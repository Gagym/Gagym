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
<title>RefundForm.jsp</title>

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
      width:700px;
      margin: auto;
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
      <form action="refund.action" method="post">
         <div id="inner">
            <div class="panel-group" id="box" style="margin-top: 100px; margin-bottom: 100px;">
               [<span>${point.point } </span>]아령을 환불하시겠습니까?<br>
               환불 예정 금액은 [<span>${point.pointPay }</span>] 원 입니다
               <input type="hidden" name="pointPayNo" value="${point.pointPayNo }">
               <input type="hidden" name="pointPay" value="${point.pointPay }">
               <br><br>
               <div id="box" style="width: 600px;">
                  아령 환불 규정<br>
                  - 당일 환불 : 수수료 제외 100% 환불 처리<br>
                  - 당일이 아닌 경우의 미사용 환불 : 수수료 제외 80% 환불 처리<br>
                  - 사용 환불 : 환불 불가 <br>
               </div>
               <br><br>
            
               <button type="submit" class="btn btn-danger">환불</button>
               <button type="reset" class="btn btn-info" onclick="location.href='payrefund.action'">취소</button>
            </div>
         </div>
      </form>
   </div>
   
<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>

</body>
</html>