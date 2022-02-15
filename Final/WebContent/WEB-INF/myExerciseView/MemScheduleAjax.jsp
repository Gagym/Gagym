<link rel="stylesheet" type="text/css" href="css/calendar.css"><%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<h2 style="text-align: center;">클래스 상세보기</h2>
<c:choose>
	<c:when test="${!empty scheduleClass}">
		<table class="table table-bordered table-hover">
			<tr>
				<th id="category">유형</th>
				<th id="rsvTime">수강시간</th>
				<th id="className">수강명</th>
				<th id="insName">강사</th>
			</tr>
			<c:forEach var="sclass" items="${scheduleClass }">
				<tr>
					<td>${sclass.category }</td>
					<td>${sclass.rsvTime }:00 ~ ${sclass.rsvTime + 1 }:00</td>
					<td>${sclass.title }</td>
					<td>${sclass.insName }(${sclass.insId })</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<table class="table table-bordered table-hover" style="text-align: center;">
			<tr>
				<th>클래스 스케줄이 없습니다.</th>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
<br>

<h2 style="text-align: center;">미션 상세보기</h2>
<c:choose>
	<c:when test="${!empty scheduleMission}">
		<table class="table table-bordered table-hover">
			<tr>
				<th>미션운동</th>
				<th>난이도</th>
				<th>기구</th>
				<th>운동부위</th>
				<th>세트</th>
				<th>횟수</th>
				<th>중량</th>
				<th>강사</th>
				<th>미션완료</th>
			</tr>
			<c:forEach var="mission" items="${scheduleMission }">
				<tr>
					<td>${mission.exeName }</td>
					<td>${mission.difName }</td>
					<td>${mission.exeEqName }</td>
					<td>${mission.exePart }</td>
					<td>${mission.misSet }</td>
					<td>${mission.misCount }</td>
					<td>${mission.misWeight }</td>
					<td>${mission.insName }<br>(${mission.insId })</td>
					<td>
						<c:choose>
							<c:when test="${mission.missionComCk eq 'N' }">
								<button type="button" class="btn btn-info missionComplete" value="${mission.missionExeNo }">
									미션 완료 체크
								</button>
							</c:when>
							<c:otherwise>
								미션 완료
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<table class="table table-bordered table-hover" style="text-align: center;">
			<tr>
				<th>미션 스케줄이 없습니다.</th>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
<br>


<h2 style="text-align: center;">운동일지 상세보기</h2>
<c:choose>
	<c:when test="${!empty scheduleExelog}">
		<table class="table table-bordered table-hover">
			<tr>
				<th>운동</th>
				<th>난이도</th>
				<th>기구</th>
				<th>운동부위</th>
				<th>세트</th>
				<th>횟수</th>
				<th>중량</th>
			</tr>
			<c:forEach var="log" items="${scheduleExelog }">
				<tr>
					<td>${log.exeName }</td>
					<td>${log.difName }</td>
					<td>${log.exeEqName }</td>
					<td>${log.exePart }</td>
					<td>${log.exeSet }</td>
					<td>${log.exeCount }</td>
					<td>${log.weight }</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<table class="table table-bordered table-hover" style="text-align: center;">
			<tr>
				<th>운동일지가 없습니다.</th>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
<button class="btn btn-info" style="float:right;">운동 일지 등록</button> 