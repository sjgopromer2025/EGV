<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
m_listDTO m_listDTO = new m_listDTO();
m_infoVO m_infoVO = new m_infoVO();
m_bookmarkDTO bm_dto = new m_bookmarkDTO();
int total = m_listDTO.GetList();
%>
<%
if(!(login_vo.getU_movieck() == null))
{
	if(login_vo.getU_movieck().equals("0"))
	{
	%>
		<tr>
			<td align="right"><a href="../join/interestmovie.jsp" ><font size="4pt">관심영화를 등록하지 않으셨습니다. 등록하러 가시겠습니까?</font></a></td>
		</tr>
	<%
	}else
	{
		%>
		<tr>
			<td align="right"><a href="../join/interestmovie.jsp" ><font size="4pt">관심영화를 변경하시겠습니까?</font></a></td>
		</tr>
		<%
	}
}
	
%>
<tr>
	<td>
		<font style="font-size:20pt;">EGV 인기콘텐츠</font>
		<table  width="100%" style="margin:0 0 0 0">
			<tr>
				<td style="width="10%">
					<a href="#" style="text-decoration:none" onclick="javascript:DoAction('prev','0');"><font size="40">&lt</font></a>
				</td>
				<td align="center">
					<div class="multiple-items0" style="left:0px; width: 1700px" >
					<%
					for (int i = 0; i<16; i++) 
					{
						m_infoVO = m_listDTO.getItem(i);
					%>
						<div style="display: inline;">
							<figure class="perfromimg" >
								<img src="<%=m_infoVO.getM_url()%>" style="width:400px; height: 420px"/>
								<figcaption>
									<% if(!(login_vo.getU_no().equals(""))){%>	
										<bm>
											<input type="checkbox" id="m_check<%=i%>" style="width:20px;height:20px;" onclick="javascript:MydoBM(this,'<%=m_infoVO.getM_no()%>','<%=login_vo.getU_no()%>');"
												<%	if(bm_dto.checklist(m_infoVO.getM_no(),login_vo.getU_no())){%> checked="checked" <%} %>	/>
										</bm>
									<%} %>
									<bm><%=m_infoVO.getM_title()%></bm>
									<hr></hr>
									<p>	장르 :<%=m_infoVO.getM_gen()%></p>
									<p> 배급사 :<%=m_infoVO.getM_company()%></p>
									<p>러닝타임 :<%=m_infoVO.getM_time()%></p>
									<p align="center"><a href="<%=m_infoVO.getNaver()%>" style="text-decoration: none;">영화정보링크</a></p>
								</figcaption>
							</figure>
						</div>
					<%
					}
					%>
					</div>
				</td>
				<td style="width="10%">
					<a href="javascript:;" style="text-decoration:none" onclick="javascript:DoAction('next','0');"><font size="40">&gt</font></a>
				</td>								
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<%@ include file="../Include/action.jsp"%>
	</td>
</tr>
<tr>
	<td>
		<%@ include file="../Include/romance.jsp"%>
	</td>
</tr>
<%@ include file="../Include/tail.jsp"%>