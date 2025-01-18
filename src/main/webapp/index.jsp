<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advanced JSP Example - Hardcoded</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
        }
        th, td {
            padding: 12px;
        }
        form input[type="text"], form input[type="submit"] {
            padding: 10px;
            margin: 5px;
        }
        .message {
            color: green;
            font-size: 18px;
            text-align: center;
        }
    </style>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>

<header>
    <h1>Welcome to the Advanced JSP Example</h1>
</header>

<div class="container">
    <h2>Welcome, ManoharPatil</h2>

    <p>If you're logged in, you will see a personalized message here. Otherwise, you're viewing the site as a guest.</p>

    <form action="changeUsername.jsp" method="post">
        <label for="newUsername">Change Username:</label>
        <input type="text" id="newUsername" name="newUsername" required>
        <input type="submit" value="Change">
    </form>

    <h3>Recent User Data</h3>
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>ManoharPatil</td>
                <td>manohar.patil@example.com</td>
            </tr>
            <tr>
                <td>2</td>
                <td>janedoe</td>
                <td>janedoe@example.com</td>
            </tr>
            <tr>
                <td>3</td>
                <td>admin</td>
                <td>admin@example.com</td>
            </tr>
        </tbody>
    </table>

    <div class="message">Username changed successfully to ManoharPatil!</div>

    <button onclick="showAlert('This is a custom JavaScript alert!')">Click Me</button>

</div>

</body>
</html>
