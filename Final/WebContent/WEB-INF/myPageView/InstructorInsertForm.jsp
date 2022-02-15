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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>InstructorInsertForm.jsp</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" type="text/css"/>

<!-- datepicker 관련 -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
$(document).ready (function () {
	
	// 자격증 추가
   	$(".cBtnAdd").click (function () {                                        
     	$(".cer").append (                        
	         "<div class='row' style='padding-left: 15px;'><br><label for='cer' class='col-md-2'></label>"
	         + "<select id='cerName' name='cerName' class='form-control col-md-2' style='width:200px;'>"
	         + "<c:forEach var='cer' items='${cerList }'>"
	         + "<option value='${cer.cerNo }'>${cer.cerName }</option>"
	         + "</c:forEach></select>"
	         + "<input type='text' name='cerDate' class='datepicker form-control col-md-4' placeholder='자격증발급날짜' style='width:200px;'>"
	         //+ "<input type='file' role='button' class='btn btnInsert col-md-3' name='proofPath' style='width:300px;'>"
	         + "<input type='button' class='btn btn-danger btnRemove col-md-1' value='삭제'><br></div>"
        );
		// datepicker 동적 추가 시 재설정
        $(document).find(".datepicker").removeClass('hasDatepicker').datepicker(
        {
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
       	});
      
      	$(".btnRemove").on("click", function () { 
        	$(this).closest("div").remove();
		});
	});
	
   	// 수상경력 추가
   	$(".pBtnAdd").click (function () {                                        
      	$(".prz").append (                        
	         "<div class='row' style='padding-left: 15px;'><br><label for='prz' class='col-md-2'></label>"
	         + "<input type='text' name='przDate' class='form-control col-md-4 datepicker' placeholder='수상날짜' style='width:200px;'>"
	         + "<input type='text' name='przName' class='form-control col-md-3' placeholder='수상명' style='width:300px;'>"
	         + "<input type='text' name='przMedal' class='form-control col-md-3' placeholder='수상실적(메달)' style='width:200px;'>"
	         + "<input type='button' class='btn btn-danger btnRemove col-md-1' value='삭제'><br></div>"
        );
     	// datepicker 동적 추가 시 재설정
        $(document).find(".datepicker").removeClass('hasDatepicker').datepicker(
        {
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
       	});
      
		$(".btnRemove").on("click", function () { 
        	$(this).closest("div").remove();
		});
	});
   	
   	// 활동경력 추가
   	$(".eBtnAdd").click (function () {                                        
		$(".exp").append (                        
	         "<div class='row' style='padding-left: 15px;'><br><label for='prz' class='col-md-2'></label>"
	         + "<input type='text' name='expStartDate' class='form-control col-md-4 datepicker' placeholder='시작날짜' style='width:200px;'>"
	         + "<input type='text' name='expEndDate' class='form-control col-md-4 datepicker' placeholder='마지막날짜' style='width:200px;'>"
	         + "<input type='text' name='expContent' class='form-control col-md-2' placeholder='활동내역' style='width:300px;'>"
	         + "<input type='button' class='btn btn-danger btnRemove col-md-1' value='삭제'><br></div>"
        );
		// datepicker 동적 추가 시 재설정
        $(document).find(".datepicker").removeClass('hasDatepicker').datepicker(
        {
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
       	});
         
      	$(".btnRemove").on("click", function () { 
         	$(this).closest("div").remove();
		});
   });
   
   // 활동지역 AJAX
   $("#cityName1").change(function()
   {
	  $("#sigunguName1").html(""); 
      
      $.ajax(
      {
          url: "areaajax.action"
          , type: "GET"
          , data: {cityNo: $("#cityName1 > option:selected").val()}
          , dataType: "html"
          , success : function(data)
         {    
        	 $("#sigunguName1").html("<option value=\"\">-선택하세요-</option>" + data); 
         }
         , error : function(e)
         {
            alert(e.responseText);
         }
      }); 
      
   });
   $("#cityName2").change(function()
   {
	  $("#sigunguName2").html(""); 
       
      $.ajax(
      {
          url: "areaajax.action"
          , type: "GET"
          , data: {cityNo: $("#cityName2 > option:selected").val()}
          , dataType: "html"
          , success : function(data)
         {       
        	  $("#sigunguName2").html("<option value=\"\">-선택하세요-</option>" + data); 
         }
         , error : function(e)
         {
            alert(e.responseText);
         }
      }); 
      
   });
   
   $("#cityName3").change(function()
   {
	  $("#sigunguName3").html(""); 
       
      $.ajax(
      {
          url: "areaajax.action"
          , type: "GET"
          , data: {cityNo: $("#cityName3 > option:selected").val()}
         , dataType: "html"
          , success : function(data)
         {       
        	  $("#sigunguName3").html("<option value=\"\">-선택하세요-</option>" + data); 
            
         }
         , error : function(e)
         {
            alert(e.responseText);
         }
      }); 
      
      
   });
	
   
   	// 지역 중복 검사
	$("#sigunguName2").change(function()
	{
		if( $("#sigunguName2").val() == $("#sigunguName1").val())
		{
		   alert("이미 선택하신 지역 입니다.");
		   $('#sigunguName2').val('');
		   return false;
		}
	});
	$("#sigunguName3").change(function()
	{
		if( $("#sigunguName3").val() == $("#sigunguName1").val() || $("#sigunguName3").val() == $("#sigunguName2").val())
		{
		   alert("이미 선택하신 지역 입니다.");
		   $('#sigunguName3').val('');
		   return false;
		}
	});
		   
	// datepicker 설정
   	$(".datepicker").datepicker(
   	{
		dateFormat: "yy-mm-dd"
		, changeMonth: true
		, changeYear: true
   	});
   
});

</script>  

<style type="text/css">
   .outer
   {
      width:100%;
      margin: auto;
   }
   .inner
   {
      width:1100px;
      margin: auto;
      padding: 100px 0;
   }
   .form-control
   {
      width: 200px;
   }
</style>
</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>


<div class="outer">

<div class="panel-group inner">
   
   <div class="panel panel-default">
      
      <div class="panel-heading" id="title">
         <h1> 강사신청 </h1>
      </div>
      
      <div class="panel-body">
         <form action="instructorinsert.action" method="post" enctype="multipart/form-data">

            <!-- 자격증 -->
            <div class="form-group row">
               <div class="cer row">
                  <label for="cer" class="col-md-2" style="padding-left: 40px;"> 자격증 </label>
                  <select id="cerName" name="cerName" class="form-control col-md-2"  style="width:200px;">
                     <c:forEach var="cer" items="${cerList }">
                        <option value="${cer.cerNo }">${cer.cerName }</option>
                     </c:forEach>
                  </select> 
                  <input type="text" name="cerDate" class="form-control col-md-4 datepicker" placeholder="자격증발급날짜"  style="width:200px;"> 
                  <input type="file" role="button" class="btn btnInsert col-md-3" name="proofPath" style="width:300px;">

                  <input type="button" class="btn btn-primary cBtnAdd col-md-1" value="추가"><br>
               </div>
            </div>
			<br>
            <!-- 수상경력 -->
            <div class="form-group row">
               <div class="prz row">
                  <label for="prz" class="col-md-2" style="padding-left: 40px;"> 수상경력 </label>
                  <input type="text" name="przDate" class="form-control col-md-4 datepicker" placeholder="수상날짜" style="width:200px;">
                   <input type="text" name="przName" class="form-control col-md-3" placeholder="수상명" style="width:300px;">
                   <input type="text" name="przMedal" class="form-control col-md-3" placeholder="수상실적(메달)" style="width:200px;">
                   
                  <input type="button" class="btn btn-primary pBtnAdd col-md-1" value="추가"><br>
               </div>
            </div>
            <br>
            <!-- 활동경력 -->
            <div class="form-group row">
               <div class="exp row">
                  <label for="exp" class="col-md-2" style="padding-left: 40px;"> 활동경력 </label>
                  <input type="text" name="expStartDate" class="form-control col-md-4 datepicker" placeholder="시작날짜" style="width:200px;">
                  <input type="text" name="expEndDate" class="form-control col-md-4 datepicker" placeholder="마지막날짜" style="width:200px;">
                  <input type="text" name="expContent" class="form-control col-md-2" placeholder="활동내역" style="width:300px;">
                   
                  <input type="button" class="btn btn-primary eBtnAdd col-md-1" value="추가"><br>
               </div>
            </div>
            <br>
            <!-- 활동지역 1-->
            <div class="form-group row">
               <div class="area row">
                  <label for="area" class="col-md-2" style="padding-left: 40px;"> 활동지역1 </label>
                  <select id="cityName1" name="cityName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                     <c:forEach var="city" items="${cityList }">
                        <option value="${city.cityNo }">${city.cityName }</option>
                     </c:forEach>
                  </select> 
                  <select id="sigunguName1" name="sigunguName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                  </select> 
               </div>
            </div>
            <br>
            <!-- 활동지역 2-->
            <div class="form-group row">
               <div class="area row">
                  <label for="area" class="col-md-2" style="padding-left: 40px;"> 활동지역2 </label>
                  <select id="cityName2" name="cityName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                     <c:forEach var="city" items="${cityList }">
                        <option value="${city.cityNo }">${city.cityName }</option>
                     </c:forEach>
                  </select> 
                  <select id="sigunguName2" name="sigunguName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                  </select> 
               </div>
            </div>
            <br>
            <!-- 활동지역 3-->
            <div class="form-group row">
               <div class="area row">
                  <label for="area" class="col-md-2" style="padding-left: 40px;"> 활동지역3 </label>
                  <select id="cityName3" name="cityName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                     <c:forEach var="city" items="${cityList }">
                        <option value="${city.cityNo }">${city.cityName }</option>
                     </c:forEach>
                  </select> 
                  <select id="sigunguName3" name="sigunguName" class="col-md-2" style="width:200px;" required="required" >
                     <option value="">-선택하세요-</option>
                  </select> 
               </div>
            </div>
            <br>
            
            <div style="text-align: center;">
               <button type="submit" class="btn btn-primary">신청</button>
               <button type="button" class="btn btn-danger" onclick="location.href='mypagemain.action'">취소</button>
            </div>
         </form>
      </div><!-- close .panel-body -->
      
   </div><!-- close .panel .panel-default -->

</div>

</div>

	<div class="row">
		<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
	</div>
	
</body>
</html>