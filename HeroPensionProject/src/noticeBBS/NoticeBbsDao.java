package noticeBBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class NoticeBbsDao implements INoticeBbsDao{
	private boolean isS = true;
	private static NoticeBbsDao noticeDao = null;
	private NoticeBbsDao() {DBConn.initConnect();}
	public static NoticeBbsDao getInstance() {
		if(noticeDao==null) noticeDao = new NoticeBbsDao();
		return noticeDao;
	}
	public void log(String msg) {
		if(isS) System.out.println(getClass() + ": " + msg);
	}
	public void log(String msg, Exception e) {
		if(isS) System.out.println(e + ": " +getClass() + ": " + msg);
	}
	@Override public List<NoticeBbsDto> getBbsList(PagingBean paging) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<NoticeBbsDto> list = new ArrayList<NoticeBbsDto>();

		try {
			conn = DBConn.getConnection();
			log("1/6 S getBbsList");
			
			String totalSql = " SELECT COUNT(SEQ_NOTICE) FROM NOTICEBBS ";			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			/*int totalCount = rs.next() ? rs.getInt(1):0;*/
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging, 10, 10);
			
			log("1.5/6 S getBbsList");
			
			psmt.close();
			rs.close();
			
			String sql = " SELECT * FROM "
					   + " (SELECT * FROM (SELECT * FROM NOTICEBBS ORDER BY REF ASC, STEP DESC) "
					   + " WHERE ROWNUM <= " + paging.getStartNum() + " ORDER BY REF DESC, STEP ASC) "
					   + " WHERE ROWNUM <= " + paging.getCountPerPage();
			
			System.out.println("paging.getStartNum():" + paging.getStartNum());
			System.out.println("paging.getCountPerPage():" + paging.getCountPerPage());
			
			psmt = conn.prepareStatement(sql);
			log("2/6 S getBbsList");
			
			rs = psmt.executeQuery();
			log("3/6 S getBbsList");

			while(rs.next()) {
				NoticeBbsDto dto = new NoticeBbsDto(
						rs.getInt("SEQ_NOTICE"),
						rs.getString("ID"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("REF"),
						rs.getInt("STEP"),
						rs.getInt("DEPTH"), 
						rs.getString("WDATE"),
						rs.getInt("DEL"),
						rs.getInt("READCOUNT")
						);
				list.add(dto);
			}
			log("4/6 S getBbsList");
		}catch (SQLException e) {
			log("SQL F getBbsList", e);
		}finally {
			DBConn.close(rs, psmt, conn);
			log("5/6 S getBbsList");
		}
		return list;
	}
	@Override public boolean writeBbs(NoticeBbsDto bbs) {
		String sql = " INSERT INTO NOTICEBBS "
				+ " (SEQ_NOTICE, ID, TITLE, CONTENT, "
				+ " REF, STEP, DEPTH, WDATE)"
				+ " VALUES(REVIEW_SEQ.NEXTVAL, ?, ?, ?, "	   // SEQ, ID, TITLE, CONTENT,
				+ " (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, "  // REF, STEP, DEPTH,
				+ " SYSDATE, 0, 0) ";	// WDATE, DEL, READCOUNT

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConn.getConnection();
			log("1/5 S DBConn writeBbs");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bbs.getId());
			psmt.setString(2, bbs.getTitle());
			psmt.setString(3, bbs.getContent());
			log("2/5 S psmt set writeBbs");

			count = psmt.executeUpdate();
			log("3/5 S executeUpdate writeBbs");

		}catch (SQLException e) {
			log("SQL F writeBbs", e);
		}finally {
			DBConn.close(psmt, conn);
			log("5/5 S writeBbs");
		}
		return count>0?true:false;
	}
	@Override public NoticeBbsDto getBbs(int seq) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		NoticeBbsDto dto = null;

		try {
			conn = DBConn.getConnection();
			log("1/6 S getBbs");
			
			String sql = " SELECT * FROM NOTICEBBS "
					   + " WHERE SEQ_NOTICE=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			log("2/6 S getBbs");
			
			rs = psmt.executeQuery();
			log("3/6 S getBbs");

			if(rs.next()) {
				dto = new NoticeBbsDto(
						rs.getInt("SEQ_NOTICE"),
						rs.getString("ID"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("REF"),
						rs.getInt("STEP"),
						rs.getInt("DEPTH"), 
						rs.getString("WDATE"),
						rs.getInt("DEL"),
						rs.getInt("READCOUNT")
						);
			}
			log("4/6 S getBbs");
		}catch (SQLException e) {
			log("SQL F getBbs", e);
		}finally {
			DBConn.close(rs, psmt, conn);
			log("5/6 S getBbs");
		}
		return dto;
	}
	@Override public void addReadcount(int seq) {
		String sql = " UPDATE NOTICEBBS SET READCOUNT = READCOUNT+1"
				   + " WHERE SEQ_NOTICE=? ";

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBConn.getConnection();
			log("2/6 S addReadcount");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			log("3/6 S addReadcount");

			psmt.executeUpdate();
			log("4/6 S addReadcount");
			log("5/6 S addReadcount");
		}catch (SQLException e) {
			log("SQL F addReadcount", e);
		}finally {
			DBConn.close(psmt, conn);
			log("6/6 S addReadcount");
		}
	}
	@Override public boolean updateBbs(NoticeBbsDto bbs, int seq) {
		String sql = " UPDATE NOTICEBBS SET TITLE=?, CONTENT=?"
				   + " WHERE SEQ_NOTICE=? ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		try {
			conn = DBConn.getConnection();
			log("2/6 S updateBbs");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bbs.getTitle());
			psmt.setString(2, bbs.getContent());
			psmt.setInt(3, seq);
			log("3/6 S updateBbs");

			count = psmt.executeUpdate();
			log("4/6 S updateBbs");
			log("5/6 S updateBbs");
		}catch (SQLException e) {
			log("SQL F updateBbs", e);
		}finally {
			DBConn.close(psmt, conn);
			log("6/6 S updateBbs");
		}
		return count>0?true:false;
		
	}
}
