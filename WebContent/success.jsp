<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.model.Show"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>success!</title>
      <style>
         .user{
         font-size: 20px;
         }
         text-align:center;
         }
         * {
         padding: 0;
         margin: 0
         }
         .wrapper {
         height: 20vh;
         display: flex;
         justify-content: center;
         align-items: center;
         background-color:white;
         }
         .checkmark__circle {
         stroke-dasharray: 166;
         stroke-dashoffset: 166;
         stroke-width: 2;
         stroke-miterlimit: 10;
         stroke: #7ac142;
         fill: none;
         animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards
         }
         .checkmark {
         width: 56px;
         height: 56px;
         border-radius: 50%;
         display: block;
         stroke-width: 2;
         stroke: #fff;
         stroke-miterlimit: 10;
         margin: 10% auto;
         box-shadow: inset 0px 0px 0px #7ac142;
         animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both
         }
         .checkmark__check {
         transform-origin: 50% 50%;
         stroke-dasharray: 48;
         stroke-dashoffset: 48;
         animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards
         }
         @keyframes stroke {
         100% {
         stroke-dashoffset: 0
         }
         }
         @keyframes scale {
         0%,
         100% {
         transform: none
         }
         50% {
         transform: scale3d(1.1, 1.1, 1)
         }
         }
         @keyframes fill {
         100% {
         box-shadow: inset 0px 0px 0px 30px #7ac142
         }
         }
         .success{
         color: #b30738;
         font-size: 30px;
         text-align:center;
         }
         .abc{
         font-size: 15px;
         color: #b30738;
         }
         #confettis {
         overflow: hidden;
         position: absolute;
         height: 100%;
         width: 100%;
         }
         .confetti {
         left: 50%;
         width: 16px;
         height: 16px;
         position: absolute;
         transform-origin: left top;
         animation: confetti 5s ease-in-out -2s infinite;
         }
         @keyframes confetti {
         0% {
         transform: rotateZ(15deg) rotateY(0deg) translate(0, 0);
         }
         25% {
         transform: rotateZ(5deg) rotateY(360deg) translate(-5vw, 20vh);
         }
         50% {
         transform: rotateZ(15deg) rotateY(720deg) translate(5vw, 60vh);
         }
         75% {
         transform: rotateZ(5deg) rotateY(1080deg) translate(-10vw, 80vh);
         }
         100% {
         transform: rotateZ(15deg) rotateY(1440deg) translate(10vw, 110vh);
         }
         }
         .confetti:nth-child(1) {
         left: 10%;
         animation-delay: 0;
         background-color: #fc0120;
         }
         .confetti:nth-child(2) {
         left: 20%;
         animation-delay: -5s;
         background-color: #8257e6;
         }
         .confetti:nth-child(3) {
         left: 30%;
         animation-delay: -3s;
         background-color: #ffbf4d;
         }
         .confetti:nth-child(4) {
         left: 40%;
         animation-delay: -2.5s;
         background-color: #fe5d7a;
         }
         .confetti:nth-child(5) {
         left: 50%;
         animation-delay: -4s;
         background-color: #45ec9c;
         }
         .confetti:nth-child(6) {
         left: 60%;
         animation-delay: -6s;
         background-color: #f6e327;
         }
         .confetti:nth-child(7) {
         left: 70%;
         animation-delay: -1.5s;
         background-color: #f769ce;
         }
         .confetti:nth-child(8) {
         left: 80%;
         animation-delay: -2s;
         background-color: #007de7;
         }
         .confetti:nth-child(9) {
         left: 90%;
         animation-delay: -3.5s;
         background-color: #63b4fc;
         }
         .confetti:nth-child(10) {
         left: 100%;
         animation-delay: -2.5s;
         background-color: #f9c4ea;
         }
         .b{
         background-color: #b30738;
         color: white;
         border: none;
         color: white;
         padding: 15px 32px;
         text-align: center;
         text-decoration: none;
         font-size: 16px;
         }
         .b:hover{
         cursor:pointer;
         background-color: green;
         }
         .btn1{
         background-color: #b30738;
         border: none;
         color: white;
         padding: 15px 32px;
         text-align: center;
         text-decoration: none;
         font-size: 16px;
         }
         .btn:hover
         {
         cursor:pointer;
         }
         .b1{
         padding-left:580px;
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp" %>
      <div id="confettis">
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
         <div class="confetti"></div>
      </div>
      <div class="container">
         <p class= "user"><b> Hey, <%=(String) session.getAttribute("username") %></b> </p>
         <h4  style="color:#b30738">Your Booking Id: <%=(String) session.getAttribute("bookingId") %> </h4>
         <div class="abc">
            <p><span style="color:black;"><b> Enjoy watching </b></span></br><%=(String) session.getAttribute("movieName") %></p>
            <p> <span style="color:black;"><b>at</b></span> <%=(String) session.getAttribute("theatreName") %>
            <p><span style="color:black;"> <b>on</b> </span><%=((Show) session.getAttribute("showDetails")).getShowDate()%> , 
               <%=((Show) session.getAttribute("showDetails")).getShowTime()%>
            </p>
         </div>
         <div class="wrapper">
            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
               <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
               <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
            </svg>
         </div>
         <div class="success">
            <p> Booking Successful!</p>
         </div>
      </div>
   </body>
</html>