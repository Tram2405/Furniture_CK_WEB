<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false"%> 
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
<title>Sản phẩm phòng khách</title>
<%@include file="all_componen/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}


#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #eccc68;
	padding: 10px;
	color: #2f3542;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
  <c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
      </script>
	</c:if>

	<%@include file="all_componen/navbar.jsp"%>
  <div class="container-fluid">
    <div class="row p-3">
        <%
        ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
        List<ProductDtls> list=dao.getAllLiving();
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
						<p>
							Danh mục:<%= p.getCategory()%></p>
						<div class="row"
							style="display: inline; font-size: 5px; height: 20px; width: 20px;">
							<% if(u==null){
								%>
								<a  href="login.jsp" type="button" class="btn btn-warning btn-sm"><i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a> 
							<% }else{%>
							<a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" type="button" class="btn btn-warning btn-sm"> <i class="fa fa-shopping-cart" style="font-size: 15px"></i>Thêm vào giỏ</a>
							<% }
							%>
							<a type="button" href="view_products.jsp?pid=<%=p.getProductId()%>" class="btn btn-danger btn-sm">Chi tiết</a> 
								
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
  </div>
</body>
</html>