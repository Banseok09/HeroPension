package reviewBBS;

import java.io.Serializable;

public class ReviewBbsDto implements Serializable{
	private static final long serialVersionUID = 1L;
	private int seq_review;
	private String id;
	private String title;
	private String content;
	private int rate;
	private int ref;
	private int step;
	private int depth;
	private int seq_pen;
	private String wdate;
	private int del;
	private int readcount;
	public ReviewBbsDto(int seq_review, String id, String title, String content, int rate, int ref, int step,
			int depth, int seq_pen, String wdate, int del, int readcount) {
		this.seq_review = seq_review;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rate = rate;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.seq_pen = seq_pen;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}
	public ReviewBbsDto(String id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	public ReviewBbsDto(int seq_pen, String id, String title, String content, int rate) {
		this.seq_pen = seq_pen;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rate = rate;
	}
	public int getSeq_review() {  return seq_review; }
	public String getId() {  return id;  }
	public String getTitle() { return title; }
	public String getContent() {  return content;  }
	public int getRate() {  return rate;  }
	public int getRef() {  return ref;  }
	public int getStep() {  return step;  }
	public int getDepth() {  return depth;  }
	public int getSeq_pen() {  return seq_pen;  }
	public String getWdate() {  return wdate;  }
	public int getDel() {  return del;  }
	public int getReadcount() {  return readcount;  }
	public void setSeq_review(int seq_review) {  this.seq_review = seq_review;  }
	public void setId(String id) {  this.id = id;  }
	public void setTitle(String title) {  this.title = title;  }
	public void setContent(String content) {  this.content = content;  }
	public void setRate(int rate) {  this.rate = rate;  }
	public void setRef(int ref) {  this.ref = ref;  }
	public void setStep(int step) {  this.step = step;  }
	public void setDepth(int depth) {  this.depth = depth;  }
	public void setSeq_pen(int seq_pen) {  this.seq_pen = seq_pen;  }
	public void setWdate(String wdate) {  this.wdate = wdate; }
	public void setDel(int del) {  this.del = del; }
	public void setReadcount(int readcount) { this.readcount = readcount; }
	@Override public String toString() {
		return "ReviewBbsDto [seq_review=" + seq_review + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", rate=" + rate + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", seq_pen=" + seq_pen
				+ ", wdate=" + wdate +", del=" + del + ", readcount=" + readcount + "]";
	}
	
	
	
	
	
	
}
