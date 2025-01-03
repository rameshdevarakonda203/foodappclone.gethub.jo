package com.App.Controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodAppClone.daoimpl.RestaurantDAOImpl;
import com.foodAppClone.daointerface.RestaurantDAO;
import com.foodAppClone.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/GetAllRestaurants")
public class GetAllRestaurants extends HttpServlet {
	
	private ArrayList<Restaurant> restaurantList;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getCookies()[0].getValue()!=null) {
			
			RestaurantDAO rdao = new RestaurantDAOImpl();
			restaurantList = rdao.fetchAll();
			
			//System.out.println(restaurantList);
			
			HttpSession session=req.getSession();
			session.setAttribute("restaurantList",restaurantList);
			resp.sendRedirect("Home.jsp");
		}
		else {
			resp.sendRedirect("login.html");
		}
	}
	
	
}
