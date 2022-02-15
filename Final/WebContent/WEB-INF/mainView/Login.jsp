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
<title>login.jsp</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->

<style type="text/css">

#outer
{
   width: 100%;
}

#inner
{
   width: 1100px;
   margin: auto;
   padding: 100px 0;
}

#main
{
   margin-left: 33%;
}

#title
{
   margin-left: 1%;
   font-size: 40px;
}

#content
{
   margin-top: 15px;
}

#loginBtn
{
   width: 400px;
   height: 50px;
   margin-top: 10px;
}

#loginMenu
{
   margin: 40px 0 0 25px;
   font-size: 20px;
}
   

</style>

<script type="text/javascript">


		$(document).ready(function()
		{
			$("#loginBtn").click(function()
			{
				if ($("#memId").val()=="" || $("#memPw").val()=="")
				{
					alert("항목을 모두 입력해야 합니다.");
					return;
				}
				
				
				$("#login").submit();
			});
		});


</script>


</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div id="outer">
   <div id="inner">
      <div id="main">
      
         <div id="title">
            <a href="" >찾아가는 GYM - 가짐</a>
         </div>
            
         <div id="content" style="width: 400px;">
            <form action="login.action" method="post" class="form-group" id="login">
               아이디<input type="text" id="memId" name="memId" class="form-control" required="required" placeholder="아이디"/><br>
               비밀번호<input type="password" id="memPw" name="memPw" class="form-control" required="required" placeholder="비밀번호"/><br>
               <button type="button" id="loginBtn" class="btn btn-info">로그인</button>
               <input type="checkbox" id="admin" name="admin" value="0" />
		 	   <label for="admin">운영자세요?</label>
            </form>
         </div>
         
            
         <div id="loginMenu">
            <a href="findidform.action">아이디 찾기 |</a>
            <a href="findpwform.action">비밀번호 찾기 |</a>
            <a href="termslist.action">회원가입</a>
         </div>
         
      </div>
   </div>
</div>

<c:import url="Footer.jsp"></c:import>

</body>
</html>