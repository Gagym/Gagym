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
</style>

<script type="text/javascript">
	
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
						<td><a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-info">월별정산내역</a></td>
						<td><a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-info">보증금내역</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 정산 버튼 -->
		<button type="button" class="btn btn-info calc-btn"  value="">일괄 정산</button>
		<button type="button" class="btn btn-info calc-btn"  value="">선택 정산</button>

			<!-- <a href="#" data-toggle="modal" data-target="#myModal">이미지 모달띄우기</a> -->


			<div class="modal fade" id="myModal" data-backdrop="static"
				data-keyboard="false">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">OOO님 월별 정산 내역</h4>
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


<!-- 이중모달 -->

<div class="modal fade" id="doubleModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">사진제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <img class="card-img-top rounded img-fluid" src="images/research/research-1.jpg">
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