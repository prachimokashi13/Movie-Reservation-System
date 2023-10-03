package com.project.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] names = request.getParameterValues("selectedSeats");
		List<String> selectedSeats = Arrays.asList(names);
		request.getSession().setAttribute("selectedSeats", selectedSeats);
		
		if(request.getSession().getAttribute("username")!=null){
			request.getRequestDispatcher("book.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
