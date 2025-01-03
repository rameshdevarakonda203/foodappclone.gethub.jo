package com.foodAppClone.Controller;

import java.io.IOException;
import java.util.Map.Entry;
import java.util.Set;

import com.foodAppClone.daoimpl.OrderItemsDAOImpl;
import com.foodAppClone.daoimpl.OrdersDAOImpl;
import com.foodAppClone.daointerface.OrderItemsDAO;
import com.foodAppClone.daointerface.OrdersDAO;
import com.foodAppClone.model.Cart;
import com.foodAppClone.model.CartItem;
import com.foodAppClone.model.OrderItems;
import com.foodAppClone.model.Orders;
import com.foodAppClone.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	
		private OrdersDAO OrdersDAO;
		private CartItem item;
		
		@Override
		public void init() {
			
			try {
				
				OrdersDAO = new OrdersDAOImpl();
				
			}
			catch(Exception e ) {
				e.printStackTrace();
			}
			
		}
		
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User)session.getAttribute("u");
		
//		System.out.println(cart+ "Cart is not null");
//		System.out.println(user+ "User is not null");

		if(cart != null && user != null && !cart.getItems().isEmpty()) {
			
			System.out.println("Inside checkoutServlet if it is true");
			
			// Extract checkout from data
			
			String  payment = req.getParameter("payment");
			
			//System.out.println(payment);
			
			// create and populate the order object
			
			Orders orders = new Orders();
			
			orders.setUserid(user.getUserid());
			//System.out.println(user.getUserid());
			
			 String id =(String)session.getAttribute("rid");
	         int rid = Integer.parseInt(id);
			
			orders.setRestaurant_id(rid);
			
			//System.out.println(Integer.parseInt((String)session.getAttribute("rid")));
			
			orders.setPaymentMode(payment);
			orders.setStatus("Pending");
			
			
			//Add cart items to the order and calculate the total amount
			
			
			float totalAmount = 0;
			for( CartItem item : cart.getItems().values()) {
				totalAmount += item.getPrice() * item.getQuantity();
				
			}
			
			orders.setTotalAmount(totalAmount);
				
           /* double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
			
		}*/
			
		// Save the order to the database	
		
			 int  generatedOrderId = OrdersDAO.insert(orders);
			 System.out.println( generatedOrderId);
			
			if(cart != null && !cart.getItems().isEmpty()) {
				
				 Set<Entry<Integer,CartItem>> entrySet=cart.getItems().entrySet();
				 
				 
				 int itemTotalAmount=0;
				 
				 OrderItemsDAO orderitem =new  OrderItemsDAOImpl();
				 
				 for(Entry<Integer,CartItem> entry:entrySet) {
					 itemTotalAmount = (int) (entry.getValue().getQuantity()*entry.getValue().getPrice());
					 
					 orderitem.insert(new OrderItems(generatedOrderId,entry.getValue().getMenu_id(),entry.getValue().getQuantity(), itemTotalAmount ));
					 
				 }
				
				
			}
			
			
			// Clear the cart and redirect to the ordr confirmation page 
			
			session.removeAttribute("cart");
			
			
			resp.sendRedirect("OrderConformation.jsp");
		
		}
		else {
			resp.sendRedirect("Home.jsp");
			
		}

		
	}
}
