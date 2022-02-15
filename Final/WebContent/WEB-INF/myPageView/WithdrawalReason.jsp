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
<title>WithdrawalReason.jsp</title>

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
   .box
   {
      width:600px;
      margin: 100px auto;
      border: 1px solid gray;
      border-radius: 7px;
      padding: 3em;
   }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
       $("input:radio[name=radioGroup]").click(function(){
          
              if($("input[name=radioGroup]:checked").val() == "MOR-6")
              {
                 $("#oth").css("display", "block");
       
              }else
              {
                 $("#oth").css("display", "none");
              }
        });
   });
   
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

   <div id="outer">
      <div id="inner">
         <div class="box">
            <p style="text-align:center; font-size: 15pt;">탈퇴 사유</p>
            <br>
            
            <form action="withdrawal.action" method="post">
               <div style="margin-left: 80px;">
                  <input type="radio" name="radioGroup" id="r1" value="MOR-1"> <label for="r1"> 원하는 정보가 없어서 </label><br>
                  <input type="radio" name="radioGroup" id="r2" value="MOR-2"> <label for="r2"> 홈페이지에 흥미가 떨어져서 </label><br>
                  <input type="radio" name="radioGroup" id="r3" value="MOR-3"> <label for="r3"> 서비스가 마음에 들지 않아서 </label><br>
                  <input type="radio" name="radioGroup" id="r4" value="MOR-4"> <label for="r4"> 운동에 도움이 되지 않아서 </label><br>
                  <input type="radio" name="radioGroup" id="r5" value="MOR-5"> <label for="r5"> 개인정보 유출을 방지하기 위해서 </label><br>
                  <input type="radio" name="radioGroup" id="r6" value="MOR-6"> <label for="r6"> 기타 </label><br>
                  
                  <textarea rows="5" cols="35" id="oth" name="oth" style="display: none"></textarea>
               </div>
               <br>
               
               <div style="text-align: center;">
                  <button type="submit" class="btn btn-danger">탈퇴</button>

                  <button type="button" class="btn btn-info" id="listBtn" onclick="location.href='mypagemain.action'">
                     취소
                  </button>
               </div>
            </form>
            
         </div>   
      </div>
   </div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>

</body>
</html>