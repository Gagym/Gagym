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
<title>InstructorUpdate.jsp</title>
<style type="text/css">
	#outer
	{
		width:100%;
	}
	#inner
	{
		width:1100px;
	    margin: auto;
	}
	table
	{
		width: 100%; 
		text-align: center;
		border-collapse: collapse;
	}
	th, td
	{
		border: 1px solid gray;
	}
</style>


</head>
<body>

	<div id="outer">
		<form>
			<div id="inner">
				<div style="text-align:center">
					<h1> 강사 프로필 수정 </h1>
					<hr>
				</div>
				
				<div class="box">
					프로필 사진 수정 <input type="button" value="+"/>
					<br><br>
					
					자격증 추가<br>
					<input type="text" id="certificate" name="certificate" placeholder="자격증명"> 
					<input type="text" id="cerDate" name="cerDate" placeholder="자격증발급날짜"> 
					<input type="button" value="+"/>
					<br><br>
					<table>
						<tr>
							<th style="width:100px;">자격증명</th>
							<th style="width:100px;">자격증 발급 날짜</th>
							<th style="width:200px;">자격증 증명 자료</th>
						</tr>
						<tr>
							<td>트레이너자격증</td>
							<td>21.11.11</td>
							<td><img src="<%=cp %>/images/img_01.png" style="width:100%; height:100%;"></td>
						</tr>
					</table>
					<br><br>
					
					활동지역 변경<br>
					<input type="text" id="place" name="place" disabled="disabled"> 
					<br><br>
					<input type="text" id="place" name="place"> 
					<input type="button" value="+"/>
					<br><br>
					
					수상경력 추가<br>
					<input type="text" id="awardsDate" name="awardsDate" placeholder="수상날짜"> 
					<input type="text" id="awards" name="awards" placeholder="수상명"> 
					<input type="text" id="awardsGrade" name="awardsGrade" placeholder="수상실적(상격)"> 
					<input type="button" value="+"/>
					<br><br>
					<table>
						<tr>
							<th>수상날짜</th>
							<th>수상명</th>
							<th>수상실적</th>
						</tr>
						<tr>
							<td>2020.08.08</td>
							<td>파이널</td>
							<td>대상</td>
						</tr>
					</table>
					<br><br>
					
					활동경력 추가<br>
					<input type="text" id="actStartDay" name="actStartDay" placeholder="시작날짜"> 
					<input type="text" id="actEndDay" name="actEndDay" placeholder="끝날짜"> 
					<input type="text" id="activity" name="activity" placeholder="활동내용">  
					<input type="button" value="+"/>
					<br><br>
					<table>
						<tr>
							<th>기간</th>
							<th>활동내용</th>
						</tr>
						<tr>
							<td>2020.08.08 ~ 2020.09.09</td>
							<td>파이널 프로젝트</td>
						</tr>
					</table>	
					<br><br>
					
				</div>
				
				<div style="text-align:center;">
					<button type="button" class="btn" style="width:400px;">수정 요청</button>
				</div>
			</div>			
		</form>
	</div>

</body>
</html>