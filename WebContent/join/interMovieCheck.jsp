<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egv.DTO.*" %> 
<%@ page import="egv.VO.*" %>
<script src="../JS/jquery-3.6.0.js"></script> 
<%
String u_no = request.getParameter("u_no");
String m_no = request.getParameter("data");
if( !m_no.equals("") )
{
	System.out.println("DATA:" + m_no);	
}else
{
	System.out.println("NO DATA");	
}

if(u_no == null || u_no.equals("") || m_no == null || m_no.equals(""))
{
	out.print("false");
	return;
}
out.print("<<EOF>>");

joinDTO m_join = new joinDTO();
inter_m_reflDTO m_refl = new inter_m_reflDTO();

loginVO login_vo = (loginVO) session.getAttribute("User");



if( m_join.Update(u_no,1) == true){
	if( login_vo != null)
	{
		login_vo.setU_movieck("1");
		session.setAttribute("User",login_vo);
	}
	
	
	if(m_refl.Insert(u_no,m_no) == true)
	{
		if( m_join.Update(u_no,2) == true)
		{ 
			if( login_vo != null)
			{
				login_vo.setU_movieck("2");
				
				session.setAttribute("User",login_vo);
			}
			out.print("true");		
		}else
		{
			out.print("false");
		}
	}
}
%>
