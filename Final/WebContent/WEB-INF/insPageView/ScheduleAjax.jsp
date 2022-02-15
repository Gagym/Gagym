<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<h2 style="text-align: center;">스케줄 상세내역</h2>
<c:choose>
	<c:when test="${!empty schedules}">
		<table class="table table-bordered table-hover">
			<tr>
				<th id="category">유형</th>
				<th id="rsvTime">수강시간</th>
				<th id="className">수강명</th>
				<th id="memName">수강생명</th>
				<th id="tel">연락처</th>
				<th id="addr">주소</th>
			</tr>
			<c:forEach var="schedule" items="${schedules }">
			<tr>
				<td>${schedule.category }</td>
				<td>${schedule.rsvTime }:00 ~ ${schedule.rsvTime + 1 }:00</td>
				<td>${schedule.className }</td>
				<td>${schedule.memName }<br>(${schedule.memId })</td>
				<%-- <td>
					<c:choose>
						<c:when test="${schedule.comDate == null }"><button type="button" class="btn-primary">스케줄 취소</button></c:when>
						<c:when test="${schedule.comDate != null}"><button type="button" class="btn-primary">미션 등록</button></c:when>
					</c:choose>
				</td> --%>
				<td>휴대폰 : ${schedule.tel }<br>집 : ${schedule.homeTel }</td>
				<td>${schedule.addr }<br>${schedule.detailAddr }</td>
			</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<table class="table table-bordered table-hover" style="text-align: center;">
			<tr>
				<th>스케줄이 없습니다.</th>
			</tr>
		</table>
	</c:otherwise>
</c:choose>