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
		 
		 System.out.println("sql: " + sql);

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
				
				PensionDto pension = new PensionDto(
							rs.getInt(i++), 	// SEQ_PEN
	                        rs.getString(i++), 	// ID
	                        rs.getString(i++), 	// NAME_PEN
	                        rs.getString(i++), 	// ADDRESS
	                        rs.getString(i++), 	// PHONE
	                        rs.getString(i++), 	// CHECKIN_TIME
	                        rs.getString(i++), 	// CHECKOUT_TIME
	                        rs.getInt(i++), 	// PICKUP 
	                        rs.getString(i++), 	// SEASON_START
	                        rs.getString(i++), 	// SEASON_END
	                        rs.getInt(i++), 	// PRICE_PERSON
	                        rs.getInt(i++), 	// PRICE_BBQ
	                        rs.getString(i++), 	// INFO_PEN
	                        rs.getString(i++), 	// DIRECTIONS
	                        rs.getString(i++), 	// x_coordinate
	                        rs.getString(i++), 	// Y_coordinate
	                        rs.getInt(i++)); 	// DEL_PEN
				
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

}
