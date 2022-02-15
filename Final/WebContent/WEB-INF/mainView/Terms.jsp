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
<title>Terms.jsp</title>

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
		width:100%;
	}
	#inner
	{
		width:1100px;
	    margin: auto;
	    text-align: center;
	    padding: 100px 0;
	}
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#checkall").click(function() 
		{
			if($("#checkall").prop("checked"))
			{
				$("input[name=checkGroup]").prop("checked", true);
			}
			else
			{
				$("input[name=checkGroup]").prop("checked", false);
			}
		});
	});
	

	//약관동의
	function chk()
	{
		var checkGroup = document.getElementsByName("checkGroup");		
		
		if (checkGroup[0].checked == true )
		{
			document.form.submit();
			
		} else
		{
			alert("개인정보 약관에 동의하셔야 합니다.");

		}
	}
	
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
	<form action="privacyinsertform.action" name="form">
		<div id="inner">
		<input type="checkbox" id="checkall" style="width:30px"><label for="checkall">전체선택</label><br>
		<br>
		
	<c:set var="i" value="1"></c:set>
		<c:forEach var="terms" items="${termsList }">
			
			<input type="checkbox" name="checkGroup" id="terms${i }" value="terms${i }"><label for="te"> 약관 <span style="color: blue;">${terms.necessary }</span></label><br>
			<textarea rows="10" cols="50" disabled="disabled" class="form-group" style="overflow-y:scroll">${terms.termsContent }</textarea>
			<br><br>
			
			<c:set var="i" value="${i+1 }"></c:set>	
			
			<!-- <input type="checkbox" name="checkGroup" id="terms2" value="약관2"><label for="terms2"> 약관2 <span style="color: gray;">선택</span></label><br>
			<textarea rows="10" cols="50" disabled="disabled" class="form-group" style="overflow-y:scroll"></textarea> -->
			
		</c:forEach>
		<button type="button" class="btn btn-info" onclick="chk()">확인</button>
		<input type="button" class="btn btn-info" value="취소"
			onclick="location.href='main.action'">
		
		
		</div>
	</form>
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>