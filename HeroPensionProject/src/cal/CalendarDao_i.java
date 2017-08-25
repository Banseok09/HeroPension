package cal;

import java.util.List;

import bbs.BbsDto;

public interface CalendarDao_i {	
	public List<CalendarDto> getCalendarList(int seq_pen, String yyyyMM);	
	
	
	
	
/* 	public boolean addCalendar(CalendarDto cal);
	public List<CalendarDto> getCalendarList(String id, String yyyyMM);	
	public List<CalendarDto> getDayList(String id, String yyyyMMdd);
	public boolean deleteCalendar(int seq);
	public CalendarDto getDetail(int seq);
	public boolean updateCalendar(int seq,String title,String content);
*/	
}
