<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="../JS/jquery-3.6.0.js"></script>
 <%
 	session.removeAttribute("User");   
    
 %>
	<script type="text/javascript">
		$(document).ready(function() 
		{
			alert("로그아웃 되었습니다.");
			document.location = "../main/main.jsp"
		});
		
	</script>
