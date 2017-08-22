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
	@Override public boolean writeBbs(ReviewBbsDto bbs) {
		String sql = " INSERT INTO REVIEWBBS "
				+ " (REVIEWBBS_SEQ, ID, TITLE, CONTENT, RATE, "
				+ " REF, STEP, DEPTH, ROOM_SEQ, WDATE)"
				+ " VALUES(REVIEWBBS_SEQ.NEXTVAL, ?, ?, ?, ? "	   // SEQ, ID, TITLE, CONTENT, RATE
				+ " (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, "  // REF, STEP, DEPTH,
				+ " ?, SYSDATE) ";	//  ROOM_SEQ, WDATE

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
			psmt.setInt(4, bbs.getRate());
			psmt.setInt(5, bbs.getRoom_seq());
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
	@Override public List<ReviewBbsDto> getReviewBbsList(PagingBean paging) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<ReviewBbsDto> list = new ArrayList<ReviewBbsDto>();

		try {
			conn = DBConn.getConnection();
			log("1/6 S getReviewBbsList");
			
			String totalSql = " SELECT COUNT(REVIEW_SEQ) FROM REVIEWBBS ";			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			/*int totalCount = rs.next() ? rs.getInt(1):0;*/
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging, 10, 10);
			
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
						rs.getInt("REVIEW_SEQ"),
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
}
