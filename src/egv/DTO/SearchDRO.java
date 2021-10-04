package egv.DTO;

import java.util.ArrayList;

import egv.VO.m_infoVO;

public class SearchDRO extends CommonDTO
{

	public ArrayList<m_infoVO> applyList = null;
	
	public int GetList(String searchbx)
	{
		applyList  = new ArrayList<m_infoVO>();
		
		
		try
		{
			this.OpenDB();

			String sql = "";			
			m_infoVO vo = null;
			
			//게시물 목록을 얻는다.
			sql += "select * from movieinfo ";
			sql += "where m_title like '%" + searchbx + "%' or m_gen like '%" + searchbx + "%'; " ;
			this.RunQuery(sql);
			while(this.GetNextResult() == true)
			{
				vo = new m_infoVO();

				vo.setM_no		(this.GetValue("m_no"));
				vo.setM_title	(this.GetValue("m_title"));
				vo.setM_year	(this.GetValue("m_year"));
				vo.setM_rate	(this.GetValue("m_rate"));
				vo.setM_gen		(this.GetValue("m_gen"));
				vo.setM_country	(this.GetValue("m_country"));
				vo.setM_time	(this.GetValue("m_time"));
				vo.setM_company	(this.GetValue("m_company"));
				vo.setM_grade	(this.GetInt("m_grade"));
				vo.setM_code	(this.GetValue("m_code"));
				vo.setM_url		(this.GetValue("m_url"));
				applyList.add(vo);
			}
			this.CloseQuery();
			this.CloseDB();
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
		
		return applyList.size();
	}
	
	public m_infoVO getItem1(int index)
	{
		return (m_infoVO)applyList.get(index);
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
		
	public static void main(String args[])
	{
		/*
		SearchDRO s = new SearchDRO();
		int total = s.GetList("원피스");
		m_infoVO vo = s.getItem1(0);
		System.out.println(vo.getM_code());
		*/
		
	}
}
