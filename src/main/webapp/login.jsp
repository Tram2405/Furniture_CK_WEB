<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store - Login</title>

<%@include file="all_componen/allCss.jsp"%>
<link rel="stylesheet" href="css/form.css"/>

<!-- link font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Raleway:ital@1&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kurale&display=swap" rel="stylesheet">

</head>
<body>
 <%@include file="all_componen/navbar.jsp"%>
    <section class="form-section">
       <div class="form-container">
       <img alt="" src="img/login-bg.png" class="form-img">
         <div class="form">
            <h1 class="form-heading">Wellcome back, Login here</h1>

				<c:if test="${not empty succMsg}">
					<h5 class="text-center text-success">${succMsg}</h5>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg}</h5>
					<c:remove var="failedMsg" scope="session" />
				</c:if>

				<form action="login" method="post">
            <input type="email" autocomplete="off" id="email" placeholder="Email" name="email">
            <input type="password" autocomplete="off" id="password" placeholder="Password" name="password">
            
            
            <button class="submit-btn">LOGIN</button>
            <a href="register.jsp" class="other-form-link">Create Account</a>
            </form>
         </div>   
       </div>
    </section>
    
 <%@include file="all_componen/footer.jsp"%>
</body>
</html>