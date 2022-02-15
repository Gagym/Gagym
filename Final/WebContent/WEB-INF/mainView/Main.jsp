<%@page import="java.net.URLDecoder"%>
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
<title>Main.jsp</title>

<!-- 슬릭 시작 -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/slick.css" />
<!-- 슬릭 끝 -->

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<!-- 슬릭 시작 -->
<script type="text/javascript" src="<%=cp %>/js/slick.js"></script>
<!-- 슬릭 끝 -->

<style type="text/css">
#outer
{
	width: 100%;
}

#inner
{
	width: 1100px;
	margin: auto;
	text-align: center;
	vertical-align: middle;
}

.slick-dots
{
	border: 0px;
}

.slick-dots li button:before
{
	font-size: 50px;
}

.card-title
{
	text-align: left;
	padding: 5px;
	font-size: 15px;
}

.card-header
{
	background-color: #2F4F4F;
	font-weight: bolder;
	font-size: 25px;
}

.card-header a
{
	color: white;
}

.card-header a:hover
{
	color: #FFE4E1;
}
</style>
<script type="text/javascript">
//제이쿼리 충돌방지
var $jq = jQuery.noConflict();
$jq(document).ready(function(){
	$jq(".List").slick(
	{
		dots : true,
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 3000,
		speed : 1000
	});
	
	$jq(".img_home").slick(
	{
		dots : true,
		infinite : true,
		slidesToShow : 1,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 5000,
		speed : 1500
	});
});
</script>
</head>
<body>

	<c:import url="Header.jsp"></c:import>

	<div id="outer">
		<div id="inner">

			<hr style="margin-top: 3%;">

			<div class="img_home">
				<div>
					<img src="images/home.png" style="width: 100%; border-radius: 15px; margin-top: 4%;">
				</div>
				<div>
					<img src="images/SANTA.png" style="width: 100%; border-radius: 15px; margin-top: 4%;">
				</div>
				<div>
					<img src="images/exe.jpg" style="width: 80%; border-radius: 15px; margin-top: 4%; margin: auto;">
				</div>
			</div>

			<hr style="margin-top: 10%;">

			<!-- 최신강좌 -->
			<h2 class="row-md-1" style="font-weight: bolder; font-size: 30px; color: #7B68EE; text-align: center; margin-top: 7%;">신규
				강좌</h2>
			<br>
			<br>
			<div class="List" style="height: 300px; font-size: 20px;">
				<c:forEach var="cla" items="${classList }">
					<div style="margin-left: 1%;">
						<div class="card" style="height: 300px; width: 90%;">
							<div class="card-header">
								<a href="classview.action?classNo=${cla.classNo }">${cla.className }</a>
							</div>
							<div class="card-body">
								<h5 class="card-title">시작날짜: ${cla.startDate }</h5>
								<h5 class="card-title">종료날짜: ${cla.endDate }</h5>
								<h5 class="card-title">활동지역: ${cla.insArea }</h5>
								<h5 class="card-title">운동종목: ${cla.sportName }</h5>
								<h5 class="card-title">아령개수: ${cla.point }</h5>
								<h5 class="card-title">강사이름: ${cla.insName }</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<hr style="margin-top: 10%;">

			<!-- 최신원데이클래스 -->
			<h2 class="row-md-1" style="font-weight: bolder; font-size: 30px; color: #7B68EE; text-align: center; margin-top: 7%;">신규
				원데이 클래스</h2>
			<br>
			<br>
			<div class="List" style="height: 300px; font-size: 20px;">
				<c:forEach var="oneday" items="${onedayList }">
					<div style="margin-left: 1%;">
						<div class="card" style="height: 300px; width: 90%;">
							<div class="card-header" style="background-color: #ff8e99;">
								<a href="onedaycontent.action?onedayNo=${oneday.onedayNo }">${oneday.title }</a>
							</div>
							<div class="card-body">
								<h5 class="card-title">희망날짜: ${oneday.wishDate }</h5>
								<h5 class="card-title">희망시간: ${oneday.startTime }시 ~
									${oneday.endTime }시</h5>
								<h5 class="card-title">운동종류: ${oneday.sportName }</h5>
								<h5 class="card-title">아령개수: ${oneday.wishPoint } 개</h5>
								<h5 class="card-title">주소: ${oneday.addr }</h5>
								<h5 class="card-title">회원이름: ${oneday.memName } 님</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 최신강사 -->
			<hr style="margin-top: 10%;">

			<h2 class="row-md-1" style="font-weight: bolder; font-size: 30px; color: #7B68EE; text-align: center; margin-top: 7%;">신규	강사</h2>
			<br>
			<br>
			<div class="List" style="height: 300px; font-size: 20px; margin-bottom: 20%;">
				<c:forEach var="ins" items="${insList }">
					<div style="margin-left: 1%;">
						<div class="card" style="height: 300px; width: 90%;">

							<div class="card-header" style="background-color: #ffdc72;">
								<a href="">${ins.insName }</a>
							</div>

							<div class="card-body">
								<h5 class="card-title">강사평점:점</h5>
								<h5 class="card-title">팔로잉수:명</h5>
								<h5 class="card-title">활동지역:</h5>
								<h5 class="card-title">현강좌명:</h5>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>

		</div>
	</div>

	<c:import url="Footer.jsp"></c:import>

</body>
</html>