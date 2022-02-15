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
<title>Header.jsp</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	#outer {width: 100%;}
	.container
	{
		width: 1100px;
		border: 1px solid;
		margin: auto;
	}
	#titleImg{margin: 20px 13px; width: 100px;}
	#headerLink{margin-left: 30%;}
	#headerLink .btn{margin: 15px;}
	.nav li{text-align: center; margin: 0 33px; padding: 0; font-size: 10pt;}
	#navbar{margin: 0 20px;}
	#navbar ul{display: inline;}
	
</style>
<script type="text/javascript">

	$(function()
	{
		$("#privacyInsert").click(function()
		{
			$(location).attr("href", "termslist.action");
		});
		
		$("#login").click(function()
		{
			$(location).attr("href", "loginform.action");
		});
	});

</script>

</head>
<body>

<div id="outer">

	<div class="container">
	
		<div class="row">
		
			<div class="col-md-2">
				<img src="<%=cp%>/images/LOGO.png" id="titleImg">
			</div>
			
			<div class="col-md-10">
				
				<div class="row">
					
					<div id="headerLink">
						<input type="button" value="강사 Home" class="btn"> 
						<input type="button" value="마이페이지" class="btn"> 
						<input type="button" value="회원가입" class="btn" id="privacyInsert"> 
						<input type="button" value="로그인" class="btn" id="login"> 
						<input type="button" value="로그아웃" class="btn"> 
					</div>
					
				</div>
				
				<div class="row">
				
					<nav class="navbar navbar-default col-md-11" id="navbar">
						<ul class="nav navbar-nav">
							<li class="active"><a href="">Home</a></li>
							<li><a href="">강좌</a></li>
							<li><a href="">원데이클래스</a></li>
							<li><a href="">게시판</a></li>
							<li><a href="">고객센터</a></li>
						</ul>
					</nav>
					
				</div>
				
			</div>
		
		</div>
	
	</div>

</div>

</body>
</html>