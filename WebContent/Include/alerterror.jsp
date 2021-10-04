<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(login_vo.getU_id().equals(""))
{
	%>
	<script>
		$(document).ready(function() {
			alert("잘못된 접근입니다.");
			document.location = "../main/main.jsp";
		});
	</script>
	<%
	return;
}
%>