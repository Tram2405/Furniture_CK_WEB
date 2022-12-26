<%@page import="com.entity.ProductDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Online Store - Index</title>
<%@include file="all_componen/allCss.jsp"%>
</head>
<body  style="background-color: #dfe4ea;">
<%
   User u = (User)session.getAttribute("userobj");
	%>
<%@include file="all_componen/navbar.jsp"%>
<!-- header -->
   <header class="header-section">
   <h1 class="header-heading"><span>Restoration</span> Hardware</h1>
   </header>
<!-- header end-->  
 
<hr>


<!-- Living Room start-->   
<div class="container-fluid">
   <h3 class="text-pr text-center">Phòng Khách</h3>
		<div class="row p-3">
			<%
        ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
        List<ProductDtls> list=dao.getLiving();
        for(ProductDtls p:list){
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
						<div class="row" style="display: inline; font-size: 5px; height: 20px; width: 20px;">
							
							<% if(u==null){
								%>
								<a  href="login.jsp" type="button" class="btn btn-warning btn-sm"><i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a> 
							<% }else{%>
							<a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" type="button" class="btn btn-warning btn-sm"> <i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a>
							<% }
							%>
							
							<a href="view_products.jsp?pid=<%=p.getProductId() %>" type="button" class="btn btn-danger btn-sm">Chi tiết</a> 
							<a type="button" class="btn btn-warning btn-sm">
								<i href="" class="fa fa-money" style="font-size: 15px"></i> <%= p.getPrice()%><span style='font-size:14px;'>&#8363;</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
                %>
		</div>
		<div class="text-center mt-3">
			<a href="all_living_room.jsp" class="btn btn-secondary btn-sm">Tất Cả</a>
		</div>
</div>

<!-- living Room  end-->    


<!-- Dining Room start-->   
<div class="container-fluid">
   <h3 class="text-pr text-center">Phòng ăn</h3>
   <div class="row p-3">
   <%
     ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
     List<ProductDtls> list2=dao2.getDin();
     for(ProductDtls p:list2){
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
						<div class="row" style="display: inline; font-size: 5px; height: 20px; width: 20px;">
						
							<% if(u==null){
								%>
								<a  href="login.jsp" type="button" class="btn btn-warning btn-sm"><i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a> 
							<% }else{%>
							<a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" type="button" class="btn btn-warning btn-sm"> <i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a>
							<% }
							%>
							
							
							<a href="view_products.jsp?pid=<%=p.getProductId() %>"  type="button" class="btn btn-danger btn-sm">Chi
								tiết</a>
							<a type="button" class="btn btn-warning btn-sm">
								<i class="fa fa-money" style="font-size: 15px"></i> <%= p.getPrice()%><span style='font-size:14px;'>&#8363;</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
   
    
  </div>
    <div class="text-center mt-3">
      <a href="all_dining_room.jsp" class="btn btn-secondary btn-sm">Tất Cả</a>
    </div>
</div>
<!-- Dining Room  end-->  
<hr>

<!-- Bed Room start-->   
<div class="container-fluid">
   <h3 class="text-pr text-center">Phòng ngủ</h3>
   <div class="row p-3">
     <%
     ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
     List<ProductDtls> list3=dao3.getBed();
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
						<div class="row" style="display: inline; font-size: 5px; height: 20px; width: 20px;">
							<% if(u==null){
								%>
								<a  href="login.jsp" type="button" class="btn btn-warning btn-sm"><i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a> 
							<% }else{%>
							<a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" type="button" class="btn btn-warning btn-sm"> <i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a>
							<% }
							%>
							<a href="view_products.jsp?pid=<%=p.getProductId() %>" type="button" class="btn btn-danger btn-sm">Chi
								tiết</a>
							<a type="button" class="btn btn-warning btn-sm">
								<i class="fa fa-money" style="font-size: 15px"></i>  <%= p.getPrice()%><span style='font-size:14px;'>&#8363;</span>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
    
  </div>
    <div class="text-center mt-3">
      <a href="all_bed_room.jsp" class="btn btn-secondary btn-sm">Tất Cả</a>
    </div>
</div>
<!-- Bed Room  end-->  
<hr> 
<%@include file="all_componen/footer.jsp"%>
</body>
</html>