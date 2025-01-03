<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
         	background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-image: radial-gradient( circle farthest-corner at 3.7% 49.8%,  rgba(143,232,255,1) 21.9%, rgba(209,243,251,1) 52.9% );
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        textarea {
            resize: none;
        }
        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }

        /* Payment section styles */
        .payment-method {
            margin: 20px 0;
        }
        .payment-method h3 {
            margin-bottom: 10px;
        }
        .payment-options {
            display: flex;
            flex-direction: column;
        }
        .payment-option {
            display: flex;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            cursor: pointer;
        }
        .payment-option input[type="radio"] {
            margin-right: 10px;
        }
        .payment-option:hover {
            background-color: #f0f0f0;
        }
        .payment-option img {
            width: 30px;
            margin-right: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Checkout</h2>
        <form action="CheckOutServlet">
            <label for="name">Name of the Person</label>
            <input type="text" id="name" name="name" required placeholder=" Name">
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" required placeholder="10 Digit Mobile Number">
            
            <label for="Pin code">Pin Code</label>
            <input type="text" id="pin code" name="pin code" required placeholder=" Pin Code">

            <label for="address">Delivery Address</label>
            <textarea id="address" name="address" rows="3" required placeholder="Address(Area and Street) "></textarea>

			<label for="cdt">City/District/Town</label>
            <textarea id="cdt" name="cdt" required placeholder=" City/District/Town"></textarea>
			
			
			<label for="land mark">LandMark</label>
            <input type="text" id="landmark" name="landmark" required placeholder=" LandMark(Optional)">
			
			<label for="state">State</label>
				<select id="state" name="state">
				<option value="AP">Andhra Pradesh</option>
				<option value="AR">Arunachal Pradesh</option>
				<option value="AS">Assam</option>
				<option value="BR">Bihar</option>
				<option value="CT">Chhattisgarh</option>
				<option value="GA">Goa</option>
				<option value="GJ">Gujarat</option>
				<option value="HR">Haryana</option>
				<option value="HP">Himachal Pradesh</option>
				<option value="JK">Jammu and Kashmir</option>
				<option value="JH">Jharkhand</option>
				<option value="KA">Karnataka</option>
				<option value="KL">Kerala</option>
				<option value="MP">Madhya Pradesh</option>
				<option value="MH">Maharashtra</option>
				<option value="MN">Manipur</option>
				<option value="ML">Meghalaya</option>
				<option value="MZ">Mizoram</option>
				<option value="NL">Nagaland</option>
				<option value="OR">Odisha</option>
				<option value="PB">Punjab</option>
				<option value="RJ">Rajasthan</option>
				<option value="SK">Sikkim</option>
				<option value="TN">Tamil Nadu</option>
				<option value="TG">Telangana</option>
				<option value="TR">Tripura</option>
				<option value="UP">Uttar Pradesh</option>
				<option value="UT">Uttarakhand</option>
				<option value="WB">West Bengal</option>
			</select>

            <!-- Payment method section -->
            <div class="payment-method">
                <h3>Payment Method</h3>
                <div class="payment-options">
                    <label class="payment-option">
                        <input type="radio" name="payment" value="UPI" required>
                        <img src="upi-icon.png" alt="UPI Icon"> UPI
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="Wallet" required>
                        <img src="wallet-icon.png" alt="Wallet Icon"> Wallets
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="Card" required>
                        <img src="card-icon.png" alt="Card Icon"> Credit / Debit / ATM Card
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="NetBanking" required>
                        <img src="netbanking-icon.png" alt="Net Banking Icon"> Net Banking
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="COD" required>
                        <img src="cod-icon.png" alt="Cash on Delivery Icon"> Cash on Delivery
                    </label>
                </div>
            </div>

            <button type="submit">Confirm Order</button>
        </form>
    </div>

</body>
</html>

--%>























<<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            <%--font-family: Arial, sans-serif;--%>
            
         	background-color: #FFE53B;
			background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            <%--background-color: #fff;--%>
            background-image: radial-gradient( circle farthest-corner at 3.7% 49.8%,  rgba(143,232,255,1) 21.9%, rgba(209,243,251,1) 52.9% );
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        textarea {
            resize: none;
        }
        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Checkout</h2>
        <form action="CheckOutServlet">
            <label for="name">Name of the Person</label>
            <input type="text" id="name" name="name" required placeholder=" Name">
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" required placeholder="10 Digit Mobile Number">
            
            <label for="Pin code">Pin Code</label>
            <input type="text" id="pin code" name="pin code" required placeholder=" Pin Code">

            <label for="address">Delivery Address</label>
            <textarea id="address" name="address" rows="3" required placeholder="Address(Area and Street) "></textarea>

			<label for="cdt">City/District/Town</label>
            <textarea id="cdt" name="cdt" required placeholder=" City/District/Town"></textarea>
			
			
			<label for="land mark">LandMark</label>
            <input type="text" id="landmark" name="landmark" required placeholder=" LandMark(Optional)">
			
			<label for="state">State</label>
				<select id="state" name="state">
				<option value="AP">Andhra Pradesh</option>
				<option value="AR">Arunachal Pradesh</option>
				<option value="AS">Assam</option>
				<option value="BR">Bihar</option>
				<option value="CT">Chhattisgarh</option>
				<option value="GA">Goa</option>
				<option value="GJ">Gujarat</option>
				<option value="HR">Haryana</option>
				<option value="HP">Himachal Pradesh</option>
				<option value="JK">Jammu and Kashmir</option>
				<option value="JH">Jharkhand</option>
				<option value="KA">Karnataka</option>
				<option value="KL">Kerala</option>
				<option value="MP">Madhya Pradesh</option>
				<option value="MH">Maharashtra</option>
				<option value="MN">Manipur</option>
				<option value="ML">Meghalaya</option>
				<option value="MZ">Mizoram</option>
				<option value="NL">Nagaland</option>
				<option value="OR">Odisha</option>
				<option value="PB">Punjab</option>
				<option value="RJ">Rajasthan</option>
				<option value="SK">Sikkim</option>
				<option value="TN">Tamil Nadu</option>
				<option value="TG">Telangana</option>
				<option value="TR">Tripura</option>
				<option value="UP">Uttar Pradesh</option>
				<option value="UT">Uttarakhand</option>
				<option value="WB">West Bengal</option>

			</select>

            

            <label for="payment">Payment Method</label>
            <select id="payment" name="payment">
                <option value="COD">Cash on Delivery</option>
                <option value="Card">Card Payment</option>
                <option value="UPI">UPI</option>
            </select>

            <button type="submit">Confirm Order</button>
        </form>
    </div>

</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChecKOut</title>
</head>
<body>
		<h2>CheckOut</h2>
		
		<form action="CheckOutServlet">
            <label for="name">Name of the Person</label>
            <input type="text" id="name" name="name" required placeholder=" Name">
            
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" required placeholder="10 Digit Mobile Number">
            
            <label for="Pin code">Pin Code</label>
            <input type="text" id="pin code" name="pin code" required placeholder=" Pin Code">

            <label for="address">Delivery Address</label>
            <textarea id="address" name="address" rows="3" required placeholder="Address(Area and Street) "></textarea>

			<label for="cdt">City/District/Town</label>
            <textarea id="cdt" name="cdt" required placeholder=" City/District/Town"></textarea>
			
			
			<label for="land mark">LandMark</label>
            <input type="text" id="landmark" name="landmark" required placeholder=" LandMark(Optional)">
			
			<label for="state">State</label>
				<select id="state" name="state">
				<option value="AP">Andhra Pradesh</option>
				<option value="AR">Arunachal Pradesh</option>
				<option value="AS">Assam</option>
				<option value="BR">Bihar</option>
				<option value="CT">Chhattisgarh</option>
				<option value="GA">Goa</option>
				<option value="GJ">Gujarat</option>
				<option value="HR">Haryana</option>
				<option value="HP">Himachal Pradesh</option>
				<option value="JK">Jammu and Kashmir</option>
				<option value="JH">Jharkhand</option>
				<option value="KA">Karnataka</option>
				<option value="KL">Kerala</option>
				<option value="MP">Madhya Pradesh</option>
				<option value="MH">Maharashtra</option>
				<option value="MN">Manipur</option>
				<option value="ML">Meghalaya</option>
				<option value="MZ">Mizoram</option>
				<option value="NL">Nagaland</option>
				<option value="OR">Odisha</option>
				<option value="PB">Punjab</option>
				<option value="RJ">Rajasthan</option>
				<option value="SK">Sikkim</option>
				<option value="TN">Tamil Nadu</option>
				<option value="TG">Telangana</option>
				<option value="TR">Tripura</option>
				<option value="UP">Uttar Pradesh</option>
				<option value="UT">Uttarakhand</option>
				<option value="WB">West Bengal</option>

			</select>
            <label for="payment">Payment Method</label>
            <select id="payment" name="payment">
                <option value="COD">Cash on Delivery</option>
                <option value="Card">Card Payment</option>
                <option value="UPI">UPI</option>
            </select>
		
		
         
         <button type="submit">Confirm Order</button>
		
		
		</form>

</body>
</html>

--%>
















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChecKOut</title>
</head>
<body>
		<h2>CheckOut</h2>
		<form action ="CheckOut">
		<label for="name">Name of the Person</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="address">Delivery Address</label>
        <textarea id="address" name="address" rows="4" required></textarea><br><br>

        <label for="phone">Phone Number</label>
        <input type="text" id="phone" name="phone" required><br><br>

        <label for="payment">Payment Method</label>
        <select id="payment" name="payment">
        <option value="COD">Cash on Delivery</option>
         <option value="Card">Card Payment</option>
         <option value="UPI">UPI</option>
         </select><br><br><br>
         
         <button type="submit">Confirm Order</button>
		
		
		</form>

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
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
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
        .total-amount {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
        .billing-info {
            margin-bottom: 20px;
        }
        .billing-info label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .billing-info input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .billing-info textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }
        .confirm-order {
            text-align: center;
        }
        .confirm-order button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .confirm-order button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Checkout</h1>
    <div class="container">
        
        <h2>Order Summary</h2>
        <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
        %>
            <p>Your cart is empty. <a href="index.jsp">Add items to your cart</a> before proceeding to checkout.</p>
        <%
        } else {
        %>
            <table>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <%
                double totalAmount = 0;
                for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                    CartItem item = entry.getValue();
                    double itemTotal = item.getPrice() * item.getQuantity();
                    totalAmount += itemTotal;
                %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td>Rs. <%= item.getPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>Rs. <%= itemTotal %></td>
                    </tr>
                <%
                }
                %>
            </table>
            <div class="total-amount">
                <strong>Total Amount: Rs. <%= totalAmount %></strong>
            </div>

            <h2>Billing Information</h2>
            <div class="billing-info">
                <form action="OrderServlet" method="post">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required>

                    <label for="address">Delivery Address</label>
                    <textarea id="address" name="address" rows="4" required></textarea>

                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required>

                    <label for="payment">Payment Method</label>
                    <select id="payment" name="payment">
                        <option value="COD">Cash on Delivery</option>
                        <option value="Card">Card Payment</option>
                        <option value="UPI">UPI</option>
                    </select>

                    <div class="confirm-order">
                        <button type="submit">Confirm Order</button>
                    </div>
                </form>
            </div>
        <%
        }
        %>
    </div>
</body>
</html>
--%>

