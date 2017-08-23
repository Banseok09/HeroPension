package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;
import room.RoomDto;

public class reservDao implements IreservDao {
	
	private static reservDao resDao = null;
	
	public reservDao() {}
	
	// singleton 생성
	public static reservDao getInstance() {
		if (resDao == null) {
			resDao = new reservDao();
		}
		return resDao;		
	}

	@Override
	public List<reservDto> getReservList(int seq_room) {
		String sql = " SELECT SEQ_RES, SEQ_PEN, SEQ_ROOM, ID, CHECKIN, CHECKOUT, PERSON_TOTAL, BBQ, PRICE_RES, DATE_RES, DEL_RES "
				+ " FROM RESERVATION "
				+ " WHERE SEQ_ROOM=? ";		
		
		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		List<reservDto> list = new ArrayList<reservDto>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getReservList()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getReservList()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getReservList()");		
			
			while (rs.next()) {
				int i = 1;
				reservDto dto = new reservDto(
								rs.getInt(i++), // SEQ_RES
								rs.getInt(i++), // SEQ_PEN
								rs.getInt(i++), // SEQ_ROOM
								rs.getString(i++), // ID
								rs.getString(i++), // CHECKIN
								rs.getString(i++), // CHECKOUT
								rs.getInt(i++), // PERSON_TOTAL
								rs.getInt(i++), // BBQ
								rs.getInt(i++), // PRICE_RES
								rs.getString(i++), // DATE_RES
								rs.getInt(i++)); // DEL_RES
				
				list.add(dto);			
			}System.out.println("5/6 Success getReservList()");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getReservList()");
		}
		
		return list;
	}
	
	

	@Override
	public List<reservDto> getReservDay(String date) {
		String sql = " SELECT SEQ_RES, SEQ_PEN, SEQ_ROOM, ID, CHECKIN, CHECKOUT, PERSON_TOTAL, BBQ, PRICE_RES, DATE_RES, DEL_RES
				FROM RESERVATION
				WHERE (CHECKIN = NULL AND CHECKOUT = NULL) OR 
				(CHECKIN < TO_DATE((?), 'YYYY/DD/MM') AND CHECKOUT > TO_DATE((?), 'YYYY/DD/MM')) "";
		
		return null;
	}

	@Override
	public boolean addReserv(reservDto reservdto) {
		String sql = " INSERT INTO RESERVATION "
				+ " (SEQ_RES, SEQ_PEN, SEQ_ROOM, "
				+ " ID, CHECKIN, CHECKOUT, PERSON_TOTAL, "
				+ " BBQ, PRICE_RES, DATE_RES, DEL_RES) "
				+ " VALUES(SEQ_RES.NEXTVAL, ?, ?, "
				+ " ?, ?, ?, ?, "
				+ " ?, ?, SYSDATE, 0 "
				+ " WHERE SEQ_ROOM=? ";
		
		Connection conn = null;
        PreparedStatement psmt = null;
        
        int count = 0;
        
        try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S addReserv");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reservdto.getSeq_pen());
			psmt.setInt(2, reservdto.getSeq_room());
			psmt.setString(3, reservdto.getId());
			psmt.setString(4, reservdto.getCheckin());
			psmt.setString(5, reservdto.getCheckout());
			psmt.setInt(6, reservdto.getPerson_total());
			psmt.setInt(7, reservdto.getBbq());
			psmt.setInt(8, reservdto.getPrice_res());
			psmt.setInt(9, reservdto.getSeq_room());
			System.out.println("3/6 S addReserv");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S addReserv");			
		} catch (SQLException e) {
			e.printStackTrace();				
		} finally {
			DBConn.close(psmt, conn);
			System.out.println("6/6 S addReserv");
		}		
		return count>0?true:false;
	}	
	
	

}
