<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup_ok.jsp</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
	#outer
	{
		width:100%;
	}
	#inner
	{
		width:1100px;
	    margin: auto;
	}
	.box
	{
		width:400px;
		margin: 100px auto;
	    text-align: center;
	    border: 2px solid gray;
	}
</style>


</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

	<div id="outer">
		<div id="inner">
			<div class="box">
			<br>
				<p>회원가입이 완료되었습니다</p>
				<input type="button" value="메인메뉴" class="btn btn-info"
				onclick="location.href='main.action'">
				<br><br> 
			</div>
		</div>
	</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>