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
<style type="text/css">
#outer 
{
	width: 100%;
}

#inner 
{
	width: 1100px;
	margin: auto;
}

#headerLink 
{
	width: 100%;
	text-align: right;
}

#headerNav, #headerNav2
{
	width: 100%;
}

#headerNav2
{
	display: inline-block;
}

.headerBtn 
{
	font-size: 15px;
	margin: 10px;
}

#headerNav a, #headerNav2 a
{
	text-decoration: none;
}

#headerNav ul 
{
	list-style-type: none;
	overflow: hidden;
	line-height: 30px;
}

#headerNav2 ul 
{
	width: 20%;
	display: inline-block;
  	vertical-align: middle;
	list-style-type: none;
	overflow: hidden;
}

#headerNav2 li, #headerNav li 
{
	width: 20%;
	float: left;
	margin-left: 30px;
}

#headerMy
{	
	margin-left: 80%;
}
</style>
</head>
<body>

	<div id="outer">

		<div id="inner">

			<img src="<%=cp%>/images/img_02.gif"
				style="float: left; height: 60px; width: 60px; margin: 10px;">

			<div id="headerLink">
				<input type="button" value="회원가입" class="headerBtn"> 
				<input type="button" value="로그인" class="headerBtn"> 
				<input type="button" value="로그아웃" class="headerBtn"> 
				<input type="button" value="마이페이지" class="headerBtn"> 
				<input type="button" value="강사HOME" class="headerBtn">
			</div>

			<div id="headerNav">
				<ul>
					<li><a href="">강좌</a></li>

					<li><a href="">원데이클래스</a></li>

					<li><a href="">게시판</a></li>

					<li><a href="">고객센터</a></li>
				</ul>
			</div>

			<div id="headerNav2">

				<ul id="headerMy">
					<li><a href="">나의 운동</a></li>
					<li><a href="">나의 식단</a></li>
				</ul>
			</div>
			</div>

		</div>

</body>
</html>