package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBConn;

public class MemberDao implements IMemberDao {
	
	public static MemberDao memberdao = null;
	
	private MemberDao() {DBConn.initConnect();}
	
	public static MemberDao getInstance(){
		if(memberdao == null){
			memberdao = new MemberDao();
		}
		return memberdao;		
	}

	//�α��� Ȯ��
	@Override
	public MemberDTO login(String id, String pw) {
		
		String sql = " SELECT ID, PW, NAME, EMAIL, PHONE, AUTH, DEL "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PW=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDTO mem = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S login");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			System.out.println("3/6 S login");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S login");
			
			while(rs.next()){
				int i = 1;
				
				String _id = rs.getString(i++);
				String _pw = rs.getString(i++);
				String name = rs.getString(i++);
				String email = rs.getString(i++);
				String phone = rs.getString(i++);
				int auth = rs.getInt(i++);
				int del = rs.getInt(i++);
				
				mem = new MemberDTO(_id, _pw, name, email, phone, auth, del);				
			}
			System.out.println("5/6 S login");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S login");
		}
		
		return mem;
	}

	
	// 회원가입
	@Override
	public boolean addMember(MemberDTO dto) {
		
		String sql = " INSERT INTO MEMBER "
				+ " (ID, PW, NAME, EMAIL, PHONE, AUTH, DEL) "
				+ " VALUES(?, ?, ?, ?, ?, 3, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;	
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S addMember");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone());
			System.out.println("3/6 S addMember");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S addMember");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			
		} finally{
			DBConn.close(psmt, conn);			
			System.out.println("5/6 S addMember");
		}		
		
		return count>0?true:false;
	}

	// 회원 수정
	@Override
	public boolean updateMem(String id,String pw, String name, String phone, String email) {
		
		String sql = " UPDATE MEMBER "
				+ " SET PW=?, NAME=?, PHONE=?, EMAIL=? "
				+ " WHERE ID=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S updateMem");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, name);
			psmt.setString(3, phone);
			psmt.setString(4, email);
			psmt.setString(5, id);
			System.out.println("3/6 S updateMem");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S updateMem");			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBConn.close(psmt, conn);
			System.out.println("6/6 S updateMem");
		}
		
		return count>0?true:false;
	}
	
	// 아이디 중복 체크 
	@Override
	public boolean idCheck(String id) {
		
		String sql = " SELECT ID "
				+ " FROM MEMBER "
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
	// 이메일 중복 체크
	@Override
	public boolean emailCheck(String email) {
		String sql = " SELECT EMAIL "
				+ " FROM MEMBER "
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
	// 전화번호 중복 체크
	@Override
	public boolean phoneCheck(String phone) {
		
		String sql = " SELECT PHONE "
				+ " FROM MEMBER "
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
	
	
	
	
	
	
	
	
	
	
	
	

}











