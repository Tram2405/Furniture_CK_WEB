<%@page import="com.entity.Product_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store: My order</title>
<%@include file="all_componen/allCss.jsp"%>
</head>
<body style="background-color: #dfe4ea;">
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
<%@include file="all_componen/navbar.jsp"%>
   <div class="container p-1">
    <h4 class="text-center mt-4" style="color: #30336b;">ĐƠN HÀNG CỦA BẠN</h4>
		<table class="table table-striped mt-3">
			<thead class="text-white" style="background-color: #95afc0">
				<tr>
					<th scope="col">Oder ID</th>
					<th scope="col">Tên khách hàng</th>
					<th scope="col">Tên sản phẩm</th>
					<th scope="col">Nơi sản xuất</th>
					<th scope="col">Giá</th>
					<th scope="col">Cách thức thanh toán</th>

				</tr>
			</thead>
			<tbody>

              <% 
              User u = (User) session.getAttribute("userobj");
              ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
              List<Product_Order> plist = dao.getProduct(u.getEmail());
              for(Product_Order p:plist) {
  				%>
  				<tr>
  					<th scope="row"><%=p.getOrderId()%></th>
  					<td><%=p.getUserName()%></td>
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
    
   </div>
</body>
</html>