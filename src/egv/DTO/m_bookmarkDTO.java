package egv.DTO;

import java.util.ArrayList;

import egv.VO.m_infoVO;

public class m_bookmarkDTO extends CommonDTO
{
	private int   total = 0;

	
	private ArrayList<String> m_bookmarkList = null;
	
	public int getTotal()			{		return total;		}
	public void setTotal(int total) {		this.total = total;	}
	
	
	public m_bookmarkDTO() {}
	//생성자로써 유저넘버를 넣어주면 유저가 북마크한 영화를 arraylist형태로 저장한다.
	public m_bookmarkDTO(String u_no) {
		try
		{
			m_bookmarkList = new ArrayList<String>(); 
					
			if (this.OpenDB() == true)
			{
				System.out.println("DB Accessed");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			String sql = "select * from bookmark where u_no = "+ u_no;
			
			
			if(this.RunQuery(sql) == true)
			{
				while(this.GetNextResult() == true)
				{
					m_bookmarkList.add(this.GetValue("m_no"));
				}
			}else
			{
				System.out.println("sql error");
			}
			
			//arraylist size를 알수 있게 세터로 지정해준다.
			setTotal(m_bookmarkList.size());
			
			this.CloseQuery();
			this.CloseDB();
		}catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
	//생성자에서 지정한 북마크 리스트를 찾을 수 있게 인덱싱한다.
	public String getItem(int index)
	{
		return (String)m_bookmarkList.get(index);
	}
	
	
	
	//북마크를 저장하고 삭제할수 있는 코드 checking이 true면 북마크 false면 삭제
	public boolean table_BM( String u_no,String m_no, String checking)
	{
		boolean flag = false;
		
		try
		{
			if (this.OpenDB() == true)
			{
				System.out.println("DB Accessed");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			String sql = "";
			//추가와 삭제
			if(checking.equals("true")) 
			{
				sql =  "insert into bookmark ";
				sql += "(m_no,u_no) ";
				sql += "values ";
				sql += "("+m_no+","+u_no+")";
			}else if(checking.equals("false"))
			{
				sql =  "delete from bookmark ";
				sql += "where m_no = "+m_no+" and u_no = "+ u_no;
			}
			
			
			if(this.RunSQL(sql) == true)
			{
				flag=true;
			}else
			{
				System.out.println("sql error");
				flag=false;
			}
			
			this.CloseDB();
		}catch (Exception e) 
		{
			return false;
		}
		return flag;
	}
	
	//사용자가 넘어온 m_no를 북마크 했는지 체크하는 로직
	public boolean checklist(String m_no, String u_no)
	{
		boolean flag = false;
		
		try
		{
			if (this.OpenDB() == true)
			{
				System.out.println("DB Accessed");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			String sql = "select * from bookmark where u_no ="+u_no+" and m_no = "+m_no;
			
			if(this.RunQuery(sql) == true)
			{
				if(this.GetNextResult() == true)
				{
					//값이 나오면 그 영화를 북마크 한 것
					flag = true;
				}
			}
			
			this.CloseQuery();
			this.CloseDB();
		}catch (Exception e) 
		{
			return false;
		}
		
		
		return flag;
	}
	
	
	
	//북마크된 영화정보 가져오는 코드
	public m_infoVO bmRead(int i)
	{
		m_infoVO m_info_vo = null; 
		try
		{
			if (this.OpenDB() == true)
			{
				System.out.println("DB Accessed");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			String sql = "";
			sql += "select * from movieinfo where m_no = "+ getItem(i);
			if(this.RunQuery(sql) == true)
			{
				if(this.GetNextResult() == true)
				{
					m_info_vo = new m_infoVO();

					m_info_vo.setM_no		(this.GetValue("m_no"));
					m_info_vo.setM_title	(this.GetValue("m_title"));
					m_info_vo.setM_year		(this.GetValue("m_year"));
					m_info_vo.setM_rate		(this.GetValue("m_rate"));
 					m_info_vo.setM_gen		(this.GetValue("m_gen"));
 					m_info_vo.setM_country	(this.GetValue("m_country"));
 					m_info_vo.setM_time		(this.GetValue("m_time"));
 					m_info_vo.setM_company	(this.GetValue("m_company"));
 					m_info_vo.setM_grade	(this.GetInt("m_grade"));
 					m_info_vo.setM_code		(this.GetValue("m_code"));
 					m_info_vo.setM_url		(this.GetValue("m_url"));
				}
			}
			
			this.CloseDB();
			this.CloseQuery();
		}catch (Exception e) 
		{
			return null;
		}
		return m_info_vo;
	}
	
	
	
}
