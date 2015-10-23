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
<jsp:include page="../header.jsp"/>
<form action="Login_Check.jsp" method="get">
<table border="1" align="center">
	<tr>
	<td>회원 로그인</td>
	</tr>
	
	<tr>
		<td><input type="text" name="id" size="20"></td>
	</tr>
	
	<tr>
		<td><input type="password" name="password" size="20"></td>
	</tr>
	
	<tr>
	<td align="center"><input type="submit" value="로그인" ></td>
	</tr>
</talbe>
</form>
</body>
</html>