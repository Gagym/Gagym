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
<title>PointPay.jsp</title>

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

form {
	margin-top: 100px;
}

.box {
	width: 600px;
	margin: auto;
	text-align: center;
	border: 1px solid gray;
	border-radius: 7px;
	padding: 3em;
}

.box2 {
	border: 1px solid gray;
}
label{ display:inline-block; line-height:50px; }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#checkall").click(function() 
		{
			if($("#checkall").prop("checked"))
			{
				$("input[name=checkGroup]").prop("checked", true);
			}
			else
			{
				$("input[name=checkGroup]").prop("checked", false);
			}
		});
	});
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

	<div id="outer">
		<div id="inner">

			<form action="point.action">
				<div class="box">
					<div class="box2">
						구매 아령 개수 : <input type="hidden" name="point" value="${point }">${point } 개
						<br>	
						결제 금액 : ${pointPay } 원 <br>
						<input type="hidden" name="memNo" value="${memNo }">
					</div>
					<br><br>
					<div class="box2">
						<input type="checkbox" id="checkall" style="width:30px"><label for="checkall">전체선택</label><br>
						<div>
							<label for="agree1"><input type="checkbox" name="checkGroup" id="agree1" value="동의1">  만 14세 이상 결제동의 </label><br>
							<label for="agree2"><input type="checkbox" name="checkGroup" id="agree2" value="동의2">  교환/환불정책 </label><br>
							<label for="agree3"><input type="checkbox" name="checkGroup" id="agree3" value="동의3">  개인정보 제3자 정보 제공 동의 </label><br>
							<label for="agree4"><input type="checkbox" name="checkGroup" id="agree4" value="동의4">  결제대행 서비스 이용약관 동의 </label><br>
							<label for="agree5"><input type="checkbox" name="checkGroup" id="agree5" value="동의5">  구매확인 동의 </label><br>
						</div>
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">구매하기</button>
					<button type="button" class="btn btn-info"
						onclick="location.href='Point.jsp'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>


	<div class="row">
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>

</body>
</html>