package car.dao;

import java.sql.*;
import car.controller.AccountBean;
import car.db.ConnectionManager;

public class CarDAO {

	private static final String CustName = null;
	static Connection currentCon = null;
	static ResultSet rs = null;

	
	// Register account for customer
	public static void Register(String CustIc,String CustName,String CustPhoneNum,String CustEmail,String CustAddress, String CustPostcode, String CustCity, String CustPassword){
		Statement stmt = null;
		String addQuery = "insert into customer(CustIc,CustName,CustPhoneNum,CustEmail,CustAddress,CustPostcode,CustCity,CustPassword) values('" + CustIc + "','" + CustName + "','" + CustPhoneNum + "','"+CustEmail +"','" + CustAddress + "','" + CustPostcode + "','" + CustCity + "','" + CustPassword + "')"; 
		
		System.out.println("Query: " + addQuery);
		
		try {
			//connect db
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			
			stmt.executeUpdate(addQuery);
			
		}
		
		catch (Exception ex) {
			System.out.println("Registration failed: An Exception has occurred! " + ex);
		} // some exception handling
		
		finally {
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) { }
				currentCon = null;
			}
		}
	}
	
	
//login user
public AccountBean login(String CustIc, String CustPassword) throws SQLException,
     ClassNotFoundException {
 String jdbcURL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a";
 String dbUser = "b60aeb8a3d95c4";
 String dbPassword = "13f26d04";

 Class.forName("com.mysql.jdbc.Driver");
 Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
 String sql = "SELECT * FROM customer WHERE CustIc = ? and CustPassword = ?";
 PreparedStatement statement = connection.prepareStatement(sql);
 statement.setString(1, CustIc);
 statement.setString(2, CustPassword);

 ResultSet result = statement.executeQuery();

 AccountBean user = null;

 if (result.next()) {
     user = new AccountBean();
     user.setCustIc(result.getString("CustIc"));
     user.setCustPassword(CustPassword);
 }

 connection.close();

 return user;
}
	
//login Admin
public AccountBean loginAdmin(String AdminId, String AdminPassword) throws SQLException,
ClassNotFoundException {
	String jdbcURL = "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_9e3eec1049bc61a";
	 String dbUser = "b60aeb8a3d95c4";
	 String dbPassword = "13f26d04";

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
String sql = "SELECT * FROM admin WHERE AdminId = ? and AdminPassword = ?";
PreparedStatement statement = connection.prepareStatement(sql);
statement.setString(1, AdminId);
statement.setString(2, AdminPassword);

ResultSet result = statement.executeQuery();

AccountBean admin = null;

if (result.next()) {
admin = new AccountBean();
admin.setAdminId(result.getString("AdminId"));
admin.setAdminPassword(AdminPassword);
}

connection.close();

return admin;
}
	
	
}