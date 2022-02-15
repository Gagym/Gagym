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
<title>ScheduleChangeForm.jsp</title>

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
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(function()
	{
		// datepicker 설정
		$(".datepicker").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
	   	});
		
		// 시간 변경
	   	$("#startTimeNo").change(function()
		{
			$("#endTimeNo").val($("#startTimeNo option:selected").val());		/* option:selected 한 startTimeNo를 endTimeNo에 넣는다 */
		})
		
		$("#endTimeNo").change(function()
		{
			if($("#endTimeNo option:selected").val() < $("#startTimeNo option:selected").val())
			{
				alert("마지막타임이 시작타임보다 빠를 수 없습니다.");
				
				$("#endTimeNo").val($("#startTimeNo option:selected").val());		/* 알림을 주고 option:selected 한 startTimeNo를 endTimeNo에 넣는다 */
			}
		});
		
		$("#changeFinish").click(function()
		{
			var form = {classNo:$("#classNo").val(), cerDate:$("#cerDate").val(), startTimeNo:$("#startTimeNo").val(), endTimeNo:$("#endTimeNo").val()};
			
			$.ajax(
					{
						type : "POST"
						, url : "scheduleChange.action"
						, data : form
						, success : function(d)
						{
							alert("스케줄 변경이 완료되었습니다.");
							window.opener.location.href='instructormain.action'; 
							window.close();
						}
		
					});
		});
		
		$("#changeCancel").click(function()
		{
			window.close();
		});
		
	});
	
	

</script>

<style type="text/css">
	#outer
	{
		width: 100%;
	}
	#inner
	{
		width: 600px;
		margin: auto;
		border: 1px solid;
	}
	#startTime, #endTime
	{
		width: 200px;
	}
	#button button
	{
		width: 200px;
		margin: 20px;
	}
</style>

</head>
<body>


<div id="outer">
	
	<div id="inner">
	
		<div class="row">
			<h1 style="margin: 30px 0 30px 180px;">스케줄 일괄변경</h1>
		</div>
		
		<form id="test">
			<div class="row">
				
				<input type="hidden" id="classNo" name="classNo" value="${classNo }">
				<input type="text" id="cerDate" name="cerDate" class="datepicker" placeholder="변경 적용시점 날짜"  style="width:200px; margin: auto;"><br><br><br>
				
			</div>
		
			<div class="row">
			
				<select id="startTimeNo" name="startTimeNo" class="form-control col-md-2" style="width: 200px; margin-left: 17%;">
					<option value="">--시작타임--</option>
					<c:forEach var="time" items="${timeList }">
						<c:choose>
							<c:when test="${classTime.startTime == time.startTime }">
								<option value="${time.timeNo }" selected="selected">${time.startTime }:00 ~ ${time.endTime }:00</option>
							</c:when>
							<c:otherwise>
								<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				&nbsp~&nbsp
				<select id="endTimeNo" name="endTimeNo" class="form-control col-md-2" style="width: 200px;">
					<option value="">--마지막타임--</option>
					<c:forEach var="time" items="${timeList }">
						<c:choose>
							<c:when test="${classTime.endTime == time.startTime }">
								<option value="${time.timeNo }" selected="selected">${time.startTime }:00 ~ ${time.endTime }:00</option>
							</c:when>
							<c:otherwise>
								<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				
			</div>
			
			<div class="row" id="button">
				
				<button type="button" id="changeFinish" class="btn btn-primary" style="margin-left: 15.5%;">등록완료</button>
				<button type="button" id="changeCancel" class="btn btn-danger">등록취소</button>
				
			</div>
		</form>
		
	</div>
	
</div>


</body>
</html>