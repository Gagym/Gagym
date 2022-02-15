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
<title>PrivacyUpdateForm.jsp</title>

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
	.outer
	{
		width:100%;
		margin: auto;
	}
	.inner
	{
		width:800px;
	    margin: auto;
	    padding: 100px 0;
	}

</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipCode").value = data.zonecode;
                document.getElementById("addr").value = addr;
                // #추가코드. 수정 시 기존 필드 clear
                document.getElementById("detailAddr").value = '';
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>

</head>
<body>

<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">

		<div class="panel-group inner">
			
			<div class="panel panel-default">
				
				<div class="panel-heading" id="title">
					<h1> 정보수정 </h1>
				</div>
				
				<div class="panel-body">
					<form role="form" action="privacyupdate.action" method="post">
						
						<div> 
		                     <div class="form-group row">
		                        <label for="telephone" class="col-md-2">
		                           주소(*) 
		                        </label>
		                        <%-- <input type="text" id="addr" name="addr" required="required" class="form-control" value="${member.addr }"/> --%>
		                        
		                        <input type="text" id="zipCode" name="zipCode" required="required" class="form-control col-md-2" 
		                        style="width:150px;" placeholder="우편번호" value="${member.zipCode }">
		                        <input type="button" onclick="postcode()" class="btn btn-primary col-md-1" style="width:120px;" value="우편번호 찾기">
		                     </div>
		                     <div class="form-group row">
		                        <label class="col-md-2"></label>
		                        
		                        <input type="text" id="addr" name="addr" required="required" class="form-control col-md-2" 
		                        style="width:300px;" placeholder="주소" value="${member.addr }">
		                     </div>
		                     <div class="form-group row">
		                        <label class="col-md-2"></label>
		                     
		                        <input type="text" id="detailAddr" name="detailAddr" required="required" class="form-control col-md-2" 
		                        style="width:250px;" placeholder="상세주소" value="${member.detailAddr }">
		                        <input type="text" id="extraAddr" name="extraAddr" class="form-control col-md-2" 
		                        style="width:250px;" placeholder="참고항목">
		                     </div>
		                  </div>
						
						<div class="form-group row">
							<label for="tel" class="col-md-2">
								휴대폰번호(*) 
							</label>
							<input type="tel" id="tel" name="tel" required="required" class="form-control" value="${member.tel }" style="width:400px;"/>
						</div>
						
						<div class="form-group row">
							<label for="hometel" class="col-md-2">
								전화번호
							</label>
							<input type="tel" id="hometel" name="hometel" required="required" class="form-control" value="${member.hometel }" style="width:400px;"/>
						</div>
						
						<div class="form-group row">
							<label for="email" class="col-md-2">
								이메일 
							</label>
							<input type="text" id="email" name="email" required="required" class="form-control col-md-2" style="width:200px;"
							value="${member.email }"/>
						</div>
						
						<div style="text-align: center;">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-danger" onclick="location.href='mypagemain.action'">취소</button>
						</div>
					</form>
				</div><!-- close .panel-body -->
				
			</div><!-- close .panel .panel-default -->
		
		</div>
		
<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>

</div>
</body>
</html>