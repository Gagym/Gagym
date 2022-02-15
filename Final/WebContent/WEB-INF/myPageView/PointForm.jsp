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
<title>Point.jsp</title>

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
}
form {
	margin-top: 100px;
}
</style>


</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

	<div id="outer">
		<div id="inner">

			<form action="pointpay.action">
				<input type="hidden" name="memNo" value="MEMBER-3">
				<div class="row" style="text-align: center;">
					<div class="col-md-1"></div>
					<div class="col-md-4">
						<div class="well well-sm">
							<input type="radio" id="radio1" name="point" value="50">아령
							50개 <br>&nbsp;&nbsp;&nbsp; <label for="radio1">6만원</label>
						</div>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="well well-sm">
							<input type="radio" id="radio2" name="point" value="100">아령
							100개 <br>&nbsp;&nbsp;&nbsp; <label for="radio2">11만원</label>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row" style="text-align: center;">
					<div class="col-md-1"></div>
					<div class="col-md-4">
						<div class="well well-sm">
							<input type="radio" id="radio3" name="point" value="300">아령
							300개 <br>&nbsp;&nbsp;&nbsp; <label for="radio3">32만원</label>
						</div>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="well well-sm">
							<input type="radio" id="radio4" name="point" value="500">아령
							500개 <br>&nbsp;&nbsp;&nbsp; <label for="radio4">53만원</label>
						</div>
					</div>
				</div>
				
				<br><br>

				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">선택완료</button>
					<button type="button" class="btn btn-info"
						 onclick="location.href='mypagemain.action'">돌아가기</button>
				</div>

			</form>
		</div>
	</div>
	
	<div class="row">
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>

</body>
</html>