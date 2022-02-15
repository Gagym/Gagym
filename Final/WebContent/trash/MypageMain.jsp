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
<title>MypageMain.jsp</title>
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
	.btn
	{
		background-color: #004FFF;
		color: white;
		width: 60px;
		height: 40px;		
		box-shadow: 0 4px 16px rgba(0, 79, 255, 0.3);
		font-size: 12px;
		font-weight: bold;
		border: 2px;
		border-radius: 10px;
	}
	#profile
	{
		
	}
	#mypageTitle
	{
		font-size: 40px;
		font-weight: bold;
		margin-left: 38%;
	}
	#mypageNotice
	{
		float: right;
		margin-right: 75px;
	}
	#picture
	{
		border: 2px solid;
		width: 150px;
		height: 200px;
		margin-left: 75px;
	}
	#pictureModify
	{
		margin-left: 125px;
	}
	.list
	{
		display: inline-block;
		border: 1px solid;
	}
	.menuBtn
	{
		width: 300px;
		height: 100px;
	}
	#drop
	{
		margin-left: 500px;
	}
</style>
</head>
<body>

<c:import url="Header.jsp"></c:import>

<div id="outer">
	<div id="inner">
		<h1 id="mypageTitle">나의 프로필</h1>
		<div class="list" style="width: 30%">
			
			<img src="<%=cp %>/image/img.jpg" id="picture">
			<br>
		
			<button type="button" id="pictureModify" class="btn">수정</button>
		</div>
		
		<div class="list" style="width: 40%;">
			
			<div id="profile">
				<span style="text-align: center; padding: 0 30px;">이름</span>
				<input type="text" id="name" name="name" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 30px;">나이</span>
				<input type="text" id="age" name="age" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 30px;">성별</span>
				<input type="text" id="gender" name="gender" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 6px;">휴대폰번호</span>
				<input type="text" id="telephone" name="telephone" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 6px;">집전화번호</span>
				<input type="text" id="homeTel" name="homeTel" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 30px;">주소</span>
				<input type="text" id="addr" name="addr" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 22px;">이메일</span>
				<input type="text" id="eMail" name="eMail" disabled="disabled"/>
				<br><br>
			</div>
		</div>		
	
		<div class="list" style="width: 20%;">
			<br>
			<button type="button" id="mypageNotice" class="btn">알림</button>
			
			<button type="button" class="menuBtn">인바디</button><br><br>
			<button type="button" class="menuBtn">눈바디</button><br><br>
			<button type="button" class="menuBtn">강사신청</button><br><br>
			<button type="button" class="menuBtn">결제환불내역</button>
		</div>
		<br>
		<button type="button" id="drop" class="btn">회원탈퇴</button>
	</div>
</div>

<c:import url="Footer.jsp"></c:import>

</body>
</html>