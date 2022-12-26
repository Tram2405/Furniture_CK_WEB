<%@page import="com.entity.ProductDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="java.awt.print.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Products</title>
<%@include file="allCss.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>
  
   <c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h2 class="text-center">Hello Admin</h2>

	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-damger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

 
	<table class="table table-striped">
		<thead class="bg-primary text-white bg-col">
			<tr style="background-color: #2f3542;">
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Nơi sản xuất</th>
				<th scope="col">Giá</th>
				<th scope="col">Danh mục</th>
				<th scope="col">Trạng thái</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		
		<tbody>
		<%
		  ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
		  List<ProductDtls> list = dao.getAllProducts();
		  for(ProductDtls p:list){%>
			<tr>
				<td ><%=p.getProductId()%></td>
				<td><img src="../product/<%=p.getPhotoName()%>" style="width: 50px; height: 50px;"></td>
				<td><%=p.getProductName()%></td>
				<td><%=p.getMakein()%></td>
				<td><%=p.getPrice()%></td>
				<td><%=p.getCategory()%></td>
				<td><%=p.getStatus()%></td>
				<td><a href="edit_products.jsp?id=<%=p.getProductId()%>" class="btn btn-sm btn-primary"><i class='fas fa-edit' style='font-size:16px'></i> Edit</a> <a
					href="../delete?id=<%=p.getProductId() %>" class="btn btn-sm btn-danger"><i class='fas fa-trash' style='font-size:16px'></i> Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
   </table>
</body>
</html>