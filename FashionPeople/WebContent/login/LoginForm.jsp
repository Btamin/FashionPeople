<%-- 프런트 컨트롤러 적용 - 링크에 .do 붙임 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>사용자 로그인</h2>
	<form action="login.do" method="post">
		아이디: <input type="text" name="USER_ID"><br> 암호: <input
			type="password" name="PWD"><br> <input type="submit"
			value="로그인">
	</form>
</body>
</html>