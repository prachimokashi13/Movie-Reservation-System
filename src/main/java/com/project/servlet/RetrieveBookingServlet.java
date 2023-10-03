package com.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.BookedShows;
import com.project.model.User;
import com.project.service.impl.RetrieveBookingServiceImpl;

/**
 * Servlet implementation class RetrieveBookingServlet
 */
@WebServlet("/retrieve")
public class RetrieveBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RetrieveBookingServiceImpl retrieveBookingServiceImpl = new RetrieveBookingServiceImpl();
		List<BookedShows> bookedShowsList = retrieveBookingServiceImpl
				.retrieveBooking(((User) session.getAttribute("user")).getUserId());
		request.setAttribute("myBookings", bookedShowsList);
		request.getRequestDispatcher("viewbooking.jsp").forward(request, response);
	}

}
