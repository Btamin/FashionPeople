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
	<c:out value="${session.memberid }"></c:out><a href="<%=request.getContextPath()%>/login/Logout.jsp">�α׾ƿ�</a>
		</c:when>
	<c:when test="${empty memberid }">
		���̵��<c:out value="${memberid }"></c:out>
		<a href="<%=request.getContextPath()%>/login/AdminLogin.jsp">������ �α���</a>
		<a href="<%=request.getContextPath()%>/login/MemberLogin.jsp">ȸ�� �α���</a>
		<a href="">ȸ������</a>
		<form action="<%=request.getContextPath()%>/login/LoginFail.jsp">
		���̵� <input type="text" name="user_id"> ��й�ȣ <input type="passowrd" name="pwd"> <input type="submit" value="�α���">
		</form>
	</c:when>		
</c:choose>
</body>
</html>