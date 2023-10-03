package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.Show;
import com.project.model.User;
import com.project.service.impl.EntryServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("username", null);

		EntryServiceImpl loginService = new EntryServiceImpl();
		User loggedUser = loginService.userLogin(request.getParameter("email"), request.getParameter("password"));

		boolean isSuccess;
		if (loggedUser != null && loggedUser.getPassword() != null) {
			if (loggedUser.getPassword().equals(request.getParameter("password"))) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} else {
			isSuccess = false;
		}

		if (isSuccess) {
			request.getSession().setAttribute("user", loggedUser);
			request.getSession().setAttribute("username", loggedUser.getName());
			if (((Show) request.getSession().getAttribute("showDetails")) != null) {
				request.getRequestDispatcher("book.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "Invalid username/password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
