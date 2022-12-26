<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Oline Store: Cart</title>
<%@include file="all_componen/allCss.jsp"%>


<!-- link font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato&family=Raleway:ital@1&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kurale&display=swap"
	rel="stylesheet">

</head>
<body style="background-color: #dfe4ea;">
	<%@include file="all_componen/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger" role="alert">${faiedlMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success"
							style="font-family: 'Kurale', serif; font-size: 30px;">LỰA
							CHỌN CỦA BẠN</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Tên Khách Hàng</th>
									<th scope="col">Nơi sản xuất</th>
									<th scope="col">Giá</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<cart> cart = dao.getProductByUser(u.getId());
								double totalPrice = 0;
								for (cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getProductName()%></th>
									<td scope="col"><%=c.getMakein()%></td>
									<td scope="col" style="text-align: right;"><fmt:formatNumber
											value="<%=c.getPrice()%>" type="currency" currencySymbol=""
											maxFractionDigits="0" /> VNĐ</td>
									<td><a
										href="remove_product?pid=<%=c.getPid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Xoá</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Tổng tiền</td>
									<td></td>
									<td style="display:flex; text-align: right;"><fmt:formatNumber
											value="<%=totalPrice%>" type="currency" currencySymbol=""
											maxFractionDigits="0" /> VNĐ</td>

									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success"
							style="font-family: 'Kurale', serif; font-size: 30px;">CHI TIẾT</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Tên Khách Hàng</label> <input
										type="text" name="username" class="form-control"
										id="inputEmail4" value="${userobj.name }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="${userobj.email}" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">SĐT</label> <input type="tel"
										name="phno" class="form-control" id="inputEmail4"
										value="${userobj.phno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Địa chỉ</label> <input type="text"
										name="address" class="form-control" id="inputEmail4"
										value="<%=u.getAddress()%>" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Đường</label> <input type="text"
										name="street" class="form-control" id="inputEmail4"
										value="<%=u.getStreet()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Thành phố</label> <input type="text"
										name="city" class="form-control" id="inputEmail4"
										value="<%=u.getCity()%>" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Pin Code</label> <input type="text"
										name="pincode" class="form-control" id="inputEmail4" value=""
										required>
								</div>
								<div class="form-group col-md-6">
									<label>Cách thức thanh toán</label>
									 <select class="form-control" name="payment">
										<option value="noselect">---select----</option>
										<option value="COD">COD</option>
									</select>
								</div>

							</div>
							
							<div class="form-row ">
								<div class="form-group col-md-6 text-center">
									<button class="btn btn-warning ml-5">Đặt hàng</button>
								</div>
								<div class="form-group col-md-6 text-center">
									<a href="index.jsp" class="btn btn-success mr-5">Tiếp tục mua hàng</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>