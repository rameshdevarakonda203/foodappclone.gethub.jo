package com.foodAppClone.Controller;

import java.io.IOException;

import com.foodAppClone.daoimpl.MenuDAOImpl;
import com.foodAppClone.daointerface.MenuDAO;
import com.foodAppClone.model.Cart;
import com.foodAppClone.model.CartItem;
import com.foodAppClone.model.Menu;
import com.foodAppClone.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		// STEP 1: Get the session for the cart

		HttpSession session =req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");

		// STEP 2: Check if the cart exist or not (if not create one)

		if(cart==null) {
			cart=new Cart();
			session.setAttribute("cart",cart);
		}

		// STEP 3 : Fetch request parameters

		String action =req.getParameter("action");
		int Menu_id =Integer.parseInt(req.getParameter("Menu_id"));

		// STEP 4 : Create A object of MenuDAO (for fetching the details of the menu item)

		MenuDAO menuDAO=null;
		try {
			menuDAO = new MenuDAOImpl();
		}
		catch(Exception e) {

			e.printStackTrace();
		}

		// STEP 5 : Check if the item has to be added to the cart based on the action.

		try {
			if(action .equals("add")) {
				Menu menuItem = menuDAO.fetch(Menu_id);

				if(menuItem !=null) {
					
					int Quantity =1;
					
					CartItem cartItem = new  CartItem(menuItem.getMenu_id(),menuItem.getRestaurant_id(),menuItem.getName(),Quantity,menuItem.getPrice());
					cart.addItem(cartItem);
					System.out.println(cartItem);
				}
			}
				else if(action.equals("Update")) {
					int Quantity =Integer.parseInt(req.getParameter("Quantity"));
					System.out.println(Quantity);
					cart.UpdateItem(Menu_id, Quantity);

				}
				else if(action.equals("remove")) {
					cart.removeItem(Menu_id);
				}
		}
			catch(Exception e) {
				e.printStackTrace();
			}

			// STEP 6: Redirect to Cart Page
		

			session.setAttribute("cart", cart);
			resp.sendRedirect("Cart.jsp");
		}

			
}
