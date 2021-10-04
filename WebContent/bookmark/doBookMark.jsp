<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egv.DTO.*" %> 
<%@ page import="egv.VO.*" %>
<script src="../JS/jquery-3.6.0.js"></script>
<%
loginVO login_vo = (loginVO) session.getAttribute("User");
if(login_vo == null)
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
out.print("<<EOF>>");
request.setCharacterEncoding("UTF-8");
String u_no	 	= request.getParameter("u_no");
if(u_no == null || u_no.equals(""))
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
String m_no 	= request.getParameter("m_no");
String checking = request.getParameter("checking");
if(m_no == null || m_no.equals("") || checking == null || checking.equals(""))
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




//System.out.print(m_no);
//System.out.print(u_no);
//System.out.print(checking);

m_bookmarkDTO m_bookmarkdto = new m_bookmarkDTO();

if(m_bookmarkdto.table_BM(u_no,m_no,checking) == true)
{
	if(checking.equals("true"))
	{
		out.print("북마크 완료");
	}else
	{
		out.print("북마크 취소");	
	}
}else
{
	out.print("북마크 오류");
}

%>
