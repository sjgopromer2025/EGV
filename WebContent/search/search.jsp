<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
String searchbx = request.getParameter("searchbx");

m_infoVO      m_infovo    	= new m_infoVO();
//m_bookmarkDTO bm_dto 		= new m_bookmarkDTO(login_vo.getU_no());
SearchDRO     search        = new SearchDRO();
int Total = search.GetList(searchbx);
int x = 0;
%>
	<td align="center">
		<h1 align="center"><%=Total%> 개의 영화가 검색되었습니다.</h1>
		<br>
		<br>
		<br>
		<table style="margin:0 0 0 0" align="center">
			<tr>
			<%
			
			System.out.print("total:" + Total);
			for (int i = 0; i< Total; i++) 
			{
				try
				{
					m_infovo = search.getItem1(i);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				
				%>
				<td align="center">
					<div style="display: inline;">
						<figure class="perfromimg" >
							<img src="<%=m_infovo.getM_url()%>" style="width:400px; height: 420px"/>
							<figcaption>
								<% if(!(login_vo.getU_no().equals(""))){%>	
									<bm>
										<input type="checkbox" id="m_check<%=i%>" style="width:20px;height:20px;" onclick="javascript:MydoBM(this,'<%=m_infovo.getM_no()%>','<%=login_vo.getU_no()%>');"
											 <%	if(search.checklist(m_infovo.getM_no(),login_vo.getU_no())){%> checked="checked" <%} %>	/> 
									</bm>      
								<%} %>
								<bm><%=m_infovo.getM_title()%></bm>
								<hr></hr>
								<p>	장르 :<%=m_infovo.getM_gen()%></p>
								<p> 배급사 :<%=m_infovo.getM_company()%></p>
								<p>러닝타임 :<%=m_infovo.getM_time()%></p>
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