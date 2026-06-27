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
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap"
          rel="stylesheet">
    <style>
        :root {
            --primary: #6366f1;
            --secondary: #a855f7;
            --bg-color: #0f172a;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: radial-gradient(circle at top right, #1e1b4b, #0f172a);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #ffffff;
        }

        .hero-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            padding: 4rem;
            border-radius: 32px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            text-align: center;
            max-width: 500px;
            width: 90%;
            transition: transform 0.4s ease;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, #6366f1, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        p {
            color: #cbd5e1;
            margin-bottom: 2.5rem;
            line-height: 1.7;
            font-size: 1.1rem;
        }

        .btn-view {
            display: inline-block;
            padding: 16px 40px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: #ffffff;
            text-decoration: none;
            border-radius: 16px;
            font-weight: 700;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-view:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(168, 85, 247, 0.4);
        }
    </style>
</head>
<body>

<div class="hero-card">
    <h1>TechMart</h1>
    <p>Experience the future of technology with our curated collection of premium gadgets. Quality meets innovation.</p>

    <a href="products" class="btn-view">Explore Collection</a>
</div>

</body>
</html>