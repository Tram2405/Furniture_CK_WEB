<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

<!-- linkcss -->
<link rel="stylesheet" href="all_componen/index.css"/>

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
<title>Sản phẩm phòng ngủ</title>
<%
	User u = (User) session.getAttribute("userobj");
	%>
<%@include file="all_componen/allCss.jsp"%>
</head>
<body>
<%@include file="all_componen/navbar.jsp"%>
<div class="container-fluid">
    <div class="row p-3">
  <%
     ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
     List<ProductDtls> list3=dao3.getAllBed();
     for(ProductDtls p:list3){
    %>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="product/<%=p.getPhotoName()%>"
							style="width: 200px; height: 200px;"
							class="img-thumblin img-curve">
						<p><%= p.getProductName()%></p>
						<p><%= p.getMakein()%></p>
						<p>Danh mục:<%= p.getCategory()%></p>
						<div class="row"
							style="display: inline; font-size: 5px; height: 20px; width: 20px;">
							<% if(u==null){
								%>
								<a  href="login.jsp" type="button" class="btn btn-warning btn-sm"><i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a> 
							<% }else{%>
							<a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" type="button" class="btn btn-warning btn-sm"> <i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a>
							<% }
							%>
							<a type="button" href="view_products.jsp?pid=<%=p.getProductId()%>" class="btn btn-danger btn-sm">Chi
								tiết</a>
							<a type="button" class="btn btn-warning btn-sm">
								<i class="fa fa-money" style="font-size: 15px"></i> </i> <%= p.getPrice()%><span style='font-size:14px;'>&#8363;</span>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
	</div>
</div>
</body>
</html>