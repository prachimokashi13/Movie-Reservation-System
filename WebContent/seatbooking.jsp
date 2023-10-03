<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Seat"%>
<%@ page import="com.project.model.Show"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Theatre Seats</title>
      <link rel="stylesheet"
         href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"
         integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
         crossorigin="anonymous"></script>
      <script type="text/javascript"></script>
   </head>
   <style type="text/css">
      ul.seat_w3ls {
      margin: 2em 0;
      }
      .screen {
      background: #ff9800;
      }
      h2.wthree {
      padding: 0.8em;
      font-size: 1.2em;
      color: #000;
      text-transform: uppercase;
      font-weight: 600;
      letter-spacing: 7px;
      word-spacing: 10px;
      }
      .smallBox::before {
      content: "";
      width: 15px;
      height: 15px;
      display: inline-block;
      margin-right: 10px;
      }
      .greenBox::before {
      content: "";
      background: Green;
      }
      .redBox::before {
      content: "";
      background: Red;
      }
      .emptyBox::before {
      content: "";
      box-shadow: inset 0px 2px 3px 0px rgb(255, 152, 0), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -moz-box-shadow: inset 0px 2px 3px 0px rgb(255, 152, 0), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -webkit-box-shadow: inset 0px 2px 3px 0px rgb(255, 152, 0), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      background-color: #fff;
      }
      .seats {
      border: 2px solid red;
      background-color: yellow;
      padding: 1rem;
      }
      #seats {
      background-color: red;
      padding: 1rem;
      }
      .seatGap {
      width: 40px;
      }
      .seatVGap {
      height: 60px;
      }
      table {
      text-align: center;
      }
      .Displaytable {
      text-align: center;
      }
      .Displaytable td, .Displaytable th {
      width: 100%;
      padding: 7px 10px;
      color: #000;
      font-weight: 600;
      }
      table.Displaytable tr {
      background: #fff;
      color: #fff;
      }
      textarea {
      border: none;
      background: transparent;
      resize: none;
      }
      input[type=checkbox] {
      width: 13px;
      margin-right: 14px;
      cursor: pointer;
      }
      table {
      width: 100%;
      margin: auto;
      padding-left: 30rem;
      margin: auto;
      }
      td {
      margin: 10px;
      border-collapse:collapse;
      padding: 5px;
      }
      .section {
      margin: 20px;
      padding-bottom: 50px;
      }
      .screen {
      border: 3px solid black;
      width: 300px;
      text-align: center;
      margin: auto;
      }
      td:hover {
      background-color: LightGray;
      }
      input[type=checkbox]:before {
      content: "";
      width: 25px;
      height: 18px;
      border-radius: 5px;
      /* Safari 3-4, iOS 1-3.2, Android 1.6- */
      -webkit-border-radius: 5px;
      /* Firefox 1-3.6 */
      -moz-border-radius: 5px;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      border: 3px solid #ff9800;
      box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      -webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      background-color: #ffffff;
      }
      input[type=checkbox]:checked:before {
      background-color: Green;
      font-size: 15px;
      }
      input[type=checkbox][disabled]:before {
      background-color: red;
      }
      .seatStructure {
      position: absolute;
      padding-left: 30rem;
      left: 0;
      width: 80%;
      }
      .container {
      width: 100%;
      }
      #seatlabel {
      padding-left: 15px;
      }
      .box {
      content: "";
      width: 25px;
      height: 18px;
      border-radius: 5px;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      border: 3px solid #ff9800;
      box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      -webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      background-color: #ffffff;
      background-color: white;
      padding-left: 30px;
      }
      .box1 {
      content: "";
      width: 25px;
      height: 18px;
      border-radius: 5px;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      border: 3px solid #ff9800;
      box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      -webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      background-color: #ffffff;
      background-color: red;
      padding-left: 30px;
      }
      .box2 {
      content: "";
      width: 25px;
      height: 18px;
      border-radius: 5px;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      border: 3px solid #ff9800;
      box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
      rgba(255, 255, 255, .8);
      -moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      -webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
      0px rgba(255, 255, 255, .8);
      background-color: #ffffff;
      background-color: green;
      padding-left: 30px;
      }
      .blank_row
      {
      height: 30px !important; /* overwrites any other rules */
      background-color: #FFFFFF;
      }
   </style>
   <body>
      <%@include file="header.jsp"%>
      <div class="container">
         <div>
            <h4>
               Movie :
               <span style="color: #b30738"><%=(String) session.getAttribute("movieName")%></span>
            </h4>
            <h5>
               Screen :
               <%=((Show) session.getAttribute("showDetails")).getScreen().getScreenName()%></br>
               Showdate :
               <%=((Show) session.getAttribute("showDetails")).getShowDate()%></br> Time
               :
               <%=((Show) session.getAttribute("showDetails")).getShowTime()%></br>
            </h5>
         </div>
         </br>
         <div class="box1">
            <p>
               <b>Reserved</b>
            </p>
         </div>
         </br>
         <div class="box2">
            <p>
               <b>Selected</b>
            </p>
         </div>
         </br>
         <div class="box">
            <p>
               <b>Available </b>
            </p>
         </div>
         <div class="screen">
            <h2 class="wthree">Screen this way</h2>
         </div>
         <div class="row">
            <div>
               <div class="seatStructure txt-center" style="overflow-x: auto;">
                  <table id="seatsBlock">
                     <p id="notification"></p>
                     <%
                        Map seatMap = (Map) request.getAttribute("seatDetails");
                        String category = "Silver";
                        %>
                     <tr class="blank_row">
                        <td colspan="10"><%=category%></td>
                     </tr>
                     <form name="seatForm" action="checkout" method="post">
                        <%
                           for (int rownum = 1; rownum <= seatMap.size(); rownum++) {
                           
                           	if(!(((List<Seat>) seatMap.get(rownum)).get(0).getCategoryType().equals(category))){
                           
                           		category = ((List<Seat>) seatMap.get(rownum)).get(0).getCategoryType();
                           	%>
                        <tr class="blank_row">
                           <td colspan="10"><%=category%></td>
                        </tr>
                        <%}
                           %>
                        <tr>
                           <%
                              List<Seat> rowSeats = (List) seatMap.get(rownum);
                              
                              for (int seat = 0; seat < rowSeats.size(); seat++) {
                              %>
                           <%
                              if (rowSeats.get(seat).getStatus().equals("Reserved")) {
                              %>
                           <td><input
                              title=<%="price:" + rowSeats.get(seat).getPrice()%>
                              type="checkbox" class="seats" id="tempseats"
                              name="selectedSeats" disabled="true"
                              value=<%=rowSeats.get(seat).getSeatNumber()%> /> <label
                              id="seatlabel"><%=rowSeats.get(seat).getSeatNumber()%></label></td>
                           <%
                              }
                              %>
                           <%
                              if (rowSeats.get(seat).getStatus().equals("Available")) {
                              %>
                           <td><input
                              title=<%="price:" + rowSeats.get(seat).getPrice()%>
                              type="checkbox" class="seats" id="tempseats"
                              name="selectedSeats" enabled 
                              value=<%=rowSeats.get(seat).getSeatNumber()%> /> <label
                              id="seatlabel"><%=rowSeats.get(seat).getSeatNumber()%></label></td>
                           <%
                              }
                              %>
                           <%
                              }
                              %>
                        </tr>
                        <%
                           }
                           %>
                  </table>
                  <div class="print-values">
                  <p id="valueList"></p>
                  </div>
                  <div class="somebutton"
                     style="margin-top: 20px; margin-left: 380px;">
                  <input type="submit" id="paymentBtn" disabled value="Proceed to Payment!" />
                  </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </body>
   <script type="text/javascript">
      var seats = document.getElementsByTagName("td");
      
      var seatvar = document.getElementsByClassName("seats");
     
      function clicked(e) {
      
      	console.log("click");
      }
      
      for (var i = 0; i < seats.length; i++) {
      
      	seats[i].addEventListener("click", clicked);
      
      }
      
      
      $('#seatsBlock input:checkbox').change(function(){
      	  $("#paymentBtn").prop("disabled", $('#seatsBlock input:checkbox:checked').length ===0);
      	});
      
      
   </script>
</html>