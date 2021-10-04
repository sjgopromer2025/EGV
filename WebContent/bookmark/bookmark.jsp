<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
if(login_vo.getU_no() == null || login_vo.getU_no().equals(""))
{
	%>    
	<script>
		$(document).ready(function() 
		{
			alert("잘못된 접근입니다.");
			document.location = "../main/main.jsp";
		});
	</script>
	<%
return;
}
	
	
	
	
m_infoVO      m_infovo    	= new m_infoVO();
m_bookmarkDTO bm_dto 		= new m_bookmarkDTO(login_vo.getU_no());
int x = 0;
%>
	<td align="center">
		<h1 align="center">찜 목록</h1>
		<br>
		<br>
		<br>
		<table border="0" style="margin:0 0 0 0" align="center">
			<tr>
			<%
			int Total = bm_dto.getTotal();
			for (int i = 0; i< Total; i++) 
			{
				m_infovo = bm_dto.bmRead(i);
				%>
				<td align="center">
					<input type="hidden" id="m_no<%=i%>" value="<%=m_infovo.getM_no()%>"/>
					<div style="display: inline;">
						<figure class="perfromimg" >
							<img src="<%=m_infovo.getM_url()%>" style="width:400px; height: 420px"/>
							<figcaption>
								<% if(!(login_vo.getU_no().equals(""))){%>	
									<bm>
									<input type="checkbox" id="m_check<%=i%>" style="width:20px;height:20px;" onclick="javascript:MydoBM(this,'<%=m_infovo.getM_no()%>','<%=login_vo.getU_no()%>');"
										<%	if(bm_dto.checklist(m_infovo.getM_no(),login_vo.getU_no())){%> checked="checked" <%} %>	/>
									</bm>
								<%} %>
								<bm><%=m_infovo.getM_title()%></bm>
								<hr></hr>
								<p>	장르 :<%=m_infovo.getM_gen()%></p>
								<p> 배급사 :<%=m_infovo.getM_company()%></p>
								<p>러닝타임 :<%=m_infovo.getM_time()%></p>
								<p align="center"><a href="<%=m_infovo.getNaver()%>" style="text-decoration: none;">영화정보링크</a></p>
							</figcaption>
						</figure>
					</div>
				</td>
				<%
				if( i > 0 && (i+1) % 5 == 0)
				{
					%>
					</tr>
					<tr>
					<%
				}
			}	
			%>
			</tr>
		</table>
	</td>
<%@ include file="../Include/tail.jsp"%>