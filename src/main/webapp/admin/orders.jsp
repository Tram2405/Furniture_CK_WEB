<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderImpl"%>
<%@page import="com.entity.Product_Order"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
  <c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr style="background-color: #eccc68;">
				<th scope="col">Order Id</th>
				<th scope="col">Khách hàng</th>
				<th scope="col">Email</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">SĐT</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Nơi sản xuất</th>
				<th scope="col">Giá</th>
				<th scope="col">Hình thức thanh toán</th>
			</tr>
		</thead>
		
		<tbody>
		
		<%
				User u = (User) session.getAttribute("userobj");
				ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
				List<Product_Order> plist = dao.getAllOrder();
				
				for(Product_Order p:plist) {
				%>
				<tr>
					<th scope="row"><%=p.getOrderId()%></th>
					<td><%=p.getUserName()%></td>
					<td><%=p.getEmail()%></td>
					<td><%=p.getFulladd()%></td>
					<td><%=p.getPhno()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getMakein()%></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getPaymentType()%></td>
				</tr>

				<%
				}
				%>
		
		   
		</tbody>
	</table>
</body>
</html>