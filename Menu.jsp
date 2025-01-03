<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #FFE53B;
            background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 300px;
            background-image: radial-gradient(circle farthest-corner at 10% 20%, rgba(176, 229, 208, 1) 42%, rgba(92, 202, 238, 0.41) 93.6%);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .card-content p {
            margin: 5px 0;
            color: #0000FF;
        }

        .card-content .price {
            font-size: 16px;
            font-weight: bold;
            color: #ff0000;
        }

        .card-content .availability {
            font-size: 14px;
            color: #666;
        }

        .add-to-cart {
            background-color: #27ae60;;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .add-to-cart:hover {
            background-color: #27ae60;;
            transform: scale(1.05);
        }

        .add-to-cart:active {
            background-color:#27ae60;;
            transform: scale(0.98);
        }
    </style>
</head>
<body>

    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("MenuList"); %>

    <% for (Menu m : mList) { %>
        <div class="card">
            <img src="<%= m.getImage_path() %>" alt="<%= m.getName() %>">
            <div class="card-content">
                <h3><%= m.getName() %></h3>
                <p><%= m.getDescription() %></p>
                <p class="price">₹<%= String.format("%.2f", (double)m.getPrice()) %></p>
                
                <form action ="cart">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="Menu_id" value="<%= m.getMenu_id() %>">
                    <button type="Submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>
    <%  }%>

</body>
</html>













<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            <%--background-color: #f9f9f9;%>
            background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
       	
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            border: 1px solid #ccc;
            
            
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 300px;
            
            background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(176,229,208,1) 42%, rgba(92,202,238,0.41) 93.6% );
            
            <%--background-color: #fff;%>
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
   
            
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .card-content p {
            margin: 5px 0;
            color: #0000FF;
        }

        .card-content .price {
            font-size: 16px;
            font-weight: bold;
            color: #ff0000;
        }

        .card-content .availability {
            font-size: 14px;
            color: #666;
        }
        
    </style>
</head>
<body>

    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("MenuList"); %>

    <% for (Menu m : mList) { %>
        <div class="card">
            <img src="<%= m.getImage_path() %>" alt="<%= m.getName() %>">
            <div class="card-content">
                <h3><%= m.getName() %></h3>
                <%-- <p><strong>Menu ID:</strong> <%= m.getMenuId() %></p>--%>
                <%--<p><strong>Restaurant ID:</strong> <%= m.getRestaurantId() %></p>%>
                <p><strong></strong> <%= m.getDescription() %></p>
                <p class="price">₹<%= String.format("%.2f", (double)m.getPrice()) %></p>
                <%--<p class="availability">Available: <%= m.isAvailable() ? "Yes" : "No" %></p>%>
            	
            	<form action ="cart">
                    <input type="hidden"  name="action" value ="add">
                    <input type ="hidden" name="Menu_id" value ="<%= m.getMenu_id()%>"> 
                   	<button type = "Submit" class ="add-to-cart">Add to Cart</button>
                    </form>
                    
            
            </div>
        </div>
    <%  }%>

</body>
</html>
--%>








<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Menu</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
           <%-- background-color: #FF6A00; /* Swiggy's orange background color */%>
           
           	background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
       	
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .menu-card {
            width: calc(33.33% - 14px);
            max-width: 300px;
            
            <%--background-color: white;%>
            
            background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(176,229,208,1) 42%, rgba(92,202,238,0.41) 93.6% );
            
         	border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .menu-card-image {
            width: 100%;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
        }
        .menu-card-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .menu-card-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .menu-card h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .menu-card p {
            margin: 5px 0;
            color:#0000FF;
        }
        .menu-card .price {
            font-weight: bold;
            color: #ff0000; /* Matching the background color */
        }
        .menu-card .availability {
        
        <%--color: #60b246; /* Swiggy's green color for availability */%>
            
            color: #006400;
        }
         .ADD-chip {
            display: inline-block;
            padding: 8px 16px; /* Padding for the chip */
            font-size: 14px;
            color: white; /* Text color */
            background-color: #27ae60; /* Green background */
            border-radius: 8px; /* Rounded corners */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            margin-top: 10px; /* Space above the chip */
        }
    </style>
    
    
   
</head>
<body>
    <% ArrayList<Menu> mList=(ArrayList<Menu>)session.getAttribute("MenuList"); %>
    
    <div class="menu-container">
        <% for(Menu m : mList) { %>
            <div class="menu-card">
                <div class="menu-card-image">
                    <img src="<%= m.getImage_path() %>" alt="<%= m.getName() %>">
                </div>
                <div class="menu-card-content">
                     <h3><%= m.getName() %></h3>
                    <p><%= m.getDescription() %></p>
                    <p class="price">₹<%= String.format("%.2f", (double)m.getPrice()) %></p>
                    <%-- <p class="availability"><%= m.isIs_Available() ? "Available" : "Not Available" %></p>%>
                    
                    <form action ="cart">
                    
                    <input type="hidden"  name="action" value ="add">
                    <input type ="hidden" name="Menu_id" value ="<%= m.getMenu_id() %>"> 
                   
                    
                    <button type = "Submit" class ="add-to-cart">Add to Cart</button>
                    
                    </form>
                    
                    
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>


--%>


















<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu Cards</title>
	<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #fc8019; /* Swiggy's orange background color */
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .menu-card {
            width: calc(33.33% - 14px);
            max-width: 350px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .menu-card-image {
            width: 100%;
            height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
        }
        .menu-card-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .menu-card-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .menu-card h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .menu-card p {
            margin: 5px 0;
            color: #666;
        }
        .menu-card .price {
            font-weight: bold;
            color: #fc8019; /* Matching the background color */
        }
        .menu-card .availability {
            color: #60b246; /* Swiggy's green color for availability */
        }
    </style>
</head>
<body>
    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("MenuList"); %>
    
    <div class="container">
        <% 
        for(Menu m : mList){
        %>
            <div class="card">
                <div class="card-image-container">
                    <img src="<%= m.getImage_path() %>" alt="<%= m.getName() %>">
                </div>
                <div class="card-content">
                    <div class="card-title"><%= m.getName() %></div>
                    <div class="card-description"><%= m.getDescription() %></div>
                    <div class="card-price">$<%= String.format("%.2f",(double) m.getPrice()) %></div>
                    <div class="card-details">
                        Menu ID: <%= m.getMenu_id() %><br>
                        Restaurant ID: <%= m.getRestaurant_id() %><br>
                        Available: <%= m.isIs_Available() ? "Yes" : "No" %>
                    </div>
                </div>
            </div>
        <%
        }
        %>
    </div>
</body>
</html>
--%>




<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu Cards</title>
	    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .chip {
            display: inline-block;
            padding: 4px 8px;
            font-size: 14px;
            color: white;
            background-color: #3498db;
            border-radius: 16px;
            white-space: nowrap;
            line-height: 1.5;
            margin: 2px;
        }

        .rating-chip {
            display: inline-block;
            padding: 4px 8px;
            font-size: 14px;
            color: white;
            background-color: #27ae60;
            border-radius: 16px;
            white-space: nowrap;
            line-height: 1.5;
            margin: 2px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("MenuList"); %>
    
    <div class="container">
        <% 
        for(Menu m : mList){
        %>
            <div class="card">
                <div class="card-image-container">
                    <img src="<%= m.getImage_path() %>" alt="<%= m.getName() %>" class="card-image">
                </div>
                <div class="card-content">
                      <div class="card-title"><%= m.getName() %></div>
                    <div class="card-description"><%= m.getDescription() %></div>
                    <div class="card-price">$<%= String.format("%.2f",(double) m.getPrice()) %></div>
                    <div class="card-details">
                        Menu ID: <%= m.getMenu_id() %><br>
                        Restaurant ID: <%= m.getRestaurant_id() %><br>
                        Available: <%= m.isIs_Available() ? "Yes" : "No" %>
                    </div>
                </div>
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
    
    <%@ page import="java.util.*" %>
    <%@ page import="com.foodAppClone.model.Menu" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<Menu> mList= (ArrayList<Menu>) session.getAttribute("MenuList"); %>
	
	<table border ="1px solid black">
	<th>
	<tr>
		<td>Menu_id</td>
		<td>Restaurant_Id</td>
		<td>Item Name</td>
		<td>Description</td>
		<td>Price</td>
		<td>is_active</td>
		<td>image_path</td>
	</tr>
	</th>
	
	<% 
	for(Menu m : mList){
		%>
		<tr>
			<td><% out.println(m.getMenu_id()); %></td>
			<td><%= m.getRestaurant_id() %></td>
			<td><%= m.getName() %></td>
			<td><%= m.getDescription() %></td>
			<td><%= m.getPrice() %></td>
			<td><%= m.isIs_Available() %></td>
			<td><%= m.getImage_path() %></td>
		</tr>
		
		
		<%
	}
	%>
		
	</table>
	


</body>
</html>
--%>