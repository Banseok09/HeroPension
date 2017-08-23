package roomIMG;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class RoomImgDao implements IRoomImg {
	
	private static RoomImgDao roomImgDao = null;
	
	public RoomImgDao() { }
	
	public static RoomImgDao getInstance(){
		if(roomImgDao == null){
			roomImgDao = new RoomImgDao();
		}
		return roomImgDao;
	}
	
	@Override
	public List<RoomImgDto> getRoomImgList(int seq_room) {
		
		String sql = " SELECT SEQ_IMG_ROOM, SEQ_ROOM, IMG_NAME_ROOM, IMG_SRC_ROOM "
	               + " FROM ROOM_IMG " 
	               + " ORDER BY SEQ_IMG_ROOM";

		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		List<RoomImgDto> list = new ArrayList<RoomImgDto>();	
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getRoomImgList()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getRoomImgList()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getRoomImgList()");		
			
			while (rs.next()) {
				int i = 1;
				RoomImgDto dto = new RoomImgDto(rs.getInt(i++), //SEQ_IMG_ROOM
							 					rs.getInt(i++), //SEQ_ROOM
							 					rs.getString(i++), //IMG_NAME_ROOM
							 					rs.getString(i++)); //IMG_SRC_ROOM
				list.add(dto);				
			}System.out.println("5/6 Success getRoomImgList()");				

		} catch (SQLException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getRoomImgList()");	
		}
		
		return list;
	}

}
