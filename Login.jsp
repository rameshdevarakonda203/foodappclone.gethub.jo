<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
       	font-family: Arial, sans-serif;
        <%--background: url('https://files.oaiusercontent.com/file-NXxPLxejcT99KEmKEQtaXj?se=2024-12-18T08%3A54%3A03Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dd3b52aa6-1c32-464b-9a39-12799ab2b70f.webp&sig=r/j/FiSh4r2rvmP2vNgPcNfwg7capZg8lW3JV%2BCBkI4%3D') no-repeat center center fixed;--%>
       	
     background-color: #FFE53B;
		background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
		
       	
       background-size: cover; /* Ensures the image covers the entire window */
       margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
       height: 100vh;
        
    }

    form {
       
        background-color:#fff;
       	padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      	max-width: 380px;
        width: 100%;
    }

    h1 {
        text-align: center;
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    input[type="text"],
    input[type="password"] {
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
    <form action="LoginServlet">
        <h1>LOGIN</h1>
        
        <div class="form-group">
        <label for="email">Email</label>
          <input type="text" id="email" name="email" required placeholder="Enter your Email">
          <label for="password">Password</label><br>
          <input type="password" id="password" name="password" required placeholder="Enter your Password">
        </div>
        <input type="submit" value="Login">
        
    <center><p>If you are a new User, <a href="register.jsp">Register here</a></p></center>
        
    </form>
</body>
</html>


















<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
       	font-family: Arial, sans-serif;
        <%--background: url('https://files.oaiusercontent.com/file-NXxPLxejcT99KEmKEQtaXj?se=2024-12-18T08%3A54%3A03Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dd3b52aa6-1c32-464b-9a39-12799ab2b70f.webp&sig=r/j/FiSh4r2rvmP2vNgPcNfwg7capZg8lW3JV%2BCBkI4%3D') no-repeat center center fixed;%>
       	
     background-color: #FFE53B;
		background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 74%);
		
       	
       background-size: cover; /* Ensures the image covers the entire window */
       margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
       height: 100vh;
        
    }

    form {
       
        background-color:#fff;
       	padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      	max-width: 380px;
        width: 100%;
    }

    h1 {
        text-align: center;
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    input[type="text"] {
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
    <form action="LoginServlet">
        <h1>LOGIN</h1>
        
        <div class="form-group">
        <label for="email">Email</label>
          <input type="text" id="email" name="email" required placeholder="Enter your Email">
          <label for="password">Password</label><br>
          <input type="text" id="password" name="password" required placeholder="Enter your Password">
        </div>
        <input type="submit" value="Login">
        
    <center><p>If you are a new User, <a href="register.jsp">Register here</a></p></center>
        
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
<title>Login</title>
</head>
<body>
	<form action="LoginServlet">
	<h1>LOGIN</h1>
	  Email: <input type="text" name="email"><br>
	  Password: <input type="text" name="password"><br>
	  <input type="submit" value="Login">
	</form>

</body>
</html>

--%>