<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
String username  = request.getParameter("username" );
String userid    = request.getParameter("userid"   );
String userpw    = request.getParameter("userpw"   );
String confirmpw = request.getParameter("confirmpw");
String email     = request.getParameter("email"    );

/*
out.println(userid);
out.println(userpw);
out.println(confirmpw);
out.println(email);
*/

if (userid == null || userid.equals("") || userpw == null || userpw.equals("") || confirmpw == null || confirmpw.equals("")||email == null || email.equals("") || username == null || username.equals("")) 
{
	%>
	<script>
		$(document).ready(function() {
			alert("가입 오류1");
			document.location = "join.jsp";
		});
	</script>
	<%
	return;
}

if(userpw.equals(confirmpw) == false)
{
	//out.print("비밀번호가 일치하지 않습니다.");
	%>
	<script>
		window.onload = function()
		{
			alert("비밀번호가 일치하지 않습니다.");
			document.location = "join.jsp";
		}
	</script>
	<%
	return;
}

joinDTO dto = new joinDTO();
joinVO vo = new joinVO();

vo.setU_id(userid);
vo.setU_pw(userpw);
vo.setU_email(email);
vo.setU_name(username);

if(dto.Insert(vo) == true)
{
	%>
	<script>
		$(document).ready(function() {
			alert("회원가입 완료");
			document.location = "../login/login.jsp";
		});
	</script>
	<%
}


%>
<%@ include file="../Include/tail.jsp"%>
