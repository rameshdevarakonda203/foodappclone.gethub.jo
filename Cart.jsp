<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.foodAppClone.model.Cart" %>
<%@ page import="com.foodAppClone.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFE53B;
            background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            padding: 20px;
            background-image: radial-gradient(circle farthest-corner at 3.7% 49.8%, rgba(143,232,255,1) 21.9%, rgba(209,243,251,1) 52.9%);
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.05);
        }

        .cart-item h3 {
            margin: 0;
            font-size: 18px;
        }

        .cart-item p {
            margin: 5px 0;
            color: #555;
            font-size: 14px;
        }

        .cart-item-actions {
            display: flex;
            align-items: center;
        }

        .cart-item-actions form {
            display: inline-block;
            margin-right: 10px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 6px 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .remove-button {
            background-color: #f44336; /* Red color */
        }

        .remove-button:hover {
            background-color: #dc3545; /* Darker red on hover */
        }

        .total {
            text-align: right;
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        .links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        /* Links styling for "Add More Items" and "Proceed to Checkout" */
        .links a {
            text-decoration: none;
            background-color: #4CAF50; /* Green color */
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }

        .links a:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        /* Quantity buttons styling */
        .quantity-buttons {
            display: flex;
            align-items: center;
        }

        .quantity-buttons button {
            margin-right: 5px;
            font-size: 16px;
            padding: 5px 10px;
        }

        .quantity-display {
            font-size: 16px;
            padding: 0 10px;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Your Cart</h1>

        <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
        %>
            <center><p>Your cart is empty</p></center>
        <% 
        } else {
            double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
        %>
                <div class="cart-item">
                    <div>
                        <h3><%= item.getName() %></h3>
                        <p>Price: Rs. <%= item.getPrice() %></p>
                        <p>Total: Rs. <%= item.getPrice() * item.getQuantity() %></p>
                    </div>

                     <!-- Right side (Actions: Update, Remove) -->
                    <div class="right-side">
                        <div class="actions">
                            <!-- Update Quantity Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="Update">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() - 1 %>" class="update-btn">-</button>
                                <span><%= item.getQuantity() %></span>
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() + 1 %>" class="update-btn">+</button>
                            </form><br><br>

                            <!-- Remove Item Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" class="remove-button">Remove</button>
                            </form>
                        </div>
                    </div>
                </div>
        <% 
            }
        %>

        <div class="total">
            Total Amount: Rs. <%= totalAmount %>
        </div>

        <%
         String id = (String)session.getAttribute("rid");
         int rid = Integer.parseInt(id);
        %>    

        <div class="links">
            <!-- Add More Items Link -->
            <a href="MenuServlets?Restaurant_id=<%= rid %>">Add More Items</a>

            <!-- Proceed to Checkout Link -->
            <a href="CheckOut.jsp">Proceed to Checkout</a>
        </div>

        <%
        }
        %>
    </div>
</body>
</html>

<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.foodAppClone.model.Cart" %>
<%@ page import="com.foodAppClone.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
           
             	
     		background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
		
       	
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            padding: 20px;
            <%--background-color: #fff;%>
            
            background-image: radial-gradient( circle farthest-corner at 3.7% 49.8%,  rgba(143,232,255,1) 21.9%, rgba(209,243,251,1) 52.9% );
            
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.05);
        }

        .cart-item h3 {
            margin: 0;
            font-size: 18px;
        }

        .cart-item p {
            margin: 5px 0;
            color: #555;
            font-size: 14px;
        }

        .cart-item-actions {
            display: flex;
            align-items: center;
        }

        .cart-item-actions form {
            display: inline-block;
            margin-right: 10px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 6px 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .remove-button {
            background-color: #f44336;
            
        }

        .remove-button:hover {
            <%--background-color: #e53935;%>
            background-color:#dc3545;
        }

        .total {
            text-align: right;
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        .links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .links a {
            text-decoration: none;
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }

        .links a:hover {
            background-color: #1e88e5;
        }

        /* Quantity buttons styling */
        .quantity-buttons {
            display: flex;
            align-items: center;
        }

        .quantity-buttons button {
            margin-right: 5px;
            font-size: 16px;
            padding: 5px 10px;
        }

        .quantity-display {
            font-size: 16px;
            padding: 0 10px;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Your Cart</h1>

        <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
        %>
            <p>Your cart is empty</p>
        <% 
        } else {
            double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
        %>
                <div class="cart-item">
                    <div>
                        <h3><%= item.getName() %></h3>
                        <p>Price: Rs. <%= item.getPrice() %></p>
                        <p>Total: Rs. <%= item.getPrice() * item.getQuantity() %></p>
                    </div>

                     <!-- Right side (Actions: Update, Remove) -->
                    <div class="right-side">
                        <div class="actions">
                            <!-- Update Quantity Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="Update">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() - 1 %>" class="update-btn">-</button>
                                <span><%= item.getQuantity() %></span>
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() + 1 %>" class="update-btn">+</button>
                            </form><br><br>

                            <!-- Remove Item Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" class="remove-btn">Remove</button>
                            </form>
                        </div>
                    </div>
                </div>
        <% 
            }
        %>

        <div class="total">
            Total Amount: Rs. <%= totalAmount %>
        </div>

        <%
         String id = (String)session.getAttribute("rid");
         int rid = Integer.parseInt(id);
        %>    

        <div class="links">
            <!-- Add More Items Link -->
            <a href="MenuServlets?Restaurant_id=<%= rid %>">Add More Items</a>

            <!-- Proceed to Checkout Link -->
            <a href="CheckOut.jsp">Proceed to Checkout</a>
        </div>

        <%
        }
        %>
    </div>
</body>
</html>
--%>















<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.foodAppClone.model.Cart" %>
<%@ page import="com.foodAppClone.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
    body {
        <%--font-family: Arial, sans-serif;%>
        background-color: #FFE53B;
		background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
       	
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        width: 80%;
        margin: 0 auto;
    }

    .cart-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 10px;
        border-bottom: 1px solid #ddd;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        margin-top: 8px;
    }

    .cart-item .left-side {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        font-size: 14px; /* Decrease font size */
    }

    .cart-item .right-side {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
    }

    .cart-item .item-name {
        font-size: 16px; /* Medium font for item name */
        font-weight: bold;
        color: #333;
        margin-bottom: 3px;
    }

    .cart-item .price, .cart-item .total {
        font-size: 14px; /* Decreased font size for price and total */
        color: #555;
    }

    .cart-item .actions {
        display: flex;
        flex-direction: column;
        gap: 5px; /* Reduced gap between buttons */
    }

    .actions .update-btn {
        background-color: #28a745; /* Green color for Update */
        color: #fff;
        border: none;
        padding: 5px 8px; /* Smaller padding for buttons */
        cursor: pointer;
        border-radius: 4px;
        font-size: 12px; /* Smaller font size for buttons */
    }

    .actions .update-btn:hover {
        background-color: #218838;
    }

    .actions .remove-btn {
        background-color: #dc3545; /* Red color for Remove */
        color: #fff;
        border: none;
        padding: 5px 8px; /* Smaller padding for buttons */
        cursor: pointer;
        border-radius: 4px;
        font-size: 12px; /* Smaller font size for buttons */
    }

    .actions .remove-btn:hover {
        background-color: #c82333;
    }

    .total-amount {
        text-align: right;
        margin-top: 15px; /* Reduced top margin */
        font-size: 16px; /* Medium font size */
        font-weight: bold;
    }

    .checkout-links {
        text-align: right;
        margin-top: 15px; /* Reduced margin */
    }

    .checkout-links a {
        text-decoration: none;
        background-color: #28a745;
        color: #fff;
        padding: 8px 15px; /* Smaller padding for links */
        border-radius: 4px;
        margin-left: 10px;
        font-size: 14px; /* Smaller font size */
    }

    .checkout-links a:hover {
        background-color: #218838;
    }

    .empty-cart {
        text-align: center;
        color: #999;
        margin-top: 15px; /* Reduced margin */
        font-size: 16px; /* Medium font size for empty cart message */
    }
</style>
</head>
<body>
    <div class="container">
    	
    		<center>
    			<h1>Your Cart</h1>
    		</center>
        <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
        %>
            <p class="empty-cart">Your cart is Empty</p>
        <% 
        } else {
        %>
            <%
            double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
            %>
                <div class="cart-item">
                    <!-- Left side (Name, Price, Total) -->
                    <div class="left-side">
                        <div class="item-name"><%= item.getName() %></div><br><br>
                        <div class="price">Price: Rs. <%= item.getPrice() %></div><br><br>
                        <div class="total">Total: Rs. <%= item.getPrice() * item.getQuantity() %></div>
                    </div>
                    
                    <!-- Right side (Actions: Update, Remove) -->
                    <div class="right-side">
                        <div class="actions">
                            <!-- Update Quantity Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="Update">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() - 1 %>" class="update-btn">-</button>
                                <span><%= item.getQuantity() %></span>
                                <button type="submit" name="Quantity" value="<%= item.getQuantity() + 1 %>" class="update-btn">+</button>
                            </form><br><br>

                            <!-- Remove Item Form -->
                            <form action="cart" style="display: inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                                <button type="submit" class="remove-btn">Remove</button>
                            </form>
                        </div>
                    </div>
                </div>
            <% 
            }
            %>
            
            <%
             String id =(String)session.getAttribute("rid");
             int rid = Integer.parseInt(id);
             %>  
            
            <h3 class="total-amount">Total Amount: Rs. <%= totalAmount %></h3>
            
            <div class="checkout-links">
                <!-- Add More Items Link -->
                <a href="MenuServlets?Restaurant_id=<%= rid %>">Add More Items</a>
                <!-- Proceed to Checkout Link -->
                <a href="checkout.jsp">Proceed to checkout</a>
            </div>
        <%
        }
        %>
    </div>
</body>
</html>

--%>


 <%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.foodAppClone.model.Cart" %>
<%@ page import="com.foodAppClone.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            <%--font-family: Arial, sans-serif;%>
            
            
           background-color: #FFE53B;
           
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
       	
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
        
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .actions form {
            margin-bottom: 10px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        .remove-button {
            background-color: #ff0000;
        }
        .remove-button:hover {
            background-color: #e60000;
        }
        .cart-summary {
            text-align: center;
            margin-top: 20px;
        }
        .cart-summary h3 {
            color: #333;
        }
        .cart-summary a {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .cart-summary a:hover {
            background-color: #45a049;
        }
        
       
        
        
    </style>
</head>
<body>
    <h1>Your Cart</h1>
    
    <%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
    %>
        <p style="text-align: center; color: #555;">Your cart is empty</p>
    <% 
    } else {
    %>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            
            <%
            double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
            %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>Rs. <%= item.getPrice() %></td>
                    <td>Rs. <%= item.getPrice() * item.getQuantity() %></td>
                    <td class="actions">
                        <!-- Update Quantity Form -->
                        <form action="cart">
                            <input type="hidden" name="action" value="Update">
                            <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                            <button type="submit" name="Quantity" value="<%= item.getQuantity() - 1 %>">-</button>
                            <span><%= item.getQuantity() %></span>
                            <button type="submit" name="Quantity" value="<%= item.getQuantity() + 1 %>">+</button>
                        </form>

                        <!-- Remove Item Form (Moved Below) -->
                        <form action="cart">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                            <button type="submit" class="remove-button">Remove</button>
                        </form>
                    </td>
                </tr>
            <% 
            }
            %>
        </table>
        <% 
         String id =(String)session.getAttribute("rid");
         int rid = Integer.parseInt(id);
         %>    
         
        <div class="cart-summary">
            <h3>Total Amount: Rs. <%= totalAmount %></h3>
            <!-- Add More Items Link -->
            <a href="MenuServlets?Restaurant_id=<%= rid %>">Add More Items</a>
            <!-- Proceed to Checkout Link -->
            <a href="CheckOut.jsp">Proceed to checkout</a>
        </div>
    <%
    }
    %>
</body>
</html>
--%>






<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.foodAppClone.model.Cart" %>
<%@ page import="com.foodAppClone.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
    <h1>Your Cart</h1>
    
    <%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
    %>
        <p>Your cart is Empty</p>
    <% 
    } else {
    %>
        <table border="1px solid black">
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            
            <%
            double totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
            %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>Rs. <%= item.getPrice() %></td>
                    <td>Rs. <%= item.getPrice() * item.getQuantity() %></td>
                    <td>
                        <!-- Update Quantity Form -->
                        <form action="cart">
                            <input type="hidden" name="action" value="Update">
                            <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                            <button type="submit" name="Quantity" value="<%= item.getQuantity() - 1 %>">-</button>
                            <span><%= item.getQuantity() %></span>
                            <button type="submit" name="Quantity" value="<%= item.getQuantity() + 1 %>">+</button>
                        </form>

                        <!-- Remove Item Form -->
                        <form action="cart">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="Menu_id" value="<%= item.getMenu_id() %>">
                            <button type="submit" >Remove</button>
                        </form>
                    </td>
                </tr>
            <% 
            }
            %>
        </table>
        <% 
         String id =(String)session.getAttribute("rid");
		 int rid = Integer.parseInt(id);
		 %>	
		 
		 	
        <h3>Total Amount: Rs. <%= totalAmount %></h3>
        <!-- Add More Items Link -->
        <a href="MenuServlets?Restaurant_id=<%= rid %>">Add More Items</a>
        <!-- Proceed to Checkout Link -->
        <a href="checkout.jsp">Proceed to checkout</a>
    <%
    }
    %>
</body>
</html>
--%>






















<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import ="java.util.Map" %>
	<%@ page import=" com.foodAppClone.model.Cart" %>  
	<%@ page import=" com.foodAppClone.model.CartItem" %> 
	  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
		<h1>Your Cart</h1>
		
		<%
		 
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null||cart.getItems().isEmpty()){
		%>
				<p>Your cart is Empty</p>
				
		<% 
			} else{
				
			%>
			
			<table border ="1px solid black">
			<tr>
				<th>Item Name </th>
				<th>Price  </th>
				<th>Total </th>
			
			</tr>
			
			<%
				double  totalAmount=0;
			for(Map.Entry<Integer,CartItem> entry:cart.getItems().entrySet()){
				CartItem item =entry.getValue();
			 	totalAmount  +=item.getPrice()*item.getQuantity();
			 %>
			 		
			 		<tr>
			 		<td><%= item.getName() %></td>
			 		<td><%= item.getPrice() %></td>
			 		<td><%= item.getPrice()*item.getQuantity() %></td>
			 		
			 		<form action ="cart" method ="service" class="update">
			 		<input  type="hidden" name ="action" value="update">
			 		<input type="hidden" name="Menu_id" value="<%=item.getMenu_id() %>">
			 		<button type="submit" name ="Quantity" value ="<%=item.getQuantity() -1 %>">-</button>
			 		<span><%= item.getQuantity() %></span>
			 		<button type="submit" name ="Quantity" value ="<%=item.getQuantity() +1 %>">+</button>
			 		</form>
			 		
			 		
			 		<form action ="cart" method ="service" class="remove">
			 		<input  type="hidden" name ="action" value="remove">
			 		<input type="hidden" name="Menu_id" value="<%=item.getMenu_id() %>">
			 		<button type="submit" name ="btn btn-danger">Remove</button>
			 		</form>
			 		</tr>
			 
			 		
			 	<% 
			 	}
			 	%>
			
			</table>
				
			 	<% 
			 	}
			 	%>
			 	
			 	<h3> Total Amount :Rs.<%=totalAmount %></h3>
			 	<a href ="MenuServlets?Restaurant_id=<%=Restaurant_id%>">Add More Items</a>
			 	<a href ="checkout.jsp">Proceed to checkout</a>

</body>
</html>
--%>

















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import ="java.util.Map" %>					
    <%@ page import ="com.foodAppClone.model.Cart" %>
    <%@ page import ="com.foodAppClone.model.CartItem" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
	<h1>Your Cart</h1>
<%
		Cart cart = (Cart)session.getAttribute("cart");
		 if(cart==null||cart.getItems().isEmpty()){
%>
	<p> Your cart is Empty</p>
<%
	 } else{
	%>
	<table>
		<tr> 
			<td>Name </td>
			<td>Price</td>
			<td>Total</td>
		</tr>
	
	
	<%
	
	for(Map.Entry<Integer,CartItem> entry:cart.getItems().entrySet()){
		CartItem item = entry.getValue();
	%>	
		<tr>
		<td><%= item.getName() %></td>
		<td><%= item.getPrice() %></td>
		<td><%= item.getPrice()*item.getQuantity() %></td>
		
		<form action ="Update">
		<input type ="hidden" name="Menu_id" value="<%= item.getMenu_id()%>">
		<button type="submit" name="action" value="<%= item.getQuantity()-1%>">-</button>
		<span ><%= item.getQuantity() %></span>
		<button type="submit" name="action" value="<%= item.getQuantity()+1%>">+</button>
		</form>
		</tr>
		
		
	<% 
	}
	%>	
		</table>
	<% 
	}
		 
		 String id =(String)session.getAttribute("rid");
		 int rid = Integer.parseInt(id);
	 %>
		
		<form action="MenuServlets"> 
		<input type="hidden" name="Restaurant_id" value="<%=rid %>">
		<button type ="submit"> Add more items</button>
		</form> 
		
		<form action = "Proceed to check">
		<button type= "submit">Proceed to check </button>
		
		</form>
	

</body>
</html>
--%>