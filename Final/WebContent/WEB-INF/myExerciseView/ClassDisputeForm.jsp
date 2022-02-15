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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ClassDisputeForm.jsp</title>

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
.outer 
{
	width: 100%;
	margin: auto;
}

.inner 
{
	width: 1100px;
	margin: auto;
	padding: 100px 0;
}

.form-control 
{
	width: 200px;
}

label 
{
	padding-top:5px;;
	text-align: center;
}
</style>
</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>


<div class="outer">

<div class="panel-group inner">
   
   <div class="panel panel-default">
      
      <div class="panel-heading" id="title">
         <h1> 분쟁조정 </h1>
      </div>
      
      <div class="panel-body">
         <form action="classdispute.action" method="post" enctype="multipart/form-data">
         
         	<div class="form-group row">
				<label for="classDisTitle" class="col-md-2">제목</label>
				<input type="text" id="classDisTitle" name="classDisTitle" maxlength="30" class="form-control" style="width:500px;" required="required"/>
			</div>
			<br>
         	<div class="form-group row">
				<label for="title" class="col-md-2">분쟁대상</label>
				<div class="col-md-10">
					<label>${classR.title}-${classR.insName}(${classR.insId}) [${classR.rsvDate}]</label>
				</div>
			</div>
			<br>
         	<div class="form-group row">
         		<label for="classDisPath" class="col-md-2">첨부파일</label>
         		<input type="file" role="button" class="btn btnInsert col-md-3" name="classDisPath" style="width:300px;">
			</div>
			<br>
			<div class="form-group row">
				<label for="classDisContent" class="col-md-2">분쟁내용</label>
				<textarea id="classDisContent" name="classDisContent" class="form-control" cols="30" rows="10" style="width:800px;" required="required"></textarea>
			</div>
			<br>
			
            <div style="text-align: center;">
               <button type="submit" class="btn btn-primary" name="classRsvNo" value="${param.classRsvNo }" >분쟁조정 신청</button>
               <button type="button" class="btn btn-danger" onclick="location.href='myexerciseclass.action'">취소</button>
            </div>
         </form>
      </div><!-- close .panel-body -->
      
   </div><!-- close .panel .panel-default -->

</div>

</div>

	<div class="row">
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>
	
</body>
</html>