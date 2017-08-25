package login_log;

import java.io.Serializable;

public class login_logDto implements Serializable {

	private String id;
	private String vdate;
	private int todaycount;
	private int totalcount;
	
	public login_logDto() {}

	public String getId() {return id;}
	public String getVdate() {return vdate;}
	public int getTodaycount() {return todaycount;}
	public int getTotalcount() {return totalcount;}

	public void setId(String id) {this.id = id;}
	public void setVdate(String vdate) {this.vdate = vdate;}
	public void setTodaycount(int todaycount) {this.todaycount = todaycount;}
	public void setTotalcount(int totalcount) {this.totalcount = totalcount;}

	@Override
	public String toString() {
		return "login_logDto [id=" + id + ", vdate=" + vdate + ", todaycount=" + todaycount + ", totalcount="
				+ totalcount + "]";
	}
	
	
	
	
}
