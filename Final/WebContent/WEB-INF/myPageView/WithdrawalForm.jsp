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
<title>WithdrawalForm.jsp</title>

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
   #outer
   {
      width:100%;
   }
   #inner
   {
      width:1100px;
      margin: auto;
      padding: 100px 0; 
   }
   #box
   {
      width:600px;
      margin: 100px auto;
      text-align: center;
      border: 1px solid gray;
      border-radius: 7px;
      padding: 3em;
   }
</style>
</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

   <div id="outer">
      <form action="withdrawalcheck.action" method="post">
         <div id="inner">
            <div class="panel-group" id="box" >
               <span id="user">${nameId.memName }(${nameId.memId })님</span>
               , 탈퇴하시겠습니까?
               <br><br>
               <div class="row" style="float: none; margin: 0 auto;">
                  <label for="pw" class="col-md-4" style="padding: 5px;">비밀번호 확인</label> 
                  <input type="password" id="pwdCheck" name="pwdCheck" class="form-control col-md-3" style="width:300px;">
               </div>
               <br><br>
            
               <button type="submit" class="btn btn-primary">비밀번호 확인</button>
               <button type="button" class="btn btn-info" id="listBtn" onclick="location.href='mypagemain.action'">
                  돌아가기
               </button>
            </div>
         </div>
      </form>
   </div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>

</body>
</html>