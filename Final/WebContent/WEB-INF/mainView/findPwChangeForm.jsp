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
	text-align: center;
}

#content
{
	width: 400px;
}

#btn
{
	width: 400px;
	height: 50px;
	margin-top: 10px;
}

</style>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#btn").click(function()
		{
			if ( ( $("#newPw").val()=="" || $("#memPw").val()=="" ) )
			{
				alert("값을 입력해주세요.");
				return;
			}	
			
			if( $("#newPw").val() != $("#memPw").val() )
			{
				alert("입력한 값이 서로 다릅니다.");
				return;
			}
			
		});
		
		
	});

</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
	<div id="inner">
		<div id="main">
		
			<div id="title">
				<h2>비밀번호 변경</h2>
				<span>비밀번호를 변경해주세요.</span>
			</div>
			
			<form action="findpwchange.action" method="post">
				<div id="content">
					<input type="hidden" name="memNo" value="${memNo }"/>
					새 비밀번호<input type="password" id="newPw" name="newPw" class="form-control" required="required" placeholder="새 비밀번호"/><br>
					비밀번호 확인<input type="password" id="memPw" name="memPw" class="form-control" required="required" placeholder="비밀번호 확인"/><br>
					<button type="submit" class="btn btn-info" >비밀번호 변경</button>
				</div>
			</form>
			
		</div>
	</div>
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>