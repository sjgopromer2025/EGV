package egv.DTO;

import egv.VO.m_infoVO;

public class inter_m_reflDTO extends CommonDTO
{
	public boolean Insert(String u_no,String data)
	{
		boolean flag = false;
		m_infoVO m_info = null;
		try
		{
			
			if(Delete(u_no) == true)
			{
				
				String[] m_no = data.split(","); //  m_no 를 분리
				String title="";				 //m_no에서가져온 제목을 담는다
				String[] genre = null;			 //m_no에서가져온 장르을 담는다
				String reco_title = "";			 //추천영화를 담는다
				
				//배열형태로된 m_no를 반복문을 돌려 m_no의 정보를 가져와 제목과 장르를 이용하여
				//pivot테이블에 있는 정보를 비교하여 결고라를 얻는 로직.
				String sql ="";	
				for (int i = 0; i < m_no.length; i++) 
				{
					m_info	= Read(m_no[i]);
					
					title = m_info.getM_title();
					genre = m_info.getM_gen().split(",");
					
					/***************************************************************/
					// 추천영화 제목을 가져오는 로직
					sql = "select x.p_title as re_title ,avg(x.p_grade) as grade,count(x.p_title) as count ";
					sql +="from pivot x inner join "; 
					sql +="(select  p_user from pivot where p_title = '"+title+"') y ";
					sql +="on x.p_user = y.p_user ";
					sql +="where x.p_title != '"+title+"' ";
					sql +="and x.p_grade < 10 and x.p_genres like '%"+genre[0]+"%' ";
					sql +="group by x.p_title ";
					sql +="order by grade desc, count desc ";

					/*
					select x.p_title as re_title ,avg(x.p_grade) as grade,count(x.p_title) as count 
					from pivot x inner join 
					(select  p_user from pivot where p_title = '타이타닉')  y 
					on x.p_user = y.p_user 
					where x.p_title != '타이타닉' and p_grade < 10 and x.p_genres like '%멜로%'
					group by x.p_title
					order by count desc, grade desc 
					limit 0,5
					*/					
					
					if(this.RunQuery(sql)==true)
					{
						while(this.GetNextResult() == true)
						{
							int avg = this.GetInt("grade");
							int count = this.GetInt("count");
							System.out.println("평균"+avg);
							System.out.println("누적"+count);
							if( avg >= 7 && count >= 500 )
							{
								reco_title += this.GetValue("re_title")+"<<EOF>>";
							}
						}
					}
					this.CloseQuery();
					/***************************************************************/
				}
				
				if(Insert_reco(u_no,reco_title) == true)
				{
					System.out.println("Insert_reco succeed");
					flag = true;
				}else {
					System.out.println("Insert_reco failed");
					flag = false;
				}
			}
			/********/
			this.CloseDB();
			/********/
		}catch (Exception e) 
		{
			return false;
		}
		
		return flag;
	}
	
	public boolean Delete(String u_no)
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
			
			String sql = "delete from reco_m where u_no = "+ u_no; 
			
			if(this.RunSQL(sql) == true)
			{
				flag = true;
			}
			
		}catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		return flag;
	}
	
	public m_infoVO Read(String m_no)
	{
		m_infoVO m_info = null;
		try
		{
			
			String sql ="select m_title, m_gen from movieinfo where m_no = "+m_no;
			
			if(this.RunQuery(sql) == true)
			{
				if(this.GetNextResult() == true)
				{
					m_info = new m_infoVO();
					
					m_info.setM_title(this.GetValue("m_title"));
					m_info.setM_gen(this.GetValue("m_gen"));
				}
			}
			/********/
			this.CloseQuery();
			/********/
		}catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
		return m_info;
	}
	
	public boolean Insert_reco(String u_no, String reco_title)
	{
		boolean flag = false;
		
		try
		{
			
			String[] m_title =  reco_title.split("<<EOF>>");
			
			String sql = "";
			sql += "Insert into reco_m ";
			sql += "(u_no, m_title) ";
			sql += "values ";
			for(int i = 0 ; i < m_title.length ; i++)
			{
				if(i < (m_title.length-1))
				{
					sql += "("+u_no+",'"+m_title[i] +"'), ";
				}else
				{
					sql += "("+u_no+",'"+m_title[i] +"') ";
				}
			}
			
			if(this.RunSQL(sql) == true)
			{
				flag = true;
			}
			
			
		}catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		
		
		return flag;
	
	}
}
