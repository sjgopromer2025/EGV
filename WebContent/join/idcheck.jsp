<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egv.DTO.*" %> 
<%@ page import="egv.VO.*" %>
<%
String userid = request.getParameter("userid");

joinDTO dto = new joinDTO();

if(dto.Check(userid) == false)
{
	//중복값이 있다.
	out.print("FALSE");
}else
{
	//중복값이 없다.
	out.print("TRUE");
}
%>
