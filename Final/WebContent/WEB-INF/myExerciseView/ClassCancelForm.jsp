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
<title>ClassCancelForm.jsp</title>

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
</style>
<script type="text/javascript">
	$(function()
	{
		$(".classCancel").click(function()
		{
			if($("#cnlReason").val()=="")
			{
				alert("사유를 입력하세요.");
			}
			else
			{
				var form = {classRsvNo:$("#classRsvNo").val(), cnlReason:$("#cnlReason").val()};
				
				$.ajax(
				{
					type : "POST"
					, url : "classcancel.action"
					, data : form
					, success : function(d)
					{
						alert("취소되었습니다.");
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
      <form id="cancel">
         <div id="inner">
            <div class="panel-group" id="box" style="margin: 50px 50px;">
            	현재 예약 취소는 [ ${cnlCheck } ]입니다. <br>
				예약을 취소하시겠습니까?
				<br>
				<textarea id="cnlReason" name="cnlReason" cols="38" rows="5" placeholder="취소 사유 입력"></textarea>
				<br>
				<div id="box" style="width: 400px;">
				   취소 규정<br>
				   - ~ 2일 전 환불 : 아령 환불 가능 취소<br>
				   - 2일 ~ 당일 환불 : 아령 환불 불가 취소<br>
				</div>
				<br><br>
				<button type="button" class="btn btn-danger classCancel" id="classRsvNo" name="classRsvNo" value="${classRsvNo }">예약 취소</button>
				<button type="reset" class="btn btn-info classRe">돌아가기</button>
            </div>
         </div>
      </form>
   </div>
   

</body>
</html>