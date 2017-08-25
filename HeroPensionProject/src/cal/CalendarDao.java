package cal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bbs.BbsDto;
import jdbc.DBConn;
import member.MemberDto;

public class CalendarDao implements CalendarDao_i {
	
	private static CalendarDao calendarDao = null;
	
	public CalendarDao() {}
	
	public static CalendarDao getInstance(){
		if(calendarDao == null){
			calendarDao = new CalendarDao();
		}
		return calendarDao;
		
	}
	
	@Override
	public List<CalendarDto> getCalendarList(String seq_pen, String yyyyMM) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				   + " FROM (SELECT ROW_NUMBER()"
					   + " OVER(PARTITION BY SUBSTR(RDATE,1,8) "
					   + " ORDER BY RDATE ASC) RN, "
					   + " SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
					   + " FROM CALENDAR "
					   + " WHERE seq_pen=? AND SUBSTR(RDATE,1,6)=?) "
				   + " WHERE RN BETWEEN 1 AND 5";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getCalendarList()");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMM.trim());
			System.out.println("3/6 Success getCalendarList()");
			System.out.println("SQL : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getCalendarList()");
			
			while (rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRdate(rs.getString(5));
				dto.setWdate(rs.getString(6));				
				list.add(dto);
			}System.out.println("5/6 Success getCalendarList()");			
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getCalendarList()");
		}					   
		
		return list;
	}
	
	
/*	
	@Override
	public boolean addCalendar(CalendarDto cal) {
		
		String sql = " INSERT INTO CALENDAR( "
				   + " SEQ, ID, TITLE, CONTENT, RDATE, WDATE) "
				   + " VALUES(SEQ_CAL.NEXTVAL, ?, ?, ?, ?, SYSDATE)";		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success addCalendar()");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getId());
			psmt.setString(2, cal.getTitle());
			psmt.setString(3, cal.getContent());
			psmt.setString(4, cal.getRdate());
			System.out.println("3/6 Success addCalendar()");
			
			count =  psmt.executeUpdate();
			System.out.println("4/6 Success addCalendar()");			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt, conn);
			System.out.println("5/6 Success addCalendar()");	
		}
		
		return count>0 ? true : false;
	}
	
	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				   + " FROM (SELECT ROW_NUMBER()"
					   + " OVER(PARTITION BY SUBSTR(RDATE,1,8) "
					   + " ORDER BY RDATE ASC) RN, "
					   + " SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
					   + " FROM CALENDAR "
					   + " WHERE ID=? AND SUBSTR(RDATE,1,6)=?) "
				   + " WHERE RN BETWEEN 1 AND 5";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getCalendarList()");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMM.trim());
			System.out.println("3/6 Success getCalendarList()");
			System.out.println("SQL : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getCalendarList()");
			
			while (rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRdate(rs.getString(5));
				dto.setWdate(rs.getString(6));				
				list.add(dto);
			}System.out.println("5/6 Success getCalendarList()");			
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getCalendarList()");
		}					   
		
		return list;
	}
	
	@Override
	public List<CalendarDto> getDayList(String id, String yyyyMMdd) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				   + " FROM CALENDAR "
				   + " WHERE ID=? AND SUBSTR(RDATE, 1, 8)=? "
				   + " ORDER BY RDATE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getDayList()");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMMdd.trim());
			System.out.println("3/6 Success getDayList()");
			System.out.println("SQL : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getDayList()");
			
			while (rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRdate(rs.getString(5));
				dto.setWdate(rs.getString(6));				
				list.add(dto);
			}System.out.println("5/6 Success getDayList()");			
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getDayList()");
		}					   
		
		return list;
	}
	
	@Override
	public boolean deleteCalendar(int seq) {
		
		String sql = " DELETE FROM CALENDAR " +
					 " WHERE SEQ = " + seq;
		
		System.out.println("SQL" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success deleteCalendar()");
			
			psmt = conn.prepareStatement(sql);			
			System.out.println("3/6 Success deleteCalendar()");
			
			count =  psmt.executeUpdate();
			System.out.println("4/6 Success deleteCalendar()");			
			
		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(null, psmt, conn);
			System.out.println("5/6 Success deleteCalendar()");	
		}
		
		return count>0 ? true : false;
	}
	
	
	@Override
	public CalendarDto getDetail(int seq) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "  
				   + " FROM CALENDAR "  
	               + " WHERE SEQ = " + seq ;
		
		System.out.println("sql : " + sql);
	
		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;	
		
		CalendarDto dto = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getDetail()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getDetail()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getDetail()");	
			
						
			rs.next();
			dto = new CalendarDto();
			dto.setSeq(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setRdate(rs.getString(5));
			dto.setWdate(rs.getString(6));				
			
			
			System.out.println("5/6 Success getDayList()");	
			

			
		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getDetail()");	
		}				
		
		return dto;
	}
	
	
	@Override
	public boolean updateCalendar(int seq, String title, String content) {
		
		String sql = " UPDATE CALENDAR " +
				 " SET TITLE ='" + title + "', CONTENT = '" + content + "'" +          
				 " WHERE SEQ = " + seq;
	
		System.out.println("SQL" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success updateCalendar()");
			
			psmt = conn.prepareStatement(sql);			
			System.out.println("3/6 Success updateCalendar()");
			
			count =  psmt.executeUpdate();
			System.out.println("4/6 Success updateCalendar()");			
			
		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(null, psmt, conn);
			System.out.println("5/6 Success updateCalendar()");	
		}
		
		return count>0 ? true : false;
	}
*/
}
