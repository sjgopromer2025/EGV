package egv.DTO;

import java.util.ArrayList;

import egv.VO.m_infoVO;

public class recoDTO extends CommonDTO {
	
	ArrayList<m_infoVO> array_re_vo ;
	
	public int GetList(String u_no)
	{
		array_re_vo = new ArrayList<m_infoVO>();
		
		try
		{
			if (this.OpenDB() == false)
			{
				System.out.println("DB Accessed");
			}else 
			{
				System.out.println("DB Denied");
			}
			
			String sql = "";
 			sql += "select m_title ";
 			sql += "from reco_m ";
 			sql += "where u_no = "+u_no +" ";
 			sql += "group by m_title ";
 			
 			
 			String str_title = "";
 			if( this.RunQuery(sql) == true) 		
 			{
 				while(this.GetNextResult() == true)
 				{
 					str_title += this.GetValue("m_title")+"<<EOF>>";
 				}
 				
 			}
 			this.CloseQuery();
 			
 			String[] m_no =Read(str_title).split("<<EOF>>");
 			
 			for(int i = 0 ; i<m_no.length;i++)
			{
				sql = "select * from movieinfo where m_no = "+m_no[i];
				
				if(this.RunQuery(sql) == true)
				{
					if(this.GetNextResult() == true)
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
	 					array_re_vo.add(vo);
					}
				}
				this.CloseQuery();
			}
 			
			this.CloseDB();
			
		}catch (Exception e) 
		{
			e.printStackTrace();
			return 0;
		}
		
		return array_re_vo.size();
	}
	
	
	
	public m_infoVO getItem(int index)
	{
		return (m_infoVO)array_re_vo.get(index);
	}
	
	public String Read(String title)
	{
		String m_no = "";
		try
		{
			String[] m_title = title.split("<<EOF>>");
			
			String sql = "";
			
			for(int i = 0 ; i<m_title.length;i++)
			{
				sql = "select m_no from movieinfo where m_title = '"+m_title[i]+"' ";
				
				if(this.RunQuery(sql) == true)
				{
					if(this.GetNextResult() == true)
					{
						m_no += this.GetValue("m_no")+"<<EOF>>";
					}
				}
				this.CloseQuery();
			}
		
		}catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
		return m_no;
	}
	
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
	
}

