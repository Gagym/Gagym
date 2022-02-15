<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${areaList }" var="area">
	<option value="${area.sigunguNo }">${area.sigunguName }</option> 
</c:forEach>