package pensionIMG;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class PensionImgDao implements IPensionImgDao {
	
	private static PensionImgDao roomImgDao = null;
	
	public PensionImgDao() { }
	
	public static PensionImgDao getInstance(){
		if(roomImgDao == null){
			roomImgDao = new PensionImgDao();
		}
		return roomImgDao;
	}
	
	@Override
	public List<PensionImgDto> getPensionImg(int seq_pen) {
		
		String sql = " SELECT SEQ_IMG_PEN, SEQ_PEN, IMG_NAME_PEN, IMG_SRC_PEN "
	               + " FROM PENSION_IMG "
	               + " WHERE SEQ_PEN="+seq_pen 
	               + " ORDER BY SEQ_IMG_PEN";

		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;		
			
		List<PensionImgDto> list = new ArrayList<PensionImgDto>();	
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getPensionImg()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getPensionImg()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getPensionImg()");		
			
			rs.next();
			
			while (rs.next()) {
				int i = 1;
				PensionImgDto dto = new PensionImgDto(
											rs.getInt(i++), //SEQ_IMG_PEN
											rs.getInt(i++), //SEQ_PEN
											rs.getString(i++), //IMG_NAME_PEN
											rs.getString(i++)); //IMG_SRC_PEN
				list.add(dto);				
			}
			System.out.println("5/6 Success getPensionImg()");				
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getPensionImg()");	
		}
		
		return list;
	}
	
	 @Override
	public PensionImgDto getPensionMainImg(int seq_pen) {
			
		String sql = " SELECT SEQ_IMG_PEN, SEQ_PEN, IMG_NAME_PEN, IMG_SRC_PEN "
	               + " FROM PENSION_IMG "
	               + " WHERE SEQ_PEN="+seq_pen
	               + "	AND IMG_NAME_PEN like '%00.jpg' "
	               + " ORDER BY SEQ_IMG_PEN";
	
		Connection conn = null;
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		PensionImgDto dto = new PensionImgDto();
			
		System.out.println("sql: "+sql);
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 Success getPensionMainImg()");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getPensionMainImg()");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getPensionMainImg()");		
			
			rs.next();
			
			while (rs.next()) {
				int i = 1;
				
				dto.setSeq_img_pen(rs.getInt(i++)); 	//SEQ_IMG_PEN
				dto.setSeq_pen(rs.getInt(i++)); 		//SEQ_PEN
				dto.setImg_name_pen(rs.getString(i++));	//IMG_NAME_PEN
				dto.setImg_src_pen(rs.getString(i++)); 	//IMG_SRC_PEN
			}
			System.out.println("5/6 Success getPensionMainImg()");				
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 Success getPensionMainImg()");	
		}
	
		return dto;
	}

}
