<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Products</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<br>

<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center" style="font-size: 40px; color:#2f3542; ">Sửa sản phẩm</h4>

						
						<%
						 int id=Integer.parseInt(request.getParameter("id"));
						 ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
						 ProductDtls p = dao.getProductById(id);
						%>
                    
						<form action="../editproducts" method="post">
						  <input type="hidden" name="id" value="<%=p.getProductId()%>">
							<div class="form-gruop">
								<label for="exampleInputEmail">Tên sản phẩm*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=p.getProductName()%>">
							</div>

							<div class="form-gruop">
								<label for="exampleInputEmail">Nơi sản xuất*</label> <input
									name="makein" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=p.getMakein()%>">
							</div>

							<div class="form-gruop">
								<label for="exampleInputEmail">Giá*</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputPassword1" value="<%=p.getPrice()%>">
							</div>



							<div class="form-gruop">
								<label for="exampleInputEmail">Chi tiết sản phẩm*</label> <input
									name="status" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=p.getStatus()%>">
							</div>

                              <br>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 139px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>