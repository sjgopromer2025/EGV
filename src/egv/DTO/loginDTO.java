package egv.DTO;

import egv.VO.loginVO;

public class loginDTO extends CommonDTO
{
	public boolean Read(loginVO vo)
	{		
		boolean flag = false;
	
		try 
		{
			this.OpenDB();
			String sql = "";
			sql +="select * from userinfo ";
			sql +="where u_id = '"+ vo.getU_id() + "' and u_pw = '" + vo.getU_pw() + "' ";
			
			this.RunQuery(sql);
			if(this.GetNextResult() == true )
			{
				vo.setU_name(this.GetValue("u_name"));
				vo.setU_no(this.GetValue("u_no"));
				vo.setU_movieck(this.GetValue("u_movieck"));
				flag = true;
			}
			this.CloseQuery();
			this.CloseDB();
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return flag;
	}
}