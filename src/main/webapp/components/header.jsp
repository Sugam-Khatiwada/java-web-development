<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Log System</title>

    <style>
        :root {
            --primary-color: #500073;
            --secondary-color: #2A004E;
            --accent-color: #F14A00;
            --text-light: #ffffff;
            --bg-light: #f4f4f4;
            --nav-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            background-color: var(--bg-light);
        }

        nav {
            background-color: var(--primary-color);
            display: flex;
            flex-direction: row;
            padding: 12px 40px;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--nav-shadow);
        }

        .logo h2 {
            color: var(--text-light);
            margin: 0;
            font-size: 1.6rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .links {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .links a {
            color: var(--text-light);
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            padding: 8px 16px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .links a:hover {
            background-color: var(--secondary-color);
            color: var(--accent-color);
        }

        /* Distinct styling for the Logout button */
        .links a[href="logout"] {
            border: 1px solid var(--accent-color);
            margin-left: 10px;
        }
        
        .links a[href="logout"]:hover {
            background-color: var(--accent-color);
            color: var(--text-light);
        }

        .container {
            padding: 30px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>

<body>
<nav>
    <div class="logo">
        <h2>Learning Log Dashboard</h2>
    </div>
    <div class="links">
        <a href="dashboard">Dashboard</a>
        <a href="topic">Add Topic</a>
        <a href="topic?page=list">View Topics</a>
        <a href="logout">Logout</a>
    </div>
</nav>

<div class="container">