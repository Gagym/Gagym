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
<title>InsReqContent.jsp</title>

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
	#trainerScheduleModify{margin-left: 70%;}
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
</style>

<script type="text/javascript">
	$(function()
	{
		// 강사 신청 수락
		$(".insReqOk").click(function()
		{
			$(location).attr("href", "insreqok.action?reqNo=" + $(this).val());
		});
		// 강사 신청 거절
		$(".insReqNo").click(function()
		{
			$(location).attr("href", "insreqno.action?reqNo=" + $(this).val());
		});
	});
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
	
	<div id="inner">
		

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
					<div style="text-align: center;">
						<img src="${certificate.proofPath }" style="width:400px;"/>
					</div>
				</c:forEach>
				</table>
				
			</div>
			
			<div style="text-align: center; margin: 50px 0">
				<button type="button" class="btn btn-primary insReqOk" value="${reqNo }">수락</button>
				<button type="button" class="btn btn-danger insReqNo" value="${reqNo }">거절</button>
			</div>
		
		</div>
		
	</div>
	
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>