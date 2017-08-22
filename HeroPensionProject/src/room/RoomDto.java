package room;
/*
DROP TABLE ROOM
CASCADE CONSTRAINT;

CREATE table "ROOM" (
    "SEQ_ROOM"             NUMBER(8),
    "NAME_ROOM"            VARCHAR2(20) NOT NULL,
    "TYPE_ROOM"            VARCHAR2(100) NOT NULL,
    "SIZE_ROOM"            VARCHAR2(20) NOT NULL,
    "PERSON_MIN"           NUMBER(2) NOT NULL,
    "PERSON_MAX"           NUMBER(2) NOT NULL,
    "PRICE_BASIC"          NUMBER(8) NOT NULL,
    "PRICE_WEEKEND"        NUMBER(8) NOT NULL,
    "PRICE_SEASON_BASIC"   NUMBER(8) NOT NULL,
    "PRICE_SEASON_WEEKEND" NUMBER(8) NOT NULL,
    "INFO_ROOM"            VARCHAR2(4000) NOT NULL,
    "ITEM"                 VARCHAR2(2000) NOT NULL,
    "SEQ_PEN"              NUMBER(8) NOT NULL,
    "DEL_ROOM"             NUMBER(1) NOT NULL,
    constraint  "ROOM_PK" primary key ("SEQ_ROOM")
);
*/
import java.io.Serializable;

public class RoomDto implements Serializable {
	private static final long serialVersionUID = -6451556835640321154L;
	
	private int seq_room;
	private String name_room;
	private String type_room;
	private String size_room;
	private int person_min;
	private int person_max;
	private int price_basic;
	private int price_weekend;
	private int price_season_basic;
	private int price_season_weekend;
	private String info_room;
	private String item;
	private int seq_pen;
	private int del_room;
	
	
	
	public RoomDto() { }
	
	public RoomDto(int seq_room, String name_room, String type_room, String size_room, int person_min, int person_max,
			int price_basic, int price_weekend, int price_season_basic, int price_season_weekend, String info_room,
			String item, int seq_pen, int del_room) {
		super();
		this.seq_room = seq_room;
		this.name_room = name_room;
		this.type_room = type_room;
		this.size_room = size_room;
		this.person_min = person_min;
		this.person_max = person_max;
		this.price_basic = price_basic;
		this.price_weekend = price_weekend;
		this.price_season_basic = price_season_basic;
		this.price_season_weekend = price_season_weekend;
		this.info_room = info_room;
		this.item = item;
		this.seq_pen = seq_pen;
		this.del_room = del_room;
	}



	public int getSeq_room() {
		return seq_room;
	}
	public void setSeq_room(int seq_room) {
		this.seq_room = seq_room;
	}
	public String getName_room() {
		return name_room;
	}
	public void setName_room(String name_room) {
		this.name_room = name_room;
	}
	public String getType_room() {
		return type_room;
	}
	public void setType_room(String type_room) {
		this.type_room = type_room;
	}
	public String getSize_room() {
		return size_room;
	}
	public void setSize_room(String size_room) {
		this.size_room = size_room;
	}
	public int getPerson_min() {
		return person_min;
	}
	public void setPerson_min(int person_min) {
		this.person_min = person_min;
	}
	public int getPerson_max() {
		return person_max;
	}
	public void setPerson_max(int person_max) {
		this.person_max = person_max;
	}
	public int getPrice_basic() {
		return price_basic;
	}
	public void setPrice_basic(int price_basic) {
		this.price_basic = price_basic;
	}
	public int getPrice_weekend() {
		return price_weekend;
	}
	public void setPrice_weekend(int price_weekend) {
		this.price_weekend = price_weekend;
	}
	public int getPrice_season_basic() {
		return price_season_basic;
	}
	public void setPrice_season_basic(int price_season_basic) {
		this.price_season_basic = price_season_basic;
	}
	public int getPrice_season_weekend() {
		return price_season_weekend;
	}
	public void setPrice_season_weekend(int price_season_weekend) {
		this.price_season_weekend = price_season_weekend;
	}
	public String getInfo_room() {
		return info_room;
	}
	public void setInfo_room(String info_room) {
		this.info_room = info_room;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getSeq_pen() {
		return seq_pen;
	}
	public void setSeq_pen(int seq_pen) {
		this.seq_pen = seq_pen;
	}
	public int getDel_room() {
		return del_room;
	}
	public void setDel_room(int del_room) {
		this.del_room = del_room;
	}
	
	
	
	@Override
	public String toString() {
		return "RoomDto [seq_room=" + seq_room + ", name_room=" + name_room + ", type_room=" + type_room
				+ ", size_room=" + size_room + ", person_min=" + person_min + ", person_max=" + person_max
				+ ", price_basic=" + price_basic + ", price_weekend=" + price_weekend + ", price_season_basic="
				+ price_season_basic + ", price_season_weekend=" + price_season_weekend + ", info_room=" + info_room
				+ ", item=" + item + ", seq_pen=" + seq_pen + ", sel_room=" + del_room + "]";
	}	

}
