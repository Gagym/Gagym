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

<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>


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
	margin: 20px 0;
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
				<h2 class="title">아이디 찾기</h2>
			</div>
			
			<div id="content">
				<span>회원가입 시 사용한 아이디는 [ ${id } ] 입니다.</span>
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