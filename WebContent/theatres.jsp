<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Theatre"%>
<%@ page import="com.project.model.Show"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <meta charset="ISO-8859-1">
      <script
         src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <title>Theatre Details</title>
      <style>
         .name {
         background-color: #E8E8E8;
         }
         .address {
         color: black;
         }
         .Button {
         background-color: #b30738;
         border-radius: 8px;
         color: white;
         }
         .Button:hover {
         background-color: LightGray;
         border-radius: 8px;
         color: black;
         cursor: pointer;
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp"%>
      <%session.removeAttribute("message"); %>
      <h1><%=(String) session.getAttribute("movieName") %></h1>
      <div class="card">
         <div class="card-content">
            <%request.setAttribute("message",null); 
               ArrayList theatres = (ArrayList) request.getAttribute("theatreDetails");			
               %>
            <%
               for (int i = 0; i < theatres.size(); i++) {
               
               	Theatre theatre = (Theatre) theatres.get(i);
               	session.setAttribute("theatreName", theatre.getTheatreName());
               	session.setAttribute("theatreAddress",theatre.getAddress());
               %>
            <div class=name>
               <b>
                  <h3><%=theatre.getTheatreName()%></h3>
               </b>
               <div class=address>
                  <%=theatre.getAddress()%>
               </div>
               </br>
               <%
                  List<Show> showList = theatre.getShows();
                  
                  
                  for (int j = 0; j < showList.size(); j++) {
                  
                  	Show show = (Show) showList.get(j);
                  	/* session.setAttribute("showDetails", show); */
                  	
                  %>
               <a
                  href="seats?showId=<%=show.getShowId()%>&screenId=<%=show.getScreen().getScreenId()%>"><button
                  class=Button class="glyphicon glyphicon-log-in">
               <%=show.getShowTime()%>
               (<%=show.getScreen().getScreenName()%>)
               </button></a>
               <%
                  }
                  %>
            </div>
         </div>
         </br> </br>
      </div>
      <%
         }
         %>
   </body>
</html>