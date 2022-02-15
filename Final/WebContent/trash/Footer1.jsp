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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
	#footerOuter
	{
		width: 100%;
	}
	#footerInner 
	{
		width: 1100px;
		margin: auto;
	}
	.fcontent
	{
		font-size: 13px;
	}
</style>

</head>
<body>
<div id="footerOuter">
	<form>
		<div id="footerInner">
			<div>
				<hr>
				<div class="fcontent col-md-3" style="width:10%; margin-left: 10%; margin-right: 20px;">
					<img src="images/LOGO.png" style="width:90px;">
				</div>
			
				<div class="fcontent col-md-5">
					<a class="conTitle" style="font-weight: bolder;">회사소개</a>
					<div>대표 | 송해덕</div>
					<div>주소 | 서울시 마포구 월드컵북로 21 풍성빌딩 2~4층</div>
					<div>Copyrightⓒ2021 이곳의 모든 저작권은 GA-GYM에게 있습니다.</div>
				</div>
				
				<div class="fcontent col-md-2">
					<a class="conTitle" style="font-weight: bolder;">이용메뉴</a>		
					<div><a href="class.action">강좌</a></div>
					<div><a href="">원데이클래스</a></div>
					<div><a href="">게시판</a></div>
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