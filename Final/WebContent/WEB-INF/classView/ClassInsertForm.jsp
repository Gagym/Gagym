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
<title>ClassInsertForm.jsp</title>

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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function()
	{
		/* 강좌기간 */
		$("#startDate").datepicker(
		{
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			minDate : 1,
			onClose : function(selectedDate)
			{
				var nextDay = new Date(selectedDate);				/* 변수선언은 밖에 하기!!! */
				nextDay.setMonth(nextDay.getMonth() + 1);
				
				$("#endDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					changeMonth : true,
					changeYear : true,
					minDate : nextDay

				})
			}
		});
		
		
		/* 강좌개설시간 */
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
		})
		
		

	});
</script>

<style type="text/css">
#outer {
	width: 100%;
}

.inner {
	width: 1100px;
	margin: auto;
	padding: 50px 0;
}

#picture {
	width: 150px;
	height: 200px;
	margin: auto;
}

#pictureModify {
	width: 150px;
}

</style>
</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

	<div id="outer">

		<div class="panel-group inner">

			<div class="panel panel-default">

				<div class="panel-heading" id="title">
					<h1>강좌등록</h1>
				</div>

				<div class="panel-body">
					<form action="classinsert.action" method="post" enctype="multipart/form-data">

						<div>
							<%-- <img src="<%=cp%>/images/img.jpg" id="picture"><br> --%>
							<input type="file" name="classPath">
						</div>
						<br>
						
							<div class="form-group row" style="padding-left: 30px;">
								<div class="col-md-2">강좌명</div>
								<input type="text" name="className" class="form-control" style="width: 200px;" required="required">
							</div>
							<br>

							<div class="form-group row">
								<div class="sp row">
									<label for="sp" class="col-md-2" style="padding-left: 40px;"> 운동종목 </label> 
									<select id="spName" name="sportNo" class="form-control col-md-2" style="width: 200px;">
										<c:forEach var="sp" items="${sportList }">
											<option value="${sp.sportNo }">${sp.sportName }</option>
										</c:forEach>
									</select>
								</div>
							</div> 
							<br>


							<div class="form-group">
								<div class="row">
									<label class="col-md-2" style="padding-left: 40px;"> 강좌기간 </label> 
										<input type="text" id="startDate" name="startDate"class="form-control col-md-4 datepicker" 
										placeholder="시작날짜" style="width: 200px;" required="required"> 
										~
										<input type="text" id="endDate" name="endDate" class="form-control col-md-4 datepicker"
										placeholder="마지막날짜" style="width: 200px;" required="required">
								</div>
							</div>
							<br>
							
							<div class="form-group">
								<div class="row">
									<label class="col-md-2" style="padding-left: 40px;"> 강좌개설시간 </label> 
										<select id="startTimeNo" name="startTimeNo" class="form-control col-md-2" style="width: 200px;">
											<c:forEach var="time" items="${timeList }">
												<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>		<!-- time 간격을 통째로 보기위해 -->
											</c:forEach>
										</select>
										~
										<select id="endTimeNo" name="endTimeNo" class="form-control col-md-2" style="width: 200px;">
											<c:forEach var="time" items="${timeList }">
												<option value="${time.timeNo }">${time.startTime }:00 ~ ${time.endTime }:00</option>
											</c:forEach>
										</select>
								</div>
							</div>
							<br>
							
							
							
							<div class="form-group">
								<div class="row">
									<textarea rows="10" cols="30" placeholder="강좌내용" name="content"></textarea>
								</div>
							</div>
							<br>

							<div class="form-group row" style="padding-left: 40px;">
								<div class="col-md-2">아령</div>
								<input type="text" name="point" class="form-control" style="width: 200px;" required="required">
							</div>
							<br>

							<div class="form-group row">
								<div class="row">
									<label class="col-md-2" style="padding-left: 40px;"> 정산은행 </label> 
									<select class="form-control col-md-2" style="width: 200px;" name="bank">
										<option>국민은행</option>
										<option>우리은행</option>
										<option>신한은행</option>
									</select>
									<input type="text" name="account" class="form-control col-md-4" placeholder="정산계좌"  style="width:300px;" required="required"> 

								</div>
							</div>
							<br>
							
							<div style="text-align: center;">
				               <button type="submit" class="btn btn-primary">등록</button>
				               <button type="button" class="btn btn-danger" onclick="location.href='instructormain.action'">취소</button>
				            </div>
						</form>
					</div>
				</div>
			</div>
		</div>

	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</body>
</html>