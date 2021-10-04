package egv.VO;

import java.util.Random;

public class m_infoVO 
{
	private String m_no;      //영화번호(PK)
	private String m_title;   //영화제목
	private String m_year;    //개봉년
	private String m_rate;    //등급
	private String m_gen;     //장르
	private String m_country; //국가
	private String m_time;	  //상영시간
	private String m_company; //배급사
	private int    m_grade;   //평점
	private String m_code;    //영화네이버페이지코드
	private String m_url;     //영화포스터이미지
	private String baseUrl = "https://movie.naver.com/movie/bi/mi/basic.naver?code=";
	private int m_total;
	private int temp;
	
	
	
	
	
	public int getTemp() 						{		return temp;		}
	public void setTemp(int temp) 				{		this.temp = temp;	}
	
	public String getM_no() 					{	return m_no;			}
	public void setM_no(String m_no) 			{	this.m_no = m_no;		}
	
	public String getM_title() 					{	return m_title;			}
	public void setM_title(String m_title) 		{	this.m_title = m_title;	}
	
	public String getM_year() 					{	return m_year;			}
	public void setM_year(String m_year)		{	this.m_year = m_year;	}
	
	public String getM_rate() 					{	return m_rate;			}
	public void setM_rate(String m_rate) 		{	this.m_rate = m_rate;	}
	
	public String getM_gen() 					{	return m_gen;			}
	public void setM_gen(String m_gen) 			{	this.m_gen = m_gen;		}
	
	public String getM_country() 				{	return m_country;			}
	public void setM_country(String m_country)	{	this.m_country = m_country;	}
	
	public String getM_time() 					{	return m_time;			}
	public void setM_time(String m_time) 		{	this.m_time = m_time;	}
	
	public String getM_company() 				{	return m_company;			}
	public void setM_company(String m_company)  {	this.m_company = m_company;	}
	
	public int getM_grade() 					{	return m_grade;			}
	public void setM_grade(int m_grade) 		{	this.m_grade = m_grade;		}
	
	public String getM_code() 					{	return m_code;			}
	public void setM_code(String m_code) 		{	this.m_code = m_code;	}
	
	public String getM_url() 					{	return m_url;			}
	public void setM_url(String m_url) 			{	this.m_url = m_url;		}

	
	public int 	getM_total() 					{		return m_total;			}
	public void setM_total(int m_total) 		{		this.m_total = m_total;	}
	
	
	//총 영화 개수에서 랜덤으로 영화 번호를 리턴한다
	public int getRandom(int total) 
	{
		Random rd = new Random();
		int m_ran = rd.nextInt(total);
		setTemp(m_ran);
		while(getTemp() == m_ran)
		{
			m_ran = rd.nextInt(total);
		}
		
		return m_ran; 
	}
	
	
	public String getNaver() 					
	{ 
		String url = this.baseUrl + this.m_code;
		return url;   
	} 
	
	
	
	
	public static void main(String[] args) 
	{
		
	}

}
