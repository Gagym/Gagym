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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<!-- datepicker 관련 -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style type="text/css">

	#headerOuter {width: 100%;}
	.headerInner
	{
		margin: auto;
	}
	#titleImg {height: 100px;}
	.nav li {text-align: center; margin: 0 33px; padding: 0; font-size: 10pt;}
	#navbar {margin: 0 20px;}
	#navbar ul {display: inline;}
	#headerLink .btn {float: right; margin-right: 50px; color: white;}
	#headerLink .btn:hover {color: #cca000;}
	#navbarResponsive .nav-link {margin: 0 60px;}
	
</style>
<script type="text/javascript">

	$(function()
	{
		$("#privacyInsertLink").click(function()
		{
			$(location).attr("href", "termslist.action");
		});
		
		$("#loginLink").click(function()
		{
			$(location).attr("href", "loginform.action");
		});
		
		$("#logoutLink").click(function()
		{
			$(location).attr("href", "logout.action");
		});
		
		$("#myPageLink").click(function()
		{
			$(location).attr("href", "mypagemain.action");
		});
		
		$("#insPageLink").click(function()
		{
			$(location).attr("href", "instructormain.action");
		});
		
		$("#adminPageLink").click(function()
		{
			$(location).attr("href", "adminhome.action");
		});
		
	});

</script>

</head>
<body>

<div id="headerOuter">

	<div class="headerInner">
		
		<nav class="navbar navbar-expand-lg navbar-dark" id="mainNav" style="background-color: black;">
			<div class="container">
			
				<div class="col-md-2">
					<a href="main.action"><img src="<%=cp%>/images/logo.png" id="titleImg"/></a>
				</div>
				
				<div class="col-md-10">
				
					<div class="row">
						
						<div class="col-md-12" id="headerLink">
							<%
							String memNo = (String)session.getAttribute("memNo");
							String insNo = (String)session.getAttribute("insNo");
							String admin = (String)session.getAttribute("admin");
							
							if(memNo==null && admin==null)
							{
							%>
								<input type="button" value="로그인" class="btn" id="loginLink">
								<input type="button" value="회원가입" class="btn" id="privacyInsertLink">
							<%
							}
							if(memNo!=null || admin!=null)
							{
							%>
								<input type="button" value="로그아웃" class="btn" id="logoutLink">
							<%
							}
							if(memNo!=null)
							{
							%>
								<input type="button" value="마이페이지" class="btn" id="myPageLink">
							<%
							}
							if(insNo!=null)
							{
							%>
								
								<input type="button" value="강사 Home" class="btn" id="insPageLink">
							<%
							}
							if(admin!=null)
							{
							%>
								<input type="button" value="관리자 Home" class="btn" id="adminPageLink">
							<%
							}
							%>
						</div>
						
					</div>
					
					<div class="col-md-12">
						
						<div class="collapse navbar-collapse" id="navbarResponsive">
							<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
								<li class="nav-item"><a class="nav-link" href="main.action">Home</a></li>
								<li class="nav-item"><a class="nav-link" href="classlist.action?order=CLASS_DATE DESC">강좌</a></li>
								<li class="nav-item"><a class="nav-link" href="onedaylist.action">원데이클래스</a></li>
								<li class="nav-item"><a class="nav-link" href="myexercise.action">나의운동</a></li>
								<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
							</ul>
						</div>
						
					</div>
			
				</div>
				
			</div>
			
		</nav>
	
	</div>

</div>

</body>
</html>