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
<title>MemberList</title>
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
</style>

<script type="text/javascript">
	
	$(function()
	{ 
		// 블랙 버튼
		$(".black").click(function()
		{
			if(confirm("선택한 회원을 블랙회원으로 지정하시겠습니까?"))
	         {				
	            $(location).attr("href", "black.action?memNo=" + $(this).val());
	         }
		});
		// 블랙 해제 버튼
		$(".blackCancel").click(function()
		{
			if(confirm("선택한 회원을 블랙회원에서 해제하시겠습니까?"))
	         {				
	            $(location).attr("href", "blackcancel.action?memNo=" + $(this).val());
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
			<button class="btn btn-info btn-xl text-uppercase col-md-5" onclick="location.href='memlist.action'">회원정보</button>
			<div class="col-md-2"></div>
			<button class="btn btn-primary btn-xl text-uppercase col-md-5" onclick="location.href='inslist.action'">강사정보</button>
		</div>
		<br><br>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>이름(아이디)</th>
					<th>나이</th>
					<th>휴대폰번호</th>
					<th>집전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>신고누적횟수</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="member" items="${memberList }">
					<tr>
						<td>${member.memName }(${member.memId })</td>
						<td>${member.age }</td>
						<td>${member.tel }</td>
						<td>${member.hometel }</td>
						<td>${member.addr }</td>
						<td>${member.email }</td>
						<td>${member.countReport }</td>
						<td>
							<button type="button" class="btn btn-danger black" value="${member.memNo }"
							style="${member.blackCheck==null?'':'display:none'}">블랙</button>
							<button type="button" class="btn btn-info blackCancel" value="${member.memNo }"
							style="${member.blackCheck==null?'display:none':''}">블랙해제</button>
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