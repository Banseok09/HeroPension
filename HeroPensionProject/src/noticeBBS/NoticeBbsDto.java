package noticeBBS;

import java.io.Serializable;

public class NoticeBbsDto implements Serializable{
	private static final long serialVersionUID = 1L;
	private int review_seq;
	private String id;
	private String title;
	private String content;
	private int rate;
	private int ref;
	private int step;
	private int depth;
	private int room_seq;
	private String wdate;
	private int del;
	private int readcount;
	public NoticeBbsDto(int review_seq, String id, String title, String content, int rate, int ref, int step,
			int depth, int room_seq, String wdate, int del, int readcount) {
		super();
		this.review_seq = review_seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rate = rate;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.room_seq = room_seq;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}
	public int getReview_seq() {  return review_seq; }
	public String getId() {  return id;  }
	public String getTitle() { return title; }
	public String getContent() {  return content;  }
	public int getRate() {  return rate;  }
	public int getRef() {  return ref;  }
	public int getStep() {  return step;  }
	public int getDepth() {  return depth;  }
	public int getRoom_seq() {  return room_seq;  }
	public String getWdate() {  return wdate;  }
	public int getDel() {  return del;  }
	public int getReadcount() {  return readcount;  }
	public void setReview_seq(int review_seq) {  this.review_seq = review_seq;  }
	public void setId(String id) {  this.id = id;  }
	public void setTitle(String title) {  this.title = title;  }
	public void setContent(String content) {  this.content = content;  }
	public void setRate(int rate) {  this.rate = rate;  }
	public void setRef(int ref) {  this.ref = ref;  }
	public void setStep(int step) {  this.step = step;  }
	public void setDepth(int depth) {  this.depth = depth;  }
	public void setRoom_seq(int room_seq) {  this.room_seq = room_seq;  }
	public void setWdate(String wdate) {  this.wdate = wdate; }
	public void setDel(int del) {  this.del = del; }
	public void setReadcount(int readcount) { this.readcount = readcount; }
	@Override public String toString() {
		return "ReviewBbsDto [review_seq=" + review_seq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", rate=" + rate + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", room_seq=" + room_seq
				+ ", wdate=" + wdate +", del=" + del + ", readcount=" + readcount + "]";
	}
	
	
	
	
	
	
}
