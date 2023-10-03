<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Theatre"%>
<%@ page import="com.project.model.Show"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width,initial-scale=1.0" />
      <link href="responsive_style.css" type="text/css" rel="stylesheet" />
      <title>Login/SignUp</title>
      <style>
         body {
         margin: 0 auto;
         padding: 0px;
         text-align: center;
         width: 100%;
         font-family: "Myriad Pro", "Helvetica Neue", Helvetica, Arial,
         Sans-Serif;
         background-color: #b30738;
         }
         #wrapper {
         margin: 0 auto;
         padding: 0px;
         text-align: center;
         width: 995px;
         }
         #wrapper h1 {
         margin-top: 50px;
         font-size: 45px;
         color: #424949;
         }
         #wrapper h1 p {
         font-size: 18px;
         }
         .form_div {
         width: 330px;
         margin-left: 320px;
         padding: 10px;
         background-color: #424949;
         flex: 1;
         margin-right: 20px;
         }
         .form_div .form_label {
         margin: 15px;
         margin-bottom: 30px;
         font-size: 25px;
         font-weight: bold;
         color: white;
         text-decoration: underline;
         }
         .form_div input[type="text"], input[type="password"] {
         width: 230px;
         height: 40px;
         border-radius: 2px;
         font-size: 17px;
         padding-left: 5px;
         border: none;
         }
         .form_div input[type="submit"] {
         width: 230px;
         height: 40px;
         border: none;
         border-radius: 2px;
         font-size: 17px;
         background-color: #b30738;
         border-bottom: 3px solid #616A6B;
         color: white;
         font-weight: bold;
         }
         @media only screen and (min-width:700px) and (max-width:995px) {
         #wrapper {
         width: 100%;
         }
         #wrapper h1 {
         font-size: 30px;
         }
         .form_div {
         width: 50%;
         margin-left: 25%;
         padding-left: 0px;
         padding-right: 0px;
         }
         .form_div input[type="text"], input[type="password"] {
         width: 80%;
         }
         .form_div textarea {
         width: 80%;
         }
         .form_div input[type="submit"] {
         width: 80%;
         }
         }
         @media only screen and (min-width:400px) and (max-width:699px) {
         #wrapper {
         width: 100%;
         }
         #wrapper h1 {
         font-size: 30px;
         }
         .form_div {
         width: 60%;
         margin-left: 20%;
         }
         .form_div input[type="text"], input[type="password"] {
         width: 80%;
         }
         .form_div input[type="submit"] {
         width: 80%;
         }
         }
         @media only screen and (min-width:100px) and (max-width:399px) {
         #wrapper {
         width: 100%;
         }
         #wrapper h1 {
         font-size: 25px;
         }
         .form_div {
         width: 90%;
         margin-left: 5%;
         padding-left: 0px;
         padding-right: 0px;
         }
         .form_div input[type="text"], input[type="password"] {
         width: 80%;
         }
         .form_div input[type="submit"] {
         width: 80%;
         }
         }
      </style>
   </head>
   <body>
      <%@include file="header.jsp"%>
      <div id="wrapper">
         <div class="form_div">
            <p class="form_label">LOGIN FORM</p>
            <form method="post" action="login">
               <p>
                  <input type="text" name = "email" placeholder="Enter Email">
               </p>
               <p>
                  <input type="password" name = "password" placeholder="**********">
               </p>
               ${message}
               <p>
                  <input type="submit" value="LOGIN">
               </p>
            </form>
         </div>
         </br> </br>
         <div class="form_div">
            <p class="form_label">SIGNUP FORM</p>
            <form method="post" action="signup">
               <p>
                  <input type="text" name = "username" placeholder="Enter Name">
               </p>
               <p>
                  <input type="text"  name = "email" placeholder="Enter Email">
               </p>
               <p>
                  <input type="password" name = "password" placeholder="**********">
               </p>
               <p>
                  <input type="text" name = "phone" placeholder="Enter phone number">
               </p>
               <p>
                  <input type="submit" value="SIGNUP">
               </p>
            </form>
         </div>
      </div>
   </body>
</html>