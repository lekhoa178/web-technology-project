package com.cnw.shoppingweb.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.cnw.shoppingweb.beans.UserBean;
import com.cnw.shoppingweb.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginSrv
 */
@WebServlet("/LoginSrv")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		response.setContentType("text/html");

		String status = "Login Denied! Invalid Username or password.";

		UserServiceImpl udao = new UserServiceImpl();

		status = udao.isValidCredential(userName, password);
		UserBean userBean = udao.getUserDetails(userName, password);
		String userType = userBean.getRole();

		if (status.equalsIgnoreCase("valid")) {
			// valid

			RequestDispatcher rd = null;

			HttpSession session = request.getSession();

			session.setAttribute("username", userName);
			session.setAttribute("password", password);
			session.setAttribute("usertype", userType);

			if (userType.equals("ADMIN"))
				rd = request.getRequestDispatcher("adminViewProduct.jsp");
			else
			{
				rd = request.getRequestDispatcher("userHome.jsp");
				session.setAttribute("userdata", userBean);
			}

			rd.forward(request, response);
		} else {
			// Invalid;
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);
			rd.include(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
