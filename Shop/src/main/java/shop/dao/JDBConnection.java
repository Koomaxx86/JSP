package shop.dao;

import java.io.FileReader;
import java.io.Reader;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBConnection {
	
	public Connection con;				// 연결된 드라이버에 SQL을 요청할 객체를 생성하는 클래스
	public Statement stmt;				// SQL 실행 요청을 하는 클래스
	public PreparedStatement psmt;		// Statement 에서 ? 파라미터 확장기능을 추가로 제공하는 클래스
	public ResultSet rs;				// SQL 실행 결과를 받아오는 클래스
	
	public JDBConnection() {
		
		try {
			ClassLoader classLoader = JDBConnection.class.getClassLoader();
	        String projectRootPath = classLoader.getResource("").getPath();
			Reader reader = new FileReader(projectRootPath + "/db.properties");
			Properties properties = new Properties();
			properties.load(reader);
			
			String driver = properties.getProperty("driver");
			String url = properties.getProperty("url");
			String id = properties.getProperty("id");
			String pw = properties.getProperty("pw");
			
			Class.forName(driver);		 
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.err.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
}






