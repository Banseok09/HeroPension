package room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;


public class RoomDao implements RoomDao_i {
	
	private static RoomDao roomDao = null;
	
	public RoomDao() { }
	
	public static RoomDao getInstance(){
		if(roomDao == null){
			roomDao = new RoomDao();
		}
		return roomDao;
	}
	
	@Override
	public List<RoomDto> getRoomList(int seq_pen) {
		
		String sql = " SELECT SEQ_ROOM, NAME_ROOM, TYPE_ROOM, SIZE_ROOM, PERSON_MIN, PERSON_MAX, "
				          + " PRICE_BASIC, PRICE_WEEKEND, PRICE_SEASON_BASIC, PRICE_SEASON_WEEKEND, "
				          + " INFO_ROOM, ITEM, SEQ_PEN, DEL_ROOM " 
	               + " FROM ROOM " 
	               + " ORDER BY SEQ_ROOM";
		
/*		
		private int seq_room;
		private String name_room;
		private String type_room;
		private String size_room;
		private int person_min;
		private int person_max;
		private int price_basic;
		private int price_weekend;
		private int price_season_basic;
		private int price_season_weekend;
		private String info_room;
		private String item;
		private int seq_pen;
		private int del_room;
*/
	
		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		List<RoomDto> list = new ArrayList<RoomDto>();	
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getRoomList()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getRoomList()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getRoomList()");		
			
			while (rs.next()) {
				int i = 1;
				RoomDto dto = new RoomDto(rs.getInt(i++), //SEQ_ROOM
										  rs.getString(i++), //NAME_ROOM
										  rs.getString(i++), //TYPE_ROOM
										  rs.getString(i++), //SIZE_ROOM 
										  rs.getInt(i++), //PERSON_MIN
										  rs.getInt(i++), //PERSON_MAX
										  rs.getInt(i++), //PRICE_BASIC
										  rs.getInt(i++), //PRICE_WEEKEND
										  rs.getInt(i++), //PRICE_SEASON_BASIC
										  rs.getInt(i++), //PRICE_SEASON_WEEKEND
										  rs.getString(i++), //INFO_ROOM 
									  	  rs.getString(i++), //ITEM
										  rs.getInt(i++), //SEQ_PEN 
										  rs.getInt(i++)); //DEL_ROOM
				list.add(dto);				
			}System.out.println("5/6 Success getRoomList()");	
			
			

		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getRoomList()");	
		}
		
		return list;
	}

}
