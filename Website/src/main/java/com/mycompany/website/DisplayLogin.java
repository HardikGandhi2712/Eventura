package com.mycompany.website;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;


/**
 *
 * @author 91989
 */
public class DisplayLogin extends HttpServlet {

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
            String Username=request.getParameter("n");
            String Password=request.getParameter("p");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3301/javaWeb","root","root");
            Statement smt=con.createStatement();
            ResultSet rs=smt.executeQuery("select * from Register where username='"+Username+"'");
            if (rs.next()) { // Check if the user exists
                String dbPassword = rs.getString("password");

                if (Password.equals(dbPassword)) {
                    HttpSession session=request.getSession();
                    session.setAttribute("loggedInUser",Username);
                    response.sendRedirect("FetchEvents");
                }
                else {
                // If the password is incorrect, display an error message
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Incorrect password!');");
                    out.println("location='login.html';");
                    out.println("</script>");
                }
            }
            else {
            // If the username does not exist, display an error message
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username not found!');");
                out.println("location='login.html';");
                out.println("</script>");
            }
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
