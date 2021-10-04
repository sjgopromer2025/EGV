package egv.DTO;

import egv.VO.joinVO;

public class joinDTO extends CommonDTO
{
	public boolean Check( String id )
	{
		try 
		{
			this.OpenDB();
			
			String sql = "select u_id from userinfo where u_id = '" + id +"'";
			
			this.RunQuery(sql);
			
			if(this.GetNextResult() == true)
			{
				//false면 중복값이 있다
				return false;
			}
			
			this.CloseQuery();
			this.CloseDB();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//true면 중복값이 없다
		return true;
	}
	
	
	public boolean Insert(joinVO vo)
	{
		boolean ch = this.Check( vo.getU_id() );
		if( ch == true)
		{
		
			try 
			{
			
				this.OpenDB();
				
				String sql = "";
				sql = "insert into userinfo ";
				sql += "(u_name, u_id, u_pw, u_email) ";
				sql += "values ";
				sql += "('"+vo.getU_name()+"','"+vo.getU_id()+"','"+vo.getU_pw()+"', '"+vo.getU_email()+"')";
				//System.out.println(sql);
				
				this.RunSQL(sql);
				
				
				sql = "select u_no from userinfo where u_id = '"+ vo.getU_id() + "', u_pw = '"+ vo.getU_pw()+"'";
				
				if( this.RunQuery(sql) == true)
				{
					if(this.GetNextResult() == true)
					{
						vo.setU_no(this.GetValue("u_no"));
					}
				}else
				{
					System.out.println("sql systnx error!");
				}
					
						
				
				this.CloseDB();
				
			}catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}	
	
	
	public boolean Update(String u_no, int status)
	{
		boolean flag = false;
		
		try 
		{
		
			if (this.OpenDB() == true)
			{
				System.out.println("DB Accessed update");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			
			String sql = "";
 			sql += "UPDATE userinfo ";
 			sql += "Set u_movieck = "+ status;
 			sql += " where u_no = "+ u_no;
			
			if(this.RunSQL(sql) == true)
			{
				flag = true;
			}else {
				flag = false;
			}
			
			this.CloseDB();
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		
		
		return flag;
	}
	
	
	
	
	
	
	
	
}
