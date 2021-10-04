<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Include/head.jsp"%>
<script src="../JS/joinJS.js"></script>
<script>
	window.onload = function()
	{
		$("#userid").keydown(function(e)
		{
			if(e.keyCode <= 48 || e.keyCode > 90)
			{
				$("#idcheck").html("영문+숫자 조합으로 입력해주세요.");
				$("#userid").val("");
				
				//str = $("#userid").val();
				//alert(str);
				//$("#userid").val(str.substring(0,str.length - 1));
			}
		});
	}
</script>
	<td>
		<h1 align="center">회원가입</h1> <br> <br> <br>
		<table border=0 style="width:100% ;hegiht:800px">
			<tr style="height:750px;">
				<td valign="top">
				<form  id="join_form"  name="join_form" method="get" action="joinok.jsp">
					<table border="0" style="width:500px;"  align="center">
						<tr  style="height:100px">
							<td align="center" class="matchtd" >
								<input type="text" id="username" name="username" placeholder="이름"  class="inputst">
							</td>
						</tr>
						<tr  style="height:100px">
							<td align="center" class="matchtd" >
								<input type="text" id="userid" name="userid" placeholder="아이디"  class="inputst" onkeyup="IdCheck();">
								<div align="center" class="idcheck"  id="idcheck" style="color:white;"></div>
							</td>
						</tr>
						<tr style="height:100px">
							<td align="center" class="matchtd">
								<input style="color:black" type="password" id="userpw" name="userpw" placeholder="비밀번호" class="inputst">
							</td>
						</tr>
						<tr style="height:100px">
							<td align="center" class="matchtd">
								<input style="color:black" type="password" id="confirmpw" name="confirmpw" placeholder="비밀번호 확인" class="inputst" onkeyup="javascript:comparepw()">
								<div align="center" class="pwcheck"  id="pwcheck" style="color:white;"></div>
							</td>
						</tr>
						<tr style="height:100px">
							<td align="center" class="matchtd">
								<input style="color:black" type="text" id="email" name="email" placeholder="email@naver.com" class="inputst" onkeyup="javascript:validate();">
								<div align="center" class="emailcheck"  id="emailcheck" style="color:white;"></div>
							</td>
						</tr>
						<tr style="height:100px">
							<td align="center" class="matchtd">
							<input type="button" style="height:80px; width:100%;background-color:red;font-size: 20pt" id="joinBtn" name="joinBtn" value="회원가입">
							</td>
						</tr>
					</table>
				</form>
				</td>
			</tr>
		</table>
	</td>
<%@ include file="../Include/tail.jsp"%>