package himedia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmaillistDao {

	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String DB_USER = "himedia";
	private static final String DB_PASS = "himedia";
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Oracle JDBC driver not found",e);
		}
	}
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
	}
	
	public List<String[]> getEmailList() {
		List<String[]> emailList = new ArrayList<>();
		String sql = "SELECT * FROM email_list ORDER BY id";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); 
			while (rs.next()) {
				String[] entry = new String[5];
				entry[0] = rs.getString("id");
				entry[1] = rs.getString("first_name");
				entry[2] = rs.getString("last_name");
				entry[3] = rs.getString("email");
				entry[4] = rs.getString("registration_date");
				emailList.add(entry);
			}
		}
		catch (SQLException e) {
			System.err.println("SQL 오류입니다.");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return emailList;
	}
	
	
	public void addEmail(String firstName, String lastName, String email) {
		String sql = "INSERT INTO email_list (first_name, last_name, email) "
				+ "VALUES(?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, email);
			pstmt.executeUpdate(); // 영향 받은 레코드 카운트
			
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn!= null) conn.close();
					if (pstmt!= null) pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	

