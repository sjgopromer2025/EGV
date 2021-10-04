<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
if(login_vo.getU_no().equals("") )
{
	%>
	<script>
		$(document).ready(function() {
			alert("잘못된 접근입니다.");
			document.location = "../login/login.jsp";
		});
	</script>
	<%	
	return;
}

if(login_vo.getU_movieck().equals("0"))
{
	%>
	<script>
		$(document).ready(function() {
			alert("관심 영화를 선택하지 않았습니다.");
			document.location = "../main/main.jsp";
		});
	</script>
	<%	
	return;
}

if(login_vo.getU_movieck().equals("1"))
{
	%>
	<script>
		$(document).ready(function() {
			alert("추천 영화를 선정중입니다.");
			document.location = "../main/main.jsp";
		});
	</script>
	<%	
	return;
}






recoDTO re_dto = new recoDTO();
m_infoVO m_infovo = null;
int total = re_dto.GetList(login_vo.getU_no());

%>
	<td align="center">
		<h1 align="center"><%=login_vo.getU_name()%>님에게 어울리는 영화!</h1>
		<br>
		<br>
		<br>
		<table border="0" style="margin:0 0 0 0" align="center">
			<tr>
			<%
			for (int i = 0; i< total; i++) 
			{
				m_infovo = re_dto.getItem(i);
				%>
				<td align="center">
					<div style="display: inline;">
						<figure class="perfromimg" >
							<img src="<%=m_infovo.getM_url()%>" style="width:400px; height: 420px"/>
							<figcaption>
								<% if(!(login_vo.getU_no().equals(""))){%>	
									<bm>
										<input type="checkbox" id="m_check<%=i%>" style="width:20px;height:20px;" onclick="javascript:MydoBM(this,'<%=m_infovo.getM_no()%>','<%=login_vo.getU_no()%>');"
											<%	if(re_dto.checklist(m_infovo.getM_no(),login_vo.getU_no())){%> checked="checked" <%} %>	/>
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
</body>
</html>
	</td>
<%@ include file="../Include/tail.jsp"%>