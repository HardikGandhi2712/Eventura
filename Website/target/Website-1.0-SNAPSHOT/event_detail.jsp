<%-- 
    Document   : event_detail
    Created on : 28-Sept-2024, 6:42:16 pm
    Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <head>
        <title></title>
        <link href="styles.css" rel="stylesheet">
    </head>
    <body>
        <%
            // Fetch the ResultSet passed from the servlet
            ResultSet rs = (ResultSet) request.getAttribute("eventsData1");

            // Iterate through the ResultSet and display each event
            try {
                while (rs != null && rs.next()) {
                    int id=rs.getInt("id");
                    String photo1 = rs.getString("photo1");  // Path for the event image
                    String photo2 = rs.getString("photo2");
                    String ename = rs.getString("ename");    // Event name
                    int price = rs.getInt("price");          // Event price
                    String ldescription = rs.getString("ldescription");  // Event description
%>
    <center>
        <h3><%= ename%></h3>
    </center>
    <div class="desc">
        <img src="images/<%= photo1%>">
        <img src="images/<%= photo2%>">
        <p>
        <ul>
            <%= ldescription%>
        </ul>
    </p>
</div>
<hr width="850px" color="black" align="right">
<div class="buy">
    <h4 style="margin-right:10px;">Price: <%= price%></h4>
    <br>
    <h4>
        <form method="POST" action="payments.jsp" target="_blank">
            <input type="hidden" name="eventId" value="<%= id%>">
            <button style="height:45px;width:130px;font-size: 18px;font-style: italic;background-color:red;border-radius: 20px;"><a href="FetchEvents" class="back" style="background-color:red; color:white;height:45px;width:130px;font-size: 18px;font-style: italic; ">Back</a></button>
            <button type="submit" name="btn" style="height:45px;width:130px;font-size: 18px;font-style: italic;background-color:red;border-radius: 20px;color: aliceblue;">Book Now</button>
        </form> <br>
    </h4>
</div>
<%
        } // End of the while loop
    } catch (Exception e) {
        out.println(e);
    }
%>
</body>
</html>
