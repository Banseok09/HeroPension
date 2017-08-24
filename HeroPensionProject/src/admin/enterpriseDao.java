package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;
import member.MemberDTO;

public class enterpriseDao implements IenterpriseDao {

	public static enterpriseDao enterpriseDao;
	
	public enterpriseDao() {DBConn.initConnect();}
	
	public static enterpriseDao getInstance(){
		if(enterpriseDao == null){
			enterpriseDao = new enterpriseDao();
		}
		return enterpriseDao;
	}
	
	// 업체등록
	@Override
	public boolean addEnterprise(enterpriseDto dto) {
		
		String sql = " INSERT INTO ENTERPRISE "
				+ " (ID, PW, NAME, EMAIL, PHONE, WDATE, AUTH, DEL) "
				+ " VALUES(?, ?, ?, ?, ?, SYSDATE, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;	
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S addEnterprise");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone());
			psmt.setInt(6, dto.getAuth());
			System.out.println("3/6 S addEnterprise");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S addEnterprise");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			
		} finally{
			DBConn.close(psmt, conn);			
			System.out.println("5/6 S addEnterprise");
		}		
		
		return count>0?true:false;
	}
	// 아이디 중복체크
	@Override
	public boolean idCheck(String id) {
		String sql = " SELECT ID "
				+ " FROM ENTERPRISE "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;		
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S idCheck");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("3/6 S idCheck");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S idCheck");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(psmt, conn);
			System.out.println("5/6 S idCheck");
		}
		
		
		return count>0?true:false;
	}
	// 이메일 중복체크
	@Override
	public boolean emailCheck(String email) {
		String sql = " SELECT EMAIL "
				+ " FROM ENTERPRISE "
				+ " WHERE EMAIL=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;		
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S emailCheck");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			System.out.println("3/6 S emailCheck");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S emailCheck");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(psmt, conn);
			System.out.println("5/6 S emailCheck");
		}		
		return count>0?true:false;
	}
	// 전화번호 중복체크
	@Override
	public boolean phoneCheck(String phone) {

		String sql = " SELECT PHONE "
				+ " FROM ENTERPRISE "
				+ " WHERE PHONE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;		
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S phoneCheck");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, phone);
			System.out.println("3/6 S phoneCheck");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S phoneCheck");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(psmt, conn);
			System.out.println("5/6 S phoneCheck");
		}
		return count>0?true:false;
	}
	// 업체등록 요청 리스트
	@Override
	public List<enterpriseDto> requestList() {
		String sql = " SELECT ID, PW, NAME, EMAIL, PHONE, WDATE, AUTH, DEL "
				+ " FROM ENTERPRISE "
				+ " WHERE AUTH=-1 "
				+ " ORDER BY WDATE ASC";
		
		List<enterpriseDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S requestList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S requestList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S requestList");
			
			while(rs.next()){
				int i = 1;
				
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);				
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String wdate = rs.getString(6);
				int auth = rs.getInt(7);
				int del = rs.getInt(8);
				
				list.add(new enterpriseDto(id, pw, name, email, phone, wdate, auth, del));
			}			
			System.out.println("5/6 S requestList");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S requestList");
		}				
		return list;
	}
	// 업체등록 요청에 대한 응답
	@Override
	public boolean req_answer(String id, int auth) {

		String sql = " UPDATE ENTERPRISE "
				+ " SET AUTH=? "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S req_answer");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, auth);
			psmt.setString(2, id);
			System.out.println("3/6 S req_answer");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S req_answer");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt, conn);
			System.out.println("5/6 S req_answer");
		}
		
		return count>0?true:false;	
	}
	
	
}


















