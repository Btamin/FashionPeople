<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${!empty memberid}">
	<c:out value="${session.memberid }"></c:out><a href="<%=request.getContextPath()%>/login/Logout.jsp">로그아웃</a>
		</c:when>
	<c:when test="${empty memberid }">
		아이디는<c:out value="${memberid }"></c:out>
		<a href="<%=request.getContextPath()%>/login/AdminLogin.jsp">관리자 로그인</a>
		<a href="<%=request.getContextPath()%>/login/MemberLogin.jsp">회원 로그인</a>
		<a href="">회원가입</a>
		<form action="<%=request.getContextPath()%>/login/LoginFail.jsp">
		아이디 <input type="text" name="user_id"> 비밀번호 <input type="passowrd" name="pwd"> <input type="submit" value="로그인">
		</form>
	</c:when>		
</c:choose>
</body>
</html>