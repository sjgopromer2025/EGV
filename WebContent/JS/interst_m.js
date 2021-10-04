
var movie_check_cnt = 0;
function checking(i) 
{
	check = $("#check"+i);
	m_no = $("#m_no"+i);
	btn = $("#subBtn");
	
	if(movie_check_cnt == 10)
	{
		alert("영화를 다 고르셨습니다.");
		return;
	}
	
	if(movie_check_cnt <= 10)
	{
		//alert(check.is(":checked"));
		if(check.is(":checked") == false)
		{
			movie_check_cnt += 1;
			check.attr("checked",true);
		}else
		{
			check.attr("checked",false);	
			movie_check_cnt -= 1;
		}	
	}
	
	if(movie_check_cnt >= 1)
	{
		btn.attr("disabled",false);
		btn.css("background-color","red");
	}else
	{
		btn.attr("disabled",true);
		btn.css("background-color","grey");
	}
	
}





function m_submit(u_no)
{
	param = "";

	for( i = 1 ; i<=30 ; i++)
	{
		check = $("#check"+i);
		if(check.is(":checked") == true)
		{
			if(param != "")
			{
				param += ",";
			}
			param += $("#m_no"+i).val();
			
			
		}
	}
	m_aj(param,u_no);
	//alert(u_no);
	//alert(param);
	/*
	var cnt = 0;
	url = "";	
	var arrVal = new Array();
	
	for( i = 1 ; i<=30 ; i++)
	{
		check = $("#check"+i);
		if(check.is(":checked") == true)
		{
			cnt += 1;
			arrVal.push(i);
		}
	}
	//alert(arrVal);
	for( x = 0; x < arrVal.length ; x++)
	{
		if(x == 0)
		{
			url = "check"+x+"="+$("#m_no"+arrVal[x]).val();
			cnt += 1;
		}else
		{
			url = url+"&"+"check"+x+"="+$("#m_no"+arrVal[x]).val();
		}
	}
	url = url+"&total="+arrVal.length;
	//alert(url);
	m_aj(url);
	*/

//	document.location = "../main/main.jsp";
}



function m_aj(urldata,u_no) {
	//alert(urldata);
	$.ajax({
		url: "../join/interMovieCheck.jsp",
		type: "post",
		dataType: "html",
		data: "data=" + urldata+"&u_no="+u_no,
		success : function(data) 
		{
			/*
			data = data.trim();
			data = data.split("<<EOF>>");
			//alert(data);
			
			if(data[1] == "true")
			{
				alert("관심영화 등록완료");
				document.location = "../recommendmovie/recommendmovie.jsp";
			}else
			{
				alert("관심영화 등록에 실패하였습니다. 다시 시도해주세요.");
				document.location = "../main/main.jsp";
			}
			*/			
		},
		error: function(request, status, error) 
		{
			alert("error!!!");
		}	
	});
	
	console.log("before");
	setTimeout(() => console.log("after"), 3000);
	
	alert("관심영화 등록을 완료하였습니다. 관심영화를 이용하여 추전영화를 작성중입니다.");
	document.location = "../main/main.jsp";		
}

