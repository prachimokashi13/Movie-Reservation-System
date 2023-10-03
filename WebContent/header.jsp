<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String username = (String) session.getAttribute("username");
   String name = (String) pageContext.getServletContext().getAttribute("name");
   %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Header</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet"
         href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script
         src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script
         src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <style>
         .container-fluid {
         background-color: #b30738;
         }
      </style>
   </head>
   <body>
      <nav class="navbar navbar-inverse">
         <div class="container-fluid">
            <ul class="nav navbar-nav">
               <li><img src="resources/logo.jpg" height="50" width="50" alt="" /></li>
               <li><a href="index.jsp">Home</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
               <%
                  if (username == null) {
                  %>
               <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span>
                  Sign Up</a>
               </li>
               <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>
                  Login</a>
               </li>
               <%
                  }
                  %>
               <%
                  if (username != null) {
                  %>
               <li><a href="retrieve?user=true">
                  My Bookings</a>
               </li>
               <li><a href="logout?value=true"><span class="glyphicon glyphicon-log-out"></span>
                  Logout    <%=username %></a>
               </li>
               <%
                  }
                  %>
            </ul>
         </div>
      </nav>
   </body>
</html>