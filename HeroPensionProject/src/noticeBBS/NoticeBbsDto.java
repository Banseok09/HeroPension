package noticeBBS;

import java.io.Serializable;

public class NoticeBbsDto implements Serializable{
	private static final long serialVersionUID = 1L;
	private int notice_seq;
	private String id;
	private String title;
	private String content;
	private int ref;
	private int step;
	private int depth;
	private String wdate;
	private int del;
	private int readcount;
	public NoticeBbsDto(int notice_seq, String id, String title, String content, int ref, int step,
			int depth, String wdate, int del, int readcount) {
		super();
		this.notice_seq = notice_seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}
	public int getNotice_seq() {  return notice_seq; }
	public String getId() {  return id;  }
	public String getTitle() { return title; }
	public String getContent() {  return content;  }
	public int getRef() {  return ref;  }
	public int getStep() {  return step;  }
	public int getDepth() {  return depth;  }
	public String getWdate() {  return wdate;  }
	public int getDel() {  return del;  }
	public int getReadcount() {  return readcount;  }
	public void setNotice_seq(int notice_seq) {  this.notice_seq = notice_seq;  }
	public void setId(String id) {  this.id = id;  }
	public void setTitle(String title) {  this.title = title;  }
	public void setContent(String content) {  this.content = content;  }
	public void setRef(int ref) {  this.ref = ref;  }
	public void setStep(int step) {  this.step = step;  }
	public void setDepth(int depth) {  this.depth = depth;  }
	public void setWdate(String wdate) {  this.wdate = wdate; }
	public void setDel(int del) {  this.del = del; }
	public void setReadcount(int readcount) { this.readcount = readcount; }
	@Override public String toString() {
		return "ReviewBbsDto [notice_seq=" + notice_seq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", wdate=" + wdate +", del=" + del + ", readcount=" + readcount + "]";
	}
	
	
	
	
	
	
}
