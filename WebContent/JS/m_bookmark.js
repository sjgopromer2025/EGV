function MydoBM(obj,m_no,u_no)
{
	
	if( obj.checked == true)
	{
		//alert("checked:" + u_no + ":" + m_no);
		ajBM(m_no,"true",u_no);
	}else
	{
		//alert("unchecked:" + u_no + ":" + m_no);
		ajBM(m_no,"false",u_no);
	}
	
}		

function ajBM(m_no,checking,u_no)
{
	
	//alert(m_no);
	//alert(checking);
	urldata = "m_no="+m_no+"&checking="+checking+"&u_no="+u_no;
	//alert(urldata);
	$.ajax({
		url: "../bookmark/doBookMark.jsp",
		type: "post",
		dataType: "html",
		data: urldata ,
		success : function(data) 
		{
			data = data.trim();
			data = data.split("<<EOF>>");
			alert(data[1]);
		},
		error: function(request, status, error) 
		{
			alert("error!!!");
		}
	});		
}