<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
	<title>회원가입 페이지</title>
	<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script language="JavaScript">
	
	function bClear(){
	    document.all.birth.value= "";
	}
	
	function bClearCheck() {
		var check = document.all.birth.value;
		if( check == "" ){
			document.all.birth.value= "ex) 1991/01/08";
		}
	}
	
	function Check()
	{		 
			 
		if (Member_Join.user_id.value.length<6 || Member_Join.user_id.value.length>15) {
			alert("아이디는 6자 이상, 15자 이하여야 합니다.");
			Member_Join.user_id.focus();
			return false;
		}

		var temp;
		var valid = "abcdefghijklmnopqrstuvwxyz0123456789_";

		for (var i = 0; i < Member_Join.user_id.value.length; i++) {
			temp = "" + Member_Join.user_id.value.substring(i, i + 1);
			if (valid.indexOf(temp) == "-1") {
				alert("아이디는 영문과 숫자, _ 로만 이루어질수 있습니다.");
				Member_Join.user_id.value = "";
				Member_Join.user_id.focus();
				return false;
			}
		}

		if (Member_Join.user_id.value.length < 1) {
			alert("아이디를 입력하세요.");
			Member_Join.user_id.focus();
			return false;
		}
		if (Member_Join.email.value.length < 1) {
			alert("이메일을 입력하세요.");
			Member_Join.email.focus();
			return false;
		}
		if (Member_Join.pwd.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Member_Join.pwd.focus();
			return false;
		}
		if (Member_Join.pwd1.value.length < 1) {
			alert("비밀번호 확인을 입력하세요.");
			Member_Join.pwd1.focus();
			return false;
		}

		if (Member_Join.nickname.value.length < 1) {
			alert("닉네임을 입력하세요.");
			Member_Join.nickname.focus();
			return false;
		}
		
		if (Member_Join.birth.value.length < 1) {
			alert("생년월일을 입력하세요.");
			Member_Join.birth.focus();
			return false;
		}
		
		if (Member_Join.pwd.value.length<6) {
			alert("비밀번호는 6자 이상이여야 합니다.");
			Member_Join.pwd.focus();
			return false;
		}
		
		else if(Member_Join.pwd.value != Member_Join.pwd1.value){
			alert("비밀번호가 서로 다릅니다.");
			Member_Join.pwd.focus();
			return false;
		}
		
		Member_Join.submit();
	}

	function Check_nick(){
		if(Member_Join.nickname.value.length<2 || Member_Join.nickname.value.length>6){
			alert("닉네임은 2자 이상, 6자 이하여야 합니다.");
			Member_Join.nickname.focus();
			return false;
		}
		
		browsing_window = window.open(
				"checknick.jsp?nickname=" + Member_Join.nickname.value,
				"_idcheck",
				"height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
		browsing_window.focus();
		
	}
	
	function Check_id() {
		
		if (Member_Join.user_id.value.length<6 || Member_Join.user_id.value.length>15) {
			alert("아이디는 6자 이상, 15자 이하여야 합니다.");
			Member_Join.user_id.focus();
			return false;
		}

		var temp;
		var valid = "abcdefghijklmnopqrstuvwxyz0123456789_";

		for (var i = 0; i < Member_Join.user_id.value.length; i++) {
			temp = "" + Member_Join.user_id.value.substring(i, i + 1);
			if (valid.indexOf(temp) == "-1") {
				alert("아이디는 영문과 숫자, _ 로만 이루어질수 있습니다.");
				Member_Join.user_id.value = "";
				Member_Join.user_id.focus();
				return false;
			}
		}
		
		browsing_window = window.open(
				"checkid.jsp?user_id=" + Member_Join.user_id.value,
				"_idcheck",
				"height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
		browsing_window.focus();
	}
	
	</script>
</head>
<body>


	<form Name='Member_Join' Method='post' Action='add.do'> 
		<table id="fashiontable">
		<tr>
			<td colspan="2">
			<h3>회원가입</h3>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
			<input type="text" name="user_id" />
			<input type='button' OnClick='Check_id()' value='ID 중복검사'/>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"/>
			<input type="button" value="이메일 인증"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" id="pwd"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="pwd1"/>
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname"/>
			<input type='button' OnClick='Check_nick()' value='닉네임 중복검사'/>
			</td>
		</tr>
		<tr>
			<td>성별</td>
 			<td>
 				<input type="radio" name="male" value="true" checked="checked" />남자
 				<input type="radio" name="male" value="false" />여자<br>
			</td>
		</tr>
		<tr>
			<Td>생년월일</Td>
			<td> 
				<input type="text" name="birth" id="birth" value="ex)1990/11/30" onClick="bClear()" onfocus="bClear()" onblur="bClearCheck()"/>
			</td>
		</tr>
		<tr>
			<td>프로필 사진</td>
			<td>
			<input type="file" name="picture" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="회원가입" onclick='Check()'/>
			<!-- 메인으로 이동하는 버튼 -->
			<input type="button" id="btn" value="닫기" onclick="window.close();"/>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>