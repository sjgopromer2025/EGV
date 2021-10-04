<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egv.DTO.*" %> 
<%@ page import="egv.VO.*" %>
<%
loginVO login_vo = (loginVO) session.getAttribute("User");
if( login_vo == null) login_vo = new loginVO();

%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EGV</title>
		<link type="text/css" rel="stylesheet" href="../CSS/header.css"></link>
		<link type="text/css" rel="stylesheet" href="../CSS/perform_img.css"></link>
		<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
		<script src="../JS/jquery-3.6.0.js"></script>
		<script src="../JS/pageMove.js"></script>
		<script src="../JS/m_bookmark.js"></script>
		<script src="../JS/slick.js"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	</head>
	<body >
		<table border="0" style="width:100%; ">
			<tr>
				<td>
					<table border="0" style="width:100%; hegiht:300px">
						<tr>
							<td style="width:150px;font-size:50pt;" id="logo" class="link"><img src="../img/EGVlogo.jpg" ></td>
							<td style="font-size:20pt;width:250px" id="recommendmovie" align="center" class="link"><a>추천영화</a></td>
							<% if(!(login_vo.getU_id().equals(""))){%>
							<td style="font-size:20pt;width:200px;" align="center" id="bookmark" class="link" ><a>찜목록</a></td>
							<%} else{
							%>
							<td style="font-size:20pt;width:700px; " align="right">
							<%} %>
							<form id="search_form" name="search_form" method="get" action="../search/search.jsp">
								<td style="font-size:20pt;width:700px; align="right">
									<div><input type="text" class="searchbx" id="searchbx" name= "searchbx" placeholder="영화 제목을 입력해주세요."><input type="submit" class="img-button" value=""></div>
								</td>
							</form>
							<%
							if(login_vo.getU_id().equals(""))
							{
							%>
								<td style="font-size:20pt;width:160px" id="login" class="link" align="center"> 로그인&nbsp;&nbsp;</td>
								<td	style="font-size:20pt;width:160px" id="join" class="link" align="center"> 회원가입&nbsp;&nbsp;</td>
							<%
							}else
							{
							%>
								<td style="font-size:20pt;text-align:right;width:130px" ><%=login_vo.getU_name()%>님</td>
								<td style="font-size:20pt;text-align:right;width:130px" id="logout" class="link">로그아웃</td>
							<%
							}							
							%>
							
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="background:white;"></td>
			</tr>
