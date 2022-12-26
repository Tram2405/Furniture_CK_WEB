<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #57606f;"></div>

<div class="container-fluid p-3">
   <div class="row">
       <div class="col-md-3 text-logo">
        <h3> Restoration Hardware </h3>
       </div>
       <!--  
         <div  class="col-md-6">
            <form class="d-flex">
                <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search" style="width: 40%; ">
                  <button class="btn btn-outline-danger" type="submit">Search</button>
            </form>
         </div>
         -->
        <div class="col-md-3">
          <c:if test="${not empty userobj }">
            <a class="btn btn-dark text-white">
              <i class="fas fa-user" style="font-size:20px"></i> ${userobj.name}</a> 
            <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger" style="color: white;"><i
					class='fa fa-sign-in' style='font-size: 20px; color: white;'></i> Đăng Xuất</a>
          </c:if>
          <c:if test="${ empty userobj} ">
				<a href="../login.jsp" class="btn btn-dark"><i
					class="fa fa-sign-in" style="font-size: 20px"></i> Đăng Nhập</a>
				<a href="../register.jsp" class="btn btn-danger"><i
					class='fas fa-user-plus' style='font-size: 20px'></i> Đăng Kí</a>
			</c:if>
        </div>
   </div>
</div>

<!-- Logout modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You Want Logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End Logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-color"style="background-color: #57606f;">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-home" style='font-size:28px'></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home<span class="sr-only">(current)</span></a>
        </li>
    </form>
  </div>
</nav>