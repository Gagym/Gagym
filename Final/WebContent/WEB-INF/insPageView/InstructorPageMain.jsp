<%@page import="java.util.ArrayList"%>
<%@page import="com.gagym.dto.InstructorScheduleDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String insNo = (String)session.getAttribute("insNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InstructorPageMain.jsp</title>

<link rel="stylesheet" type="text/css" href="css/calendar.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


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
	.btnTop{padding: 2em;}
	.TrainerPageTitle
	{
		text-align: center;
		font-size: 40px;
		font-weight: bold;
		padding-top: 30px;
	}
	#TrainerPageNotice{margin-left: 85%;}
	#picture
	{
		width: 150px;
		height: 200px;
		margin: 0 0 25px 100px;
	}
	#pictureModify
	{
		margin-left: 105px;
		width: 150px;
	}
	#profile
	{
		margin: 60px 0 0 140px;
	}
	#profile input
	{
		margin-bottom: 30px;
		width: 150px;
	}
	#profile h4
	{
		display: inline-block;
		width: 100px;
		text-align: center;
		font-size: 15pt;
	}
	#profile div
	{
		display: inline-block;
	}
	.table th,td{text-align: center;}
	h3
	{
		text-align: center;
		margin: 100px 0;
		padding: 40px 0 5px 0;
	}
	.area
	{
		height: 150px;
		text-align: center;
	}
	.area input
	{
		text-align: center;
		margin: 10px 0;
	}
	#introduce
	{
		width: 500px;
		display: inline-block;
		text-align: center;
	}
	.review
	{
		padding: 2em;
		margin: 0 45px;
		display: inline-block;
	}
	a:link {text-decoration: none;}
	a:visited {text-decoration: none;}
	a:hover {text-decoration: none;}
	#trainerScheduleModify{margin-left: 80%;}
	#classLink
	{
		text-align: center;
	}
	#classBtn
	{
		text-align: center;
		margin-top: 30px;
		margin-bottom: 10px;
	}
	#classBtn .btn-primary
	{
		width: 120px;
		margin: 0 20px;
	}
	#bottomBtn
	{
		text-align: center;
		margin: 50px 0;
	}
	#bottomBtn .btn-primary
	{
		margin: 0 5px;
	}
	#category{width: 6%;}
	#rsvTime{width: 11%;}
	#className{width: 24%;}
	#memName{width: 10%;}
	#tel{width: 20%;}
	#addr{width: 29%;}
	.table td, .table th
	{
		vertical-align: middle;
	}
	.insModal
	{
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.insModalInner
	{
		background: white;
		padding: 24px 16px;
		border-radius: 4px;
		width: 320px;
	}
</style>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
	
	<div id="inner">
		
		<div>
		
			<div class="row">
				<h1 class="TrainerPageTitle">나의 강사 프로필</h1>
			</div>
			
			<div class="row">
				<div class="col-md-3">
					<img src="http://localhost:8090/Final/upload/instructor/img.jpg" id="picture"><br>
					<button type="button" id="pictureModify" class="btn-primary">프로필 수정요청</button>
				</div>
				
				<div class="col-md-9 row">
					
					<div id="profile">
						<div class="form-group col-md-5">
							<h4>이름</h4>
							<input type="text" id="name" name="name" value="${profile.insName }" disabled="disabled"/>
						</div>
						<div class="form-group col-md-5">
							<h4>나이</h4>
							<input type="text" id="age" name="age" value="${profile.age }" disabled="disabled"/>
						</div>
						<div class="form-group col-md-5">
							<h4>성별</h4>
							<input type="text" id="gender" name="gender" value="${profile.gender }" disabled="disabled"/>
						</div>
						<div class="form-group col-md-5">
							<h4>이메일</h4>
							<input type="text" id="email" name="email" value="${profile.email }" disabled="disabled"/>
						</div>
						<div class="form-group col-md-5">
							<h4>팔로워수</h4>
							<input type="text" id="follower" name="follower" value="${follower }" disabled="disabled"/>
						</div>
						<div class="form-group col-md-5">
							<h4>전체평점</h4>
							<input type="text" id="grade" name="grade" value="${grade }" disabled="disabled"/>
						</div>
					</div>
				</div>
				<div>
					<div class="row">
						<div class="form-group col-md-6">
							<h3>활동지역</h3>
							<div class="area">
							<c:forEach var="area" items="${areas }">
								<input type="text" name="area" value="${area.area }" disabled="disabled"/><br>
							</c:forEach>
							</div>
						</div>
						<div class="form-group  col-md-6">
							<h3>활동경력</h3>
							<table class="table table-bordered table-hover">
								<tr>
									<th>활동내용</th>
									<th>시작날짜</th>
									<th>종료날짜</th>
								</tr>
							<c:forEach var="experience" items="${experiences }">
								<tr>
									<td>${experience.expContent }</td>
									<td>${experience.expStartDate }</td>
									<td>${experience.expEndDate }</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<h3>수상경력</h3>
							<table class="table table-bordered table-hover">
								<tr>
									<th>수상내용</th>
									<th>수상메달</th>
									<th>수상날짜</th>
								</tr>
							<c:forEach var="prize" items="${prizes }">
								<tr>
									<td>${prize.przName }</td>
									<td>${prize.przMedal }</td>
									<td>${prize.przDate }</td>
								</tr>
							</c:forEach>
							</table>
						</div>
						<div class="form-group col-md-6">
							<h3>자격증</h3>
							<table class="table table-bordered table-hover">
								<tr>
									<th>자격증명</th>
									<th>발급처</th>
									<th>취득날짜</th>
								</tr>
							<c:forEach var="certificate" items="${certificates }">
								<tr>
									<td>${certificate.cerName }</td>
									<td>${certificate.issueName }</td>
									<td>${certificate.cerDate }</td>
								</tr>
							</c:forEach>
							</table>
						</div>
						<div class="form-group">
							<h3>한줄소개</h3>
							<div style="text-align: center;">
								<input type="text" class="form-control" id="introduce" value="${profile.introduce }" disabled="disabled"/>
							</div>
						</div>
					</div>
					
				</div>
			
			</div>
		</div>
		
		<div class="row">
		
			<div class="col-md-12">
			
				<c:forEach var="review" items="${reviews }">
				<div class="col-md-4 review" style="width: 450px;">
					<h4>최신리뷰</h4>
					<textarea rows="5" cols="40" disabled="disabled">${review.reviewContent }</textarea>
				</div>
				</c:forEach>
				
			</div>
		</div>
		
		
		<div class="row">
		
			<h1 class="TrainerPageTitle">스케줄표</h1>
			<a name="here"></a>
			<div class="col-md-12">
				<button type="button" id="trainerScheduleModify" class="btn-primary"
				style="width: 120px;">스케줄변경</button>
			</div>
			
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
						<input type="hidden" id="json" value="<c:out value="${json}"/>"></input>
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
			
			<div class="col-md-12" id="scheduleDetail"></div>
			
		</div>
		
		<div class="row">
		
			<h1 class="TrainerPageTitle">나의 강좌</h1>
			
			<div id="classLink">

				<table class="table table-bordered table-hover">
					<tr>
						<th>강좌명</th>
						<th>강좌기간</th>
						<th>진행상태</th>
					</tr>
					
					<c:if test="${insMyClass eq null}">
						<tr>
							<td colspan="3">진행한 강좌가 없습니다.</td>
						</tr>
					</c:if>
					
					<!-- 강사가 등록한 강좌가 있을 때 -->
					<c:forEach var="cla" items="${insMyClass }">
						<tr>
							<!-- 진행 중인 강좌만 강좌 이름에 링크 -->
							<c:if test="${cla.status == '진행 중'}">
								<td><a href="classview.action?classNo=${cla.classNo}" style="font-size: 14pt;" id="classNo" class="currentClass">${cla.className }</a></td>
							</c:if>
							
							<c:if test="${cla.status != '진행 중'}">
								<td>${cla.className }</td>
							</c:if>
							
							<td>${cla.startDate } ~ ${cla.endDate }</td>
							<td>${cla.status }</td>
						</tr>		
					</c:forEach>
				</table>	
					
			</div>
			
			<div id="classBtn">
				<button type="button" id="classInsert" class="btn-primary">강좌등록</button>
				<button type="button" id="classExtend" class="btn-primary">강좌연장</button>
				<button type="button" id="classClose" class="btn-primary">강좌폐쇄</button>
			</div>
			
			<div id="bottomBtn">
				<button type="button" id="onedayRsvList" class="btn-primary" style="width: 300px;">원데이클래스 구직현황</button>
				<button type="button" id="calculate" class="btn-primary" style="width: 300px;">정산현황</button>
			</div>
			
		</div>
		
	</div>
	
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>


<!-- 달력관련 -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript">

	$(function()
	{
		/* ajax 관련 */
		$(".today").parent().css("background-color", "#d5ffda");
		
		ajaxRequest($(".today").children().val());
		
		$(".ajaxClick").click(function()
		{
			$(".ajaxClick").css("background-color", "white");
			
			$(".today").parent().css("background-color", "#d5ffda");
			
			$(this).css("background-color", "#bebebe");
			
			ajaxRequest($(this).children().children().val());
		});
		
		/* 강사수정요청 관련 */
		$("#pictureModify").click(function()
		{
			$(location).attr("href", "instructorChangeForm.action");
		});
		
		/* 스케줄변경 관련 */
		$("#trainerScheduleModify").click(function()
		{
			window.open("scheduleChangeform.action?classNo=${nowClass.classNo }", "_blank"
					, "toolbar=yes, scrollbars=yes, width=610, height=300, top=200, left=600");
		});
		
		/* 강좌등록 관련 */
		$("#classInsert").click(function()
		{
			// #classNo 를 변경해서 일단 주석
			/*	 
			if (($("#classNo").text()) == "")
			{
				$(location).attr("href", "classinsertform.action");
			} else
			{
				alert("등록된 강좌가 이미 존재합니다.");
			}
			 */
		});
		
		/* 강좌연장 관련 */
		$("#classExtend").click(function()
		{
			alert()
		});
		
		/* 강좌폐쇄 관련 */
		$("#classClose").click(function()
		{
			
		});
		
		/* 원데이클래스 구직현황 관련 */
		$("#onedayRsvList").click(function()
		{
			$(location).attr("href", "onedayrsvlist.action");
		});
		
		/* 정산현황 관련 */
		$("#calculate").click(function()
		{
			
		});
		
	});
	
	function ajaxRequest(date)
	{
		var params = "insNo=" + $.trim("<%=insNo%>")
		+ "&date=" + $.trim(date);
	
		$.ajax(
		{
			type : "GET"
			, url : "scheduleajax.action"
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