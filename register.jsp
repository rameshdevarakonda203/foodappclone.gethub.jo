<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        <%--background-color: #FF6A00;--%>
        
        background-color: #FFE53B;
		background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
		
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    form {
        
         <%--background-image: linear-gradient( 65.9deg,  rgba(85,228,224,1) 5.5%, rgba(75,68,224,0.74) 54.2%, rgba(64,198,238,1) 55.2%, rgba(177,36,224,1) 98.4% );--%>
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    input[type="text"], input[type="password"], input[type="email"] {
       
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    label {
    	 font-weight: bold;
        font-size: 14px;
        color: #333;
    }

    .form-group {
        margin-bottom: 15px;
    }
</style>
</head>
<body>
    <form action="Register">
        <h2>Register Here</h2>
        <div class="form-group">
            <label for="username">UserName</label>
            <input type="text" id="username" name="username"required placeholder="Enter your UserName">
        
            <label for="password">Password</label>
            <input type="password" id="password" name="password"required placeholder="Enter your Password">
      
            <label for="cpassword">Confirm Password</label>
            <input type="password" id="cpassword" name="cpassword"required placeholder="Enter your Confirm Password">

            <label for="email">Email</label>
            <input type="email" id="email" name="email"required placeholder="Enter your Email">
        
            <label for="address">Address</label>
            <input type="text" id="address" name="address"required placeholder="Enter your Address">
        </div>
        <input type="submit" value="Register" >
      <center><p>If you already have an account,<a href="Login.jsp">Login here </a></center> 
        
    </form>
</body>
</html>





 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>

<!-- Internal CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 0 auto;
    }

    input[type="text"], input[type="submit"] {
        display: block;
        width: 100%;
        margin-bottom: 15px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: White;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
        display: inline-block;
    }
</style>

</head>
<body>
	<form action="Register">
	    <label for="username">UserName</label>
	    <input type="text" name="username" id="username"><br>

	    <label for="password">Password</label>
	    <input type="text" name="password" id="password"><br>

	    <label for="cpassword">Confirm Password</label>
	    <input type="text" name="cpassword" id="cpassword"><br>

	    <label for="email">Email</label>
	    <input type="text" name="email" id="email"><br>

	    <label for="address">Address</label>
	    <input type="text" name="address" id="address"><br>

	    <input type="submit" value="Register">
	   
	  <p>If you already have an account,<a href="Login.jsp">Login here </a> 
	</form>
</body>
</html>
--%>





















<%---<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
</head>
<body>
	<form action="Register">
	UserName <input type ="text" name ="username"><br>
	Password <input type ="text" name ="password"><br>
	ConformPassword <input type ="text" name ="cpassword"><br>
	Email <input type ="text" name="email"><br>
	Address <input type ="text" name ="address"><br>
	
	<input type ="submit" value ="Register">
	</form>
</body>
</html>---%>


