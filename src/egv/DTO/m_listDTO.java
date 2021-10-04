package egv.DTO;

import java.util.ArrayList;

import egv.VO.m_infoVO;

public class m_listDTO extends CommonDTO
{
	ArrayList<m_infoVO> array_m_info ;
	
	
	public int GetList(String genre)
	{
		array_m_info = new ArrayList<m_infoVO>();
		
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
 			sql += "select * ";
 			sql += "from movieinfo ";
 			if(!(genre.equals("")))
 			{
 				sql+="where m_gen like '%"+genre+"%'";
 			}
 			
 			
 			if( this.RunQuery(sql) == true) 		
 			{
 				while(this.GetNextResult() == true)
 				{
 					m_infoVO vo = new m_infoVO();
 					
 					vo.setM_no(this.GetValue("m_no"));
 					vo.setM_title(this.GetValue("m_title"));
 					vo.setM_year(this.GetValue("m_year"));
 					vo.setM_rate(this.GetValue("m_rate"));
 					vo.setM_gen(this.GetValue("m_gen"));
 					vo.setM_country(this.GetValue("m_country"));
 					vo.setM_time(this.GetValue("m_time"));
 					vo.setM_company(this.GetValue("m_company"));
 					vo.setM_grade(this.GetInt("m_grade"));
 					vo.setM_code(this.GetValue("m_code"));
 					vo.setM_url(this.GetValue("m_url"));
 					
 					array_m_info.add(vo);
 					
 				}
 				
 			}else
 			{
 				System.out.println("sql 구문  오류");
 			}
 			
 			
 			
 			this.CloseQuery();
			this.CloseDB();
			
		}catch (Exception e) 
		{
			e.printStackTrace();
			return 0;
		}
		
		return array_m_info.size();
	}
	
	public m_infoVO getItem(int index)
	{
		return (m_infoVO)array_m_info.get(index);
	}
	
	public int GetList()
	{
		return GetList("");
	}
	
	
}
