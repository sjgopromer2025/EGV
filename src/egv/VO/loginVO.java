package egv.VO;

public class loginVO 
{
	private String u_no;
	private String u_id;	
	private String u_pw;	
	private String u_name;	
	private String u_movieck;
	
	
	
	
	
	public String getU_movieck()				{	return u_movieck;			}
	public void setU_movieck(String u_movieck) 	{	this.u_movieck = u_movieck;	}
	public String getU_no() 					{	return u_no;				}
	public void setU_no(String u_no) 			{	this.u_no = u_no;			}
	public String getU_id() 					{	return u_id;				}
	public void setU_id(String u_id) 			{	this.u_id = u_id;			}
	public String getU_pw() 					{	return u_pw;				}
	public void setU_pw(String u_pw) 			{	this.u_pw = u_pw;			}
	public String getU_name() 					{	return u_name;				}
	public void setU_name(String u_name) 		{	this.u_name = u_name;		}
	
	

	public loginVO()
	{
		this.u_name		= "";
		this.u_id   	= "";
		this.u_pw 		= "";
		this.u_no		= "";
	}
	
}

