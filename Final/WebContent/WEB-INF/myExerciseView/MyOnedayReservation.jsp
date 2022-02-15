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
<title>MyOnedayReservation</title>

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
</style>

<script type="text/javascript">
	
	$(function()
	{ 
		// 강사 확정 버튼
		$(".onedayFix").click(function()
		{
			if(confirm("이 강사를 확정하시겠습니까?"))
	         {				
	            $(location).attr("href", "onedayfix.action?rsvNo=" + $(this).val() + "&onedayNo=" + $(onedayNo).val());
	         }
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<input type="hidden" id="onedayNo" name="onedayNo" value="${onedayNo }"/>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>강사</th>
					<th>활동지역</th>
					<th>진행중인 강좌</th>
					<th>제안아령</th>
					<th>제안시간</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="rsv" items="${onedayRsvList }">
					<tr>
						<td>${rsv.insName }(${rsv.insId })</td>
						<td>${rsv.area }</td>
						<td>${rsv.title }</td>
						<td>${rsv.reqPoint }</td>
						<td>${rsv.reqTime }</td>
						<td>
							<button type="button" class="btn btn-info onedayFix" value="${rsv.rsvNo }" 
							style="${fixCheck!=null? 'display:none' : '' }">확정</button>
							${rsv.fixDate!=null? "확정강사" : ""}
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>
</html>