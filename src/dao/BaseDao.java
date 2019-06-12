package dao;
import sun.rmi.runtime.Log;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
public class BaseDao {

	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	static Properties pros=null;
	
	static {
		pros=new Properties();
		try {
			pros.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static  Connection getMysqlConn(){

		try {
			 //1.加载驱动
			Class.forName(pros.getProperty("mysqlDriver"));
//			String url="jdbc:mysql://localhost:3306/project3?useSSL=false";
			//2.建立连接
			return DriverManager.getConnection(pros.getProperty("mysqlURL"),pros.getProperty("mysqlUser"), pros.getProperty("mysqlPwd"));
		} catch (Exception e) {
			System.out.print("21");
			e.printStackTrace();
			return null;
		}
			
	}
	
	public static void close(ResultSet rs,PreparedStatement ps,Connection conn){
		
			try {
				if(rs!=null){
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			try {
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	public static void close(PreparedStatement ps,Connection conn){
		try {
			if(ps!=null){
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		try {
			if(conn!=null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}	
	public static void close(Connection conn){

		try {
			if(conn!=null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}


	
	public int doExcuteSql(String sql,String[] arr){
		int j =0;
		conn=getMysqlConn();
		try {
			ps=conn.prepareStatement(sql);
			if(arr!=null&&arr.length>0){
				for(int i=0;i<arr.length;i++){
					ps.setString(i+1, arr[i]);
				}
			}
			j=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j ;
	}
	
}