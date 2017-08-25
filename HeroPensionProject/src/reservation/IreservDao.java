package reservation;

import java.util.List;

public interface IreservDao {
	
	  public List<reservDto> getReservList(int seq_room);
	  public List<reservDto> getCalReservList(int seq_pen, String yyyyMM);

}
