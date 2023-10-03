<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>SC Movies-Home</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link
         href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
         rel="stylesheet">
      <script
         src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
         integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
         crossorigin="anonymous"></script>
      <style>
         /* Remove the navbar's default margin-bottom and rounded borders */
         /* .navbar {
         margin-bottom: 0;
         border-radius: 0;
         } */
         .carousel-inner img {
         width: 100%;
         margin: auto;
         height: 500px;
         }
         @media ( max-width : 600px) {
         .carousel-caption {
         display: none;
         }
         }
         .centered {
         position: absolute;
         top: 30%;
         left: 50%;
         transform: translate(-50%, -50%);
         color: #b30738;
         }
         footer {
         text-align: center;
         padding: 3px;
         background-color: #b30738;
         color: white;
         margin: 0;
         width: 100%;
         bottom: 0;
         left: 0;
         right: 0;
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp"%>
      <div class="carousel-inner" role="listbox">
         <img src="resources/show.jpg">
         <div class="centered">
            <h1>Santa Clara Movies</h1>
            <br>
            <h3>Book your favourite shows right here !!!</h3>
         </div>
      </div>
      <div class="container text-center">
         <h3>Now Showing</h3>
         <br>
         <% 
            for(int id=0; id<6; id++) {
            %>
         <div class="row">
            <div class="col-sm-4">
               <a href="movieDetails?movieId=<%=id%>"> <img src="resources/movie<%=id%>.jpg"
                  class="img-responsive" width="400">
               </a>
            </div>
            <%} %>
         </div>
         <br>
      </div>
      <footer>
         <p>
            Santa Clara Movies<br>
      </footer>
   </body>
</html>