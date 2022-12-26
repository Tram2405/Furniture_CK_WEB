<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- link font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Raleway:ital@1&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kurale&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@600&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: #ff4d4d;
}
</style>

</head>
<body>
<%@include file="navbar.jsp"%>

   <c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
   
<br>
<br>
     <div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-plus fa-3x text-primary"></i><br>
							<h4>Thêm sản phẩm</h4>
							-------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class='fab fa-penny-arcade' style='font-size:50px; color: black;'></i><br>
							<h4>Tất cả sản phẩm</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class='fas fa-box-open' style='font-size:50px;color:#fed330'></i><br>
							<h4>Đơn hàng</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa fa-sign-out" style="font-size:50px;color:black;"></i><br>
							<h4>Đăng xuất</h4>
							-------------
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You Want Logout ???</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button" a
							class="btn btn-primary text-white">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Logout modal -->

	<div style="margin-top: 139px;">
	<%@include file="footer.jsp"%></div>
</body>
</html>