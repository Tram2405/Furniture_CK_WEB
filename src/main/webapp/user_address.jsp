<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store: Edit Address</title>
<%@include file="all_componen/allCss.jsp"%>
</head>
<body style="background-color: #dfe4ea;">
<%@include file="all_componen/navbar.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4 mt-5">
      <div class="card">
        <div class="card-body">
           <h4 class="text-center" style="color: #30336b;">THÊM ĐỊA CHỈ</h4>
         <form action="">
           
                <div class="form-row ">
                 
                 <div class="form-group col-md-8">
                   <label for="inputEmail4">Địa chỉ</label> 
                      <input type="text" class="form-control" id="inputEmail4">
                 </div>
                </div>
               
               <div class="form-row">
                 <div class="form-group col-md-8">
                  <label for="inputEmail4">Đường</label> 
                      <input type="text" class="form-control" id="inputEmail4" >
                 </div>
                 <div class="form-group col-md-8">
                  <label for="inputEmail4">Thành phố</label> 
                      <input type="text" class="form-control" id="inputEmail4" >
                 </div> 
               <div class="form-group col-md-8">
                  <label for="inputEmail4">Mã pin</label> 
                      <input type="text" class="form-control" id="inputEmail4" >
                 </div> 
               
               <div class="tex-center">
							<button class="btn btn-success text-white">Add Address</button>
							</div>
         </form>
        </div>
      </div>
      </div>
    </div>
  </div>
</body>
</html>