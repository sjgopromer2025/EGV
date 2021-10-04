package egv.DTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CommonDTO 
{
	public String mHost     = "127.0.0.1:3306/movie";
	public String mUserId   = "root";
	public String mPassword = "ezen";
	
	public Connection mConnection;
	public ResultSet  rs;
	
	private boolean LoadDriver()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean OpenDB()
	{
		if(LoadDriver() == false)
		{
			return false;
		}
		
		String mServer = "jdbc:mysql://" + mHost + "?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		
		try
		{
			this.mConnection = 
					DriverManager.getConnection(mServer,mUserId,mPassword);
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public void CloseDB()
	{
		try
		{
			this.mConnection.close();
		}catch(Exception e)
		{
			
		}
	}	
	
	public boolean RunSQL(String sql) 
	{
		System.out.println("SQL:"+sql);
		
		try
		{
			Statement stmt = mConnection.createStatement();
			stmt.executeUpdate(sql);
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}	
	
	public boolean RunQuery(String sql)
	{
		System.out.println("SQL:"+sql);
		
		try
		{
			Statement stmt = mConnection.createStatement();
			rs = stmt.executeQuery(sql);			
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean GetNextResult()
	{
		try
		{
			return rs.next();
		}catch(Exception e)
		{
			return false;
		}
	}	
	
	public String GetValue(String name)
	{
		try
		{
			return rs.getString(name);
		}catch(Exception e)
		{
			return "";
		}
	}
	
	public int GetInt(String name)
	{
		try
		{
			return rs.getInt(name);
		}catch(Exception e)
		{
			return 0;
		}
	}	
	
	public void CloseQuery() 
	{
		try
		{
			rs.close();
		}catch(Exception e)
		{
		}
	}	
	
	public String _R(String value)
	{
		return value.replace("'","''");
	}
}


