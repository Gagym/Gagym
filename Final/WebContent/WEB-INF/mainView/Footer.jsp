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
<title>Insert title here</title>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

<style type="text/css">
	#footerOuter
	{
		width: 100%;
	}
	#footerInner 
	{
		margin: auto;
	}
	.fcontent
	{
		font-size: 13px;
	}
</style>

</head>
<body>
<div id="footerOuter" style="background-color: white;">
	<form>
		<div id="footerInner">
			<div class="row">
				<hr>
				<div class="fcontent col-md-3" style="width:10%; margin-left: 15%; margin-right: 20px;">
					<img src="images/logo.png" style="width:90px;">
				</div>
			
				<div class="fcontent col-md-4">
					<div class="conTitle" style="font-weight: bolder;">회사소개</div>
					<div>대표 | 송해덕</div>
					<div>주소 | 서울시 마포구 월드컵북로 21 풍성빌딩 2~4층</div>
					<div>Copyrightⓒ2021 이곳의 모든 저작권은 GA-GYM에게 있습니다.</div>
				</div>
				
				<div class="fcontent col-md-2">
					<div class="conTitle" style="font-weight: bolder;">이용메뉴</div>
					<div><a href="class.action">강좌</a></div>
					<div><a href="onedaylist.action">원데이클래스</a></div>
					<div><a href="myexercise.action">나의운동</a></div>
				</div>
						
				<div class="fcontent col-md-2" style="margin-bottom: 5%;">	
					<div class="conTitle" style="font-weight: bolder;">고객센터</div>
					<div><a href="">1:1문의</a></div>
					<div><a href="">자주묻는 질문</a></div>
					<div><a href="">분쟁</a></div>
				</div>
 			</div>
		</div>
	</form>
</div>

 
</body>
</html>