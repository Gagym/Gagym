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
<title>StandBy.jsp</title>
<style type="text/css">
#outer {
	width: 100%;
}

#inner {
	width: 1100px;
	margin: auto;
}

.title
{
	text-align: center;
}

table {
	padding-left: 5%;
	width: 95%;
	border-collapse: collapse;
	text-align: center;
}

table th {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	padding: 10px;
}
</style>
</head>
<body>

	<hr>
	<div id="outer">
		<div id="inner">

			<div class="title">회원 예약 대기</div>

			<table>
				<tr>
					<th>수강생명(아이디)</th>
					<th>날짜</th>
					<th>시간</th>
					<th>주소</th>
					<th></th>
				</tr>
				<tr>
					<td>정가연(jgy)</td>
					<td>2021.12.08</td>
					<td>15:00</th>
					<td>경기도 고양시 일산동구</td>
					<td><button>수락</button>
						<button>거절</button></td>
				</tr>
			</table>
			<br><br>
			
			<div style="width:100%; border:1px solid; text-align:center;">
				스케줄표
			</div>

		</div>
	</div>


</body>
</html>