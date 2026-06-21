<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/23/2026
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.java.techmart.entity.Order" %>
<html>
<head>
    <title>TechMart - Order Status</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .main-container {
            background: #ffffff;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        h2 { color: #1a1a1a; font-size: 1.5rem; margin-bottom: 1.5rem; }
        .data-card {
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 12px;
            text-align: left;
            margin-bottom: 1.5rem;
            border: 1px solid #e2e8f0;
        }
        .data-card p { margin: 0.5rem 0; font-size: 0.95rem; color: #475569; }
        .status-pill {
            padding: 4px 12px;
            border-radius: 99px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        .btn-back {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: #215be8;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            transition: background 0.3s ease;
        }
        .btn-back:hover { background: #334155; }
    </style>
</head>
<body>

<div class="main-container">
    <h2>Order Status</h2>

    <%
        Order processedOrder = (Order) request.getAttribute("order");
        String customerName = (String) request.getAttribute("customer");

        if (processedOrder != null) {
    %>
    <div class="data-card">
        <p>Customer: <strong><%= customerName %></strong></p>
        <p>Order Status: <span class="status-pill" style="background: <%= "COMPLETED".equals(processedOrder.getStatus()) ? "#dcfce7" : "#fee2e2" %>; color: <%= "COMPLETED".equals(processedOrder.getStatus()) ? "#166534" : "#991b1b" %>;">
            <%= processedOrder.getStatus() %>
        </span></p>

        <% if ("COMPLETED".equals(processedOrder.getStatus())) { %>
        <p>Order ID: <strong><%= processedOrder.getId() %></strong></p>
        <p style="color: #166534; font-size: 0.85rem; margin-top: 10px;">✔ Success! Background Async Notification triggered.</p>
        <% } else { %>
        <p style="color: #991b1b; font-size: 0.85rem; margin-top: 10px;">❌ Order Failed! Check Inventory Cache.</p>
        <% } %>
    </div>
    <% } %>

    <a href="products" class="btn-back">Back to Products</a>
</div>

</body>
</html>

