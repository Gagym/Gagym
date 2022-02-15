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
<title>findPw.jsp</title>

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
	font-size: 40px;
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
				<h2>비밀번호 찾기</h2>
			</div>
			<span>비밀번호는 가입시 입력하신 아이디,이름,주민번호를 통해 찾을 수 있습니다.</span>
			
			<div id="content" style="width: 400px">
				<form action="findpwchangeform.action" method="post" class="form-group">
					아이디<input type="text" id="memId" name="memId" class="form-control" required="required" placeholder="아이디"/><br />
					이름<input type="text" id="memName" name="memName" class="form-control" required="required" placeholder="이름"/><br />
					주민번호
					<div class="form-inline">
						<input type="text" id="ssn1" name="ssn1" class="form-control" required="required"
						placeholder="앞자리" maxlength="6" style="width:190px; margin-right:5px; display: inline;">-
						<input type="password" id="ssn2" name="ssn2" class="form-control" required="required"
						placeholder="뒷자리" maxlength="7" style="width:190px; margin-left:3px; display: inline;">
					</div><br>
					<button type="submit" id="btn" class="btn btn-info">비밀번호 찾기</button>
				</form>
			</div>
			
		</div>
	</div>
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>