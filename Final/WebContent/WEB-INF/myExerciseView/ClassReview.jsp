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
<title>ClassReview.jsp</title>

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
   #box
   {
      width:500px;
      text-align: center;
      border: 1px solid gray;
      border-radius: 7px;
      padding: 3em;
   }
  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
</style>

<script type="text/javascript">
	$(function()
	{
		showStar();
	});
</script>

</head>
<body>

	<div id="outer">
		<form id="cancel">
			<div id="inner">
				<div class="panel-group" id="box" style="margin: 50px 50px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>강좌명</th>
								<th>강사</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${review.className }</td>
								<td>${review.insName}(${review.insId})</td>
							</tr>
					</table>
					<br> 
					<span class="star"> 
					★★★★★ 
					<span>★★★★★</span> 
						<input type="range" id="grade" name="grade" value="${review.grade }" step="0.5"min="0" max="5" disabled="disabled">
					</span> 
					<br>
					<textarea id="reviewContent" name="reviewContent" cols="38" rows="5" disabled="disabled">${review.reviewContent }</textarea>
					<br>
					<button type="reset" class="btn btn-info classRe" onclick="window.close();">닫기</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 별점 js -->
	<script type="text/javascript" src="<%=cp %>/js/star.js"></script>
	
</body>
</html>