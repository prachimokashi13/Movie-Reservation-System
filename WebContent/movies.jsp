<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Movie</title>
      <style>
         .open-button {
         background-color: #b30738;
         color: white;
         padding: 16px 20px;
         border: none;
         cursor: pointer;
         opacity: 0.8;
         position: fixed;
         bottom: 40px;
         right: 100px;
         width: 100px;
         transform: translate(-50%, -50%);
         }
         .container {
         position: relative;
         text-align: center;
         color: white;
         }
         .centered {
         position: absolute;
         top: 60%;
         left: 40%;
         transform: translate(-50%, -50%);
         z-index:2;
         color: #b30738;
         font-weight: bold;
         text-align:left;
         }
         .bg-image{
         z-index:1;
         position:relative;
         opacity: 0.5;
         background-color: red;
         }
         .bg2-image{
         z-index:2;
         position:absolute;
         top:20px;
         left:80px;
         max-width: 20%;
         max-height: 20%;
         }
         #imgg{
         background-color: linear-gradient(blue, pink);
         }
         .form-popup {
         display: none;
         position: fixed;
         bottom: 0;
         right: 75px;
         border: 3px solid #f1f1f1;
         z-index: 9;
         }
         .form-container {
         max-width: 300px;
         padding: 10px;
         background-color: white;
         }
         .form-container input[type=text], .form-container input[type=password] {
         width: 100%;
         padding: 15px;
         margin: 5px 0 22px 0;
         border: none;
         background: #f1f1f1;
         }
         .form-container input[type=text]:focus, .form-container input[type=password]:focus
         {
         background-color: #ddd;
         outline: none;
         }
         .form-container .btn {
         background-color: #b30738;
         color: white;
         padding: 16px 20px;
         border: none;
         cursor: pointer;
         width: 50%;
         margin-bottom: 10px;
         opacity: 0.8;
         }
         .form-container .cancel {
         background-color: #b30738;
         }
         .form-container .btn:hover, .open-button:hover {
         opacity: 1;
         }
         .alert {
         width : 50%;
         padding: 20px;
         background-color: #ff6699;
         color: white;
         margin-left: auto;
         margin-right: auto;
         }
         .closebtn {
         margin-left: 15px;
         color: white;
         font-weight: bold;
         float: right;
         font-size: 22px;
         line-height: 20px;
         cursor: pointer;
         transition: 0.3s;
         }
         .closebtn:hover {
         color: black;
         }
         .aboutmovie{
         padding-right: 50px;
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp" %>
      <section>
         <div class="container">
         <div class="bg-image">  <img  id="imgg" src="resources/${movieDetails.movieId}.jpeg" width="100%" height="400"> </div>
         <div class="bg2-image"><img src="resources/movie${movieDetails.movieId}.jpg"></div>
         <div class="centered">
            <h4><b>Language : ${movieDetails.language}</b></h4>
            <h4><b>Release date : ${movieDetails.releaseDate}</b></h4>
            <h4><b>Duration : ${movieDetails.duration} mins</b></h4>
            <h4><b>Rating : ${movieDetails.rating}</b></h4>
         </div>
      </section>
      <div class="aboutmovie">
         <h3>
            <strong>About the movie</strong>
         </h3>
         <h4>${movieDetails.description}</h4>
      </div>
      <section>
         <button class="open-button" onclick="openForm()">Book Now!!</button>
         <% if(session.getAttribute("message") != null ){
            if(!session.getAttribute("message").toString().isBlank()
                 ||!session.getAttribute("message").toString().isEmpty()){%>	
         <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
            <strong>No  movies available on this date !!</strong> </br>Please choose a different date
            <%session.removeAttribute("message"); %>
         </div>
         <%
            session.removeAttribute("message");
              	  } } %>
         <div class="form-popup" id="myForm">
            <form action="theatre" class="form-container">
               <h6>Select the date</h6>
               <input type="date" id="showDate" name="showDate">
               <br></br>
               <button type="submit" class="btn">Proceed</button>
               <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            </form>
         </div>
         <script>
            function openForm() {
            	document.getElementById("myForm").style.display = "block";
            }
            
            function closeForm() {
            	document.getElementById("myForm").style.display = "none";
            }
         </script>
      </section>
   </body>
</html>