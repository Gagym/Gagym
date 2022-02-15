<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String memNo = (String)session.getAttribute("memNo");
	String insNo = (String)session.getAttribute("insNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnedayContent</title>

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

<script type="text/javascript">
	
	$(function()
	{ 
		// 신청 버튼
		$(".onedayRsvInsertForm").click(function()
		{
			$(location).attr("href", "onedayrsvinsertform.action?onedayNo=" + $(this).val());
		});
		// 신고 버튼
		$(".onedayReportForm").click(function()
		{
			$(location).attr("href", "onedayreportform.action?onedayNo=" + $(this).val());
		});
		// 원데이클래스 삭제 버튼 클릭
		$(".onedayDelete").click(function()
		{
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
	         {				
	            $(location).attr("href", "onedaydelete.action?onedayNo=" + $(this).val());
	         }
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
		<div id="inner" class="row">
				<div class="box">
					<div class="row" >
						<div class="col-md-3"></div>
						<div class="col-md-5">
							<h3>${oneday.title }</h3>
						</div>
						<div class="col-md-4 row">
							<span class="col-md-4" style="padding-top: 0.5em;">모집마감일</span>
							<input type="text" id="deadline" readonly="readonly" value="${oneday.dateCheck }"
							class="form-control col-md-8" style="width:110px; text-align: right;" />
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="name" class="col-md-2">이름(아이디)</label> 
						<input type="text" id="name" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${member.memName }" />
							
						 
						<label for="gender" class="col-md-2">성별</label>
						<input type="text" id="gender" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${member.gender }" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="sport" class="col-md-2">운동종목</label> 
						<input type="text" id="sport" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${oneday.sportName }" />
							
						 
						<label for="addr" class="col-md-2">지역</label>
						<input type="text" id="addr" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${member.addr }" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="wishDate" class="col-md-2">희망날짜</label> 
						<input type="text" id="wishDate" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${oneday.wishDate }" />
							
						 
						<label for="time" class="col-md-2">희망타임</label>
						<input type="text" id="time" class="form-control col-md-1" style="width: 120px;"
							readonly="readonly" value="${oneday.startTime }:00 ~ ${oneday.startTime +1}:00" />
						~
						<input type="text" id="time" class="form-control col-md-1" style="width: 120px;"
							readonly="readonly" value="${oneday.endTime }:00 ~ ${oneday.endTime +1}:00" />
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-1"></div>
						<label for="wishPoint" class="col-md-2">희망아령</label> 
						<input type="text" id="wishPoint" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${oneday.wishPoint }" />
							
						 
						<label for="regDate" class="col-md-2">게시날짜</label>
						<input type="text" id="regDate" class="form-control col-md-3" style="width: 250px;"
							readonly="readonly" value="${oneday.regDate }" />
					</div>
					<br>
					
					<div class="form-group row">
						<div class="col-md-1"></div>
						<label for="content" class="col-md-2">내용</label>
						<textarea class="form-control" name="content" cols="40" rows="10" required="required" 
						readonly="readonly" style="width:680px;">${oneday.content }</textarea>
					</div>
					<br>
					
					<div>
						<button type="button" class="btn btn-info onedayRsvInsertForm" value="${oneday.onedayNo }" 
						style="${memNo==oneday.memNo? 'display:none' : (insNo==null?'display:none':oneday.dateCheck=='기간만료'?'display:none':'') } ">신청하기</button> 
						<button type="button" class="btn btn-danger onedayReportForm" value="${oneday.onedayNo }" 
						style="${memNo==oneday.memNo? 'display:none' : '' }">신고</button> 
						<button type="button" class="btn btn-danger onedayDelete" value="${oneday.onedayNo }" 
						style="${memNo==oneday.memNo? '' : 'display:none' }">삭제</button> 
						<!-- 신청하기/신고 버튼은 다른 회원만, 삭제 버튼은 작성자만 -->
					</div>
					
				</div>
		</div>
</div>


<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>
</html>