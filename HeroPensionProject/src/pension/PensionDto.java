package pension;

import java.io.Serializable;
/*
DROP TABLE PENSION
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_PEN;

CREATE TABLE PENSION(
	SEQ_PEN NUMBER(8) PRIMARY KEY,		-- 펜션 seq
	ID VARCHAR2(20) NOT NULL,			-- 펜션주인(업체) ID
	NAME_PEN VARCHAR2(20) NOT NULL,		-- 펜션이름
	ADDRESS VARCHAR2(100) NOT NULL,		-- 펜션주소
	PHONE VARCHAR2(20) NOT NULL,		-- 펜션전화번호
	CHECKIN_TIME VARCHAR2(20) NOT NULL,		-- 체크인 시간
	CHECKOUT_TIME VARCHAR2(20) NOT NULL,	-- 체크아웃 시간
	PICKUP NUMBER(1) NOT NULL, 			-- 픽업여부(0: 픽업가능 1: 불가능)
	SEASON_START DATE NOT NULL,			-- 성수기 시작일
	SEASON_END DATE NOT NULL,			-- 성수기 종료일
 	PRICE_PERSON NUMBER(8) NOT NULL,	-- 인원 추가 요금
 	PRICE_BBQ NUMBER(8) NOT NULL,		-- BBQ 추가 요금
 	INFO_PEN VARCHAR2(4000) NOT NULL,	-- 펜션정보
 	DIRECTIONS VARCHAR2(2000) NOT NULL,	-- 펜션 오시는 길
 	x_coordinate VARCHAR2(20) NOT NULL,	-- 펜션위치 x좌표
 	Y_coordinate VARCHAR2(20) NOT NULL,	-- 펜션위치 y좌표
 	DEL_PEN NUMBER(1) NOT NULL 			-- 펜션 삭제여부(0: 기본 1: 삭제승인대기)
);

CREATE SEQUENCE SEQ_PEN
START WITH 1 INCREMENT BY 1;

ALTER TABLE PENSION
ADD CONSTRAINT FK_PEN_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
*/

public class PensionDto implements Serializable {
	
	private static final long serialVersionUID = 8561426898926970448L;
	
	private int seq_pen;
	private String id;
	private String name_pen;
	private String address;
	private String phone;
	private String chechin_time;
	private String chechout_time;
	private int pickup;	// 0: 픽업가능 1: 불가능
	private String season_start;
	private String season_end;
	private int price_person;
	private int price_bbq;
	private String info_pen;
	private String directions;
	private String x_coordinate;
	private String Y_coordinate;
	private int del_pen;		// 0: 기본 1: 삭제승인대기
	
	
	public PensionDto() {}
		
	public PensionDto(int seq_pen, String id, String name_pen, String address, String phone, String chechin_time,
			String chechout_time, int pickup, String season_start, String season_end, int price_person, int price_bbq,
			String info_pen, String directions, String x_coordinate, String y_coordinate, int del_pen) {
		super();
		this.seq_pen = seq_pen;
		this.id = id;
		this.name_pen = name_pen;
		this.address = address;
		this.phone = phone;
		this.chechin_time = chechin_time;
		this.chechout_time = chechout_time;
		this.pickup = pickup;
		this.season_start = season_start;
		this.season_end = season_end;
		this.price_person = price_person;
		this.price_bbq = price_bbq;
		this.info_pen = info_pen;
		this.directions = directions;
		this.x_coordinate = x_coordinate;
		this.Y_coordinate = y_coordinate;
		this.del_pen = del_pen;
	}


	public int getSeq_pen() {
		return seq_pen;
	}
	public void setSeq_pen(int seq_pen) {
		this.seq_pen = seq_pen;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName_pen() {
		return name_pen;
	}
	public void setName_pen(String name_pen) {
		this.name_pen = name_pen;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChechin_time() {
		return chechin_time;
	}
	public void setChechin_time(String chechin_time) {
		this.chechin_time = chechin_time;
	}
	public String getChechout_time() {
		return chechout_time;
	}
	public void setChechout_time(String chechout_time) {
		this.chechout_time = chechout_time;
	}
	public int getPickup() {
		return pickup;
	}
	public void setPickup(int pickup) {
		this.pickup = pickup;
	}
	public String getSeason_start() {
		return season_start;
	}
	public void setSeason_start(String season_start) {
		this.season_start = season_start;
	}
	public String getSeason_end() {
		return season_end;
	}
	public void setSeason_end(String season_end) {
		this.season_end = season_end;
	}
	public int getPrice_person() {
		return price_person;
	}
	public void setPrice_person(int price_person) {
		this.price_person = price_person;
	}
	public int getPrice_bbq() {
		return price_bbq;
	}
	public void setPrice_bbq(int price_bbq) {
		this.price_bbq = price_bbq;
	}
	public String getInfo_pen() {
		return info_pen;
	}
	public void setInfo_pen(String info_pen) {
		this.info_pen = info_pen;
	}
	public String getDirections() {
		return directions;
	}
	public void setDirections(String directions) {
		this.directions = directions;
	}
	public String getX_coordinate() {
		return x_coordinate;
	}
	public void setX_coordinate(String x_coordinate) {
		this.x_coordinate = x_coordinate;
	}
	public String getY_coordinate() {
		return Y_coordinate;
	}
	public void setY_coordinate(String y_coordinate) {
		Y_coordinate = y_coordinate;
	}
	public int getDel_pen() {
		return del_pen;
	}
	public void setDel_pen(int del_pen) {
		this.del_pen = del_pen;
	}

	@Override
	public String toString() {
		return "PensionDto [seq_pen=" + seq_pen + ", id=" + id + ", name_pen=" + name_pen + ", address=" + address
				+ ", phone=" + phone + ", chechin_time=" + chechin_time + ", chechout_time=" + chechout_time
				+ ", pickup=" + pickup + ", season_start=" + season_start + ", season_end=" + season_end
				+ ", price_person=" + price_person + ", price_bbq=" + price_bbq + ", info_pen=" + info_pen
				+ ", directions=" + directions + ", x_coordinate=" + x_coordinate + ", Y_coordinate=" + Y_coordinate
				+ ", del_pen=" + del_pen + "]";
	}
	
}
