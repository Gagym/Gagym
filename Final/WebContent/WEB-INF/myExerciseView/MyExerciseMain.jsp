<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String memNo = (String)session.getAttribute("memNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyExerciseMain</title>
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
.outer {
	width: 100%;
}

.inner {
	width: 1100px;
	margin: auto;
	padding: 100px 0;
}
table th, table td
{
	text-align: center;
	vertical-align: middle;
}
</style>


<script type="text/javascript">
	
	$(function()
	{ 
		// 미션 완료 체크
		$(document).on('click', '.missionComplete', function()		// ajax로 불러온 버튼 클릭 이벤트 적용 시 이렇게 작성!
		{
			if(confirm("미션이 완료되었습니까?"))
	        {
				$(location).attr("href", "missioncomplete.action?missionExeNo=" + $(this).val());
	        }
			
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<div class="row">
			<button class="btn btn-primary btn-xl text-uppercase col-md-4" onclick="location.href='myexerciseoneday.action'">나의 원데이클래스</button>
			<div class="col-md-4"></div>
			<button class="btn btn-primary btn-xl text-uppercase col-md-4" onclick="location.href='myexerciseclass.action'">나의 수강예약</button>
		</div>
		
		<div class="row">
		
			<a id="here"></a>
			
			<div id="scheduleList">
				<div class="header">
					<div class="year-month"></div>
					<div class="nav">
						<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
						<button class="nav-btn go-today" onclick="goToday()">Today</button>
						<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
						<input type="hidden" id="year" value="" />
						<input type="hidden" id="month" value="" />
						<input type="hidden" id="urlLink" value="myexercise.action" />
						<input type="hidden" id="json" value="<c:out value="${json}"/>"></input><!-- 스케줄바 -->
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
			
			<!-- ajax -->
			<div class="col-md-12" id="scheduleDetail"></div>
			
		</div>
		
	</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>

<!-- 달력관련 -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript">

	$(function()
	{
		ajaxRequest($(".today").children().val());
		
		$(".today").parent().css("background-color", "#d5ffda");
		
		$(".ajaxClick").click(function()
		{
			$(".ajaxClick").css("background-color", "white");
			
			$(".today").parent().css("background-color", "#d5ffda");
			
			$(this).css("background-color", "#bebebe");
			
			ajaxRequest($(this).children().children().val());
		});
		
	});
	
	function ajaxRequest(date)
	{
		var params = "memNo=" + $.trim("<%=memNo%>")
		+ "&date=" + $.trim(date);
	
		$.ajax(
		{
			type : "GET"
			, url : "memscheduleajax.action"
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

</html>