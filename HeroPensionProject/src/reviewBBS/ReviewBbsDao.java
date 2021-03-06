package reviewBBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class ReviewBbsDao implements IReviewBbsDao{
	private boolean isS = true;
	private static ReviewBbsDao reviewDao = null;
	private ReviewBbsDao() {DBConn.initConnect();}
	public static ReviewBbsDao getInstance() {
		if(reviewDao==null) reviewDao = new ReviewBbsDao();
		return reviewDao;
	}
	public void log(String msg) {
		if(isS) System.out.println(getClass() + ": " + msg);
	}
	public void log(String msg, Exception e) {
		if(isS) System.out.println(e + ": " +getClass() + ": " + msg);
	}
	@Override public List<ReviewBbsDto> getBbsList(PagingBean paging) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();

		try {
			conn = DBConn.getConnection();
			log("1/6 S getReviewBbsList");
			
			String totalSql = " SELECT COUNT(SEQ_REVIEW) FROM REVIEWBBS ";			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			/*int totalCount = rs.next() ? rs.getInt(1):0;*/
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging, 10, 10);
			System.out.println("paging.getCountPerPage()"+ paging.getCountPerPage());
			System.out.println("paging.getBlockCount()"+ paging.getBlockCount());
			log("1.5/6 S getReviewBbsList");
			
			psmt.close();
			rs.close();
			
			String sql = " SELECT * FROM "
					   + " (SELECT * FROM (SELECT * FROM REVIEWBBS ORDER BY REF ASC, STEP DESC) "
					   + " WHERE ROWNUM <= " + paging.getStartNum() + " ORDER BY REF DESC, STEP ASC) "
					   + " WHERE ROWNUM <= " + paging.getCountPerPage();
			
			System.out.println("paging.getStartNum():" + paging.getStartNum());
			System.out.println("paging.getCountPerPage():" + paging.getCountPerPage());
			
			psmt = conn.prepareStatement(sql);
			log("2/6 S getReviewBbsList");
			
			rs = psmt.executeQuery();
			log("3/6 S getReviewBbsList");

			while(rs.next()) {
				ReviewBbsDto dto = new ReviewBbsDto(
						rs.getInt("SEQ_REVIEW"),
						rs.getString("ID"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("RATE"),
						rs.getInt("REF"),
						rs.getInt("STEP"),
						rs.getInt("DEPTH"),
						rs.getInt("ROOM_SEQ"),  
						rs.getString("WDATE"),
						rs.getInt("DEL"),
						rs.getInt("READCOUNT")
						);
				list.add(dto);
			}
			log("4/6 S getReviewBbsList");
		}catch (SQLException e) {
			log("SQL F getReviewBbsList", e);
		}finally {
			DBConn.close(rs, psmt, conn);
			log("5/6 S getReviewBbsList");
		}
		return list;
	}
	@Override public boolean writeBbs(ReviewBbsDto bbs) {
		String sql = " INSERT INTO REVIEWBBS "
				+ " (SEQ_REVIEW, ID, TITLE, CONTENT, RATE, "
				+ " REF, STEP, DEPTH, SEQ_PEN, WDATE, DEL, READCOUNT)"
				+ " VALUES(SEQ_REVIEW.NEXTVAL, ?, ?, ?, ?, "	   // SEQ, ID, TITLE, CONTENT, RATE
				+ " (SELECT NVL(MAX(REF), 0)+1 FROM REVIEWBBS), 0, 0, "  // REF, STEP, DEPTH,
				+ " ?, SYSDATE, 0, 0) ";	//  SEQ_PEN, WDATE, DEL, READCOUNT

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConn.getConnection();
			log("1/4 S DBConn writeBbs");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bbs.getId());
			psmt.setString(2, bbs.getTitle());
			psmt.setString(3, bbs.getContent());
			psmt.setInt(4, bbs.getRate());
			psmt.setInt(5, bbs.getSeq_pen());  
			log("2/4 S psmt set writeBbs");

			count = psmt.executeUpdate();
			log("3/4 S executeUpdate writeBbs");

		}catch (SQLException e) {
			log("SQL F writeBbs", e);
		}finally {
			DBConn.close(psmt, conn);
			log("4/4 S writeBbs");
		}
		return count>0?true:false;
	}
	@Override public ReviewBbsDto getBbs(int seq) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		ReviewBbsDto dto = null;

		try {
			conn = DBConn.getConnection();
			log("1/6 S getBbs");
			
			String sql = " SELECT * FROM REVIEWBBS "
					   + " WHERE SEQ_REVIEW=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			log("2/6 S getBbs");
			
			rs = psmt.executeQuery();
			log("3/6 S getBbs");

			if(rs.next()) {
				dto = new ReviewBbsDto(
						rs.getInt("SEQ_REVIEW"),
						rs.getString("ID"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("RATE"),
						rs.getInt("REF"),
						rs.getInt("STEP"),
						rs.getInt("DEPTH"),
						rs.getInt("SEQ_PEN"),  
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
		String sql = " UPDATE REVIEWBBS SET READCOUNT = READCOUNT+1"
				   + " WHERE SEQ_REVIEW=? ";

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
	@Override public boolean updateBbs(ReviewBbsDto bbs, int seq) {
		String sql = " UPDATE REVIEWBBS SET TITLE=?, CONTENT=?"
				   + " WHERE SEQ_REVIEW=? ";

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
	@Override public boolean deleteBbs(int seq) {
		String sql = " DELETE FROM REVIEWBBS "
				   + " WHERE SEQ_REVIEW=? ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConn.getConnection();
			log("1/5 S DBConn deleteBbs");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			log("2/5 S psmt set deleteBbs");

			count = psmt.executeUpdate();
			log("3/5 S executeUpdate deleteBbs");

		}catch (SQLException e) {
			log("SQL F deleteBbs", e);
		}finally {
			DBConn.close(psmt, conn);
			log("4/5 S deleteBbs");
			log("5/5 S deleteBbs");
		}
		return count>0?true:false;
	}
	@Override public List<ReviewBbsDto> getBbsList(PagingBean paging, String search_type, String search_key) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();
		// Search옵션과 값 설정
					String where_sql = "";
					switch (search_type) {
					case "id":
						where_sql = " WHERE ID = '" + search_key+"' ";
						break;
					case "title" :
						where_sql = " WHERE TITLE LIKE '%" + search_key + "%' ";
						break;
					case "content" :
						where_sql = " WHERE CONTENT LIKE '%" + search_key + "%' ";
						break;
					default:
						where_sql="";
					}
					if(search_key==null || search_key.equals("")) where_sql="";
					
		try {
			conn = DBConn.getConnection();
			log("1/6 S getReviewBbsList");
			
			String totalSql = " SELECT COUNT(SEQ_REVIEW) FROM REVIEWBBS " + where_sql;			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			/*int totalCount = rs.next() ? rs.getInt(1):0;*/
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging, 10, 10);
			System.out.println("paging.getCountPerPage()"+ paging.getCountPerPage());
			System.out.println("paging.getBlockCount()"+ paging.getBlockCount());
			log("1.5/6 S getReviewBbsList");
			
			psmt.close();
			rs.close();
			
			
			
			String sql = " SELECT * FROM "
					   + " (SELECT * FROM (SELECT * FROM REVIEWBBS "+ where_sql +" ORDER BY REF ASC, STEP DESC) "
					   + " WHERE ROWNUM <= " + paging.getStartNum() + " ORDER BY REF DESC, STEP ASC) "
					   + " WHERE ROWNUM <= " + paging.getCountPerPage();
			
			System.out.println("paging.getStartNum():" + paging.getStartNum());
			System.out.println("paging.getCountPerPage():" + paging.getCountPerPage());
			
			psmt = conn.prepareStatement(sql);
			log("2/6 S getReviewBbsList");
			
			System.out.println("sql:" + sql);
			
			rs = psmt.executeQuery();
			log("3/6 S getReviewBbsList");

			while(rs.next()) {
				ReviewBbsDto dto = new ReviewBbsDto(
						rs.getInt("SEQ_REVIEW"),
						rs.getString("ID"),
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getInt("RATE"),
						rs.getInt("REF"),
						rs.getInt("STEP"),
						rs.getInt("DEPTH"),
						rs.getInt("SEQ_PEN"),  
						rs.getString("WDATE"),
						rs.getInt("DEL"),
						rs.getInt("READCOUNT")
						);
				list.add(dto);
			}
			log("4/6 S getReviewBbsList");
		}catch (SQLException e) {
			log("SQL F getReviewBbsList", e);
		}finally {
			DBConn.close(rs, psmt, conn);
			log("5/6 S getReviewBbsList");
		}
		return list;
	}
	
	@Override public String getPensionName(int seq_pen){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String pension_name = null;

		try {
			conn = DBConn.getConnection();
			log("1/5 S getPensionName");
			
			String sql = " SELECT NAME_PEN FROM PENSION "
					   + " WHERE SEQ_PEN=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq_pen);
			log("2/5 S getPensionName");
			
			rs = psmt.executeQuery();
			log("3/5 S getPensionName");

			if(rs.next()) {
				pension_name = rs.getString("NAME_PEN");
			}
			log("4/5 S getPensionName");
		}catch (SQLException e) {
			log("SQL F getBbs", e);
		}finally {
			DBConn.close(rs, psmt, conn);
			log("5/5 S getPensionName");
		}
		return pension_name;
	}
}
