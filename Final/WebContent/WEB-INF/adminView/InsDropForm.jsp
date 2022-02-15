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
<title>InsDropForm.jsp</title>

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
		$(".insDrop").click(function()
		{
			if($("#dropReason").val()=="")
			{
				alert("사유를 입력하세요.");
			}
			else
			{
				var form = {insNo:$("#insNo").val(), dropReason:$("#dropReason").val()};
				
				$.ajax(
				{
					type : "POST"
					, url : "insdrop.action"
					, data : form
					, success : function(d)
					{
						alert("박탈되었습니다.");
						window.opener.location.href='inslist.action'; 
						window.close();
					}
	
				});
			}
				
		});
		
		$(".insRe").click(function()
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
            <div class="panel-group" id="box" style="margin: 100px; ">
				<textarea id="dropReason" name="dropReason" cols="38" rows="5" placeholder="박탈 사유 입력"></textarea>
				<br><br>
				<button type="button" class="btn btn-danger insDrop" id="insNo" name="insNo" value="${insNo }">권한박탈</button>
				<button type="reset" class="btn btn-info insRe">돌아가기</button>
            </div>
         </div>
      </form>
   </div>
   

</body>
</html>