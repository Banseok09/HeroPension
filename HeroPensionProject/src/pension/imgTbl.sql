DROP TABLE PENSION_IMG
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_IMG_PEN;

CREATE TABLE PENSION_IMG(
	SEQ_IMG_PEN NUMBER(8) PRIMARY KEY,		-- 펜션 이미지 seq
	SEQ_PEN NUMBER(8) NOT NULL,				-- 펜션 seq (FK)
	IMG_NAME_PEN VARCHAR2(50) NOT NULL,		-- 펜션 이미지 이름
	IMG_SRC_PEN VARCHAR2(50) NOT NULL		-- 펜션 이미지 경로
);


CREATE SEQUENCE SEQ_IMG_PEN
START WITH 1 INCREMENT BY 1;

ALTER TABLE PENSION_IMG
ADD CONSTRAINT FK_PENIMG_ID FOREIGN KEY(SEQ_PEN)
REFERENCES PENSION(SEQ_PEN);



-- 펜션 방 이미지
DROP TABLE ROOM_IMG
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_IMG_ROOM;

CREATE TABLE ROOM_IMG(
	SEQ_IMG_ROOM NUMBER(8) PRIMARY KEY,		-- 방 이미지 seq
	SEQ_ROOM NUMBER(8) NOT NULL,				-- 방 seq (FK)
	IMG_NAME_ROOM VARCHAR2(50) NOT NULL,		-- 방 이미지 이름
	IMG_SRC_ROOM VARCHAR2(50) NOT NULL		-- 방 이미지 경로
);

CREATE SEQUENCE SEQ_IMG_ROOM
START WITH 1 INCREMENT BY 1;

ALTER TABLE ROOM_IMG
ADD CONSTRAINT FK_ROOMIMG_ID FOREIGN KEY(SEQ_ROOM)
REFERENCES ROOM(SEQ_ROOM);