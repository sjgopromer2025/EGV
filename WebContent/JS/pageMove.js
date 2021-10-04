
$(document).ready(function() {
	/* 로고 누르면 메인페이지 이동 */
	$("#logo").click(function() {
			document.location = "../main/main.jsp";
		});
	
	
	$("#login").click(function() {
		document.location = "../login/login.jsp";
	});

	$("#logout").click(function() {
		document.location = "../login/logout.jsp";
	});
	
	
	$("#join").click(function() {
		document.location = "../join/join.jsp";
	});
	
	$("#joinok").click(function() {
		document.location = "../join/joinok.jsp";
	});
	
	$("#emailsend").click(function() {
		document.location = "../join/emailok.jsp";
	});
	
	$("#recommendmovie").click(function() {
		document.location = "../recommendmovie/recommendmovie.jsp";
	});
	
	$("#bookmark").click(function() {
		document.location = "../bookmark/bookmark.jsp";
	});
	
});