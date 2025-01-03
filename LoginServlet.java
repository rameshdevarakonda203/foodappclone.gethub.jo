package com.foodAppClone.Controller;

import java.io.IOException;

import com.foodAppClone.daoimpl.UserDAOImpl;
import com.foodAppClone.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private UserDAOImpl udaoi;
	private User u;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String password =req.getParameter("password");
		
		if(password.equals(req.getParameter("password"))) {
		
			String email =req.getParameter("email");
		
			Cookie ck1 = new Cookie("email",email);
			resp.addCookie(ck1);
		
		
				udaoi= new UserDAOImpl();
				u= udaoi.fetch(email);
				
				session.setAttribute("u",u);
				
		
		    req.getRequestDispatcher("GetAllRestaurants").forward(req,resp);
		}
		else {
			resp.getWriter().println("password Mismatch");	
		}
		
	}
	
	
}