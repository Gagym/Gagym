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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OnedayInsertForm.jsp</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" type="text/css"/>

<!-- datepicker 관련 -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style type="text/css">
	.outer
	{
		width:100%;
		margin: auto;
	}
	.inner
	{
		width:800px;
	    margin: auto;
	    padding: 100px 0;
	}

</style>

<script type="text/javascript">

	$(function()
	{
		// datepicker 설정
	   	$(".datepicker").datepicker(
	   	{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
			, minDate: 4
			, maxDate: 30
	   	});
		
		// startTime 바뀌면 endTime 자동으로 startTime과 동일하게 변경
		$("#startTimeNo").change(function()
		{
			$("#endTimeNo").val($("#startTimeNo option:selected").val());
		});
		
		// 마지막 타임이 시작 타임보다 빠르지 않도록 제한
		$("#endTimeNo").change(function()
		{
			if($("#startTimeNo option:selected").val() > $("#endTimeNo option:selected").val())
			{
				alert("희망 마지막 타임이 희망 시작 타임보다 빠를 수 없습니다.");
				$("#endTimeNo").val($("#startTimeNo option:selected").val());
			}
		});
		
	});

</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">

		<div class="panel-group inner">
			
			<div class="panel panel-default">
				
				<div class="panel-heading" id="title">
					<h1> 원데이클래스 등록 </h1>
				</div>
				
				<div class="panel-body">
					<form role="form" action="onedayinsert.action" method="post">
						
						<div class="form-group row">
							<label for="title" class="col-md-2">제목</label>
							<input type="text" id="title" name="title" maxlength="30" class="form-control" style="width:500px;" required="required"/>
						</div>
						<br>
						<div class="form-group row">
							<label for="sportNo" class="col-md-2">운동종목</label>
							<select id="sportNo" name="sportNo" class="form-control col-md-2"  style="width:200px;" required="required" >
								<c:forEach var="sport" items="${sportList }">
									<option value="${sport.sportNo }">${sport.sportName }</option>
								</c:forEach>
							</select> 
						</div>
						<br>
						<div class="form-group row">
							<label for="wishDate" class="col-md-2">희망날짜</label>
							<input type="text" name="wishDate" class="form-control col-md-4 datepicker" placeholder="희망날짜" style="width:150px;" required="required" >
							
							<label for="start-endTimeNo" class="col-md-2">희망타임범위</label>
							<select id="startTimeNo" name="startTimeNo" class="form-control col-md-2" style="width:150px;" required="required" >
								<c:forEach var="time" items="${timeList }">
									<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>
								</c:forEach>
							</select>
							~
							<select id="endTimeNo" name="endTimeNo" class="form-control col-md-2"  style="width:150px;" required="required" >
								<c:forEach var="time" items="${timeList }">
									<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>
								</c:forEach>
							</select>
							
						</div>
						<br>
						<div class="form-group row">
							<label for="wishPoint" class="col-md-2">희망아령개수</label>
							<input type="number" min=0 id="wishPoint" name="wishPoint" required="required" class="form-control" style="width:200px;" required="required" />
						</div>
						<br>
						<div class="form-group row">
							<label for="content" class="col-md-2">내용</label>
							<textarea class="form-control" name="content" cols="50" rows="10" required="required"></textarea>
						</div>
						
						
						<div style="text-align: center;">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-danger" onclick="location.href='myexerciseoneday.action'">취소</button>
						</div>
					</form>
				</div><!-- close .panel-body -->
				
			</div><!-- close .panel .panel-default -->
		
		</div>
		
<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>

</div>
</body>
</html>