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
<title>MyExerciseOneday</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
.outer {
	width: 100%;
}

.inner {
	width: 1100px;
	margin: auto;
	padding: 100px 0;
}
</style>

<script type="text/javascript">
	
	$(function()
	{ 
		// 게시글 이동
		$(".onedayContent").click(function()
		{
			$(location).attr("href", "onedaycontent.action?onedayNo=" + $(this).children().val());
		});
		// 신청목록 버튼
		$(".onedayRsvList").click(function()
		{
			$(location).attr("href", "myonedayreservation.action?onedayNo=" + $(this).val());
		});
		// 원데이클래스 삭제 버튼 클릭
		$(".onedayDelete").click(function()
		{
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
	         {				
	            $(location).attr("href", "onedaydelete.action?onedayNo=" + $(this).val());
	         }
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary onedayInsert" onclick="location.href='onedayinsertform.action'">원데이클래스 등록</button> 
		</div>
		<br>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>제목</th>
					<th>운동종목</th>
					<th>운동희망날짜</th>
					<th>희망시작시간</th>
					<th>희망아령</th>
					<th>게시날짜</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="oneday" items="${onedayList }">
					<tr>
						<!-- 게시글 링크 이동 -->
						<td class="onedayContent" style="cursor: pointer;"><input type="hidden"  value="${oneday.onedayNo }"/>${oneday.title }</td>
						<td>${oneday.sportName }</td>
						<td>${oneday.wishDate }</td>
						<td>${oneday.startTime }:00~${oneday.endTime }:00</td>
						<td>${oneday.wishPoint }</td>
						<td>${oneday.regDate }</td>
						<td>
							<button type="button" class="btn btn-info onedayRsvList" value="${oneday.onedayNo }" 
							style="${oneday.dateCheck=='기간만료'? 'display:none' : (oneday.fixDate!=null? 'display:none' : '') } ">신청목록</button> 
							<button type="button" class="btn btn-danger onedayDelete" value="${oneday.onedayNo }" 
							style="${oneday.dateCheck=='기간만료'? 'display:none' : (oneday.fixDate!=null? 'display:none' : '') } ">삭제</button> 
							${oneday.dateCheck=="기간만료"? "기간만료" : (oneday.fixDate!=null? "모집완료" : "") }
						</td>
						<!-- 
						wishDate < SYSDATE 이면 (기간만료)
						fixDate가 null이 아니면 (모집완료)
						fixDate가 null이면 (신청목록, 삭제 버튼)
						-->
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>
</html>