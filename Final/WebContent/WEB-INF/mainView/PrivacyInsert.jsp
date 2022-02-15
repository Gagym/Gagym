<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MemberList.jsp</title>

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
	.outer
	{
		width:100%;
		margin:auto;
	}
	.inner
	{
		width:800px;
	    margin:auto;
	    padding:100px 0;
	}
	h1{	text-align: center;	}
	.form-group
	{
		margin: 20px 0;
	}
	.form-group label
	{
		width: 170px;
		text-align: center;
	}
</style>

<script type="text/javascript">

	$(function()
	{
		
		$("#checkBtn").click(function()
		{
			var id = $("#id").val();
			
			if(id == "")
			{
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			
			if(id.length < 6)
			{
				alert("아이디는 6자 이상으로 입력하세요.");
				return;
			}
			
			ajaxRequest();
			
		}); 
		
		$('#memPw').keyup(function()
		{
			$('font[id=check]').text('');
		}); //#memPw.keyup

				
		$('#pwCheck').keyup(function()
		{
			if ($('#memPw').val() != $('#pwCheck').val())
			{
				$('font[id=check]').text('');
				$('font[id=check]').html("일치하지 않습니다.");
			} else
			{
				$('font[id=check]').text('');
				$('font[id=check]').html("일치합니다.");
			}
		}); //#pwCheck.keyup
		
	});
	
	
	function ajaxRequest()
	{
		$.post("ajax.action", {memId : $("#id").val()}, function(data) 
		{
			$("#result").html('');
			if(data == 1)
			{
				$("#result").html('이미 존재하는 아이디입니다.');
				$("#result").css('color','red');
			}
			else if(data==0)
			{
				$("#result").html('사용 가능한 아이디입니다.');
				$("#result").css('color','red');
			}
		}); 
		
	} //ID Check
	
</script>

<!-- 우편번호 API -->
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
					<h1> 회원가입 </h1>
				</div>
				
				<div class="panel-body">
					<form name="myForm" role="form" action="memberinsert.action" method="post">
						<div class="form-group row">
							<label for="id" class="col-md-2">
								아이디(*)
							</label>
							<input type="text" id="id" name="memId" maxlength="20" required="required" class="form-control col-md-2"
							style="width: 200px; margin-right: 8px; display: inline;"/> 
							&nbsp;
							<input type="button" value="중복검사" class="btn btn-info" id="checkBtn" style=" width:100px; display: inline;">
							<span id="result" style="width:300px; display: inline;"></span>
						</div>
						
						<div class="form-group row">
							<label for="pw" class="col-md-2">
								비밀번호(*) 
							</label>
							<input type="password" id="memPw" name="memPw" maxlength="20" required="required" class="form-control"
							style="width: 200px; display: inline;"/>
						</div>
						
						<div class="form-group row">
							<label for="pwCheck" class="col-md-2">
								비밀번호 확인(*) 
							</label>
							<input type="password" id="pwCheck" name="pwCheck" maxlength="20" required="required" class="form-control col-md-2"
							style="width: 200px; display: inline;"/>
							<font id="check" size="3" color="red" class="col-md-3"></font>
						</div>
						
						<div class="form-group row">
							<label for="name" class="col-md-2">
								이름(*) 
							</label>
							<input type="text" id="name" name="memName" required="required" class="form-control"
							style="width: 200px; display: inline;"/>
						</div>
						
						<div class="form-group row">
							<label for="ssn1" class="col-md-2">
								주민번호(*) 
							</label>
							<input type="text" id="ssn1" name="ssn1" required="required" class="form-control col-md-2"
							 style="width:200px; " maxlength="6"/>
							<span class="col-md-1" style="width:20px;">-</span>
							<input type="password" id="ssn2" name="ssn2" required="required" class="form-control col-md-2"
							 style="width:200px; margin-left: 5px;" maxlength="7"/>
						</div>
						<div> 
		                     <div class="form-group row">
		                        <label for="telephone" class="col-md-2">
		                           주소(*) 
		                        </label>
		                        <input type="text" id="zipCode" name="zipCode" required="required" class="form-control col-md-2" 
		                        style="width:200px; margin-right: 10px;" placeholder="우편번호">
		                        <input type="button" onclick="postcode()" class="btn btn-info col-md-1" style="width:120px;" value="우편번호 찾기">
		                     </div>
		                     <div class="form-group row">
		                        <label class="col-md-2"></label>
		                        
		                        <input type="text" id="addr" name="addr" required="required" class="form-control col-md-2" 
		                        style="width:200px;" placeholder="주소">
		                     </div>
		                     <div class="form-group row">
		                        <label class="col-md-2"></label>
		                     
		                        <input type="text" id="detailAddr" name="detailAddr" required="required" class="form-control col-md-2" 
		                        style="width:250px; margin-right: 10px;" placeholder="상세주소">
		                        <input type="text" id="extraAddr" name="extraAddr" class="form-control col-md-2" 
		                        style="width:250px;" placeholder="참고항목">
		                     </div>
		                </div>
						<div class="form-group row">
							<label for="tel" class="col-md-2">
								휴대폰번호(*) 
							</label>
							<input type="tel" id="tel" name="tel" required="required" class="form-control" placeholder="ex)010-1234-1234" maxlength="13"
							style="width: 200px; display: inline;"/>
						</div>
						
						<div class="form-group row">
							<label for="hometel" class="col-md-2">
								전화번호
							</label>
							<input type="tel" id="hometel" name="hometel" class="form-control" placeholder="전화번호"
							style="width: 200px; display: inline;"/>
						</div>
						
						<div class="form-group row">
							<label for="hometel" class="col-md-2">
								이메일 
							</label>
							<input type="email" id="email" name="email" class="form-control col-md-2" style="width:200px;"/>
						</div>
						
						<div style="text-align: center;">
							<button type="submit" class="btn btn-info">회원가입</button>
							<button type="button" class="btn btn-info" onclick="location.href='main.action'">취소</button>
						</div>
					</form>
				</div><!-- close .panel-body -->
				
			</div><!-- close .panel .panel-default -->
		
		</div>
		
</div>

<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>

</body>
</html>