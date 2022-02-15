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
<title>OnedayMain.jsp</title>

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
	margin: 100px 0;
}

#inner
{
	width: 1100px;
	margin: auto;
	text-align: center;
	vertical-align: middle;
}
</style>

<script type="text/javascript">
	
	$(function()
	{ 
		// 게시글 이동
		$(".onedayContent").click(function()
		{
			$(location).attr("href", "onedaycontent.action?onedayNo=" + $(this).children().val());
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div style="text-align: center; margin-top: 80px;">
	<h1>원데이클래스</h1>
</div>
<div id="outer">
	<div id="inner">
		<table class="table table-striped" style="margin-top: 80px;">
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>지역</th>
				<th>운동종목</th>
				<th>운동희망날짜</th>
				<th>희망타임</th>
				<th>게시날짜</th>
				<th>모집상태</th>
			</tr>
			
			<c:forEach var="oneday" items="${list }">
			<tr>
				<td>${oneday.memName }</td>
				<td class="onedayContent" style="cursor: pointer;"><input type="hidden"  value="${oneday.onedayNo }">${oneday.title }</td>
				<td>${oneday.addr }</td>
				<td>${oneday.sportName }</td>
				<td>${oneday.wishDate }</td>
				<td>${oneday.startTime } 시~${oneday.endTime } 시</td>
				<td>${oneday.regDate }</td>
				<td>
					${oneday.dateCheck=="기간만료"? "기간만료" : oneday.fixDate!=null? "모집완료" : "모집중" }
				</td>
			</tr>
			</c:forEach>
			
		</table>
		
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="onedaylist.action?nowPage=${paging.startPage - 1 }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="onedaylist.action?nowPage=${p }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="onedaylist.action?nowPage=${paging.endPage+1 }">&gt;</a>
			</c:if>
		</div>
	</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>
</html>