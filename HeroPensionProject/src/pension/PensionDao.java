package pension;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class PensionDao implements IPensionDao {

	private static PensionDao pendao = null;

	public PensionDao() {
	}

	public static PensionDao getInstance() {
		if (pendao == null) {
			pendao = new PensionDao();
		}
		return pendao;
	}

	@Override
	public List<PensionDto> getPensionList() {
		String sql = " SELECT SEQ_PEN, ID, NAME_PEN, ADDRESS, PHONE, CHECKIN_TIME, CHECKOUT_TIME, PICKUP, "
				+ " SEASON_START, SEASON_END, PRICE_PERSON, PRICE_BBQ,"
				+ " INFO_PEN, DIRECTIONS, x_coordinate, Y_coordinate, DEL_PEN "
				+ " FROM PENSION ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<PensionDto> list = new ArrayList<>();

		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getPensionList()");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getPensionList()");

			rs = psmt.executeQuery();
			System.out.println("4/6 Success getPensionList()");

			while (rs.next()) {
				int i = 1;

				PensionDto pension = new PensionDto(rs.getInt(i++), // SEQ_PEN
						rs.getString(i++), // ID
						rs.getString(i++), // NAME_PEN
						rs.getString(i++), // ADDRESS
						rs.getString(i++), // PHONE
						rs.getString(i++), // CHECKIN_TIME
						rs.getString(i++), // CHECKOUT_TIME
						rs.getInt(i++), // PICKUP
						rs.getString(i++), // SEASON_START
						rs.getString(i++), // SEASON_END
						rs.getInt(i++), // PRICE_PERSON
						rs.getInt(i++), // PRICE_BBQ
						rs.getString(i++), // INFO_PEN
						rs.getString(i++), // DIRECTIONS
						rs.getString(i++), // x_coordinate
						rs.getString(i++), // Y_coordinate
						rs.getInt(i++)); // DEL_PEN

				list.add(pension);
			}
			System.out.println("5/6 S getPensionList");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getPensionList");
		}

		return list;
	}

	@Override
	public PensionDto getChoicePension(int seq_pen) {

		String sql = " SELECT SEQ_PEN, ID, NAME_PEN, ADDRESS, PHONE, CHECKIN_TIME, CHECKOUT_TIME, PICKUP, "
				+ " TO_CHAR(SEASON_START, 'YYYY-MM-DD'), TO_CHAR(SEASON_END, 'YYYY-MM-DD'), PRICE_PERSON, PRICE_BBQ, INFO_PEN, DIRECTIONS, x_coordinate, Y_coordinate, DEL_PEN "
				+ " FROM PENSION " 
				+ " WHERE SEQ_PEN = " + seq_pen;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		PensionDto dto = null;

		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getChoicePension()");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getChoicePension()");

			rs = psmt.executeQuery();
			System.out.println("4/6 Success getChoicePension()");

			while (rs.next()) {
				int i = 1;
				dto = new PensionDto(rs.getInt(i++), // SEQ_PEN
						rs.getString(i++), // ID
						rs.getString(i++), // NAME_PEN
						rs.getString(i++), // ADDRESS
						rs.getString(i++), // PHONE
						rs.getString(i++), // CHECKIN_TIME
						rs.getString(i++), // CHECKOUT_TIME
						rs.getInt(i++), // PICKUP
						rs.getString(i++), // SEASON_START
						rs.getString(i++), // SEASON_END
						rs.getInt(i++), // PRICE_PERSON
						rs.getInt(i++), // PRICE_BBQ
						rs.getString(i++), // INFO_PEN
						rs.getString(i++), // DIRECTIONS
						rs.getString(i++), // x_coordinate
						rs.getString(i++), // Y_coordinate
						rs.getInt(i++)); // DEL_PEN

			}
			System.out.println("5/6 Success getChoicePension()");

		} catch (SQLException e) {
			System.out.println(e.getMessage());

		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getChoicePension()");
		}

		return dto;
	}

	@Override
	public boolean addPension(PensionDto pen) {
		String sql = " INSERT INTO PENSION( "
				+ " SEQ_PEN, ID, NAME_PEN, ADDRESS, PHONE, CHECKIN_TIME, CHECKOUT_TIME,"
				+ " PICKUP, SEASON_START, SEASON_END, PRICE_PERSON, PRICE_BBQ, "
				+ "	INFO_PEN, DIRECTIONS, X_COORDINATE, Y_COORDINATE, DEL_PEN ) "
				+ " VALUES(SEQ_PEN.NEXTVAL, ?, ?, ?, ?, ?, ?,"
				+ " ?, ?, ?, ?, ?, "
				+ " ?, ?, ?, ?, 0 ) ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success addPension()");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pen.getId());
			psmt.setString(2, pen.getName_pen());
			psmt.setString(3, pen.getAddress());
			psmt.setString(4, pen.getPhone());
			psmt.setString(5, pen.getCheckin_time());
			psmt.setString(6, pen.getCheckout_time());
			psmt.setInt(7, pen.getPickup());
			psmt.setString(8, pen.getSeason_start());
			psmt.setString(9, pen.getSeason_end());
			psmt.setInt(10, pen.getPrice_person());
			psmt.setInt(11, pen.getPrice_person());
			psmt.setString(12, pen.getInfo_pen());
			psmt.setString(13, pen.getDirections());
			psmt.setString(14, pen.getX_coordinate());
			psmt.setString(15, pen.getY_coordinate());
			System.out.println("3/6 Success addPension()");

			count = psmt.executeUpdate();
			System.out.println("4/6 Success addPension()");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt, conn);
			System.out.println("5/6 Success addPension()");
		}

		return count > 0 ? true : false;
	}

	@Override
	public List<PensionDto> getMyPensionList(String id) {
		String sql = " SELECT SEQ_PEN, ID, NAME_PEN, ADDRESS, PHONE, CHECKIN_TIME, CHECKOUT_TIME, PICKUP, "
				+ " TO_CHAR(SEASON_START, 'YYYY-MM-DD'), TO_CHAR(SEASON_END, 'YYYY-MM-DD'),"
				+ " PRICE_PERSON, PRICE_BBQ, INFO_PEN, DIRECTIONS, x_coordinate, Y_coordinate, DEL_PEN "
				+ " FROM PENSION "
				+ " WHERE ID =? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<PensionDto> list = new ArrayList<>();

		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getIdPensionList()");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("3/6 Success getIdPensionList()");

			rs = psmt.executeQuery();
			System.out.println("4/6 Success getIdPensionList()");

			while (rs.next()) {
				int i = 1;
				PensionDto dto = new PensionDto(rs.getInt(i++), // SEQ_PEN
										rs.getString(i++), // ID
										rs.getString(i++), // NAME_PEN
										rs.getString(i++), // ADDRESS
										rs.getString(i++), // PHONE
										rs.getString(i++), // CHECKIN_TIME
										rs.getString(i++), // CHECKOUT_TIME
										rs.getInt(i++), // PICKUP
										rs.getString(i++), // SEASON_START
										rs.getString(i++), // SEASON_END
										rs.getInt(i++), // PRICE_PERSON
										rs.getInt(i++), // PRICE_BBQ
										rs.getString(i++), // INFO_PEN
										rs.getString(i++), // DIRECTIONS
										rs.getString(i++), // x_coordinate
										rs.getString(i++), // Y_coordinate
										rs.getInt(i++)); // DEL_PEN
				
				list.add(dto);
			}
			System.out.println("5/6 Success getIdPensionList()");

		} catch (SQLException e) {
			System.out.println(e.getMessage());

		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getIdPensionList()");
		}

		return list;
	}
	
	@Override
	public List<PensionDto> getMyPensionPagingList(PagingBean paging, String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PensionDto> penlist = new ArrayList<>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("1/6 S getMyPensionPagingList");
			
			String totalsql = " SELECT COUNT(SEQ_PEN) FROM PENSION ";
			psmt = conn.prepareStatement(totalsql);
			rs = psmt.executeQuery();
			
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging, 10, 5);
			
			psmt.close();
			rs.close();
			
			String sql = " SELECT * FROM "
					+ " (SELECT * FROM (SELECT * FROM PENSION ORDER SEQ_PEN )"
					+ " WHERE ROWNUM <=" + paging.getStartNum() + " ORDER SEQ_PEN ) "
					+ "	WHERE ROWNUM <= " + paging.getCountPerPage()
					+ "	 AND ID=? ";

			System.out.println("paging.getStartNum(): "+paging.getStartNum());
			System.out.println(" paging.getCountPerPage(): "+ paging.getCountPerPage());
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 S getMyPensionPagingList");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 S getMyPensionPagingList");
			
			while (rs.next()) {
				int i = 1;
				
				PensionDto dto =  new PensionDto(rs.getInt(i++), // SEQ_PEN
						rs.getString(i++), // ID
						rs.getString(i++), // NAME_PEN
						rs.getString(i++), // ADDRESS
						rs.getString(i++), // PHONE
						rs.getString(i++), // CHECKIN_TIME
						rs.getString(i++), // CHECKOUT_TIME
						rs.getInt(i++), // PICKUP
						rs.getString(i++), // SEASON_START
						rs.getString(i++), // SEASON_END
						rs.getInt(i++), // PRICE_PERSON
						rs.getInt(i++), // PRICE_BBQ
						rs.getString(i++), // INFO_PEN
						rs.getString(i++), // DIRECTIONS
						rs.getString(i++), // x_coordinate
						rs.getString(i++), // Y_coordinate
						rs.getInt(i++)); // DEL_PEN

				penlist.add(dto);
			}
			System.out.println("4/6 S getMyPensionPagingList");

			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("5/6 S getMyPensionPagingList");
		}
		
		return penlist;
	}
	
	//펜션 리스트 목록
	@Override
	public List<PensionDto> getPensionList() {
		
		List<PensionDto> list = new ArrayList<>();
		
		
		return list;
	}
	
	

}
