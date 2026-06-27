package lk.java.techmart.messaging;

import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.MessageDriven;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.TextMessage;

import java.util.logging.Logger;

@MessageDriven(name = "NotificationMDB", activationConfig = {
        @ActivationConfigProperty(propertyName = "destination", propertyValue = "TechMartOrderQueue"),
        @ActivationConfigProperty(propertyName = "resourceAdapter", propertyValue = "activemq-rar-6.2.6"),
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "jakarta.jms.Queue"),
        @ActivationConfigProperty(propertyName = "maxSessions", propertyValue = "10")
})
public class NotificationMDB implements MessageListener {

    private static final Logger LOGGER = Logger.getLogger(NotificationMDB.class.getName());

    @PostConstruct
    public void init() {

        System.out.println("Instance created successfully and ready for consumption.");
        LOGGER.info("MDB instance initialized successfully and ready to process messages.");
    }

    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof TextMessage) {
                TextMessage textMessage = (TextMessage) message;
                String payload = textMessage.getText();

                System.out.println("\n==================== NOTIFICATION LOG ====================");
                System.out.println("[NOTIFICATION SERVICE] : ActiveMQ Async Notification Handler");
                System.out.println("[EVENT] : Message received from queue successfully");
                System.out.println("[PAYLOAD] : " + payload);
                System.out.println("[STATUS] : Notification processing started");
                System.out.println("===================== NOTIFICATION LOG ====================\n");
            }
        } catch (Exception e) {
            LOGGER.severe("Severe error encountered while processing MDB message: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @PreDestroy
    public void destroy() {
        LOGGER.info("Destroying instance and releasing resources.");
    }
}