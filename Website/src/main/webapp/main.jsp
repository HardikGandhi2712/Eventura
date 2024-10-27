<%-- 
    Document   : main
    Created on : 09-Oct-2024, 1:50:56 am
    Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Main Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap');

            :root{
                --main-color:#3867d6;
            }

            body{
                background-color: black;
                font-family:'Nunito',sans-serif;
            }

            #img1{
                height:500%;
                width:100%;
            }

            header {
                background-color: #070E10;
                padding: 10px 0;
            }

            .flex-container {
                display: flex;
                justify-content: space-between; /* Logo to the left, navbar to the right */
                align-items: center; /* Vertically centers the logo and navbar */
                padding: 0 20px; /* Adds padding to the sides */
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
                margin-left: 40px; /* Space between navbar items */
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


            .heading{
                text-align: center;
                padding-bottom:2rem;
                color:#fff;
                text-transform: uppercase;
                font-size:4rem;
                margin-top:100px;
            }

            .service .box-container{
                display:grid;
                grid-template-columns: repeat(auto-fit,minmax(27rem,1fr));
                gap:1.5rem;
            }

            .service .box-container .box{
                border-radius:.5rem;
                background:#333;
                text-align: center;
                padding:2.5rem;
            }

            .service .box-container .box i{
                height:6rem;
                width:6rem;
                line-height: 6rem;
                border-radius:50%;
                font-size:2.5rem;
                background:var(--main-color);
                color:#fff;

            }

            .service .box-container .box h3{
                font-size:2rem;
                color:#fff;
                padding:1rem 0;
            }

            .service .box-container .box p{
                font-size:1.4rem;
                color:#eee;
                line-height:1.8;
            }


            .about .row{
                display:flex;
                align-items: center;
                margin-right: 45px;
                margin-bottom: 80px;
                margin-top: -40px;
            }

            .about .row .image{
                flex:37rem;
            }

            .about .row .image img{
                height:400px;
                width:700px;
                border-radius: 0.5rem;
                border:1rem solid #333;
            }

            .about .row .content{
                flex:42rem;
            }

            .about .row .content h3{
                font-size:3.5rem;
                color:#fff;
            }

            .about .row .content p{
                font-size:1.5rem;
                color:#eee;
                line-height:2;
            }

            
            .feedback-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin-top: 10px;
                margin-bottom: 100px;
            }

            .feedback_box {
                width: 300px;
                margin: 20px;
                padding: 20px;
                background-color: #222;
                box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.1);
                border-radius: 10px;
                text-align: center;
                transition: transform 0.3s ease;
            }

            .feedback_box:hover {
                transform: translateY(-10px);
            }

            .feedback_box h3 {
                color: #fff;
                font-size: 24px;
                margin-bottom: 10px;
                text-transform: uppercase;
            }

            .feedback_box p {
                font-size: 16px;
                color: #aaa;
            }

            
            .footer{
                background:#111;
            }

            .footer .box-container{
                margin-left:110px;
                display:grid;
                grid-template-columns:repeat(auto-fit,minmax(25rem,1fr));

            }

            .footer .box-container .box h3{
                font-size:30px;
                padding:1rem 0;
                color:#fff;
            }

            .footer .box-container .box a{
                display:block;
                font-size:18px;
                padding:1rem 0;
                color:#eee;
                text-decoration: none;
            }

            .footer .box-container .box a i{
                padding-right:0.5rem;
                color:var(--main-color);
            }

            .footer .box-container .box a:hover i{
                padding-right:1.5rem;
                color:#fff;
            }

            .footer .credit{
                text-align:center;
                border-top:0.1rem solid #222;
                color:#fff;
                padding:2rem;
                padding-top:2.5rem;
                margin-top:1rem;
                font-size:2rem;
            }

        </style>
    </head>
    <body>
        <header>
            <nav class="navbar">
                <div class="flex-container">
                    <img src="images/logo1.png" class="logo" align="left">

                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#service">Services</a></li>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="login.html">Login</a></li>
                        <li><a href="Registration.html">Register</a><li>
                    </ul>
                </div>    
            </nav>
            <img src="images/events.png" id="img1">
        </header>

        <section class="service" id="service">
            <h1 class="heading">Our <span>Services</span></h1>
            <div class="box-container">
                <div class="box">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>Venue Selection</h3>
                    <p>We help you find the perfect venue that matches your event's style, size, and location. From luxurious banquet halls to intimate outdoor spaces, we've got you covered.</p>
                </div>

                <div class="box">
                    <i class="fas fa-envelope"></i>
                    <h3>Invitation Card</h3>
                    <p>Make a great first impression with customized invitation cards that set the tone for your event. We design and send out beautiful invitations that capture your event’s essence.</p>
                </div>

                <div class="box">
                    <i class="fas fa-music"></i>
                    <h3>Entertainment</h3>
                    <p>Keep your guests entertained with live performances, DJs, or interactive activities tailored to your event. We provide a wide range of entertainment options for all ages and tastes.</p>
                </div>

                <div class="box">
                    <i class="fas fa-utensils"></i>
                    <h3>Food and Drink</h3>
                    <p>From gourmet meals to casual bites, we offer catering services that satisfy every palate. Our diverse menu options include a variety of cuisines, ensuring your guests are well-fed and happy.</p>
                </div>

                <div class="box">
                    <i class="fas fa-photo-video"></i>
                    <h3>Photos and Videos</h3>
                    <p>Capture every special moment with professional photo and video services. Our skilled team ensures your memories are preserved with high-quality images and videos.</p>
                </div>

                <div class="box">
                    <i class="fas fa-birthday-cake"></i>
                    <h3>Custom Food</h3>
                    <p>We offer custom menus and special treats, including themed cakes, desserts, and snacks, tailored to fit your event’s theme and dietary requirements.</p>
                </div>
            </div>
        </section>

        <section class="about" id="about">
            <h1 class="heading"><span>About</span> us </h1>
            <div class="row">
                <div class="image">
                    <img src="images/about.jpg">
                </div>

                <div class="content">
                    <h3>Let us create an unforgettable celebration tailored just for you</h3>
                    <p>From intimate gatherings to grand celebrations, we bring your vision to life with meticulous attention to detail and personalized service.
                        With our expert team handling every aspect, you can relax and enjoy a seamless event experience that reflects your unique style and preferences.</p>
                </div>
            </div>
        </section>

        <section class="feedback">
            <h1 class="heading">Customer Feedback</h1>
            <div class="feedback-container">
            <%
                ResultSet rs = (ResultSet) request.getAttribute("feedbackdata");

                try {
                    while (rs != null && rs.next()) {
                        String name = rs.getString("username");
                        String feedback_text = rs.getString("feedback_text");
            %>
                <div class="feedback_box">
                    <h3><%= name%></h3>
                    <p><%= feedback_text%></p>
                </div>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
            </div>
        </section>
        
        <section class="footer">
            <div class="box-container">
                <div class="box">
                    <h3>Branches</h3>
                    <a href="https://maps.app.goo.gl/V7VS7ZwLdbb12ekB8" target="_blank"><i class="fas fa-map-marker-alt"></i>mumbai</a>
                    <a href="https://maps.app.goo.gl/XoMK1a9JifLSiVw46" target="_blank"><i class="fas fa-map-marker-alt"></i>delhi</a>
                    <a href="https://maps.app.goo.gl/3gCzjw4gBmFYMriN9" target="_blank"><i class="fas fa-map-marker-alt"></i>gurgaon</a>
                    <a href="https://maps.app.goo.gl/VnnMAyjpdGA4e9p87" target="_blank"><i class="fas fa-map-marker-alt"></i>jaipur</a>
                    <a href="https://maps.app.goo.gl/H5pPAdWsTBU4K7LS6" target="_blank"><i class="fas fa-map-marker-alt"></i>kolkata</a>
                </div>

                <div class="box">
                    <h3>Quick Links</h3>
                    <a href="#"><i class="fas fa-arrow-right"></i>home</a>
                    <a href="#service"><i class="fas fa-arrow-right"></i>service</a>
                    <a href="#about"><i class="fas fa-arrow-right"></i>about</a>
                </div>

                <div class="box">
                    <h3>Contact Info</h3>
                    <a><i class="fas fa-phone"></i>+91712461462</a>
                    <a><i class="fas fa-phone"></i>+91294932652</a>
                    <a href="mailto:eventura@gmail.com"><i class="fas fa-envelope"></i> eventura@gmail.com</a>
                    <a href="mailto:contacteventura@gmail.com"><i class="fas fa-envelope"></i> contacteventura@gmail.com</a>

                </div>

                <div class="box">
                    <h3>Follow us</h3>
                    <a href="https://www.facebook.com/EventuraLK" target="_blank"><i class="fab fa-facebook-f"></i>facebook</a>
                    <a href="https://x.com/eventurauk" target="_blank"><i class="fab fa-twitter"></i>twitter</a>
                    <a href=https://www.instagram.com/eventura._/  target="_blank"><i class="fab fa-instagram"></i>instagram</a>
                    <a href="https://www.linkedin.com/company/eventura/posts/?feedView=all" target="_blank"><i class="fab fa-linkedin"></i>linkedin</a>
                </div>
            </div>

            <div class="credit">&copy; 2024. <span>Eventura</span> All rights reserved.</div>
        </section>
    </body>
</html>

