<%--
  Created by IntelliJ IDEA.
  User: Medhavi Jayasinghe
  Date: 6/23/2026
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TechMart | Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .hero-container {
            background: #ffffff;
            padding: 3rem;
            border-radius: 24px;
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 { color: #0f172a; margin-bottom: 1rem; }
        p { color: #64748b; margin-bottom: 2rem; line-height: 1.6; }
        .action-btn {
            display: inline-block;
            padding: 12px 30px;
            background: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: transform 0.2s;
        }
        .action-btn:hover { transform: scale(1.05); background: #1d4ed8; }
    </style>
</head>
<body>

<div class="hero-container">
    <h1>Welcome to TechMart</h1>
    <p>Your one-stop destination for the latest technology and gadgets. Explore our premium product catalog with ease.</p>

    <a href="products" class="action-btn">View Products</a>
</div>

</body>
</html>
