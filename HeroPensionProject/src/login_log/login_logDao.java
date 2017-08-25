package login_log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBConn;

public class login_logDao implements Ilogin_logDao {
	
	public static login_logDao login_logDao;
	
	public login_logDao() {DBConn.initConnect();}

	public static login_logDao getInstance(){ 
		if(login_logDao == null){
			login_logDao = new login_logDao();
		}
		return login_logDao;
	}

	@Override
	public void setTotalCount(String id) {
		//총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가
		String sql = " INSERT INTO LOGIN_LOG(ID, VDATE) "
				+ " VALUES(?,SYSDATE)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S setTotalCount");
			
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S setTotalCount");
			
			psmt.executeQuery();
			System.out.println("4/6 S setTotalCount");
			
			conn.commit();
			System.out.println("5/6 S setTotalCount");
			
		} catch (SQLException e) {			
			e.printStackTrace();			
			try {
				conn.rollback();
				System.out.println("ROLLBACK setTotalCount");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}			
		} finally{
			DBConn.close(psmt, conn);
			System.out.println("6/6 S setTotalCount");
		}
		
	}

	// 총 방문자수 얻어온다.
	@Override
	public int getTotalCount() {
		
		String sql = " SELECT COUNT(*) AS TOTALCNT FROM LOGIN_LOG "
				+ " GROUP BY ID";				 
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int totalCount = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getTotalCount");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getTotalCount");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S getTotalCount");
			
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
			System.out.println("5/6 S getTotalCount");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getTotalCount");
		}		
		return totalCount;
	}

	@Override
	public int getTodayCount() {
		
		String sql = " SELECT COUNT(*) AS TODAYCNT FROM LOGIN_LOG "
				+ " WHERE TO_DATE(VDATE, 'YYYY-MM-DD') = TO_DATE(SYSDATE,'YYYY-MM-DD')";				 
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int todayCount = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("6/6 S getTodayCount");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("6/6 S getTodayCount");
			
			rs = psmt.executeQuery();
			System.out.println("6/6 S getTodayCount");
			
			if(rs.next()){
				todayCount = rs.getInt(1);
			}
			System.out.println("6/6 S getTodayCount");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getTodayCount");
		}	
		return todayCount;
	}
	
	
	
	
	
}
