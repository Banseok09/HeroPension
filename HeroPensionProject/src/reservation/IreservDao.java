package reservation;

import java.util.List;

import room.RoomDto;

public interface IreservDao {
	
	// 펜션 방 리스트 가져오기
	public List<reservDto> getReservList(int seq_room);
	
	// 펜션 방 특정 날짜 리스트 가져오기
	public List<reservDto> getReservDay(String date);
	
	// 예약하기
	public boolean addReserv(reservDto reservdto);
}
