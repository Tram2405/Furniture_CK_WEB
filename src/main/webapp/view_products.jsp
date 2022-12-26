<%@page import="com.entity.User"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
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
<title>Chi tiết sản phẩm</title>
<%@include file="all_componen/allCss.jsp"%>
</head>
<body style="background-color: #dfe4ea;">
<%@include file="all_componen/navbar.jsp"%>
<%
   User u = (User)session.getAttribute("userobj");
	%>

    <%
    int pid = Integer.parseInt(request.getParameter("pid"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	ProductDtls p = dao.getProductById(pid);
    %>

     <div class="container p-5">
       <div class="row">
         <div class="col-md-6 text-center p-5 border bg-white">
           <img alt="" src="product/<%=p.getPhotoName() %>" style="height: 300px; width: 400px; "> <br>
           <h4 class="mt-3">Tên sản phẩm: <span class="text-success"><%=p.getProductName() %></span></h4>
           <h4>Nơi sản xuất<span class="text-success"> <%=p.getMakein()%></span></h4>
           <h4>Danh mục:<span class="text-success"> <%=p.getCategory() %></span></h4>
           <h4>Chi tiết sản phẩm: <span class="text-success"><%=p.getStatus() %></span></h4>
         </div>
         
         <div class="col-md-6 text-center p-5 border bg-white">
           <h2><%=p.getProductName() %></h2> 
           <br>
           <div class="row">
           <div class="col-md-4 text-danger text-center p-2">
             <i class="fa fa-money" style="font-size:24px"></i>
             <p>COD</p>
           </div>
           
           <div class="col-md-4 text-danger text-center p-2">
             <i class="fa fa-rotate-left" style="font-size:24px"></i>
             <p>Return</p>
           </div>
             
           <div class="col-md-4 text-danger text-center p-2">
              <i class="fa fa-truck" style="font-size:24px"></i>
              <p>Free ship</p>
           </div>
           </div>
           
           <div class="text-center p-3">
            <a href="cart?pid=<%=p.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-primary"><i class="fa fa-shopping-cart" style="font-size: 15px"></i> Thêm vào giỏ hàng</a>
            <a href="" class="btn btn-danger"><i class="fa fa-money" style="font-size: 15px"></i> <%=p.getPrice() %><span style='font-size:14px;'>&#8363;</span></a>
           </div>
           
         </div>
       </div>
     </div>
 <%@include file="all_componen/footer.jsp"%>
</body>
</html>