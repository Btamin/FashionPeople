<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> ȸ�� ��� ���� </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<%
String user_id = request.getParameter("user_id");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd"); 
String nickname = request.getParameter("nickname");
//boolean male = request.getParameter("male");
String birth = request.getParameter("birth");
String picture = request.getParameter("picture");

String check_ok = "yes";  
if (user_id == "")                 
	check_ok = "no";     
if (email == "")
	check_ok = "no";
if (pwd == "")              
	check_ok = "no";     
if (nickname == "")              
	check_ok = "no";
/* if (male == "true")
	check_ok = "no"; */
if (birth == "")
	check_ok = "no";
if (picture == "")
	check_ok="no";

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/fashion";
Connection conn = DriverManager.getConnection(url,"root", "rootroot");

Statement stmt = conn.createStatement();

String strSQL = "SELECT user_id FROM member where user_id='" + user_id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

if (!rs.next())            
	check_ok="yes";   
else                      
	check_ok="no";   

if (check_ok == "yes"){
	strSQL = "INSERT INTO member(user_id,email,pwd,nickname,birth, picture,address,phone,email)";
	strSQL = strSQL +  "VALUES('" + user_id + "', '" + email + "', '" + pwd + "', '" + nickname + "',";
	strSQL = strSQL +  "'" + birth + "', '" + picture + "')"; 
	stmt.executeUpdate(strSQL);
%>

<BODY>

<center><font size='3'><b> ȸ�� ���� ���� </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>ȸ�� ������ �����մϴ�.<BR>�α��� �ϼ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="member.jsp">[�α���]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
} else {
%>

<HTML>
<HEAD>
<TITLE> ȸ�� ���� ���� </TITLE> 
</HEAD>

<BODY>

<center><font size='3'><b> ȸ�� ���� ���� </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>ȸ�� ���Կ� ���� �߽��ϴ�. <BR>�ٽ� ���Լ�
                     �� �ۼ��� �ּ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	 <font size='2'><a href="member_join.jsp">[���Լ� �ۼ�]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>
<%
}

stmt.close();
conn.close();
%>