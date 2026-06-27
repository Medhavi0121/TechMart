<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/23/2026
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.java.techmart.entity.Product" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>TechMart - Checkout</title>
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
        }

        .page-checkout {
            max-width: 900px;
            margin: 0 auto;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            background: linear-gradient(to right, #6366f1, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            padding: 30px;
            border-radius: 32px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th {
            color: #94a3b8;
            font-size: 0.8rem;
            text-transform: uppercase;
            padding: 20px;
            text-align: left;
        }

        td {
            padding: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            font-family: 'JetBrains Mono', monospace;
        }

        .btn-remove {
            background: rgba(225, 29, 72, 0.1);
            color: #fb7185;
            border: 1px solid #e11d48;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-remove:hover {
            background: #e11d48;
            color: white;
        }

        .customer-block {
            margin-top: 30px;
            background: rgba(255, 255, 255, 0.03);
            padding: 30px;
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        input {
            width: 100%;
            padding: 15px;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            background: rgba(0, 0, 0, 0.2);
            color: white;
            margin-top: 10px;
        }

        .btn-place {
            background: linear-gradient(135deg, #6366f1, #a855f7);
            color: white;
            border: none;
            padding: 15px 30px;
            width: 100%;
            border-radius: 12px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="page page-checkout">
    <h2> Your Cart &amp; Checkout </h2>

    <%
        Map<Product, Integer> items = (Map<Product, Integer>) request.getAttribute("cartProducts");

        if (items == null || items.isEmpty()) {
    %>
    <div class="glass-container" style="text-align: center;">
        <p>Your cart is empty.</p>
        <a href="products" style="color: #6366f1;">Go back to products &rarr;</a>
    </div>
    <%
    } else {
    %>
    <div class="glass-container">
        <table>
            <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                double grandTotal = 0.0;
                for (Map.Entry<Product, Integer> entry : items.entrySet()) {
                    Product product = entry.getKey();
                    Integer quantity = entry.getValue();
                    double itemTotal = product.getPrice() * quantity;
                    grandTotal += itemTotal;
            %>
            <tr>
                <td><%= product.getName() %>
                </td>
                <td>Rs. <%= product.getPrice() %>
                </td>
                <td><%= quantity %>
                </td>
                <td>Rs. <%= itemTotal %>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/remove-from-cart" method="POST">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button type="submit" class="btn-remove">&times; Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
            <tr style="background: rgba(255,255,255,0.05); font-weight: bold;">
                <td colspan="3" style="text-align: right;">Grand Total</td>
                <td colspan="2">Rs. <%= grandTotal %>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="customer-block">
        <h3>Customer Details</h3>
        <form action="checkout" method="POST">
            <label>Your Name</label>
            <input type="text" name="customerName" required placeholder="Enter your name">
            <button type="submit" class="btn-place">Place Order</button>
        </form>
    </div>
    <% } %>

    <a href="products" style="display: block; margin-top: 20px; color: #94a3b8; text-decoration: none;">&larr; Continue
        Shopping</a>
</div>
</body>
</html>

