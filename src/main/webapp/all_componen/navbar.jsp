<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<style>
.divider {
	margin: 5px;
}
</style>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false"%> 
<div class="container-fluid"
	style="height: 10px; background-color: #eccc68;"></div>

<div class="container-fluid p-3" style="background-color: #ffffff;">
	<div class="row">
		<div class="col-md-3 text-logo">
			<h3>Restoration Hardware</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Tìm kiếm sản phẩm" aria-label="Search"
					style="width: 40%;">
				<button class="btn btn-outline-danger" type="submit">Search</button>
			</form>
		</div>

        <c:if test="${not empty userobj}">
          <div class="col-md-4" style="left: 68%;">
            <a href="checkout.jsp" style="font-size: 10px;">
              <i class="fa fa-shopping-cart" style="font-size:18px"> Cart</i>
            </a>
			<a href="login.jsp" class="btn btn-dark"><i class='fas fa-user-alt' style='font-size:18px'></i> ${userobj.name}</a> 
			<a href="logout"
				class="btn btn-danger"><i
					class='fa fa-sign-in' style='font-size: 20px; color: white;'></i> Đăng xuất</a>
		  </div>
        
        </c:if>


       <c:if test="${empty userobj }">
          <div class="col-md-3">
			<a href="login.jsp" class="btn btn-dark"><i class="fa fa-sign-in"
				style="font-size: 20px"></i> Đăng Nhập</a> <a href="register.jsp"
				class="btn btn-danger"><i class='fas fa-user-plus'
				style='font-size: 20px'></i> Đăng Kí</a>
		  </div>
       </c:if>		
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-color">
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-home"
		style='font-size: 28px'></i></a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent" style="display: flex; justify-content: space-between;">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="index.jsp">Home</a></li>

			<li class="nav-item"><a class="nav-link active" href="all_dining_room.jsp"><i
					class='fas fa-mug-hot' style='font-size: 20px'></i> Phòng ăn</a></li>

			<li class="nav-item"><a class="nav-link active" href="all_living_room.jsp"><i
					class='fas fa-couch' style='font-size: 20px'></i> Phòng khách</a></li>

			<li class="nav-item"><a class="nav-link active" href="all_bed_room.jsp"><i
					class='fas fa-bed' style='font-size: 20px'></i> Phòng ngủ</a></li>
		</ul>

		<form action="" class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">
				<i class="fa fa-gear" style="font-size: 20px"></i> Cài đặt
			</a>
			<div class="divider" />
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa fa-phone" style="font-size: 20px"></i> Liên hệ
			</button>
		</form>
	</div>
</nav>