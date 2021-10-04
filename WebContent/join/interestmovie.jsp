<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>

<%
String u_no = login_vo.getU_no();
 if(u_no == null || u_no.equals(""))
 {
		 %>
			<script>
				window.onload = function()
				{
					alert("잘못된 접근입니다.");
					document.location = "../main/main.jsp";
				}
			</script>
		<%
			return;
}

inter_movie_listDTO inter_m_dto = new inter_movie_listDTO();
m_infoVO  m_vo = null;
int total = inter_m_dto.GetList();
int num = 0;

%>


<script src="../JS/interst_m.js"></script>	
<td>
	<h1 align="center">관심 영화 선택</h1>
	<br>
	<br>
	<br>
	<table style="width:100%" >
	<caption style="text-align: right;"><input type="button" value="제출" id="subBtn" onclick="javascript:m_submit('<%=u_no%>');" disabled="disabled" style="width:150px; height:60px; font-size: 20pt ;background-color: grey;color:white; border-radius:14px;"></caption>
		<tr>
			<td>				
				<table border=0 style="width:100%" align="center">
					<%
					for(int i = 1 ; i<=30; i++)
					{
						num = inter_m_dto.getRandom(total);
						m_vo = inter_m_dto.getItem(num);
						if(i%5 == 1)
						{%>
						<tr>
						<%}%>
							<td align="center">
								<input type="checkbox" id="check<%=i%>">
								<input type="hidden" id="m_no<%=i%>" value="<%=m_vo.getM_no()%>">
								<figure class="perfromimg" onclick="javascript:checking(<%=i%>)">
								 	<img src="<%=m_vo.getM_url() %>" alt="영화" title="영화" style="width: 280px" />
								  	<figcaption>
								    	<bm><%=m_vo.getM_title() %></bm>
								    	<hr></hr>
								    	<p>장르      : <%=m_vo.getM_gen() %></p>
								    	<p>배급사   : <%=m_vo.getM_company() %></p>
								    	<p>러닝타임 : <%=m_vo.getM_time() %></p>
								  	</figcaption>								  						  	 
								</figure>								
							</td>
						<%				
						if(i%5 == 0)
						{%>
						</tr>
						<%}
					}
					%>	
				</table>
			</td>
		</tr>
	</table>	
</td>
<%@ include file="../Include/tail.jsp"%>