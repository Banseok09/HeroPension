DROP TABLE PENSION
CASCADE CONSTRAINTS;


DROP SEQUENCE SEQ_PEN;


CREATE TABLE PENSION(
	SEQ_PEN NUMBER(8) PRIMARY KEY,		-- 펜션 seq
	ID VARCHAR2(20) NOT NULL,			-- 펜션주인(업체) ID
	NAME_PEN VARCHAR2(200) NOT NULL,		-- 펜션이름
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
 	DIRECTIONS VARCHAR2(4000) NOT NULL,	-- 펜션 오시는 길
 	x_coordinate VARCHAR2(20) NOT NULL,	-- 펜션위치 x좌표
 	Y_coordinate VARCHAR2(20) NOT NULL,	-- 펜션위치 y좌표
 	DEL_PEN NUMBER(1) NOT NULL 			-- 펜션 삭제여부(0: 기본 1: 삭제승인대기)
);


CREATE SEQUENCE SEQ_PEN
START WITH 1 INCREMENT BY 1;

ALTER TABLE PENSION
ADD CONSTRAINT FK_PEN_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);