<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/23/2026
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.java.techmart.entity.Product" %>
<html>
<head>
    <title>TechMart - Product List</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap"
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

        .page {
            max-width: 950px;
            margin: 0 auto;
        }

        /* Back Button Style */
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.9rem;
            transition: 0.3s;
        }

        .back-btn:hover {
            color: #ffffff;
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
        }

        .btn-add {
            background: linear-gradient(135deg, #6366f1, #a855f7);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-add:disabled {
            background: #475569;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .checkout-link {
            display: inline-block;
            margin-top: 30px;
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 15px 30px;
            border-radius: 16px;
            transition: 0.3s;
        }

        .checkout-link:hover {
            background: rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>

<div class="page">
    <a href="index.jsp" class="back-btn">&larr; Back to Home</a>

    <h2>Product List</h2>

    <% if (request.getParameter("message") != null) { %>
    <p style="color: #fbbf24;"><%= request.getParameter("message") %>
    </p>
    <% } %>

    <div class="glass-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Product> products = (List<Product>) request.getAttribute("productList");
                if (products != null) {
                    for (Product p : products) {
            %>
            <tr>
                <td>#<%= p.getId() %>
                </td>
                <td><%= p.getName() %>
                </td>
                <td>Rs. <%= p.getPrice() %>
                </td>
                <td><%= p.getStock() %>
                </td>
                <td>
                    <form action="cart" method="POST">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <input type="number" name="quantity" value="1" min="1" max="<%= p.getStock() %>"
                               style="width: 50px; padding: 5px; border-radius: 5px; background: rgba(0,0,0,0.2); color:white; border: 1px solid rgba(255,255,255,0.1);">
                        <button type="submit" class="btn-add" <%= p.getStock() <= 0 ? "disabled" : "" %>>Add to Cart
                        </button>
                    </form>
                </td>
            </tr>
            <% }
            } %>
            </tbody>
        </table>
    </div>

    <a href="checkout" class="checkout-link">🛒 Go to Checkout</a>
</div>
</body>
</html>