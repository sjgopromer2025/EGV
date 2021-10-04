<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egv.DTO.*" %>
<%@ page import="egv.VO.*" %>
<script src="../JS/jquery-3.6.0.js"></script>  

<%
request.setCharacterEncoding("UTF-8");
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");

if (userid == null || userpw == null || userid.equals("") || userpw.equals("")) 
{
%>    
	<script>
		$(document).ready(function() 
		{
			alert("로그인에 실패하였습니다.");
			document.location = "login.jsp";
		});
	</script>
<%
		return;
}


loginVO VO = new loginVO();
loginDTO DTO = new loginDTO();

VO.setU_id(userid);
VO.setU_pw(userpw);

if(	DTO.Read(VO) == false)
{
	%>
	<script>
	$(document).ready(function() {
		alert("로그인에 실패하였습니다");
		document.location = "login.jsp";
	});
	</script>
	<%
	return;
}
session.setAttribute("User",VO);

%>
<script>
	$(document).ready(function() {
		alert("<%= VO.getU_name()%>님이 로그인 하셨습니다.");
		document.location = "../main/main.jsp";
	});
</script>
