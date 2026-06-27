package lk.java.techmart.service;

import jakarta.ejb.AsyncResult;
import jakarta.ejb.Asynchronous;
import jakarta.ejb.Stateless;
import java.util.concurrent.Future;
import java.util.logging.Logger;

@Stateless
public class TechMartAnalyticsService {

    private static final Logger LOGGER = Logger.getLogger(TechMartAnalyticsService.class.getName());

    @Asynchronous
    public Future<String> processOrderAnalytics(Long orderId) {
        long start = System.currentTimeMillis();
        try {
            Thread.sleep(1500);

            long duration = System.currentTimeMillis() - start;
            LOGGER.info("[ASYNC PERFORMANCE METRIC] : Order analytics processing completed for Order ID: " + orderId + " (Took " + duration + "ms)");

            return new AsyncResult<>("ANALYTICS_SUCCESS");
        } catch (InterruptedException e) {
            LOGGER.severe("[ASYNC PROCESS ERROR] : Analytics execution encountered an error: " + e.getMessage());
            return new AsyncResult<>("ANALYTICS_FAILED");
        }
    }
}