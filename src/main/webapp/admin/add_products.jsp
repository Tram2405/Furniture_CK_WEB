<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Products</title>
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
						<h4 class="text-center" style="font-size: 40px; color:#2f3542; ">Thêm sản phẩm</h4>


						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
                    
						<form action="../add_products" method="post"
							enctype="multipart/form-data">

							<div class="form-gruop">
								<label for="exampleInputEmail">Tên Sản Phẩm*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-gruop">
								<label for="exampleInputEmail">Nơi sản xuất*</label> <input
									name="makein" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-gruop">
								<label for="exampleInputEmail">Giá*</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputPassword1">
							</div>



							<div class="form-group">
								<label for="inputState">Danh mục sản phẩm</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="Phong khach">Phòng khách</option>
									<option value="Phong ngu">Phòng ngủ</option>
									<option value="Phong an">Phòng ăn</option>
								</select>
							</div>

							<div class="form-gruop">
								<label for="exampleInputEmail">Chi tiết sản phẩm*</label> <input
									name="status" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleControlFile1">Thêm hình ảnh</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Thêm</button>
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