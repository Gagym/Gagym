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
<title>findIdForm.jsp</title>

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
	font-size: 40px;
}

#content
{
	margin-top: 15px;
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
				<h2>아이디 찾기</h2>
			</div>
			<span>아이디는 가입시 입력하신 이름,주민번호를 통해 찾을 수 있습니다.</span>
			
			<div id="content" style="width: 400px">
				<form action="findid.action" method="post" class="form-group">
					이름
					<input type="text" id="memName" name="memName" class="form-control" required="required" placeholder="이름"/><br />
					주민번호
					<div class="form-inline">
						<input type="text" id="ssn1" name="ssn1" class="form-control" required="required"
						placeholder="앞자리" maxlength="6" style="width:190px; margin-right:5px; display: inline;">-
						<input type="password" id="ssn2" name="ssn2" class="form-control" required="required"
						placeholder="뒷자리" maxlength="7" style="width:190px; margin-left:3px; display: inline;">
					</div><br>
					<button type="submit" id="btn" class="btn btn-info">아이디 찾기</button>
				</form>
			</div>
			
		</div>
	</div>
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>