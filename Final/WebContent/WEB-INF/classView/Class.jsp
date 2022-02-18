<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String order = request.getParameter("order");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class.jsp</title>

<style type="text/css">
	#outer
	{
		width:100%;
		margin: auto;
	}
	#inner
	{
		width:800px;
	    margin: auto;
	    padding: 100px 0;
	}
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
 	
 	$(function()
	{
		$("#sel").change(function()
		{
			$(location).attr("href","classlist.action?order=" + $("#sel option:selected").val());
		})
	})
	
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
<div id="inner">

	<h2 class="row-md-1"
		style="font-weight: bolder; font-size: 30px; color: #7B68EE; text-align: center; margin-top: 7%;">강좌게시판</h2>
	<br>
	<br>
	<div style="margin-left: 70%;">
		<select name="col" class="form-control" id="sel">
		  <option value="CLASS_DATE DESC" <% if(order.equals("CLASS_DATE DESC")){%>selected="selected"<%}%>>강좌등록순</option>	<!-- if문은 option 선택시 그대로 selected 하기위해 -->
		  <option value="INSAREA" <% if(order.equals("INSAREA")){%>selected="selected"<%}%>>활동지역순</option>
		  <option value="POINT" <% if(order.equals("POINT")){%>selected="selected"<%}%>>아령순</option>
		</select>
	</div>
	<br>
	
	<div id="order" class="row List" style=" font-size: 19px;">
		<c:forEach var="cla" items="${classList }">
			<div class="col-md-4" style="margin-bottom: 30px;">
				<div class="card" style=" margin: auto;">
					<div class="card-header">
						<a id="class" href="classview.action?classNo=${cla.classNo }">${cla.className }</a>
					</div>
					<div class="card-body">
						<h6 class="card-title">시작날짜: ${cla.startDate }</h6>
						<h6 class="card-title" id="endDate">종료날짜: ${cla.endDate }</h6>
						<h6 class="card-title">활동지역: ${cla.insArea }</h6>
						<h6 class="card-title">운동종목: ${cla.sportName }</h6>
						<h6 class="card-title">강좌평점: ${cla.grade }</h6>
						<h6 class="card-title">아령개수: ${cla.point }</h6>
						<h6 class="card-title">강사이름: ${cla.insName }(${cla.insId })</h6>
						<h6 class="card-title"> ${cla.profilePath }
							<img src="${cla.profilePath }" class="card-img-top embed-responsive-item" alt="강사프로필">
						</h6>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="classlist.action?nowPage=${paging.startPage - 1 }&order=CLASS_DATE DESC">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="classlist.action?nowPage=${p }&order=CLASS_DATE DESC">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="classlist.action?nowPage=${paging.endPage+1 }&order=CLASS_DATE DESC">&gt;</a>
		</c:if>
	</div>
	
</div>
	
	<div class="row" >
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>
</div>
	

</body>
</html>