<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>	<!-- 금액 표시 lib -->
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산페이지</title>
<link rel="stylesheet" type="text/css" href="css/calendar.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" type="text/css"/>

<!-- For modal -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


<style type="text/css">
.outer {
	width: 100%;
}

.inner {
	width: 1300px;
	margin: auto;
	padding: 100px 0;
}

.calc-btn
{
	float: right;
	margin-left: 5px;
}

 .modal
{
	margin-top:10%;
}
/*.modal-header
{
	margin-top:50px;
} */
#modal-memId
{
	color: #24A0ED;
}
</style>

<script type="text/javascript">
	$(document).ready(function() 
	{
		/* 선택/일괄정산 버튼 눌렀을 때 10일에서 14일 사이에만 정산 기능 수행
		아닐 경우 alert 띄우기*/
		var now = new Date();
		//alert(now.getDate());
		
		$("#totalCalc, #selectCalc").click(function()
		{
			if((now.getDate() < 10) || (now.getDate > 14))
				alert("10일에서 14일 사이에만 정산이 가능합니다.");
			else
				alert("정산 가능!");
		});
	});
	function monthly_modal(val)
	{
		//alert(val);
		$("#modal-memId").empty();
		const node = document.createElement("span");
		const textnode = document.createTextNode(val);
		node.appendChild(textnode);
		document.getElementById("modal-memId").appendChild(node);
		
		var params = "memId=" + val;
		
		// ajax로 리스트 불러오기
		/* $.ajax(
		{   
			//alert("test");
			type : "POST"
			, url : "ajaxinscalclist.action"
			, data : params
			, dataType : "json"
			, success : function(jsonObj)
			{
				var str = "";

				for(var idx=0; idx<(jsonObj.length)-1; idx++)		// 배열방 만큼 반복문 순환
				{
					var beeId = jsonObj[idx].beeId;
					var typeName = jsonObj[idx].typeName;
					var title = jsonObj[idx].title;
					var beeTime = jsonObj[idx].beeTime;
					var nickName = jsonObj[idx].nickName;
					var beeDate = jsonObj[idx].beeDate;
					var content = jsonObj[idx].content;
					var reqCnt = jsonObj[idx].reqCnt;
					var max = jsonObj[idx].max;
					
					str += "			<a href='beedetailpage.action?beeId=" + beeId + "&cid=${cid}' style='text-decoration: none; color: black;'>";
					str += "				<div class='card mb-3' style='max-width: 1000px;'>";
					str += "				<div class='row g-0'>";
					str += "					<div class='col-md-4'>";
					str += "						<img src='http://artinsight.co.kr/data/tmp/1806/8a7aa7b2cc1c8658726cc7a2df93418f_Kthlez4CFNiI72tb12Chqdw.jpg' class='img-fluid rounded-start' alt='...'>";
					str += "					</div>";
					str += "					<div class='col-md-8'>";
					str += "						<div class='card-body'>";
					str += "							<h5 class='card-title'>" + title + "</h5>";
					
					str += "								<p class='card-text'>모임 시간 : " + beeTime + " </p>";
					str += "								<p class='card-text'>게시자 " + nickName + "</p>";
					str += "								<p class='card-text'><small class='text-muted'>작성일 " + beeDate + "</small></p>";
					str += "								<p class='card-text'>인원수 : (" + reqCnt + " / " + max + ")</p>";
					str += "						</div>";
					str += "					</div>";
					str += "				</div>";
					str += "				</div>";
					str += "			</a><br>";
				}
				$("#showList").html(str);
				var pageIndexList = jsonObj[(jsonObj.length)-1].pageIndexList;
				pageIndexList = "<nav aria-label='Page navigation example'><ul class='pagination justify-content-center'>"
								+ pageIndexList + "</ul></nav>";
				$("#pageIndexList").html(pageIndexList);
				
			}
			, error : function(e)
			{
				alert(e.responseText);
			}
		}); */
	}
	
	function deposit_modal(val)
	{
		//alert(val);
		$("#deposit-memId").empty();
		const node = document.createElement("span");
		const textnode = document.createTextNode(val);
		node.appendChild(textnode);
		document.getElementById("deposit-memId").appendChild(node);
		
		// ajax로 리스트 불러오기
	}
</script>

</head>
<body>
<c:import url="/WEB-INF/mainView/Header.jsp"></c:import>

<div class="outer">
	<div class="inner">
		<div class="row">
			<!-- <button class="btn btn-info btn-xl text-uppercase col-md-5" onclick="location.href='memlist.action'">회원정보</button>
			<div class="col-md-2"></div>
			<button class="btn btn-primary btn-xl text-uppercase col-md-5" onclick="location.href='inslist.action'">강사정보</button> -->
		</div>
		<br><br>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>선택</th>
					<th>강사이름(아이디)</th>
					<th>이번달 정산아령</th>
					<th>아령 환전 금액</th>
					<th>월별 정산 내역</th>
					<th>보증금 내역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ins" items="${insCalcList }">
					<tr>
						<td><input class="form-check-input" type="checkbox" value="${ins.insNo }" id="flexCheckChecked"></td>
						<td>${ins.insName }(${ins.memId })</td>
						<td>${ins.classPoint }</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ins.classPoint * 1000}" /></td>
						<td><a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-info"  onclick="monthly_modal('${ins.memId}');">월별정산내역</a></td>
						<td><a href="#" data-toggle="modal" data-target="#depositModal" class="btn btn-sm btn-info"  onclick="deposit_modal('${ins.memId}');">보증금내역</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 정산 버튼 -->
		<button type="button" class="btn btn-info calc-btn" id="totalCalc" value="">일괄 정산</button>
		<button type="button" class="btn btn-info calc-btn" id="selectCalc" value="">선택 정산</button>

			<!-- <a href="#" data-toggle="modal" data-target="#myModal">이미지 모달띄우기</a> -->

		<!-- 강사별 월별 정산 내역 모달-->
		<!-- <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false"> -->
		<div class="modal" id="myModal" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"><span id="modal-memId"></span>님 월별 정산 내역</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>정산날짜</th>
									<th>지급날짜</th>
									<th>정산아령</th>
									<th>아령 환전 금액</th>
									<th>입금 계좌</th>
									<th>정산 처리 상황</th>
									<th>월별 정산 상세 내역</th>
								</tr>
							</thead>
							<tbody>
								<tr>
										<td>21.12.10</td>
										<td>21.12.15</td>
										<td>500</td>
										<td>500,000</td>
										<td>국민 xxxx - xxx</td>
										<td>정산중</td>
										<td><a href="#" data-toggle="modal" data-target="#doubleModal" class="btn btn-info">월별 정산 상세 내역</a></td>
									</tr>
								<%-- <c:forEach var="member" items="${memberList }">
									<tr>
										<td>${member.memName }(${member.memId })</td>
										<td>${member.age }</td>
										<td>${member.tel }</td>
										<td>${member.hometel }</td>
										<td>${member.addr }</td>
										<td>${member.email }</td>
										<td>${member.countReport }</td>
										<td>
											<button type="button" class="btn btn-danger black" value="${member.memNo }"
											style="${member.blackCheck==null?'':'display:none'}">블랙</button>
											<button type="button" class="btn btn-info blackCancel" value="${member.memNo }"
											style="${member.blackCheck==null?'display:none':''}">블랙해제</button>
										</td>
									</tr>
								</c:forEach> --%>
								
							</tbody>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		
		<!-- 강사별 보증금 내역 모달-->
		<div class="modal" id="depositModal" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"><span id="deposit-memId"></span>님 보증금 내역</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>처리날짜</th>
									<th>입금아령</th>
									<th>출금아령</th>
									<th>출금유형</th>
									<th>남은 아령</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>21.12.10</td>
									<td>21.12.15</td>
									<td>500</td>
									<td>500,000</td>
									<td>국민 xxxx - xxx</td>
								</tr>
								<%-- <c:forEach var="member" items="${memberList }">
									<tr>
										<td>${member.memName }(${member.memId })</td>
										<td>${member.age }</td>
										<td>${member.tel }</td>
										<td>${member.hometel }</td>
										<td>${member.addr }</td>
										<td>${member.email }</td>
										<td>${member.countReport }</td>
										<td>
											<button type="button" class="btn btn-danger black" value="${member.memNo }"
											style="${member.blackCheck==null?'':'display:none'}">블랙</button>
											<button type="button" class="btn btn-info blackCancel" value="${member.memNo }"
											style="${member.blackCheck==null?'display:none':''}">블랙해제</button>
										</td>
									</tr>
								</c:forEach> --%>
								
							</tbody>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>


<!-- 이중모달 -->

<div class="modal" id="doubleModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">000님 월별 정산 상세 내역</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<table class="table table-striped">
					<thead>
						<tr>
							<th>유형</th>
							<th>강좌명</th>
							<th>예약일시</th>
							<th>수강생 명</th>
							<th>정산 아령</th>
							<th>아령 환전 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
								<td>21.12.10</td>
								<td>21.12.15</td>
								<td>500</td>
								<td>500,000</td>
								<td>국민 xxxx - xxx</td>
								<td>정산중</td>
							</tr>
						<%-- <c:forEach var="member" items="${memberList }">
							<tr>
								<td>${member.memName }(${member.memId })</td>
								<td>${member.age }</td>
								<td>${member.tel }</td>
								<td>${member.hometel }</td>
								<td>${member.addr }</td>
								<td>${member.email }</td>
								<td>${member.countReport }</td>
								<td>
									<button type="button" class="btn btn-danger black" value="${member.memNo }"
									style="${member.blackCheck==null?'':'display:none'}">블랙</button>
									<button type="button" class="btn btn-info blackCancel" value="${member.memNo }"
									style="${member.blackCheck==null?'display:none':''}">블랙해제</button>
								</td>
							</tr>
						</c:forEach> --%>
						
					</tbody>
				</table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
</div>

<!--  -->

		</div>
</div>

<div class="row">
	<c:import url="/WEB-INF/mainView/Footer.jsp"></c:import>
</div>
</body>

</html>