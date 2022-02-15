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
<title>findIdAfter.jsp</title>

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
	width: 100%;
}

#inner
{
	width: 1100px;
	margin: auto;
	padding: 100px 0;
}

#main
{
	margin-left: 33%;
}


#title
{
	width: 400px;
	font-size: 40px;
	text-align: center;
}

#content
{
	width: 400px;
	text-align: center;
}


#btn
{
	width: 400px;
	height: 50px;
	margin-top: 10px;
}

</style>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
	<div id="inner">
		<div id="main">
		
			<div id="title">
				<h2 class="title">비밀번호 찾기</h2>
			</div>
			
			<div id="content">
				<span>비밀번호가 변경되었습니다</span>
			</div>
			
			<div>
				<form action="loginform.action">
					<button type="submit" id="btn" class="btn btn-info">로그인 화면으로 돌아가기</button>
				</form>
			</div>
			
		</div>	
	</div>
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>