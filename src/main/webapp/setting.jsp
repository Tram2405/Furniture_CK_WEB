<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store: Setting</title>
<%@include file="all_componen/allCss.jsp"%>
<style type="text/css">
a{
 text-decoration: none;
 color: #2f3542;
 
}
a:hover {
	text-decoration: none;
	color: #ff4757;
}
</style>


</head>
<body style="background-color: #dfe4ea;">
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
<%@include file="all_componen/navbar.jsp"%>
 <div class="container">
   <h3 class="text-center">Hello,${userobj.name}</h3>
   <div class="row p-5">
       <div class="col-md-6 mt-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class='fas fa-edit' style='font-size:32px; color: #eccc68;'></i>
							</div>
							<h4>Chỉnh Sửa Thông Tin</h4>
						</div>
					</div>
				</a>
			</div>	
		<div class="col-md-6 mt-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class='fas fa-briefcase' style='font-size:32px; color: #70a1ff;'></i>
							</div>
							<h4>Trung Tâm Trợ Giúp</h4>
						</div>
					</div>
				</a>
			</div>	
     	
			
		<div class="col-md-6 mt-4">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open" style="font-size: 32px; color: #70a1ff;"></i>
							</div>
							<h4>Đơn Hàng Của Bạn</h4>
							<p>Theo dõi đơn hàng</p>
						</div>
					</div>
				</a>
			</div>


			
   </div>
 </div>
<%@include file="all_componen/footer.jsp"%>
</body>
</html>