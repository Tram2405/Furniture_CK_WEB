<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online store - file not found</title>
<%@include file="all_componen/allCss.jsp"%>
<link rel="stylesheet" href="css/form.css"/>
<link rel="stylesheet" href="css/404_page.css"/>
<!-- link font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Raleway:ital@1&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kurale&display=swap" rel="stylesheet">
</head>
<body>
	<%if (response.getStatus() == 500) {%>
		<font color="red">Error: <%=exception.getMessage()%></font>
		<br>

	<%-- include login page --%>

	<%} else {%>
	<header class="four-0-four-section">
		<div class="content">
			<h1 class="er">Page doesn't exitst</h1>
			Đương dẫn sai. Nhấn vào đây để về trang chủ 
		<a href="index.jsp">Home page</a>
	<%}%>
		</div>
	</header>
	
</body>
</html>