<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<%
m_listDTO m_listDTO = new m_listDTO();
m_infoVO  m_infoVO  = new m_infoVO();

int total = m_listDTO.GetList();
int random = 0;
int temp = random;
%>

		<script> 
				$(document).ready(function(){ 
					// 옵셥 사용하지 않을 경우 $('.single-item').slick();
					// 옵셥 사용할 경우 

					$('.multiple-items').slick({
						infinite : true, 
						slidesToShow: 5,
						slidesToScroll: 5, 
						speed : 800,
						arrows : true,
						draggable : false
					});
				});
		</script>
</td>		
		<div class="multiple-items">
				<%
					for(int i = 0 ; i < 15 ; i++)
					{	m_infoVO = m_listDTO.getItem(i);
						%>
							<div style="display: inline;">
								<figure class="perfromimg">
								  	<figcaption >
								    	<bm><%=m_infoVO.getM_title() %></bm>
								    	<hr></hr>
								    	<p>장르 	 : <%=m_infoVO.getM_gen() %></p>
								    	<p>배급사    : <%=m_infoVO.getM_company() %></p>
								    	<p>러닝타임  : <%=m_infoVO.getM_time() %></p>
								  	</figcaption>								  						  	 
									<img src="<%= m_infoVO.getM_url() %>"/>
								</figure>
							</div>		
						<%
					}
				%>
		</div>
</td>
<%@ include file="../Include/tail.jsp"%>