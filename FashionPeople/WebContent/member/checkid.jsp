<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>아이디 중복 체크</title>
</head>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">

<BODY>

<table border="1" width="250">
<%
String user_id = request.getParameter("user_id");
if(user_id==""){
%>
<tr>
	<td align="center" bgcolor="cccccc">
	<font size="2">id를 입력하세요.</font>
	</td>
</tr>
<tr>
	<td align="center">
	<a href=javascript:close()>[닫 기]</a>
	</td>
</tr>

<%
} else {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/Fashion";
	Connection conn = DriverManager.getConnection(url,"root", "rootroot");
	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM member where user_id='" + user_id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);


	
	if(!rs.next()){
%>
<TR>
	<TD align='center' bgcolor='cccccc'>
	<fint size='2'>ID : <%=user_id%> <BR> 사용할 수 있는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a> 
	</TD>
</TR>
<%
	} else {
%>
<TR>
	<TD align='center' bgcolor='cccccc'> 
	<font size='2'>ID : <%=user_id%> <BR> 사용할 수 없는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a>
	</TD>
</TR>
<%
	}

	rs.close();
	stmt.close();
	conn.close();
}
%>

</BODY>
</HTML>