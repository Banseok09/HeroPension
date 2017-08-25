package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

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
      String sql = " SELECT SEQ_RES, SEQ_PEN, SEQ_ROOM, NAME_PEN, NAME_ROOM ID, CHECKIN, CHECKOUT, PERSON_TOTAL, BBQ, PRICE_RES, DATE_RES, DEL_RES "
            + " FROM RESERVATION R, PENSION P "
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
                        rs.getString(i++), // NAME_PEN
                        rs.getString(i++), // NAME_ROOM
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
  public List<reservDto> getCalReservList(int seq_pen, String yyyyMM) {
/*    
   String sql = " SELECT SEQ_RES, SEQ_PEN, SEQ_ROOM, ID, CHECKIN, CHECKOUT, PERSON_TOTAL, BBQ, PRICE_RES, DATE_RES, DEL_RES "
             + " FROM RESERVATION "
             + " WHERE SEQ_ROOM=? ";      
  
	String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
			   + " FROM (SELECT ROW_NUMBER()"
				   + " OVER(PARTITION BY SUBSTR(RDATE,1,8) "
				   + " ORDER BY RDATE ASC) RN, "
				   + " SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				   + " FROM CALENDAR "
				   + " WHERE seq_pen=? AND SUBSTR(RDATE,1,6)=?) "
			   + " WHERE RN BETWEEN 1 AND 5";
*/  
   
	String sql = " SELECT SEQ_RES, SEQ_PEN, SEQ_ROOM, NAME_ROOM, ID, TO_CHAR(CHECKIN,'yyyymmdd'), TO_CHAR(CHECKOUT,'yyyymmdd'), PERSON_TOTAL, BBQ, PRICE_RES,DATE_RES, DEL_RES "
			   + " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(DATE_RES,1,8) ORDER BY DATE_RES ASC) RN, SEQ_RES, RE.SEQ_PEN, RE.SEQ_ROOM, NAME_ROOM, RE.ID, CHECKIN, CHECKOUT, PERSON_TOTAL, BBQ, PRICE_RES, DATE_RES, DEL_RES "
			   		  + " FROM RESERVATION RE, ROOM RO "
			   		  + " WHERE RE.SEQ_PEN=? AND SUBSTR(DATE_RES,1,6)=?) "
			   + " WHERE RN BETWEEN 1 AND 5 ";
	
	System.out.println("[getCalReservList SQL]" + sql);
	System.out.println("seq_pen : " + seq_pen);
	System.out.println("yyyyMM : " + yyyyMM );
	
	
   
   
      Connection conn = null;
      PreparedStatement psmt = null;   
      ResultSet rs = null;
      
      List<reservDto> list = new ArrayList<reservDto>();
      
      try {
         conn = DBConn.getConnection();
         System.out.println("2/6 Success getCalReservList()");
         
         psmt = conn.prepareStatement(sql);
		 psmt.setInt(1, seq_pen);
		 psmt.setString(2, yyyyMM.trim());
         System.out.println("3/6 Success getCalReservList()");
         
         rs = psmt.executeQuery();
         System.out.println("4/6 Success getCalReservList()");      
         
         while (rs.next()) {
            int i = 1;
            reservDto dto = new reservDto(
                        rs.getInt(i++), // SEQ_RES
                        rs.getInt(i++), // SEQ_PEN
                        rs.getInt(i++), // SEQ_ROOM
                        rs.getString(i++), // NAME_ROOM
                        rs.getString(i++), // ID
                        rs.getString(i++), // CHECKIN
                        rs.getString(i++), // CHECKOUT
                        rs.getInt(i++), // PERSON_TOTAL
                        rs.getInt(i++), // BBQ
                        rs.getInt(i++), // PRICE_RES
                        rs.getString(i++), // DATE_RES
                        rs.getInt(i++)); // DEL_RES
            
            list.add(dto);         
         }System.out.println("5/6 Success getCalReservList()");
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConn.close(rs, psmt, conn);
         System.out.println("6/6 Success getCalReservList()");
      }
      
      return list;
   }

}
