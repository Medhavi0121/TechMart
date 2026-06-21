<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/23/2026
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.java.techmart.entity.Product" %>
<html>
<head>
    <title>TechMart - Product List</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            padding: 40px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        h2 {
            color: #1e293b;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #f1f5f9;
            color: #475569;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e2e8f0;
            color: #1e293b;
        }

        tr:hover {
            background: #f8fafc;
        }

        .btn-back {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .btn-back:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Available Products</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (LKR)</th>
            <th>Stock</th>
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
            <td><%= String.format("%.2f", p.getPrice()) %>
            </td>
            <td><%= p.getStock() > 0 ? p.getStock() : "<span style='color:red;'>Out of Stock</span>" %>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <a href="index.jsp" class="btn-back">Back to Home</a>
</div>

</body>
</html>