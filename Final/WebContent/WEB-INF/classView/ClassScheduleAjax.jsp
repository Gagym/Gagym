<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<h2 style="text-align: center;">스케줄 상세보기</h2>
<%-- <c:if test="${schedules != null}"> --%>
	<table class="table table-bordered table-hover">
		<tr>
			<th>예약타임</th>
			<th>예약현황</th>
		</tr>
		<fmt:parseNumber var="start" type="number" value="${startTime }" />
		<fmt:parseNumber var="end" type="number" value="${endTime }" />
		<c:set var="j" value="0"/>
		
		<c:forEach var="i" begin="${start}" end="${end}">
			<tr>
				<td>${i}:00 ~ ${i+1}:00</td>
				
				<c:choose>
				
					<c:when test="${empty rsvTimeList}">
						<td>예약가능</td>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="time" items="${rsvTimeList }">
							<c:if test="${not loopBreak}">
							<c:choose>
								<c:when test="${i eq time.rsvTime}">
									<td>예약불가</td>
								</c:when>
								<c:otherwise>
									<td>예약가능</td>
								</c:otherwise>
							</c:choose>
							</c:if>
						</c:forEach>
					</c:otherwise>
					
				</c:choose>
			</tr>
			
		</c:forEach>
		
	</table>
<%-- </c:if> --%>