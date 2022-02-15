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
<title>ClassInsert.jsp</title>
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
	.box
	{
		width: 100%;
		border: 1px solid;
	}
	.list
	{
		display: inline-block;
		vertical-align: top;
	}
	ul
	{
		display: inline-block;
	}
	li
	{
		list-style-type: none;
		margin: 30px 0;
	}
	#ClassInsertTitle
	{
		text-align: center;
		border: 1px solid;
	}
	#picture
	{
		width: 150px;
		height: 200px;
		margin: 0 0 0 160px;
	}
	#pictureInsert
	{
		margin-left: 175px;
		width: 120px;
	}
</style>
</head>
<body>

<div id="outer">
	<div id="inner">
		
		<div id="ClassInsertTitle" >
			
			<h1>강좌 등록</h1>
			
		</div>
		
		<div class="box">
		
			<div class="list" style="width: 450px; border: 1px solid;" >
			
				<img src="<%=cp %>/image/img.jpg" id="picture">
				
				<button type="button" id="pictureInsert" class="btn">사진 업로드</button>
			
			</div>
			
			<div class="list">
			
				<div id="list" style="width: 640px; border: 1px solid;">
					
					<ul>
						<li>
							<input type="text" placeholder="강좌명" />
						</li>
						<li>
							<select>
								<option>운동 카테고리</option>
								<option>헬스</option>
								<option>필라테스</option>
								<option>요가</option>
								<option>체형교정</option>
							</select>
						</li>
						<li>	
							<span>수강인원</span>
							<input type="text" placeholder="최대 20" />
							<span>명</span>
						</li>
					</ul>
					
				</div>
				
			</div>
			
		</div>
		
		<div class="box">

			<div style="width: 100%; margin: 25px; text-align: center;">
				<span style="margin: 0 30px">수업기간</span>
				<input type="text" placeholder="시작날짜" />
				 ~ 
				<input type="text" placeholder="종료날짜" />
			</div>
			
			<div style="width: 100%">
				<textarea rows="10" cols="150">
				강좌 내용 ~~~~~~~~~~~~~~~~~~~~~~
				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				</textarea>
			</div>
		
		</div>
		
		<div class="box">
		
			<span>상담가격</span>
			<input type="text" />원
		
		</div>
		
	</div>
</div>


</body>
</html>