package reservation;

import java.io.Serializable;

/*
DROP TABLE RESERVATION
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_RES;

CREATE TABLE RESERVATION (
SEQ_RES NUMBER(8) CONSTRAINT PK_RES PRIMARY KEY,
SEQ_PEN NUMBER(8) NOT NULL,
SEQ_ROOM NUMBER(8) NOT NULL,
ID VARCHAR2(20) NOT NULL,
CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL,
PERSON_TOTAL NUMBER(8) NOT NULL,
BBQ NUMBER(8) NOT NULL,
PRICE_RES NUMBER(8) NOT NULL,
DATE_RES DATE NOT NULL,
DEL_RES NUMBER(1) NOT NULL,
CONSTRAINT FK_RES_PEN FOREIGN KEY (SEQ_PEN) REFERENCES PENSION(SEQ_PEN),
CONSTRAINT FK_RES_ROOM FOREIGN KEY (SEQ_ROOM) REFERENCES ROOM(SEQ_ROOM),
CONSTRAINT FK_RES_ID FOREIGN KEY (ID) REFERENCES MEMBER(ID) 
);

CREATE SEQUENCE SEQ_RES
INCREMENT BY 1
START WITH 1;
*/

public class reservDto implements Serializable {
	
	private int seq_res;
	private int seq_pen;
	private int seq_room;
	private String id;
	private String checkin;
	private String checkout;
	private int person_total;
	private int bbq;
	private int price_res;
	private String date_res;
	private int del_res;
	public int getSeq_res() {
		return seq_res;
	}
	public void setSeq_res(int seq_res) {
		this.seq_res = seq_res;
	}
	public int getSeq_pen() {
		return seq_pen;
	}
	public void setSeq_pen(int seq_pen) {
		this.seq_pen = seq_pen;
	}
	public int getSeq_room() {
		return seq_room;
	}
	public void setSeq_room(int seq_room) {
		this.seq_room = seq_room;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getPerson_total() {
		return person_total;
	}
	public void setPerson_total(int person_total) {
		this.person_total = person_total;
	}
	public int getBbq() {
		return bbq;
	}
	public void setBbq(int bbq) {
		this.bbq = bbq;
	}
	public int getPrice_res() {
		return price_res;
	}
	public void setPrice_res(int price_res) {
		this.price_res = price_res;
	}
	public String getDate_res() {
		return date_res;
	}
	public void setDate_res(String date_res) {
		this.date_res = date_res;
	}
	public int getDel_res() {
		return del_res;
	}
	public void setDel_res(int del_res) {
		this.del_res = del_res;
	}
	@Override
	public String toString() {
		return "reservDto [seq_res=" + seq_res + ", seq_pen=" + seq_pen + ", seq_room=" + seq_room + ", id=" + id
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", person_total=" + person_total + ", bbq=" + bbq
				+ ", price_res=" + price_res + ", date_res=" + date_res + ", del_res=" + del_res + "]";
	}
}