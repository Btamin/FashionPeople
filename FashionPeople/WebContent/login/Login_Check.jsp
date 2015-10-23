<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="memberid" scope="session" value="${param.id}" />
	<c:choose>
	<c:when  test="${memberid eq 123 }">
  					<script>location.href="../main/main.jsp";</script>
  					</c:when>
  			<c:when test="${memberid not 123 }">
  				<script>location.href="Loginf.Fail.jsp"</script>
  			</c:when>
  	</c:choose>
  					
</body>
</html>