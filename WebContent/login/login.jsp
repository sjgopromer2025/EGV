<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<script>
	function GoLoginOk() 
	{
			if($("#userid").val() == "")
			{
				alert("아이디를 입력해 주세요.");
				$("#userid").focus();
				return;
			}
			if($("#userpw").val() == "")
			{
				alert("비밀번호를 입력해 주세요.");
				$("#userpw").focus();
				return;
			}
			
			$("#login_form").submit();
	}
</script>
<td>
	<h1 align="center">로그인</h1> <br> <br> <br>
	<form id="login_form" name="login_form" action="loginok.jsp" method="post">
		<table border=0 style="width: 100%; hegiht: 80%">
			<tr style="height: 750px;">
				<td valign="top">
					<table border="0" style="width: 800px;" align="center">
						<tr>
							<td align="center" class="matchtd">
								<input type="text" id="userid" name="userid" placeholder="아이디" class="inputst">
							</td>
						</tr>
						<tr>
							<td align="center" class="matchtd" >
								<input type="password"id="userpw" name="userpw" placeholder="비밀번호" class="inputst">
							</td>
						</tr>
						<tr>
							<td align="center" class="matchtd" style="height:80px; width:93%;background-color:red;font-size: 20pt">
								<font style="background-color: red" id="pagelogin" name="pagelogin" onclick="javascript:GoLoginOk();">로그인</font>
							</td>
						</tr>
						<tr>
							<td align="right">
								<a class="button" href="qanda.jsp">도움이	필요하신가요?</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</td>
<%@ include file="../Include/tail.jsp"%>