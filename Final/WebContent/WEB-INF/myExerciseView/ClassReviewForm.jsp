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
<title>ClassReviewForm.jsp</title>

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
		$(".classReview").click(function()
		{
			if($("#grade").val()==0)
			{
				alert("별점을 입력하세요");
			}
			if($("#reviewContent").val()=="")
			{
				alert("리뷰 내용을 작성하세요");
			}
			else
			{
				var form = {classComNo:$("#classComNo").val(), grade:$("#grade").val(), reviewContent:$("#reviewContent").val()};
				
				$.ajax(
				{
					type : "POST"
					, url : "classreviewinsert.action"
					, data : form
					, success : function(d)
					{
						alert("리뷰가 등록되었습니다.");
						window.opener.location.href='myexerciseclass.action'; 
						window.close();
					}
	
				});
			}
				
		});
		
		$(".classRe").click(function()
		{
			window.close();
		});
	});
</script>

</head>
<body>

	<div id="outer">
		<form id="review">
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
						<input type="range" oninput="drawStar(this)" id="grade" name="grade" value="0" step="0.5"min="0" max="5">
					</span> 
					<br>
					<textarea id="reviewContent" name="reviewContent" cols="38" rows="5" placeholder="리뷰 입력"></textarea>
					<br>
					<button type="button" class="btn btn-primary classReview" id="classComNo" name="classComNo" 
					value="${param.classComNo}">리뷰작성</button>
					<button type="reset" class="btn btn-info classRe">취소</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 별점 js -->
	<script type="text/javascript" src="<%=cp %>/js/star.js"></script>
	
</body>
</html>