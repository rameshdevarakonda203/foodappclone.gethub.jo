package com.foodAppClone.Controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodAppClone.daoimpl.MenuDAOImpl;
import com.foodAppClone.daointerface.MenuDAO;
import com.foodAppClone.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlets")
public class MenuServlets extends HttpServlet {
	
private ArrayList<Menu> MenuList;

@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	HttpSession session=req.getSession();
	int rid = Integer.parseInt(req.getParameter("Restaurant_id"));
	session.setAttribute("rid",req.getParameter("Restaurant_id"));
	
	
	MenuDAO mdao=new MenuDAOImpl();
	MenuList =mdao.fetchMenuByRestaurantId(rid);
	
	
	session.setAttribute("MenuList", MenuList);
	resp.sendRedirect("Menu.jsp");
	

}
	
	
	
	
}
