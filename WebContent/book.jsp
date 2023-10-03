<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Theatre"%>
<%@ page import="com.project.model.Show"%>
<%@ page import="com.project.model.Seat"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <style>
         body {
         font-family: Arial;
         font-size: 17px;
         padding: 8px;
         }
         * {
         box-sizing: border-box;
         }
         .row {
         display: -ms-flexbox; /* IE10 */
         display: flex;
         -ms-flex-wrap: wrap; /* IE10 */
         flex-wrap: wrap;
         margin: 0 -16px;
         }
         .col-25 {
         -ms-flex: 25%; /* IE10 */
         flex: 25%;
         }
         .col-50 {
         -ms-flex: 50%; /* IE10 */
         flex: 50%;
         }
         .col-75 {
         -ms-flex: 75%; /* IE10 */
         flex: 75%;
         }
         .col-25, .col-50, .col-75 {
         padding: 0 16px;
         }
         .container {
         background-color: #f2f2f2;
         padding: 5px 20px 15px 20px;
         border: 1px solid lightgrey;
         border-radius: 3px;
         }
         input[type=text] {
         width: 100%;
         margin-bottom: 20px;
         padding: 12px;
         border: 1px solid #ccc;
         border-radius: 3px;
         }
         label {
         margin-bottom: 10px;
         display: block;
         }
         .icon-container {
         margin-bottom: 20px;
         padding: 7px 0;
         font-size: 24px;
         }
         .btn {
         background-color: #b30738;
         color: white;
         padding: 12px;
         margin: 10px 0;
         border: none;
         width: 100%;
         border-radius: 3px;
         cursor: pointer;
         font-size: 17px;
         }
         .btn:hover {
         background-color: Gray;
         color: black;
         }
         a {
         color: #2196F3;
         }
         hr {
         border: 1px solid lightgrey;
         }
         .tab {
         display: inline-block;
         margin-left: 40px;
         }
         span.price {
         float: right;
         color: grey;
         }
         /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
         @media ( max-width : 800px) {
         .row {
         flex-direction: column-reverse;
         }
         .col-25 {
         margin-bottom: 20px;
         }
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp"%> 
      <h2 style="color: #b30738">Grab your seats now !!</h2>
      <div class="row">
         <div class="col-50">
            <div class="container">
               <form action="book" method="post">
                  <div class="row">
                     <div class="col-50">
                        <h3>Payment</h3>
                        <label for="fname">Accepted Cards</label>
                        <div class="icon-container">
                           <i class="fa fa-cc-visa" style="color: navy;"></i> <i
                              class="fa fa-cc-amex" style="color: blue;"></i> <i
                              class="fa fa-cc-mastercard" style="color: red;"></i> <i
                              class="fa fa-cc-discover" style="color: orange;"></i>
                        </div>
                        <label for="ccnum">Credit card number</label> <input type="text"
                           id="ccnum" name="cardnumber" maxlength="14"
                           placeholder="1111-2222-3333-4444"> <label for="expmonth">Exp
                        Month</label> 
                        <select name="expmonth" id="expmonth" name="expmonth">
                           <option value="Jan">Jan</option>
                           <option value="Feb">Feb</option>
                           <option value="Mar">Mar</option>
                           <option value="Apr">Apr</option>
                           <option value="May">May</option>
                           <option value="Jun">Jun</option>
                           <option value="Jul">Jul</option>
                           <option value="Aug">Aug</option>
                           <option value="Sept">Sept</option>
                           <option value="Oct">Oct</option>
                           <option value="Nov">Nov</option>
                           <option value="Dec">Dec</option>
                        </select>
                        </br> </br>
                        <div class="row">
                           <div class="col-50">
                              <label for="expyear">Exp Year</label> <input type="text"
                                 id="expyear" name="expyear" placeholder="2018">
                           </div>
                           <div class="col-50">
                              <label for="cvv">CVV</label> <input type="password" id="cvv"
                                 name="cvv" placeholder="352">
                           </div>
                        </div>
                     </div>
                  </div>
                  <input type="submit" value="Book My Show" class="btn">
               </form>
            </div>
         </div>
         <div class="col-25">
            <div class="container">
               <%
                  List<Seat> seatList = (List) request.getSession().getAttribute("seatList");
                  List<String> selectedSeats = (List<String>) request.getSession().getAttribute("selectedSeats");
                  
                  List<Seat> selectedSeatDetails = new ArrayList<>();
                  
                  int totalPrice = 0;
                  for (Seat seat : seatList) {
                  	if (selectedSeats.contains(seat.getSeatNumber())) {
                  		totalPrice = totalPrice + seat.getPrice();
                  		selectedSeatDetails.add(seat);
                  	}
                  }
                  request.getSession().setAttribute("selectedSeatDetails", selectedSeatDetails);
                  %>
               <h4 style="color: #b30738">Summary</h4>
               <p>
                  Movie<span class="price"><%=(String) session.getAttribute("movieName")%></span>
               </p>
               <p>
                  Theatre<span class="price"><%=(String) session.getAttribute("theatreName")%></span>
               </p>
               <p>
                  Screen<span class="price"><%=((Show) session.getAttribute("showDetails")).getScreen().getScreenName()%></span>
               </p>
               <p>
                  Showdate<span class="price"><%=((Show) session.getAttribute("showDetails")).getShowDate()%></span>
               </p>
               <p>
                  Time<span class="price"><%=((Show) session.getAttribute("showDetails")).getShowTime()%></span>
               </p>
               <p>
                  Seats<span class="price"> <%
                     for (String selectedSeat : selectedSeats) {
                     %>
                  <%=selectedSeat%> <%
                     }
                     %>
                  </span>
               </p>
               <hr>
               <p>
                  Total<span class="price" style="color: black"><b>$<%=totalPrice%></b></span>
               </p>
            </div>
         </div>
      </div>
   </body>
</html>