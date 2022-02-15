<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//String memNo = (String)session.getAttribute("memNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnedayRsvInsertForm</title>

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
.box {
	text-align: center;
	border: 1px solid gray;
	padding: 3em;
	width: 1100px;
}
</style>



</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
		<div id="inner" class="row">
				<div class="box">
					<h3>${oneday.title }</h3>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="name" class="col-md-2">회원이름(아이디)</label> 
						<input type="text" id="name" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${member.memName }" />
							
						 
						<label for="wishDate" class="col-md-2">희망날짜</label> 
						<input type="text" id="wishDate datepicker" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${oneday.wishDate }" />
					</div>
					<br>
					<form action="onedayrsvinsert.action" method="post">
						<div class="row">
							<div class="col-md-1"></div>
							<label for="time" class="col-md-2">제안타임</label>
							<%-- <input type="text" id="time" name="reqTime" class="form-control col-md-3" style="width: 250px;"
								readonly="readonly" value="${oneday.startTime }:00 ~ ${oneday.endTime }:00" /> --%>
							<select id="reqTimeNo" name="reqTimeNo" class="form-control col-md-3" style="width: 250px;" required="required" >
								<c:forEach var="time" items="${timeList }">
									<option value="${time.timeNo }" 
										<%-- 희망타임 범위에 없는 option은 disabled - 제안불가  --%>
										<c:if test="${time.startTime < oneday.startTime || time.startTime > oneday.endTime }">disabled</c:if>
									>
										${time.startTime }:00 ~ ${time.endTime }:00
									</option>
								</c:forEach> 
							</select>
								
							<label for="wishPoint" class="col-md-2">제안아령</label> 
							<input type="number" id="reqPoint" name="reqPoint" class="form-control col-md-3" 
								style="width: 250px;" value="${oneday.wishPoint }" />
						</div>
						<br>
						
						<div>
							<button type="submit" class="btn btn-primary" id="rsvInsertBtn" name="onedayNo" value="${onedayNo}">
							   신청하기
							</button>
							<button type="button" class="btn btn-info" id="contentBtn" onclick="location.href='onedaycontent.action?onedayNo=${onedayNo}'">
							   돌아가기
							</button>
						</div>
					</form>
				</div>
		</div>
</div>


<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>
</html>