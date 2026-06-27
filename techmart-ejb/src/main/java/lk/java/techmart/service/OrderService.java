package lk.java.techmart.service;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.java.techmart.entity.Order;
import lk.java.techmart.entity.Product;
import lk.java.techmart.messaging.OrderProducer;

import java.util.Map;
import java.util.logging.Logger;

@Stateless
public class OrderService {

    private static final Logger LOGGER = Logger.getLogger(OrderService.class.getName());

    @PersistenceContext
    private EntityManager em;

    @EJB
    private InventoryCache inventoryCache;

    @EJB
    private OrderProducer orderProducer;

    @EJB
    private TechMartAnalyticsService analyticsService;

    public Order checkout(String customerName, Map<Long, Integer> cartItems) {

        long startTime = System.currentTimeMillis();

        Order order = new Order();
        order.setCustomerName(customerName);
        order.setStatus("PENDING");

        double totalAmount = 0.0;
        boolean transactionSuccess = true;

        for (Map.Entry<Long, Integer> entry : cartItems.entrySet()) {
            Long productId = entry.getKey();
            Integer orderQty = entry.getValue();

            boolean deducted = inventoryCache.deductStock(productId, orderQty);
            if (!deducted) {
                transactionSuccess = false;
                LOGGER.warning("[OUT OF STOCK] :Insufficient stock available in cache for product ID: " + productId);
                break;
            }
        }

        if (transactionSuccess) {
            for (Map.Entry<Long, Integer> entry : cartItems.entrySet()) {
                Long productId = entry.getKey();
                Integer orderQty = entry.getValue();

                Product product = em.find(Product.class, productId);
                if (product != null) {
                    totalAmount += product.getPrice() * orderQty;

                    int newStock = product.getStock() - orderQty;
                    product.setStock(newStock);
                    em.merge(product);
                }
            }

            order.setTotalAmount(totalAmount);
            order.setStatus("COMPLETED");

            em.persist(order);
            em.flush();

            try {
                orderProducer.sendOrderMessage(order.getId(), customerName, totalAmount);
                LOGGER.info("[JMS OPERATION SUCCESS] : Order message published to ActiveMQ queue successfully.");
            } catch (Exception e) {
                LOGGER.severe("[JMS OPERATION ERROR] : Failed to execute producer call: " + e.getMessage());
            }

            try {
                analyticsService.processOrderAnalytics(order.getId());
            } catch (Exception e) {
                LOGGER.warning("[ASYNC OPERATION WARNING] : Analytics processing skipped due to condition: " + e.getMessage());
            }

        } else {
            order.setStatus("FAILED");
            LOGGER.severe("[ORDER TRANSACTION FAILED] : Checkout aborted: insufficient stock available for product " + customerName);
        }

        long endTime = System.currentTimeMillis();
        long executionTime = endTime - startTime;

        LOGGER.info("[PERFORMANCE METRICS] : Client checkout() completed successfully in: '" + customerName + "': " + executionTime + " ms");

        return order;
    }
}