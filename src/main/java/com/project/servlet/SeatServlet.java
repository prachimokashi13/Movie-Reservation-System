package com.project.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.Seat;
import com.project.model.Show;
import com.project.model.Theatre;
import com.project.service.impl.SeatServiceImpl;


/**
 * Servlet implementation class SeatServlet
 */
@WebServlet("/seats")
public class SeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer screenId = Integer.parseInt(request.getParameter("screenId"));
		Integer showId = Integer.parseInt(request.getParameter("showId"));
		
		List<Theatre> allTheatres = (List<Theatre>) request.getSession().getAttribute("allTheatres");
		for(Theatre theatre: allTheatres) {
			for(Show show :theatre.getShows()) {
				if(show.getShowId()== showId) {
					request.getSession().setAttribute("showDetails", show);
					break;
				}
			}
		}
		
		SeatServiceImpl seatService = new SeatServiceImpl();
		Map<Integer, List<Seat>> seatDetails =seatService.getSeatDetails(showId,screenId,request);
		request.setAttribute("showId", showId);
		request.setAttribute("seatDetails", seatDetails);
		request.getRequestDispatcher("seatbooking.jsp").forward(request, response);


	}


}
