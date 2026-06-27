<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/25/2026
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.java.techmart.entity.Order" %>
<html>
<head>
    <title>TechMart - Order Status</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&family=JetBrains+Mono:wght@400;600&display=swap"
          rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: radial-gradient(circle at top right, #1e1b4b, #0f172a);
            color: #ffffff;
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            padding: 40px;
            border-radius: 32px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            text-align: center;
            max-width: 450px;
            width: 90%;
        }

        .status-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 1.8rem;
            margin-bottom: 15px;
        }

        .ok {
            color: #4ade80;
        }

        .fail {
            color: #f87171;
        }

        .amount {
            font-family: 'JetBrains Mono', monospace;
            font-size: 2rem;
            font-weight: 700;
            margin: 20px 0;
            color: #ffffff;
        }

        .home-link {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 24px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            transition: 0.3s;
        }

        .home-link:hover {
            background: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>

<%
    Order order = (Order) request.getAttribute("processedOrder");
    String customerName = (String) request.getAttribute("customerName");

    if (order != null && "COMPLETED".equals(order.getStatus())) {
%>
<div class="card">
    <div class="status-icon">✅</div>
    <h2 class="ok">Order Placed Successfully!</h2>
    <p>Thank you, <b style="color: #818cf8"><%= customerName %>
    </b></p>
    <div class="amount">Rs. <%= String.format("%.2f", order.getTotalAmount()) %>
    </div>
    <a href="index.jsp" class="home-link">Return to Home</a>
</div>
<%
} else {
%>
<div class="card">
    <div class="status-icon">❌</div>
    <h2 class="fail">Order Failed</h2>
    <p style="color: #cbd5e1;">Reason: Out of stock for one or more items in your cart.</p>
    <a href="index.jsp" class="home-link">Return to Home</a>
</div>
<%
    }
%>
</body>
</html>
