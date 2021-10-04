package egv.DTO;

import java.util.ArrayList;
import java.util.Random;

import egv.VO.m_infoVO;

public class inter_movie_listDTO extends CommonDTO {
	ArrayList<m_infoVO> array_m_info;
	private int temp = 0;
	Random rd = new Random();
	
	public int getTemp() {		return temp;	}
	public void setTemp(int temp) {		this.temp = temp;	}

	public int GetList() 
	{
		array_m_info = new ArrayList<m_infoVO>();

		try 
		{
			if (this.OpenDB() == true) 
			{
				System.out.println("DB Accessed");
			} else {
				System.out.println("DB Denied");
			}

			String sql = "";
			sql += "select * ";
			sql += "from movieinfo ";

			if (this.RunQuery(sql) == true) 
			{
				while (this.GetNextResult() == true)
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

			} else 
			{
				System.out.println("sql 구문  오류");
			}

			this.CloseQuery();
			this.CloseDB();

		} catch (Exception e) 
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

	
	
	//총 영화 개수에서 랜덤으로 영화 번호를 리턴한다
	public int getRandom(int total) 
	{
		
		int m_ran = rd.nextInt(total);
		setTemp(m_ran);
		while(getTemp() == m_ran)
		{
			m_ran = rd.nextInt(total);
		}
		
		return m_ran; 
	}
}
