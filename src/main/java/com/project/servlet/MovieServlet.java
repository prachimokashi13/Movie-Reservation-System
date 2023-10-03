package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.Movie;
import com.project.service.impl.MovieServiceImpl;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet("/movieDetails")
public class MovieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer movieId = Integer.parseInt(request.getParameter("movieId"));
		MovieServiceImpl movieService = new MovieServiceImpl();
		Movie movieDetails = movieService.getMovieDetails(movieId);
		request.setAttribute("movieDetails", movieDetails);
		HttpSession session = request.getSession();
		session.setAttribute("movieId", movieDetails.getMovieId());
		session.setAttribute("movieName", movieDetails.getMovieName());
		session.setAttribute("movieDetails", movieDetails);
		request.getRequestDispatcher("movies.jsp").forward(request, response);

	}

	

}
