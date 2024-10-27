<%-- 
   Document   : ticket
   Created on : 29-Sept-2024, 8:17:32 pm
   Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Ticket</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #66ffcc;
            }

            .ticket-container {
                max-width: 400px;
                margin: 20px auto;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .header {
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                text-align: center;
            }

            .header h2 {
                margin: 0;
            }

            .content {
                padding: 20px;
            }

            .content img {
                width: 100%;
                height: auto;
                border-radius: 10px;
            }

            .details {
                margin-top: 15px;
            }

            .details p {
                margin: 5px 0;
                font-size: 14px;
            }

            .details p span {
                font-weight: bold;
            }

            .total {
                display: flex;
                justify-content: space-between;
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
            }

            .footer {
                background-color: #f9f9f9;
                padding: 10px;
                border-top: 1px solid #e0e0e0;
                text-align: center;
            }

            .footer button {
                background-color: #4CAF50;
                border: none;
                padding: 10px 20px;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }

            .footer button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <%
            // Fetch the ResultSet passed from the servlet
            ResultSet rs = (ResultSet) request.getAttribute("eventsData1");

            // Iterate through the ResultSet and display each event
            try {
                while (rs != null && rs.next()) {
                    String photo1 = rs.getString("photo1");  // Path for the event image
                    String ename = rs.getString("ename");    // Event name
                    String location = rs.getString("location");  // Event location
                    int price = rs.getInt("price");          // Event price
                    String date = rs.getString("date");      // Event date
                    String description = rs.getString("description");  // Event description
                    String ticketNumber = (String) request.getAttribute("ticketNumber");
        %>
        <div class="ticket-container">
            <div class="header">
                <h2><%= ename%></h2>
                <p>Booking Confirmed - Enjoy the Show!</p>
            </div>
            <div class="content">
                <img src="images/<%= photo1%>" alt="Diljit Dosanjh">
                <div class="details">
                    <p><span>Event:</span> <%= ename%></p>
                    <p><span>Location:</span> <%= location%></p>
                    <p><span>Date:</span> <%= date%></p>
                    <p><span>Price:</span> <%= price%></p>
                    <p><span>Description:</span> <%= description%></p>
                    <p><span>Ticket Number:</span> <%= ticketNumber%></p>
                </div>
                <div class="total">
                    <p>1 Ticket</p>
                    <p>₹8000</p>
                </div>
            </div>
            <div class="footer">
                <button onclick="resendConfirmation()">Resend Confirmation</button>
            </div>
        </div>

        <script>
            function resendConfirmation() {
                alert('Confirmation has been resent to your email.');
            }
        </script>
        <%
                } // End of the while loop
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
