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
<style type="text/css">
	#outer
	{
		width: 100%;
		vertical-align: middle;
	}
	#inner 
	{
		width: 1100px;
		margin: auto;
	}
	.fcontent
	{
		display: inline-table;
		width: 20%;
		padding: 1em;
	}
</style>

</head>
<body>

<div id="outer">
	<form>
		<div id="inner">
			<div class="fcontent" style="width:10%;">
				<img src="images/img_01.png" style="width:90%;">
			</div>
				
			<div class="fcontent" style="width:35%;">
				<a class="conTitle">회사소개</a>
				<ul class="list">
					<li>대표</li>
					<li>주소 | 서울시 마포구 월드컵북로 21 풍성빌딩 2~4층</li>
					<li>Copyrightⓒ2021 이곳의 모든 저작권은 XX에게 있습니다.</li>
				</ul>
			</div>
			
			<div class="fcontent">
				<a class="conTitle">이용메뉴</a>		
				<ul class="link">
					<li><a href="">강좌</a></li>
					<li><a href="">원데이클래스</a></li>
					<li><a href="">게시판</a></li>
				</ul>
			</div>
					
			<div class="fcontent">	
				<a class="conTitle">고객센터</a>
				<ul class="link2">
					<li><a href="">1:1문의</a></li>
					<li><a href="">자주묻는 질문</a></li>
					<li><a href="">분쟁</a></li>
				</ul>	
			</div>
		</div>
	</form>
</div>

</body>
</html>