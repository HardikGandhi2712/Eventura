/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.website;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.UUID;

/**
 *
 * @author 91989
 */
public class event_ticket extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3301/javaWeb","root","root");
            Statement smt=con.createStatement();
            int id = Integer.parseInt(request.getParameter("eventId"));
            String username = (String) request.getSession().getAttribute("loggedInUser");
            ResultSet rs=smt.executeQuery("select photo1,ename,location,date,price,description from events where id = " + id);
            String ticketNumber = "TCK-" + UUID.randomUUID().toString().substring(0, 8);
            Statement smt1 = con.createStatement();
            String bookingQuery = "INSERT INTO bookings (username, event_id, ticket_number) VALUES ('" + username + "', " + id + ", '" + ticketNumber + "')";
            smt1.execute(bookingQuery);
            request.setAttribute("eventsData1", rs);
            request.setAttribute("ticketNumber", ticketNumber);
            request.getRequestDispatcher("ticket.jsp").forward(request, response);
            con.close();
        }
        
        catch(Exception e){
            out.println(e);
        }
        
        finally{
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
