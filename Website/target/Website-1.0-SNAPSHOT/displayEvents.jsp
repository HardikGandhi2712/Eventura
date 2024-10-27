<%-- 
    Document   : displayEvents
    Created on : 22-Sept-2024, 7:39:50 pm
    Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet" %>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Montserrat", sans-serif;
            }

            body {
                background-color: #25252b;
                color: #777;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
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

            .container {
                width: 100%;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                padding: 20px;
                margin-top: 20px;
            }

            .item-container {
                position: relative;
                margin: 40px;
                width: 380px;
                height: 570px;
                overflow: hidden;
                background-color: #fff;
                box-shadow: 0 0 30px 5px rgba(0, 0, 0, 0.15);
                cursor: pointer;
            }

            .img-container,
            .body-container {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }

            .img-container img {
                width: 100%;
                height: 380px;
            }

            .body-container {
                position: relative;
            }

            .overlay {
                position: relative;
                width: 100%;
                height: 400px;
                background-color: rgba(24, 83, 122, 0.6);
                opacity: 0;
                transition: height linear 0.4s, opacity linear 0.2s;
            }

            .item-container:hover .overlay {
                opacity: 1;
                height: 150px;
            }

            .event-info {
                background-color: #fff;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 8px;
            }

            .title,
            .price {
                color: #18537a;
                font-size: 1.5em;
                font-weight: bold;
                letter-spacing: 1px;
                margin: 12px;
            }

            .info {
                letter-spacing: 0.5px;
                margin-bottom: 6px;
            }

            .separator {
                width: 20%;
                height: 6px;
                background-color: #17537a;
                margin-bottom: 16px;
            }

            .additional-info {
                border-top: 1px solid #bbb;
                margin-top: 12px;
                padding: 28px;
                padding-bottom: 0;
            }

            .info i {
                color: #18537a;
                font-size: 1.1em;
                margin-right: 4px;
            }

            .action {
                color: #fff;
                border: 3px solid #fff;
                background-color: transparent;
                position: absolute;
                top: -100px;
                left: 50%;
                transform: translateX(-50%);
                width: 60%;
                outline: none;
                cursor: pointer;
                padding: 12px;
                text-transform: uppercase;
                font-size: 1.3em;
                font-weight: bold;
                letter-spacing: 2px;
                transition: background-color 0.4s, top 0.4s;
            }

            .item-container:hover .action {
                top: 50px;
            }

            .action:hover {
                background-color: rgba(255, 255, 255, 0.2);
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar">
                <div class="flex-container">
                    <img src="images/logo1.png" class="logo" align="left">
                    <ul>
                        <li><a href="mainServlet">Home</a></li>
                        <li><a href="feedback.jsp">Feedback</a></li>
                        <li><a href="aboutus.html">About Us</a></li>
                        <li><a href="contactus.html">Contact Us</a></li>
                        <li><a href="My_Events">My Events</a></li>
                        <li><a href="mainServlet">Log Out</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="container">
            <%
                // Fetch the ResultSet passed from the servlet
                ResultSet rs = (ResultSet) request.getAttribute("eventsData");

                // Iterate through the ResultSet and display each event
                try {
                    while (rs != null && rs.next()) {
                        int id=rs.getInt("id");
                        String photo1 = rs.getString("photo1");  // Path for the event image
                        String ename = rs.getString("ename");    // Event name
                        String city = rs.getString("city");      // Event city
                        String location = rs.getString("location");  // Event location
                        int price = rs.getInt("price");          // Event price
                        String date = rs.getString("date");      // Event date
                        String description = rs.getString("description");  // Event description
            %>
            <div class="item-container">
                <div class="img-container">
                    <img src="images/<%= photo1%>">  <!-- Dynamic event image -->
                </div>

                <div class="body-container">
                    <div class="overlay"></div>

                    <div class="event-info">
                        <p class="title"><%= ename%></p>  <!-- Dynamic event name -->
                        <div class="separator"></div>
                        <p class="info"><%= city%></p>    <!-- Dynamic event city -->
                        <p class="price">₹<%= price%></p> <!-- Dynamic event price -->

                        <div class="additional-info">
                            <p class="info">
                                <i class="fas fa-map-marker-alt"></i>
                                <%= location%>  <!-- Dynamic event location -->
                            </p>

                            <p class="info">
                                <i class="far fa-calendar-alt"></i>
                                <%= date%>  <!-- Dynamic event date -->
                            </p>

                            <p class="info description">
                                <%= description%><!-- Dynamic event description -->
                            </p>
                        </div>
                    </div>
                            <form method="post" action="FetchEvents1">
                                <input type="hidden" name="eventId" value="<%= id%>">
                                <input type="submit" class="action" value="Book Now">
                            </form>
                </div>
            </div>
            <%
                    } // End of the while loop
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </div>
    </body>
</html>