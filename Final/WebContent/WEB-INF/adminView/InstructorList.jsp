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
<title>InstructorList</title>
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
	width: 1300px;
	margin: auto;
	padding: 100px 0;
}
.box {
	text-align: center;
	border: 1px solid gray;
	padding: 3em;
	width: 1100px;
}
label {
	text-align: center;
	padding-top: 5px;
}

ul.tab {
	margin: 0;
	padding: 0;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tab li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tab li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.3em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
	width: 440px;
	height: 150px;
	text-align: center;
}

ul.tab li a:hover {
	background: #ccc;
}

html ul.tab li.active, html ul.tab li.active a:hover {
	background: #fff;
	border-bottom: 1px solid #fff;
}

.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}

</style>

<script type="text/javascript">
	$(function()
	{
		// 탭 전환
		$(".tab_content").hide(); // 처음에 전부 숨기기
		$("ul.tab li:first").addClass("active").show(); // 처음 탭 활성화 
		$(".tab_content:first").show(); // 처음 탭 보여주기

		$("ul.tab li").click(function()
		{
			$("ul.tab li").removeClass("active"); // 활성화 지우기
			$(this).addClass("active"); // 선택된 탭 활성화
			$(".tab_content").hide(); // 전부 숨기기

			var activeTab = $(this).find("a").attr("href"); // 선택된 탭 영역 href 찾기
			$(activeTab).fadeIn();
			return false;
		});
		
		// ※ 버튼
		// 강사 권한박탈
		$(".insDropForm").click(function()
		{
			window.open("insdropform.action?insNo=" + $(this).val(), "_blank"
						, "toolbar=yes, scrollbars=yes, width=450, height=400, top=30, left=400");
		});
		// 강사 신청 상세정보
		$(".insReqContent").click(function()
		{
			$(location).attr("href", "insreqcontent.action?reqNo=" + $(this).val());
		});
	});
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<div class="row">
			<button class="btn btn-primary btn-xl text-uppercase col-md-5" onclick="location.href='memlist.action'">회원정보</button>
			<div class="col-md-2"></div>
			<button class="btn btn-info btn-xl text-uppercase col-md-5" onclick="location.href='inslist.action'">강사정보</button>
		</div>
		<br><br>
		
		<!-- 탭 -->
		<div id="wrapper" class="row">
			<ul class="tab">
				<li><a href="#tab1">강사목록</a></li>
				<li><a href="#tab2">강사신청</a></li>
				<li><a href="#tab3">강사수정요청</a></li>
			</ul>

			<!-- 강사 리스트-->
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>이름(아이디)</th>
								<th>활동지역</th>
								<th>현재개설강좌</th>
								<th>강사등록날짜</th>
								<th>권한</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="ins" items="${insList }">
								<tr>
									<td>${ins.insName }(${ins.insId })</td>
									<td style="width:300px;">${ins.area }</td>
									<td>${ins.className }</td>
									<td>${ins.prcDate }</td>
									<td>
										<button type="button" class="btn btn-danger insDropForm" value="${ins.insNo }"
										style="${ins.dropReason==null?'':'display:none'}">권한박탈</button>
										<p>${ins.dropReason==null?'':ins.dropReason}</p>
									</td>
									<td><button type="button" class="btn btn-info" value="${ins.insNo }">상세정보</button></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				
				<!-- 강사 신청 -->
				<div id="tab2" class="tab_content">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>이름(아이디)</th>
								<th>강사신청날짜</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="ins" items="${insReqList }">
								<tr>
									<td>${ins.insName }(${ins.insId })</td>
									<td>${ins.reqDate }</td>
									<td><button type="button" class="btn btn-info insReqContent" value="${ins.reqNo }">신청 상세정보</button></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				
				<div id="tab3" class="tab_content">
				</div>

			</div>
		</div>
		
	</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>

</html>