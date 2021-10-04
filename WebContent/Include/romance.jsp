<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int total2 = m_listDTO.GetList("로맨스");
%>
<font style="font-size:20pt;">사랑하는 사람과 보기 좋은 영화들</font>
<table  width="100%" style="margin:0 0 0 0">
	<tr>
		<td style="width="10%">
			<a href="#" style="text-decoration:none" onclick="javascript:DoAction('prev','2');"><font size="40">&lt</font></a>
		</td>
		<td align="center">
			<div class="multiple-items2" style="left:0px; width: 1700px" >
			<%
			for (int i = 20; i<36; i++) 
			{
				m_infoVO = m_listDTO.getItem(i);
				%>
				<div style="display: inline;">
					<figure class="perfromimg" >
						<img src="<%=m_infoVO.getM_url()%>" style="width:400px; height: 420px"/>
						<figcaption>
							<% if(!(login_vo.getU_no().equals(""))){%>	
								<bm>
																	<input type="checkbox" id="m_check<%=i%>" style="width:20px;height:20px;" onclick="javascript:MydoBM(this,'<%=m_infoVO.getM_no() %>','<%= login_vo.getU_no()%>');"
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
			<a href="javascript:;" style="text-decoration:none" onclick="javascript:DoAction('next','2');"><font size="40">&gt</font></a>
		</td>								
	</tr>
</table>