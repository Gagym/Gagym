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
<title>MyExerciseClass</title>

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
tr, td{
	text-align: center;
}
</style>

<script type="text/javascript">
	
	$(function()
	{ 
		// 게시글 이동
		$(".classContent").click(function()
		{
			$(location).attr("href", "classview.action?classNo=" + $(this).children().val());
		});
		// 예약 취소창
		$(".classCancelForm").click(function()
		{
			window.open("classcancelform.action?classRsvNo=" + $(this).val(), "_blank"
						, "toolbar=yes, scrollbars=yes, width=450, height=480, top=30, left=400");
		});
		// 수강확정
		$(".classComplete").click(function()
		{
			if(confirm("수강을 확정하시겠습니까?"))
	         {
				$(location).attr("href", "classcomplete.action?classRsvNo=" + $(this).val());
	         }
		});
		// 분쟁조정
		$(".classDispute").click(function()
		{
			$(location).attr("href", "classdisputeform.action?classRsvNo=" + $(this).val());
		});
		// 리뷰작성창
		$(".classReviewInsert").click(function()
		{
			window.open("classreviewinsertform.action?classComNo=" + $(this).val(), "_blank"
					, "toolbar=yes, scrollbars=yes, width=450, height=450, top=30, left=400");
		});
		// 리뷰보기창
		$(".classReview").click(function()
		{
			window.open("classreview.action?reviewNo=" + $(this).val(), "_blank"
					, "toolbar=yes, scrollbars=yes, width=450, height=450, top=30, left=400");
		});
	});
	
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>수강일</th>
					<th>수강타임</th>
					<th>강좌명</th>
					<th>지불아령</th>
					<th>강사</th>
					<th>처리상태</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="classR" items="${classList }">
					<tr>
						<td>${classR.rsvDate }</td>
						<td>${classR.rsvTime }:00~${classR.rsvTime+1 }:00</td>
						<!-- 게시글 링크 이동 -->
						<td class="classContent" style="cursor: pointer;"><input type="hidden"  value="${classR.classNo }"/>${classR.title }</td>
						<td>${classR.point }</td>
						<td>${classR.insName }(${classR.insId })</td>
						<td>${classR.cnlDate!=null?'예약취소' : (classR.prcCode==2?'예약거절' : (classR.prcDate=='대기중'? '대기중'
						: (classR.comCheck==null?'예약확정': (classR.comDate!=null?'수강확정':(classR.classDisNo==null?'수강완료':'분쟁조정 중') ) ) ) ) }</td>
						<!--
						cnlDate가 null X (예약취소)
								  	   O - prcCode가 2이면 (예약거절)
								  				     1 - prcDate가 대기중이면 (대기중)
								  				   				   날짜 - comCheck가 null O (예약확정)
								  				   				 	  				 	  x - comDate가 null X (수강확정)
								  				   				 	  				 	  					 O - classDisNo가 null X (분쟁조정)
								  				   				 	  				 	  					 					   O (수강완료)
						-->
						<td>
							<!-- 수강날짜 > 현재날짜, 취소X = (예약취소) -->
							<button type="button" class="btn btn-danger classCancelForm" value="${classR.classRsvNo }" 
							style="${classR.comCheck==null? (classR.cnlDate==null?'':'display:none') : 'display:none'}">예약 취소</button> 
							
							<!-- 수강완료 = (수강확정) (분쟁조정) -->
							<button type="button" class="btn btn-primary classComplete" value="${classR.classRsvNo }"
							style="${classR.prcDate=='대기중'? 'display:none' : (classR.prcCode==2?'display:none' : (classR.cnlDate!=null?'display:none'
							: (classR.comCheck==null?'display:none': (classR.comDate!=null?'display:none':(classR.classDisNo==null?'':'display:none') ) ) ) ) }">
								수강확정
							</button> 
							<button type="button" class="btn btn-danger classDispute" value="${classR.classRsvNo }"
							style="${classR.prcDate=='대기중'? 'display:none' : (classR.prcCode==2?'display:none' : (classR.cnlDate!=null?'display:none'
							: (classR.comCheck==null?'display:none': (classR.comDate!=null?'display:none':(classR.classDisNo==null?'':'display:none') ) ) ) ) }">
								분쟁조정
							</button> 
							
							<!-- 수강확정 = (리뷰작성)→(리뷰보기) -->
							<button type="button" class="btn btn-info classReviewInsert" value="${classR.classComNo }" 
							style="${classR.comDate!=null? (classR.reviewNo==null?'':'display:none') :'display:none'}">
								리뷰작성
							</button> 
							<button type="button" class="btn btn-info classReview" value="${classR.reviewNo }" 
							style="${classR.comDate!=null? (classR.reviewNo==null?'display:none':'') :'display:none'}">
								리뷰보기
							</button> 
							
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