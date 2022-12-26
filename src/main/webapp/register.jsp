<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store - Sign up</title>
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
         <div class="form">
            <h1 class="form-heading"> New here, sign up here</h1>
            
            <c:if test="${not empty succMsg }">
               <p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
             </c:if>
             
             <c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
			 </c:if>
            
            
            <form action="register" method="post">
            <input type="text" autocomplete="off" id="name" placeholder="Full name" name="fname" required>
            <input type="email" autocomplete="off" id="email" placeholder="Email" name="email" required>
            <input type="password" autocomplete="off" id="password" placeholder="Password" name="password" required>
            <input type="tel" autocomplete="off" id="number" placeholder="Phone number" name="phno" required>
            <span class="error">**This is an error</span>
            
            <div>
              <input type="checkbox" id="tc" name="check">
              <label for="tc" class="tc-text">You agree to our <a href="#">term and conditions</a></label>
            </div>
            
            <button class="submit-btn">SIGN UP</button>
            <a href="login.jsp" class="other-form-link">Already have a account. Login here</a>
         </div>
         <img alt="" src="img/signup-bg.png" class="form-img">
       </div>
    </section>
    
   <%@include file="all_componen/footer.jsp"%>
   </form>
</body>
</html>