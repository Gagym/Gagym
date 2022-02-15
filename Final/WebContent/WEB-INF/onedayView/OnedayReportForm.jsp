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
<title>OnedayReportForm.jsp</title>

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
       $("input:radio[name=repReasonNo]").click(function(){
          
              if($("input[name=repReasonNo]:checked").val() == "RR-6")
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
            <p style="text-align:center; font-size: 15pt;">신고 사유</p>
            <br>
            
            <form action="onedayreport.action" method="post">
               <div style="margin-left: 80px;">
					<c:forEach var="reason" items="${reasonList }">
						<input type="radio" name="repReasonNo" id="${reason.repReasonNo }" value="${reason.repReasonNo }"> 
						<label for="${reason.repReasonNo }"> ${reason.repReason } </label><br>
					</c:forEach> 
                  	<textarea rows="5" cols="35" id="oth" name="repOther" style="display: none"></textarea>
               </div>
               <br>
               
               <div style="text-align: center;">
                  <button type="submit" class="btn btn-danger" name="repNo" value="${onedayNo}">신고</button>

                  <button type="button" class="btn btn-info" onclick="location.href='onedaycontent.action?onedayNo=${onedayNo}'">
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