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
<title>TrainerPageMain</title>
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
		display: inline-table;
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

<div id="outer">
	<div id="inner">
		<div>
			<h1 id="mypageTitle">나의 강사 프로필</h1>
			<div class="list" style="width: 30%">
				<br><br><br><br><br>
				<img src="<%=cp %>/image/img.jpg" id="picture">
				<br>
			
				<button type="button" id="pictureModify" class="btn">프로필 수정요청</button>
			</div>
			
			<div class="list" style="width: 40%;">
				<br><br><br><br><br>
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
					<span style="text-align: center; padding: 0 22px;">이메일</span>
					<input type="text" id="gender" name="gender" disabled="disabled"/>
					<br><br>
					<span style="text-align: center; padding: 0 14px;">활동지역</span>
					<input type="text" id="area" name="area" disabled="disabled"/>
					<br><br>
					<span style="text-align: center; padding: 0 22px;">자격증</span>
					<input type="text" id="license" name="license" disabled="disabled"/>
					<br><br>
					<span style="text-align: center; padding: 0 14px;">수상경력</span>
					<input type="text" id="award" name="award" disabled="disabled"/>
					<br><br>
					<span style="text-align: center; padding: 0 14px;">한줄소개</span>
					<input type="text" id="introduce" name="introduce" disabled="disabled"/>
					<br><br>
				</div>
			</div>		
		
			<div class="list" style="width: 20%;">
				<br><br><br><br><br>
				<span style="text-align: center; padding: 0 30px;">팔로잉수</span>
				<input type="text" id="name" name="name" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 30px;">평점</span>
				<input type="text" id="age" name="age" disabled="disabled"/>
				<br><br>
				<span style="text-align: center; padding: 0 30px;">??</span>
				<input type="text" id="gender" name="gender" disabled="disabled"/>
			</div>
			<br>
		</div>
	</div>
</div>

</body>
</html>