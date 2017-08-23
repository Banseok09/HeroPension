package reservation;

import java.util.List;

import room.RoomDto;

public interface IreservDao {
	
<<<<<<< HEAD
	// 펜션 방 리스트 가져오기
	public List<reservDto> getReservList(int seq_room);
	
	// 펜션 방 특정 날짜 리스트 가져오기
	public List<reservDto> getReservDay(String date);
	
=======
	// 펜션 방 예약정보 리스트 가져오기
	public List<reservDto> getReservList(int seq_room);
	
>>>>>>> ad3b5eeb71b51e63758887854f2630a8604cf4ea
	// 예약하기
	public boolean addReserv(reservDto reservdto);
}
