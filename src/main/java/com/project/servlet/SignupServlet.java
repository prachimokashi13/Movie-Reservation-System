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
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("username", null);
		
		EntryServiceImpl signupService = new EntryServiceImpl();
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("username"));
		user.setPhone(Integer.parseInt(request.getParameter("phone")));

		int userId = signupService.userSignUp(user);

		if (userId != 0) {
			user.setUserId(userId);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("username", user.getName());
			if (((Show) request.getSession().getAttribute("showDetails")) != null) {
				request.getRequestDispatcher("book.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "Invalid");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
