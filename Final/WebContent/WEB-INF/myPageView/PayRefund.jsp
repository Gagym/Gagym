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
<title>PayRefund.jsp</title>

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
#outer {
   width: 100%;
   text-align: center;
}

#inner {
   width: 1100px;
   margin: auto;
   padding: 100px 0;
}

.box {
   text-align: center;
   border: 1px solid gray;
   padding: 3em;
   width: 1100px;
}
th {
   text-align: center;
}

</style>

<script type="text/javascript">
   
   $(function()
   { 
      <c:forEach var="point" items="${pointList }">
         if($("#repay${point.pointPayNo }").html() != 0)               // 환불 내역 존재
         {
            $("#refund${point.pointPayNo }").css('display', 'none');   // 환불 버튼 X
            $("#usepoint${point.pointPayNo }").html(" - ");            // 사용 아령 X
         }
         else
         {
            $("#repay${point.pointPayNo }").html("");
         }
         
         if($("#usepoint${point.pointPayNo }").html() > 0)            // 사용한 아령 존재
         {
            $("#refund${point.pointPayNo }").css('display', 'none');   // 환불 버튼 X
         }
         
      </c:forEach>
   });
   
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

   <div id="outer">
      <div id="inner">
         <div id="box" class="tab_content">
            <div>
               <h1>아령 결제 및 환불 내역</h1>
            </div>
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th>결제날짜</th>
                     <th>결제금액</th>
                     <th>지급아령</th>
                     <th>사용아령</th>
                     <th></th>
                     <th>환불날짜</th>
                     <th>환불금액</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="point" items="${pointList }">
                     <tr>
                        <td>${point.payDate }</td>
                        <td>${point.pointPay }</td>
                        <td>${point.point }</td>
                        <td id="usepoint${point.pointPayNo }">${point.usepoint }</td>
                        <td>
                           <button type="button" id="refund${point.pointPayNo }" name="refund" class="btn btn-primary btnDelete" 
                           value="${point.pointPayNo }" onclick="location.href='refundform.action?pointPayNo=${point.pointPayNo }&point=${point.point }'">환불</button>
                        </td>
                        <td>${point.pointReDate }</td>
                        <td id="repay${point.pointPayNo }">${point.pointRepay }</td>
                     </tr>
                  </c:forEach>
                  <tr style="text-align: right;">
                     <td colspan="7">
                        잔여아령 : <input type="text" id="havePoint" name="havePoint" disabled="disabled" 
                                 value="${havePoint }" style="width:80px; text-align:right;"/>
                     </td>
                  </tr>
               </tbody>
            </table>
            <div>
               <button type="button" class="btn btn-info" id="listBtn" onclick="location.href='mypagemain.action'">
                  돌아가기
               </button>
               <br><br>
            </div>
         </div>
      </div>
   </div>
   
   <div class="row">
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>
</body>
</html>