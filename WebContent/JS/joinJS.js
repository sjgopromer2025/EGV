var flag       = false; //이메일 유효한지 (false면 유효X, true면 유효)
var IsJoinOk   = false; //아이디 중복 여부 (true면 중복X, false면 중복)
var IsDupCheck = false; //비밀번호 확인 (true면 일치, false면 일치X)

//아이디 중복검사
function IdCheck()
{
	urldata = "userid="+ $("#userid").val();
	value = $("#userid").val();
	
	const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(korean.test(value) == true)
	{
		$("#userid").val();
		IsJoinOk = false;
		return;	
	}
	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi

     if ( regExp .test(value) == true) {
    	 $("#userid").val();
 		IsJoinOk = false;
 		return;	
     }

	$.ajax({
		url: "../join/idcheck.jsp",
		type: "post",
		dataType: "html",
		data: urldata,
		success: function(data)
		{
			IsDupCheck = true;
			data = data.trim();
			if(data == "FALSE")
			{
				IsJoinOk = false;
				$("#idcheck").html("중복된 아이디입니다.");
			}else if(data == "TRUE" )
			{
				IsJoinOk = true;
				$("#idcheck").html("등록가능한 아이디입니다.");
			}
		},
		error: function (request, status, error)
		{
			$("#idcheck").html("ERROR");
		}
	});
}

//비밀번호 확인
function comparepw()
{
	 if(!($("#userpw").val() ==  $("#confirmpw").val() ))
	 {
		 IsDupCheck = false;
		 $("#pwcheck").html("비밀번호가 일치하지 않습니다.");
		 return false;
	 }else{
		 IsDupCheck = true;
		 $("#pwcheck").html("");
	 }
	 return true;
}

//이메일 유효성 검사
function validate() 
{
	const $result = $("#emailcheck");
	const email = $("#email").val();
	$result.text("");
  
	if(validateEmail(email))
	{
		flag = true; 
		$result.html("");
		return false;
	}else
	{
		flag = false;
		$result.html("유효하지 않은 이메일 입니다.");
	}
	return true;
}

function validateEmail(email) 
{
	const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(korean.test(email) == true)
	{
		return false;	
	}
	
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}


//전송
$(document).ready(function() 
{
	$("#joinBtn").click(function()
	{
		if( $("#username").val() == "" )
		{
			alert("이름을 입력해주세요")
			$("#username").focus();
			return;
		}
				
		if( $("#userid").val() == "" )
		{
			alert("아이디를 입력해주세요")
			$("#userid").focus();
			return;
		}
				
		if( $("#userpw").val() == "" )
		{
			alert("비밀번호를 입력해주세요")
			$("#userpw").focus();
			return;
		}
		
		if( $("#confirmpw").val() == "" )
		{
			alert("이메일을 입력해주세요")
			$("#confirmpw").focus();
			return;
		}
		
		if( $("#email").val() == "" )
		{
			alert("확인 비밀번호를 입력해주세요")
			$("#email").focus();
			return;
		}
		
		if(IsJoinOk == false)
		{	
			alert("중복된 아이디 입니다.");			
			$("#userid").focus();
			return;
		}
		
		if(IsDupCheck == false)
		{	
			alert("비밀번호가 일치하지 않습니다");
			$("#confirmpw").focus();
			return;
		}
		
		if(flag == false)
		{	
			alert("유효하지 않은 이메일 입니다.");
			$("#email").focus();
			return;
		}
		
		if(confirm("회원가입을 진행하시겠습니까?") == 1)
		{
			$("#join_form").submit();
		}
	});
});
