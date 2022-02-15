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
<title>TrainerPageMain.jsp</title>
<style type="text/css">
	#outer
	{
		width: 100%;
	}
	#inner
	{
		width: 1100px;
		margin: auto;
		border: 1px solid;
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
	}
	.btnTop
	{
		width: 100%;
		padding: 2em;
	}
	.TrainerPageTitle
	{
		font-size: 40px;
		font-weight: bold;
		margin-left: 38%;
	}
	#TrainerPageNotice
	{
		margin-left: 85%;
	}
	#picture
	{
		width: 150px;
		height: 200px;
		margin-left: 75px;
		border: 1px solid;
	}
	#pictureModify
	{
		margin-left: 125px;
	}
	.list
	{
		display: inline-block;
		vertical-align: top;
	}
	#nowClass
	{
		border: 1px solid;
		padding: 2em;
	}
	#trainerScheduleModify
	{
		margin-left: 70%;
	}
	#scheduleDetails
	{
		width: 1100px;
		border-collapse: collapse;
	}
	#scheduleDetails th, td
	{
		text-align: center;
		border: 1px solid;
	}
	#classLink
	{
		width: 1100px;
		text-align: center;
		margin: 50px 0;
	}
	#classBtn
	{
		margin-top: 50px;
		margin-left: 28%;
		margin-bottom: 50px;
	}
	#bottomBtn
	{
		margin-left: 25%;
	}
</style>
</head>
<body>
<div id="outer">
	<div id="inner">
		
		<div class="box">
		
			<h1 class="TrainerPageTitle">나의 강사 프로필</h1>
		
			<div class="btnTop">
				<button type="button" id="TrainerPageNotice" class="btn">알림</button>
			</div>
		
			<div class="list" style="width: 30%">
				<img src="<%=cp %>/image/img.jpg" id="picture">
				<br>
				<button type="button" id="pictureModify" class="btn">프로필 수정요청</button>
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
		
			<div class="list" style="width: 25%;">
				<span style="text-align: center; padding: 0 14px;">팔로잉수</span>
				<input type="text" id="following" name="following" disabled="disabled"
				style="width: 70px;"/>
				<br><br>
				<span style="text-align: center; padding: 0 14px;">전체평점</span>
				<input type="text" id="grade" name="grade" disabled="disabled"
				style="width: 70px;"/>
				<br><br>
				
				<div id="nowClass">
					<span style="text-align: center;">현재강좌</span>
					<br>
					<a href="">여름 대비 몸짱 프로젝트</a>
					<br><br>
					<span style="text-align: center;">최신리뷰1</span>
					<br>
					<textarea rows="5" cols="27" disabled="disabled">
					잘 가르쳐 주시고 좋아요!
					여름이 빨리 왔으면 좋겠어요!
					</textarea>
					<br>
					<span style="text-align: center;">최신리뷰2</span>
					<br>
					<textarea rows="5" cols="27" disabled="disabled">
					잘 가르쳐 주시고 좋아요!
					여름이 빨리 왔으면 좋겠어요!
					</textarea>
					<a href="">리뷰 더보기</a>
				</div>
				
			</div>
		</div>
		
		
		
		<div class="box">
		
			<h1 class="TrainerPageTitle">스케줄표</h1>
		
			<div class="btnTop">
				<button type="button" id="trainerScheduleModify" class="btn"
				style="width: 120px;">스케줄변경</button>
				<button type="button" id="studentWaiting" class="btn"
				style="width: 120px;">회원 예약 대기</button>
			</div>
			
			<div id="scheduleList" style="width: 1100px; height: 500px; border: 1px solid;">
				스케줄표 들어갈 공간<br>
				추후 div에 걸린 스타일도 지우기
			</div>
			
			<div>
				<h2 style="text-align: center;">스케줄 상세보기</h2>
				
				<table id="scheduleDetails">
					<tr>
						<th>수강시간</th>
						<th>수강생명</th>
						<th>연락처</th>
						<th>수강생주소</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>10:00~11:00</td>
						<td>홍길동(honggil)</td>
						<td>010-1111-1111</td>
						<td>경기도 xx시 xx동 xx아파트 xxx동 xxx호</td>
						<td>
							<button type="button" class="btn">스케줄 취소</button>
						</td>
					</tr>
					<tr>
						<td>12:00~13:00</td>
						<td>김길동(kimgil)</td>
						<td>010-2222-2222</td>
						<td>경기도 xx시 xx동 xx빌라 xxx동 xxx호</td>
						<td>
							<button type="button" class="btn">스케줄 취소</button>
						</td>
					</tr>
				</table>
				
			</div>
			
		</div>
		
		<div class="box">
		
			<h1 class="TrainerPageTitle">나의 강좌</h1>
			
			<div id="classLink">
				<a href="">여름 대비 몸짱 프로젝트 / 21.10.21 ~ 22.05.31</a>
			</div>
			
			<div id="classBtn">
				<button type="button" class="btn" style="width: 120px;">회원명단</button>
				<button type="button" class="btn" style="width: 120px;">강좌등록</button>
				<button type="button" class="btn" style="width: 120px;">강좌연장</button>
				<button type="button" class="btn" style="width: 120px;">강좌폐쇄</button>
			</div>
			
			<div id="classLink">
				<a href="">이전 강좌 목록</a>
			</div>
			
			<div id="bottomBtn">
				<button type="button" class="btn" style="width: 300px;">원데이클래스 구직현황</button>
				<button type="button" class="btn" style="width: 300px;">정산현황</button>
			</div>
			
		</div>
		
	</div>
</div>

</body>
</html>