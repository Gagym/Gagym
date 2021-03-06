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
		// ??? ??????
		$(".tab_content").hide(); // ????????? ?????? ?????????
		$("ul.tab li:first").addClass("active").show(); // ?????? ??? ????????? 
		$(".tab_content:first").show(); // ?????? ??? ????????????

		$("ul.tab li").click(function()
		{
			$("ul.tab li").removeClass("active"); // ????????? ?????????
			$(this).addClass("active"); // ????????? ??? ?????????
			$(".tab_content").hide(); // ?????? ?????????

			var activeTab = $(this).find("a").attr("href"); // ????????? ??? ?????? href ??????
			$(activeTab).fadeIn();
			return false;
		});
		
		// ??? ??????
		// ?????? ????????????
		$(".insDropForm").click(function()
		{
			window.open("insdropform.action?insNo=" + $(this).val(), "_blank"
						, "toolbar=yes, scrollbars=yes, width=450, height=400, top=30, left=400");
		});
		// ?????? ?????? ????????????
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
			<button class="btn btn-primary btn-xl text-uppercase col-md-5" onclick="location.href='memlist.action'">????????????</button>
			<div class="col-md-2"></div>
			<button class="btn btn-info btn-xl text-uppercase col-md-5" onclick="location.href='inslist.action'">????????????</button>
		</div>
		<br><br>
		
		<!-- ??? -->
		<div id="wrapper" class="row">
			<ul class="tab">
				<li><a href="#tab1">????????????</a></li>
				<li><a href="#tab2">????????????</a></li>
				<li><a href="#tab3">??????????????????</a></li>
			</ul>

			<!-- ?????? ?????????-->
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>??????(?????????)</th>
								<th>????????????</th>
								<th>??????????????????</th>
								<th>??????????????????</th>
								<th>??????</th>
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
										style="${ins.dropReason==null?'':'display:none'}">????????????</button>
										<p>${ins.dropReason==null?'':ins.dropReason}</p>
									</td>
									<td><button type="button" class="btn btn-info" value="${ins.insNo }">????????????</button></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				
				<!-- ?????? ?????? -->
				<div id="tab2" class="tab_content">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>??????(?????????)</th>
								<th>??????????????????</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="ins" items="${insReqList }">
								<tr>
									<td>${ins.insName }(${ins.insId })</td>
									<td>${ins.reqDate }</td>
									<td><button type="button" class="btn btn-info insReqContent" value="${ins.reqNo }">?????? ????????????</button></td>
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