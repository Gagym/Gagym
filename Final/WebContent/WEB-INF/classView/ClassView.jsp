<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String memNo = (String)session.getAttribute("memNo");
	String insNo = (String)session.getAttribute("insNo");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClassView</title>

<!-- 달력 css -->
<link rel="stylesheet" type="text/css" href="css/calendar.css">

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
#outer {
	width: 100%;
}

#inner {
	width: 1100px;
	margin: auto;
	padding: 100px 0;
}
.box {
	text-align: center;
	border: 1px solid gray;
	padding: 3em;
	width: 1100px;
}
</style>


</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
		<div id="inner" class="row">
				<div class="box">
					<div class="row" >
						<div class="col-md-3"></div>
						<div class="col-md-5">
							<h3>${cla.className }</h3>
						</div>
						<br>
						<div class="col-md-4 row">
							<span class="col-md-5" style="padding-top: 0.5em;">강사이름/아이디</span>
							<input type="text" id="name" readonly="readonly" value="${cla.insName } ${cla.insId }"
							class="form-control col-md-8" style="width:140px; text-align: right;" />
							<input type="hidden" id="insNo" name="insNo" value="${cla.insNo }"/>
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="time" class="col-md-2">강좌타임</label>
						<input type="text" id="time" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${cla.startTime }:00 ~ ${cla.endTime }:00" />
						<input type="hidden" id="startTime"" name="startTime" value="${cla.startTime }"/>
						<input type="hidden" id="endTime" name="endTime" value="${cla.endTime }"/>
							
						<label for="date" class="col-md-2">강좌기간</label>
						<input type="text" id="date" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${cla.startDate } ~ ${cla.endDate }" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="sport" class="col-md-2">운동종목</label> 
						<input type="text" id="sport" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${cla.sportName }" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="area" class="col-md-2">활동지역</label>
						<input type="text" id="area" class="form-control col-md-3" style="width: 680px;"
							readonly="readonly" value="${cla.insArea }" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="count" class="col-md-2">누적 수강인원</label> 
						<input type="text" id="count" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${count }" />
							
						 
						<label for="point" class="col-md-2">아령</label>
						<input type="text" id="point" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${cla.point }" />
					</div>
					<br>
					
					<div class="form-group row">
						<div class="col-md-1"></div>
						<label for="content" class="col-md-2">내용</label>
						<textarea class="form-control" name="content" cols="40" rows="10" required="required" 
						readonly="readonly" style="width:680px;">${cla.content }</textarea>
					</div>
					<br>
					
					<div class="row">
		
						<h1 class="TrainerPageTitle">강좌 스케줄표</h1>
						<a name="here"></a>
						
						<div id="scheduleList">
							<div class="header">
								<div class="year-month"></div>
								<div class="nav">
									<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
									<button class="nav-btn go-today" onclick="goToday()">Today</button>
									<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
									<input type="hidden" id="urlLink" value="instructormain.action"/>
									<input type="hidden" id="year" value="" />
									<input type="hidden" id="month" value="" />
								</div>
							</div>
							<div class="main">
								<div class="days">
									<div class="day">일</div>
									<div class="day">월</div>
									<div class="day">화</div>
									<div class="day">수</div>
									<div class="day">목</div>
									<div class="day">금</div>
									<div class="day">토</div>
								</div>
								<div class="dates">
									
								</div>
							</div>
						</div>
						
						<input type="hidden" id="json" value="<c:out value="${json}"/>"></input>
						
						<div class="col-md-12" id="scheduleDetail"></div>
						
					</div>
					<br>					
					
					<div>
						<button type="button" class="btn btn-danger" 
						style="${insNo==cla.insNo? 'display:none' : '' }"
						onclick="location.href='classreportform.action?classNo=${cla.classNo}'">신고</button> 
						<button type="button" class="btn btn-info" 
						onclick="location.href='classlist.action?order=CLASS_DATE DESC'">돌아가기</button> 
					</div>
					
					
				</div>
		</div>
</div>


<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>


<!-- 달력관련 -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript">

	$(function()
	{
		$(".today").parent().css("background-color", "#d5ffda");
		
		$(".ajaxClick").click(function()
		{
			$(".ajaxClick").css("background-color", "white");
			
			$(".today").parent().css("background-color", "#d5ffda");
			
			$(this).css("background-color", "#bebebe");
			
			//alert($(this).children().children().val()); //잘라서 숫자로만들고 걔를비교해야해
			//if($(this).children().children().val())
				
			//else
			ajaxRequest($(this).children().children().val());
		});
		
	});
	
	function ajaxRequest(date)
	{
		<%-- var params = "insNo=" + $.trim("<%=insNo%>") + "&date=" + $.trim(date); --%>
	
		var params = "startTime=" + $("#startTime").val() + "&endTime=" + $("#endTime").val() 
					+ "&insNo=" + $("#insNo").val() + "&date=" + $.trim(date);
		
		$.ajax(
		{
			type : "GET"
			, url : "classscheduleajax.action"
			, data : params
			, success : function(data)
			{
				$("#scheduleDetail").html(data);
			}
			, error : function(e)
			{
				alert(e.responseText);
			}
			
		});

	}
	

</script>

</body>
</html>