package com.foodAppClone.Controller;

import java.io.IOException;

import com.foodAppClone.daoimpl.UserDAOImpl;
import com.foodAppClone.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	
	private UserDAOImpl udaoi;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password =req.getParameter("password");
		
		if(password.equals(req.getParameter("cpassword"))) {
			
			
			String username =req.getParameter("username");
			String email =req.getParameter("email");
			String address =req.getParameter("address");
			
			
			udaoi= new UserDAOImpl();
			udaoi.insert(new User(username,password,email,address));
			resp.sendRedirect("Login.jsp");

		}
		else {
			resp.getWriter().println("password Mismatch");
		}
	}
	

}