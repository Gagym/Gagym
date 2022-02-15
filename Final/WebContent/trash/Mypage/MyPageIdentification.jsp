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
<title>MyPageIdentification.jsp</title>
<style type="text/css">
   #outer
   {
      width:100%;
       height:100%;
   }
   #inner
   {
      width:400px;
      margin: auto;
      margin-top: 200px;
      text-align: center;
      border: 1px solid gray;
      padding: 3em;
   }
</style>
</head>
<body>

   <div id="outer">
      <form>
         <div id="inner">
            비밀번호를 입력하세요.
            <br><br>
            비밀번호 <input type="password" id="pwdCheck" name="pwdCheck" >
            <br><br>
         
            <button type="button" class="btn">비밀번호 확인</button>
         </div>
      </form>
   </div>

</body>
</html>