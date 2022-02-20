package car.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager 
{
	static Connection con;
	
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver"; //Drivername
	private static final String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a"; //Edit DATABASE LINK DENGAN ORACLE FORMAT (jdbc:oracle:thin:@hostname:portnumber:databasename)
	private static final String DB_USER = "b60aeb8a3d95c4"; // Username Oracle
	private static final String DB_PASSWORD = "13f26d04"; //Password Oracle
	
	public static Connection getConnection()
	{
		try {
			//1. load the driver
			Class.forName(DB_DRIVER);
			
			try {
				//2. create connection
				con = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
				System.out.println("Connected");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e){
				e.printStackTrace();
		}
		return con;
	}
}
