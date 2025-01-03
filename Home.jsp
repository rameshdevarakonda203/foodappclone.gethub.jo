 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            <%--background-color: #f9f9f9;--%>
            
            background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
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
            <%--background-color: white;--%>
            <%--background-image: linear-gradient(-20deg, #00cdac 0%, #8ddad5 100%);--%>
           
           	background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(176,229,208,1) 42%, rgba(92,202,238,0.41) 93.6% );
            
            <%--width: 300px;--%>
            
           
            width:300px;
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
            
            <%--height: 200px;--%>
            
            height: 230px;
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
            <%--color: #7f8c8d;--%>
            
            color: #000000;
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

        .view-menu-chip {
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername()%>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>
    
    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <a href="MenuServlets?Restaurant_id=<%= r.getRestaurant_id()%>">
                    <img src="<%= r.getImage_path() %>" alt="Restaurant Image"> 
                </a>              
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: 
                        <span class="rating-chip">
                            <% 
                               float rating = r.getRattings(); // Get the rating value
                                for (int i = 0; i < 1 ; i++) { // Loop for 5 stars
                                    if (i < rating) { // If the index is less than the rating, show filled star
                            %>
                                ★ <!-- Filled star -->
                            <% 
                                    }
                                } 
                            %>
                            <%= rating %> 
                        </span>
                    </p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                    <Center>
                    <a class="view-menu-chip" href="MenuServlets?Restaurant_id=<%= r.getRestaurant_id() %>">View Menu</a>
                </Center>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>
    

    <div class="container">
        <% for (Restaurant r : rList) { %>
    	
            <div class="card">
            <a  href="MenuServlets?Restaurant_id=<%= r.getRestaurant_id()%>">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image"> 
                </a>              
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: 
                        <span class="rating-chip">
                            <% 
                               float rating = r.getRattings(); // Get the rating value
                                for (int i = 0; i < 5; i++) { // Loop for 5 stars
                                    if (i < rating) { // If the index is less than the rating, show filled star
                            %>
                                ★ <!-- Filled star -->
                            <% 
                                    } else { // Otherwise, show empty star
                            %>
                                ☆ <!-- Empty star -->
                            <% 
                                    }
                                } 
                            %>
                            <%= rating %> / 5
                        </span>
                    </p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                    
                    <a href ="MenuServlets?Restaurant_id=<%= r.getRestaurant_id() %>"> View Menu</a>
                </div>
            </div>
            
        <% } %>
    </div>
    

</body>
</html>

--%>










<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <span class="rating-chip"><%= r.getRattings() %> / 5</span></p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
--%>








<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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
    flex-wrap: wrap; /* Allow wrapping of cards */
    justify-content: center; /* Center the cards */
    gap: 20px; /* Space between cards */
    padding: 20px;
}

.card {
    background-color: white;
    width: 300px; /* Fixed width for cards */
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.2s, box-shadow 0.2s;
    position: relative; /* Positioning context for absolute children */
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.card img {
    width: 100%;
    height: 200px; /* Fixed height for images */
    object-fit: cover; /* Maintain aspect ratio */
}

.card-content {
    padding: 15px;
    position: relative; /* Positioning context for absolute children */
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

.card-content span {
    display: block;
    margin-top: 10px;
    font-weight: bold;
    color: #2c3e50;
}

.chip {
    display: inline-block; /* Changed to inline-block */
    padding: 4px 8px; /* Adjusted padding */
    font-size: 14px;
    color: white;
    background-color: #3498db;
    border-radius: 16px;
    white-space: nowrap;
    line-height: 1.5;
    margin: 2px; /* Added margin */
}

.rating-chip {
    display: inline-block; /* Changed to inline-block */
    padding: 4px 8px; /* Adjusted padding */
    font-size: 14px;
    color: white;
    background-color: #27ae60;
    border-radius: 16px;
    white-space: nowrap;
    line-height: 1.5;
    position: absolute; /* Changed to absolute */
    top: -12px; /* Position above the content */
    right: 10px; /* Position from the right */
    z-index: 1; /* Ensure it's above other content */
}

@media (max-width: 768px) {
    .container {
        flex-direction: column; /* Stack cards vertically on small screens */
        align-items: center; /* Center cards */
    }

    .card {
        width: 90%; /* Full width on small screens */
    }
}
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <span class="rating-chip"><%= r.getRattings() %> / 5</span></p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>

--%>




















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <span class="rating-chip"><%= r.getRattings() %> / 5</span></p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
--%>


























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

        .card-content span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            background-color: #3498db;
            border-radius: 20px;
            margin: 3px 0;
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <%= r.getRattings() %> / 5</p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
--%>






























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>
<%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

        card-content span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            border-radius: 20px;
            margin :5px 0;
            background-color: #3498db;
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type: <span class="chip"><%= r.getCuisine_type() %></span></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <%= r.getRattings() %> / 5</p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                    <span>Restaurant ID: <%= r.getRestaurant_id() %></span>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>

--%>























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
	<%@ page import="com.foodAppClone.model.Restaurant" %>
    <%@ page import="com.foodAppClone.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

        .card-content span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
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

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
			<img src="<%= r.getImage_path() %>" alt="Restaurant Image">               
			<div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine Type <%= r.getCuisine_type() %></p>
                    <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <%= r.getRattings() %> / 5</p>
                    <p>Availability: <%= r.isIs_active()? "Available" : "Unavailable" %></p>
                    <span>Restaurant ID: <%= r.getRestaurant_id() %></span>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
--%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodAppClone.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .card {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
        padding: 15px;
        margin: 10px;
        text-align: center;
    }

    .card img {
        width: 100%;
        border-radius: 8px;
    }

    .card h2 {
        font-size: 20px;
        margin: 10px 0;
    }

    .card p {
        font-size: 14px;
        color: #555;
    }

    .card .info {
        text-align: left;
    }

    .card .info p {
        margin: 5px 0;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<h1>Hello, <%= session.getAttribute("name") %>!</h1>

<% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

<div class="container">
    <% for (Restaurant r : rList) { %>
        <div class="card">
            <img src="<%= r.getImage_path() %>" alt="Restaurant Image">
            <h2><%= r.getName() %></h2>
            <div class="info">
                <p><strong>Cuisine Type:</strong> <%= r.getCuisine_type() %></p>
                <p><strong>Delivery Time:</strong> <%= r.getDelivery_time() %> minutes</p>
                <p><strong>Address:</strong> <%= r.getAddress() %></p>
                <p><strong>Ratings:</strong> <%= r.getRattings() %></p>
                <p><strong>Active:</strong> <%= r.isIs_active() ? "Yes" : "No" %></p>
            </div>
        </div>
    <% } %>
</div>

<a href="NextPage"><button>Click Here For Next</button></a>

</body>
</html>
--%>









<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*" %>
    <%@ page import="com.foodAppClone.model.Restaurant" %>
    <%@ page import="com.foodAppClone.model.User" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    h1 {
        text-align: center;
        margin: 20px;
        color: #333;
    }
    
    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        padding: 20px;
    }
    
    .card {
        background-color: white;
        border: 1px solid #ccc;
        border-radius: 8px;
        width: 30%;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        transition: transform 0.2s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 8px 8px 0 0;
    }

    .card-details {
        padding: 10px;
    }

    .card-details h2 {
        font-size: 1.2em;
        margin: 0;
        color: #333;
    }

    .card-details p {
        margin: 5px 0;
        color: #555;
    }

    button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #218838;
    }

</style>
</head>
<body>
    <%User u = (User)session.getAttribute("u"); %>
    <h1>Hello <%= u.getUsername()%></h1>
    <% ArrayList<Restaurant> rList= (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>
    
    <div class="card-container">
    <% 
    for(Restaurant r : rList){
    %>
        <div class="card">
            <img src="<%= r.getImage_path() %>" alt="<%= r.getName() %> Image">
            <div class="card-details">
                <h2><%= r.getName() %></h2>
                <p>Cuisine: <%= r.getCuisine_type() %></p>
                <p>Delivery Time: <%= r.getDelivery_time() %> mins</p>
                <p>Address: <%= r.getAddress() %></p>
                <p>Ratings: <%= r.getRattings() %> / 5</p>
                <p>Active: <%= r.isIs_active() ? "Yes" : "No" %></p>
            </div>
        </div>
    <% 
    }
    %>
    </div>

    <div style="text-align:center;">
        <a href ="NextPage"><button>Click Here For Next</button></a>
    </div>
</body>
</html>
--%>





<%--- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*" %>
    <%@ page import="com.foodAppClone.model.Restaurant" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello <% out.println(session.getAttribute("name")); %></h1>
	<% ArrayList<Restaurant> rList= (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>
	
	<table border ="1px solid black">
	<th>
	<tr>
		<td>restaurant_id</td>
		<td>name</td>
		<td>cuisine_type</td>
		<td>delivery_time</td>
		<td>address</td>
		<td>rattings</td>
		<td>is_active</td>
		<td>image_path</td>
	</tr>
	</th>
	
	<% 
	for(Restaurant r : rList){
		%>
		<tr>
			<td><% out.println(r.getRestaurant_id()); %></td>
			<td><%= r.getName() %></td>
			<td><%= r.getCuisine_type() %></td>
			<td><%= r.getDelivery_time() %></td>
			<td><%= r.getAddress() %></td>
			<td><%= r.getRattings() %></td>
			<td><%= r.isIs_active() %></td>
			<td><%= r.getImage_path() %></td>
		</tr>
		
		
		<%
	}
	%>
		
	</table>
	
	<a href ="NextPage"><button>Click Here For Next</button></a>
</body>
</html>

--%>
