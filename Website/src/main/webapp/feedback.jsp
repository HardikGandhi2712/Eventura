<%-- 
    Document   : feedback
    Created on : 06-Oct-2024, 1:51:09 am
    Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("loggedInUser");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #1f1f1f;
                color: #fff;
            }

            header {
                background-color: #070E10;
                padding: 10px 0;
                width: 100%;
            }

            .flex-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 20px;
            }

            .logo {
                height: 150px;
                width: 150px;
                border-radius: 50%;
            }

            .navbar ul {
                display: flex;
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .navbar li {
                margin-left: 40px;
            }

            .navbar li a {
                color: white;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
            }

            .navbar li a:hover {
                color: aqua;
                border-bottom: red solid 4px;
            }

            .navbar li a {
                color: white;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
            }

            .logo {
                height: 200px;
                width: 200px;
                border-radius: 50%;
                margin-top: -30px;
            }

            .feedback-container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background-color: #333;
                border-radius: 10px;
                text-align: center;
            }

            textarea {
                width: calc(100% - 40px);
                padding: 10px;
                margin: 20px 0;
                border: none;
                background-color: #555;
                color: #fff;
                border-radius: 5px;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #00bfff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0077b6;
            }

            .message {
                font-size: 18px;
                color: #00bfff;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar">
                <div class="flex-container">
                    <img src="images/logo1.png" class="logo" align="left">
                    <ul>
                        <li><a href="FetchEvents">Home</a></li>
                        <li><a href="aboutus.html">About Us</a></li>
                        <li><a href="contactus.html">Contact Us</a></li>
                        <li><a href="mainServlet">Log Out</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="feedback-container">
            <h1>Feedback</h1>
            <form method="post" action="FeedbackServlet">
                <p>Welcome <%= username%></p>
                <p>Give Your Valuable Feedback:</p>
                <textarea name="feedback" rows="10" placeholder="Enter Feedback..."></textarea>
                <br>
                <input type="submit" value="Submit">
                <p class="message">Your Feedback Matters To Us!!</p>
            </form>
        </div>
    </body>
</html>
