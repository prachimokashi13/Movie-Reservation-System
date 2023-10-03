package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.service.impl.BookingServiceImpl;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/book")
public class BookingServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookingServiceImpl bookingService = new BookingServiceImpl();
		int isSuccess = bookingService.bookShow(request.getSession());
		
		if(isSuccess == 1) {
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
		
		
	}

}
