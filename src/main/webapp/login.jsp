<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="title">Se connecter</div>
<form action="<%= request.getContextPath()  %>/login" method="post">
	<div >
        <div>
		 	 <input type="text" id="email"
		 	name="email" placeholder="Enter your email" required>
		</div>
	   <div >
		    <input type="password" name="password"
			id="password" placeholder="Enter your password" required> 
	  </div>
	   <div >
			<input type="submit" value="Envoyer">
		</div>
	  </div>
	  </form>
</body>
</html>