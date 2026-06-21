package lk.java.techmart.service;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.ejb.PostActivate;
import jakarta.ejb.PrePassivate;
import jakarta.ejb.Stateful;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

@Stateful
public class CartService implements Serializable {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(CartService.class.getName());

    private Map<Long, Integer> cartItems;

    @PostConstruct
    public void init() {
        cartItems = new HashMap<>();
        LOGGER.info("CartService initialized successfully and ready to handle cart operations.");
    }

    public void addItem(Long productId, Integer quantity) {
        cartItems.put(productId, cartItems.getOrDefault(productId, 0) + quantity);
        LOGGER.info("Cart item added successfully. Item details: ProductID=" + productId + ", Qty=" + quantity);
    }

    public void removeItem(Long productId) {
        cartItems.remove(productId);
        LOGGER.info("Item removed from cart successfully: ProductID=" + productId);
    }

    public Map<Long, Integer> getCartItems() {
        return cartItems;
    }

    public void clearCart() {
        cartItems.clear();
        LOGGER.info("Cart cleanup completed successfully.");
    }

    //OPTIMIZATION
    @PrePassivate
    public void prePassivate() {

        LOGGER.info("@PrePassivate: Saving cart to storage to reduce memory consumption.");
    }

    @PostActivate
    public void postActivate() {
        LOGGER.info("@PostActivate: Cart has been reloaded into memory successfully.");
    }

    @PreDestroy
    public void destroy() {
        LOGGER.info("@PreDestroy: CartService is being destroyed and resources are being released.");
    }
}