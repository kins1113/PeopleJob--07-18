-- 3차직종      1 
--DROP TABLE THIRD CASCADE CONSTRAINTS;
CREATE TABLE THIRD (
	THIRD_CODE NUMBER      primary key,  -- 3차직종코드
	THIRDNAME  VARCHAR(50)                  -- 3차직종명
);
--DROP SEQUENCE THIRD_SEQ ;
create sequence THIRD_SEQ
increment by 1
start with 1
nocache;


-- 게시판 종류       2
--DROP TABLE BOARD_KIND CASCADE CONSTRAINTS;
CREATE TABLE BOARD_KIND (
	TYPE_CODE   NUMBER      primary key, -- 종류 코드
	TYPE             VARCHAR(50)                 -- 종류
);
alter table board_kind add USAGE varchar2(10) default 'Y';         --추가 7월 2일 옥환 
alter table board_kind add REGDATE date default sysdate;         --추가 7월 2일 옥환 
--drop sequence BOARD_KIND_SEQ;
create sequence BOARD_KIND_SEQ
increment by 1
start with 1
nocache;
SELECT * FROM PAYMENT;

-- 결제       3
--DROP TABLE PAYMENT CASCADE CONSTRAINTS;
CREATE TABLE PAYMENT (
	PAYMENT_CODE     NUMBER          primary key,   -- 결제 코드
	PATMENTWAY        VARCHAR(30)   NOT NULL,     -- 결제수단
	PROGRESS            VARCHAR(30) ,                      -- 진행상황
	DISCOUNT             NUMBER,                            -- 할인금액
	PAYDATE               DATE ,                               -- 결제일
	PAYEND_DATE       DATE,                                -- 종료일
	SERVICE_CODE     NUMBER          NOT NULL,   -- 서비스 코드
	MEMBER_CODE     NUMBER          NOT NULL,     -- 회원 코드
	constraint FK_SERVICE_TO_PAYMENT foreign key(SERVICE_CODE) references SERVICE(SERVICE_CODE),
	constraint FK_MEMBER_TO_PAYMENT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence PAYMENT_SEQ;
create sequence PAYMENT_SEQ
increment by 1
start with 1
nocache;



-- 열람여부(이력서)        4
--DROP TABLE OPENCHECK CASCADE CONSTRAINTS;
CREATE TABLE OPENCHECK (
	OPEN_CODE         NUMBER primary key,   -- 열람 코드
	MEMBER_CODE    NUMBER ,                    -- 회원 코드
	RESUME_CODE    NUMBER ,                    -- 이력서 코드
	OPENDATE          DATE,                            -- 열람 날짜
	constraint FK_MEMBER_TO_OPENCHECK foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_RESUME_TO_OPENCHECK foreign key(RESUME_CODE) references RESUME(RESUME_CODE)
);
--drop sequence OPENCHECK_SEQ;
create sequence OPENCHECK_SEQ
increment by 1
start with 1
nocache;


-- 게시글      5
--DROP TABLE POST CASCADE CONSTRAINTS;
CREATE TABLE POST (
	BOARD_CODE2      NUMBER            primary key,         -- 게시글 코드
	BOARDTITLE          VARCHAR(50)     NOT NULL,           -- 제목
	BOARDCONTENT   CLOB                  NOT NULL,          -- 내용
	BOARDREGDATE2 DATE                  DEFAULT sysdate, -- 등록일
	BOARDHITS           NUMBER             DEFAULT 0,          -- 조회수
	DELETECHECK      VARCHAR(20)      DEFAULT 'N',         -- 삭제 여부
	MEMBER_CODE     NUMBER            NOT NULL,             -- 회원 코드
	BOARD_CODE        NUMBER,                                       -- 게시판 코드
	BOARDCHECK       VARCHAR(20) ,                                 -- 게시판 구분 코드 
	constraint FK_MEMBER_TO_POST foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_BOARD_TO_POST foreign key(BOARD_CODE) references BOARD(BOARD_CODE1)
);
alter table post drop column boardCheck;
alter table post add REPORT_CK VARCHAR2(5) default 'Y';
alter table post add REPORT_USER VARCHAR2(50);
alter table post add REPORT_COMENT CLOB;

--drop sequence POST_SEQ;
create sequence POST_SEQ
increment by 1
start with 1
nocache;


-- 희망근무조건       6
--DROP TABLE HOPE_WORKING CASCADE CONSTRAINTS;
CREATE TABLE HOPE_WORKING (
	HOPEWORK_CODE    NUMBER           primary key, -- 희망근무코드
    JOBTYPE                  VARCHAR(50) ,                      -- 업직종
	HOPEWORKDATE     DATE,                                    -- 근무일시
    HOPEPAY                VARCHAR(50) ,                       -- 급여
	HOPEWORKFORM   VARCHAR(50) ,                       -- 근무형태
	LOCAL_CODE          NUMBER             NOT NULL, -- 지역코드
	FIRSTJOB_CODE     NUMBER             NOT NULL, -- 1차직종코드
	constraint FK_LOCATION_TO_HOPE_WORKING foreign key(LOCAL_CODE) references LOCATION(LOCAL_CODE),
	constraint FK_FIRST_TO_HOPE_WORKING foreign key(FIRSTJOB_CODE) references FIRST(FIRST_CODE)
);
ALTER TABLE HOPE_WORKING modify LOCAL_CODE  null;
ALTER TABLE HOPE_WORKING modify FIRSTJOB_CODE  null;
ALTER TABLE HOPE_WORKING modify HOPEWORKDATE varchar2(60);

--drop sequence HOPE_WORKING_SEQ;
create sequence HOPE_WORKING_SEQ
increment by 1
start with 1
nocache;


-- 지원현황 7
--DROP TABLE APPLY CASCADE CONSTRAINTS;
CREATE TABLE APPLY (
	APPLY_CODE         NUMBER               primary key, -- 지원 코드
	APPLYDATE            DATE,                                      -- 지원일
    APPLYLIST             VARCHAR(100) ,                       -- 지원내역
	APPLYCONDITION  VARCHAR(50) ,                         -- 지원상태
	OPENCHECK          VARCHAR(20)       DEFAULT 'N', -- 열람여부
	MEMBER_CODE     NUMBER               NOT NULL,   -- 회원 코드
	JOBOPENING         NUMBER               NOT NULL,    -- 채용공고 코드
	constraint FK_MEMBER_TO_APPLY foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_JOBOPENING_TO_APPLY foreign key(JOBOPENING) references JOBOPENING(JOBOPENING)
);
--drop sequence APPLY_SEQ;
create sequence APPLY_SEQ
increment by 1
start with 1
nocache;


-- 고객문의답변   8
--DROP TABLE CUSANSWER CASCADE CONSTRAINTS;
CREATE TABLE CUSANSWER (
	ANSWER_CODE           NUMBER         primary key, -- 답변코드
	CUSTEXT_CODE          NUMBER        NOT NULL, -- 고객문의 글 코드
	ANSWERTITLE             VARCHAR(30) NOT NULL, -- 제목
	ANSWERCONTENT       CLOB             NOT NULL, -- 내용
	ANSWER_REGDATE     DATE,                              -- 등록일
	ADMIN_CODE               NUMBER,                        -- 관리자 코드
	constraint FK_CUSTEXT_TO_CUSANSWER foreign key(CUSTEXT_CODE) references CUSTEXT(CUSTEXT_CODE),
	constraint FK_MANAGER_TO_CUSANSWER foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
--drop sequence CUSANSWER_SEQ;
create sequence CUSANSWER_SEQ
increment by 1
start with 1
nocache;


-- 게시판 댓글   9
CREATE TABLE POST_CMT (
	COMMENT_CODE    NUMBER          primary key,             -- 댓글 코드
	BOARD_DATE          DATE              DEFAULT sysdate,     -- 등록일
	ARRAYNO               NUMBER,                                        -- 정렬번호
	STEPNO                  NUMBER,                                        -- 단계번호
	DELETECHECK        VARCHAR(20)  DEFAULT 'N',            -- 삭제여부
    MEMBER_CODE      NUMBER,                                        -- 회원 코드
	BOARD_CODE2       NUMBER,                                       -- 게시글 코드
	GROUPNO              NUMBER,                                       -- 그룹번호
	constraint FK_MEMBER_TO_POST_CMT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_POST_TO_POST_CMT foreign key(BOARD_CODE2) references POST(BOARD_CODE2)
);
--drop sequence NOTICE_CMT_SEQ;
create sequence NOTICE_CMT_SEQ
increment by 1
start with 1
nocache;


-- 이력서  10
CREATE TABLE RESUME (
	RESUME_CODE          NUMBER       primary key,                  -- 이력서 코드
	RESUMETITLE            VARCHAR(20) NOT NULL,                 -- 제목
	RESUMEREGDATE     DATE              DEFAULT sysdate,     -- 등록일
    INTRODUCE              CLOB,                                                -- 자기소개
	AWARD                     VARCHAR(50) ,                               -- 수상, 수료, 활동내역
	LANGLICENCE_CODE NUMBER,                                      -- 언어자격증코드
	LICENCE_CODE        NUMBER,                                     -- 자격증번호
	DV_CODE                 NUMBER,                                  -- 구분코드
    ACADEMIC_CODE      NUMBER            NOT NULL,      -- 학력코드
	DESIREDWORK_CODE NUMBER,                                -- 희망근무코드
    OPENCHECK               VARCHAR(10) DEFAULT 'N',        -- 공개여부
	MEMBER_CODE          NUMBER         NOT NULL,            -- 회원 코드
	constraint FK_LANGCERTIFICATION_TO_RESUME foreign key(LANGLICENCE_CODE) references LANGCERTIFICATION(LANGLICENCE_CODE),
	constraint FK_CERTIFICATE_TO_RESUME foreign key(LICENCE_CODE) references CERTIFICATE(L_NO),
	constraint FK_CAREER_TO_RESUME foreign key(DV_CODE) references CAREER(DV_CODE),
	constraint FK_EDUCATION_TO_RESUME foreign key(ACADEMIC_CODE) references EDUCATION(ACADEMIC_CODE),
	constraint FK_HOPE_WORKING_TO_RESUME foreign key(DESIREDWORK_CODE) references HOPE_WORKING(HOPEWORK_CODE),
	constraint FK_MEMBER_TO_RESUME foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence RESUME_SEQ;
alter table resume modify ACADEMIC_CODE  null;
alter table resume modify MEMBER_CODE  null;
alter table resume add (picture varchar2(100));
alter table resume modify (RESUMETITLE varchar2(100));
alter table resume modify (RESUMEREGDATE DEFAULT sysdate);

create sequence RESUME_SEQ
increment by 1
start with 1
nocache;



-- 게시판      11
CREATE TABLE BOARD (
	BOARD_CODE1        NUMBER      primary key, -- 게시판 코드
	FIR_ADMIN               VARCHAR(50) ,                 -- 최초 등록 관리자
	BOARDNAME            VARCHAR(30) NOT NULL,  -- 게시판 이름
	BOARDREGDATE1    DATE,                              -- 게시판 최초 등록일
	BOARDUPDATE         DATE,                              -- 게시판 마지막 수정일
	LAST_ADMIN             VARCHAR(50) ,              -- 마지막 수정 관리자
	BOARD_ORDER        VARCHAR(50) ,              -- 게시판 순서
	USAGE                     VARCHAR(50) ,              -- 사용 여부
    COMMENTAGE          VARCHAR(50) ,                 -- 댓글 가능 여부
	UPAGE                     VARCHAR(50) ,                -- 업로드 가능 여부
	UPNUMAGE              VARCHAR(50) ,                 -- 업로드 가능 한 숫자
	UPSIZEAGE              NUMBER,                          -- 첨부 가능한 파일 사이즈
	TYPE_CODE             NUMBER      NOT NULL,       -- 종류 코드
	constraint FK_board_kind_TO_BOARD foreign key(TYPE_CODE) references board_kind(TYPE_CODE)
);
alter table board modify usage default 'Y';
alter table board modify BOARDREGDATE1 default sysdate;
--drop sequence BOARD_SEQ;
create sequence BOARD_SEQ
increment by 1
start with 1
nocache;



-- 고객문의 글 정보    12
CREATE TABLE CUSTEXT (
	CUSTEXT_CODE             NUMBER         primary key, -- 고객문의 글 코드
	CUSTEXTCATEGORY      VARCHAR(20) NOT NULL, -- 문의유형
	CUSTITLE                       VARCHAR(50) NOT NULL, -- 제목
	CUSCONTENT                 CLOB             NOT NULL, -- 내용
	CUS_REGDATE               DATE,                              -- 등록일
	MEMBER_CODE              NUMBER        NOT NULL,  -- 회원 코드
	constraint FK_MEMBER_TO_CUSTEXT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence CUSTEXT_SEQ;
create sequence CUSTEXT_SEQ
increment by 1
start with 1
nocache;



-- 채용공고     13
CREATE TABLE JOBOPENING (
	JOBOPENING                       NUMBER       primary key,  -- 채용공고 코드
	JOBTITLE                            VARCHAR(20)  NOT NULL,  -- 제목
	LOCALCHECK                     VARCHAR(10)  NOT NULL,   -- 지역구분
	SUBWAYINFO                     VARCHAR(50)  ,                   -- 역정보
	WORKWAY                         VARCHAR(30)  ,                   -- 근무방식
	WORKDATE                       DATE,                                    -- 근무기간
	DAYOFWEEK                     VARCHAR(20)  ,                    -- 근무요일
	WORKTIME                       DATE,                                    -- 근무시간
	PAYWAY                           VARCHAR(30)  ,                      -- 급여방식
	PAY                                   VARCHAR(30)  ,                      -- 급여
	WORKFORM                      VARCHAR(30)  ,                      -- 근무형태
	WELFARE                          VARCHAR(50)  ,                       -- 복리후생
	GENDER                            VARCHAR(20)  ,                      -- 성별
	AGELIMIT                          NUMBER,                                -- 제한연령
	ACADEMIC_CONDITION      VARCHAR(50)  ,                       -- 학력조건
	CAREER                             VARCHAR(50)  ,                      -- 경력사항
	SWEETENER                       VARCHAR(100) ,                     -- 우대조건
	RECRUIT                             NUMBER,                               -- 모집인원
	RECRUITMENT_TARGET      VARCHAR(50)  ,                     -- 모집대상
	END_DATE                          DATE,                                     -- 모집종료일
	RECEIVEWAY                      VARCHAR(50)  ,                       -- 접수방법
	SUBMIT                               VARCHAR(50)  ,                       -- 제출서류
	APPLICATIONHANDBOOK     VARCHAR(50)  ,                        -- 상세모집요강
	JOBREGDATE                     DATE,                                    -- 등록일
	HITS                                   NUMBER,                                 -- 조회수
	REPORTCHEKE                  VARCHAR(10)       DEFAULT 'N',     -- 신고여부
	ADMINAGREE                      VARCHAR(10)       DEFAULT 'N',   -- 관리자 승인
	CATEGORY                        VARCHAR(50)  ,                          -- 카테고리
	COMPANYIMAGE                VARCHAR(150)        NULL,           -- 공고 이미지
	COMPANY_CODE                NUMBER              NOT NULL,        -- 회사코드
	constraint FK_COMPANY_TO_JOBOPENING foreign key(COMPANY_CODE) references COMPANY(COMPANY_CODE)
);

alter table jobopening modify welfare varchar(500);
alter table jobopening modify localcheck varchar(50);

--drop sequence JOBOPENING_SEQ;
create sequence JOBOPENING_SEQ
increment by 1
start with 1
nocache;


-- 자격증      14
CREATE TABLE CERTIFICATE (
	L_NO                 NUMBER           primary key,              -- 자격증번호
	L_NAME             VARCHAR(50)   NOT NULL,                -- 자격증이름
	L_GETDATE       DATE                DEFAULT sysdate,     -- 취득일
	L_INSTITUTION  VARCHAR(50)    NOT NULL                 -- 발행기관
);
ALTER TABLE CERTIFICATE modify L_GETDATE varchar2(50); 

--drop sequence CERTIFICATE_SEQ;
create sequence CERTIFICATE_SEQ
increment by 1
start with 1
nocache;



-- 공지사항 15
CREATE TABLE NOTICE (
	NOTIFY_CODE           NUMBER      primary key,      -- 공지사항 코드
	NOTIFYTITLE             VARCHAR(50) NOT NULL,     -- 제목
	NOTIFYCONTENT       CLOB  ,                               -- 내용
	NOTIFYDATE             DATE,                                  -- 게시 날짜 
	ADMIN_CODE            NUMBER,                              -- 관리자 코드
	constraint FK_MANAGER_TO_NOTICE foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
ALTER TABLE NOTICE ADD(READCOUNT number); --조회수
ALTER TABLE NOTICE MODIFY(NOTIFYDATE DATE DEFAULT sysdate);

--drop sequence NOTICE_SEQ;
create sequence NOTICE_SEQ
increment by 1
start with 1
nocache;



-- 회원       16
CREATE TABLE MEMBER (
	MEMBERID                   VARCHAR(30)  NOT NULL, -- 아이디
	REGDATE                     DATE,                               -- 가입일
	MEMBERNAME             VARCHAR(30)  NOT NULL, -- 이름
	ZIPCODE                      VARCHAR(30)  NOT NULL, -- 우편번호
	ADDRESS                     VARCHAR(30)  NOT NULL, -- 주소
	ADDRESSDETAIL          VARCHAR(100) NOT NULL, -- 상세주소
	MEMBER_CODE           NUMBER       primary key, -- 회원 코드
	WITHDRAWALDATE      DATE,                              -- 탈퇴일
	PWD                           VARCHAR(30)  NOT NULL, -- 비밀번호
	BIRTH                         VARCHAR(30)  NOT NULL, -- 생년월일
	MEMBERGENDER        VARCHAR(30)  NOT NULL, -- 성별
	EMAIL                         VARCHAR(100) NOT NULL, -- 이메일
	PICTURE                     VARCHAR(100) ,               -- 사진
	TEL                             VARCHAR(50)  NOT NULL, -- 전화번호
	COMPANY_CODE         NUMBER         NOT NULL,  -- 회사코드
    constraint FK_COMPANY_TO_MEMBER foreign key(COMPANY_CODE) references COMPANY(COMPANY_CODE)
);
alter table MEMBER modify COMPANY_CODE  null;
ALTER TABLE member DROP COLUMN picture;
ALTER TABLE member DROP COLUMN company_code;
ALTER TABLE member add (authority_code number);
ALTER TABLE MEMBER MODIFY (ADDRESS VARCHAR2(200));

alter table member modify zipcode null;
alter table member modify address null;
alter table member modify addressdetail null;
alter table member modify birth null;
alter table member modify membergender null;

SELECT * FROM MEMBER;
SELECT * FROM COMPANY;

alter table member add (company_code number);
alter table member add constraint fk_member foreign key(COMPANY_CODE) references company(company_code);

--사업자 번호
ALTER TABLE MEMBER MODIFY (REGDATE DEFAULT SYSDATE);

--사진컬럼 회원에서 이력서로 
alter table member add constraint AUTHORITY_CODE_FK FOREIGN KEY(AUTHORITY_CODE)
REFERENCES AUTHORITY(AUTHORITY_CODE) ON DELETE CASCADE;
ALTER TABLE COMPANY RENAME COLUMN COMPANY_CODE TO BUSSINESS_NUMBER;

--drop sequence MEMBER_SEQ;
create sequence MEMBER_SEQ
increment by 1
start with 1
nocache;


-- 관리자  17
CREATE TABLE MANAGER (
	ADMIN_CODE        NUMBER          primary key,  -- 관리자 코드
	ADMINID               VARCHAR(50)   NOT NULL,   -- 관리자아이디
	ADMINPWD           VARCHAR(50)   NOT NULL,   -- 비밀번호
	AUTHORITY          VARCHAR(50) ,                    -- 권한
	AUT_REGDATE     DATE,                                  -- 가입일
	AUT_DELDATE      DATE                                   -- 삭제일
);
alter table manager modify AUT_REGDATE default sysdate;
alter table manager modify adminid unique;
--drop sequence MANAGER_SEQ;
create sequence MANAGER_SEQ
increment by 1
start with 1
nocache;


--권한    18
create table authority(
    AUTHORITY_CODE   NUMBER          PRIMARY KEY,
    AUTHORITY_NAME   VARCHAR(50)   NOT NULL
);
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '개인회원');
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '기업회원 요청');
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '기업회원 승인');
create sequence AUTHORITY_SEQ
increment by 1
start with 1
nocache;





-- 지역   19
CREATE TABLE LOCATION (
	LOCAL_CODE      NUMBER           primary key,      -- 지역코드
	SIDO                   VARCHAR(50)   NOT NULL,        -- 시도
	GUGUN               VARCHAR(50)   NOT NULL         -- 시군구
);
--drop sequence LOCATION_SEQ;
create sequence LOCATION_SEQ
increment by 1
start with 1
nocache;

-- 학력   20
CREATE TABLE EDUCATION (
	ACADEMIC_CODE       NUMBER           primary key,          -- 학력코드
	SCHOOLNAME           VARCHAR(50)    NOT NULL,            -- 학교명
	MAJOR                      VARCHAR(50)    NOT NULL,            -- 전공명
	DEGREE                    VARCHAR(50)    NOT NULL,            -- 학위
	GRADUATE                DATE                DEFAULT sysdate,  -- 졸업년도
	GRADUATECHECK      VARCHAR(20)   DEFAULT 'N'          -- 졸업여부
);
--drop sequence EDUCATION_SEQ;
ALTER TABLE EDUCATION ADD(SCHOOLLOCAL varchar2(50)); --학교지역
ALTER TABLE EDUCATION ADD(GRADUATETYPE varchar2(50)); --졸업 종류(초졸,중졸,고졸,대졸)
ALTER TABLE EDUCATION DROP COLUMN GRADUATE;
alter table EDUCATION add(GRADUATE varchar2(50)); 

create sequence EDUCATION_SEQ
increment by 1
start with 1
nocache;



-- 언어자격증    21
CREATE TABLE LANGCERTIFICATION (
	LANGLICENCE_CODE        NUMBER          primary key,              -- 언어자격증코드
	LANGLICENCENAME         VARCHAR(50) ,                                 -- 언어자격증이름
	GETDATE                         DATE                DEFAULT sysdate,     -- 취득일
	INSTITUTE                        VARCHAR(50)                                  -- 발행기관
);
--drop sequence LANGUAGE_CERTIFICATION_SEQ;
ALTER TABLE LANGCERTIFICATION ADD(CERTIFICATIONTYPE varchar2(50)); --자격증 종류 (자격증,어학,수상내역)
ALTER TABLE LANGCERTIFICATION RENAME COLUMN GETDATE TO LANG_GETDATE;
ALTER TABLE LANGCERTIFICATION ADD(language varchar2(50));--언어
ALTER TABLE LANGCERTIFICATION ADD(langpoint varchar2(50));--언어점수
ALTER TABLE LANGCERTIFICATION ADD(lang_grade varchar2(50));--언어급수
ALTER TABLE LANGCERTIFICATION DROP COLUMN LANG_GETDATE;
ALTER TABLE LANGCERTIFICATION ADD(LANG_GETDATE varchar2(50)); 
create sequence LANGCERTIFICATION_SEQ
increment by 1
start with 1
nocache;



-- 경력사항     22
CREATE TABLE CAREER (
	DV_CODE                NUMBER            primary key,            -- 구분코드
	COMPANYNAME      VARCHAR(30)     NOT NULL,              -- 회사명
	WORKTERM            DATE                 DEFAULT sysdate,    -- 근무기간
	CHARGEWORK       VARCHAR(50)     NOT NULL               -- 담당업무
);
ALTER TABLE CAREER ADD(workcheck varchar2(50)); --경력구분 (신입,경력)
ALTER TABLE CAREER ADD(jobgrade varchar2(50)); --직급
ALTER TABLE CAREER ADD(workcondition varchar2(50)); --근무상태(재직중,퇴직)
ALTER TABLE CAREER DROP COLUMN WORKTERM;
ALTER TABLE CAREER ADD(WORKTERM varchar2(50));       

--drop sequence CAREER_SEQ;
create sequence CAREER_SEQ
increment by 1
start with 1
nocache;


-- 서비스      23
CREATE TABLE SERVICE (
	SERVICE_CODE          NUMBER             primary key, -- 서비스 코드
	SERVICENAME            VARCHAR(30)     NOT NULL, -- 서비스 이름
	SERVICEPRICE           NUMBER             NOT NULL, -- 서비스 가격
	SERVICECONTENT      CLOB                 NOT NULL, -- 서비스 내용
	SERVICEDAY              NUMBER                              -- 서비스 일수
);
--drop sequence SERVICE_SEQ;
create sequence SERVICE_SEQ
increment by 1
start with 1
nocache;


-- 업로드 정보       24
CREATE TABLE upload_info (
	UPLOAD_CODE               NUMBER      primary key, -- 업로드 코드
    FILENAME                       VARCHAR(30) ,               -- 업로드 파일명
	FILESIZE                         NUMBER,                       -- 파일사이즈
	DOWNCOUNT                  NUMBER,                       -- 다운로드 수
	ORIGINALFILENAME        VARCHAR(50) ,               -- 원래 파일명
	BOARD_CODE2               NUMBER,                        -- 게시글 코드
	constraint FK_POST_TO_upload_info foreign key(BOARD_CODE2) references POST(BOARD_CODE2)
);
--drop sequence upload_info_SEQ;
create sequence upload_info_SEQ
increment by 1
start with 1
nocache;



-- 2차직종     25
CREATE TABLE SECOND (
	SECOND_CODE   NUMBER             primary key, -- 2차직종코드
	SECONDNAME    VARCHAR(50) ,                       -- 2차직종명
    THIRD_CODE      NUMBER                                -- 3차직종코드
);
--drop sequence SECOND_OCCUPATION_SEQ;
create sequence SECOND_SEQ
increment by 1
start with 1
nocache;



-- 회사26
DROP TABLE COMPANY  CASCADE CONSTRAINTS;
CREATE TABLE COMPANY (
	COMPANY_CODE     NUMBER          primary key, -- 회사코드
	COMPANYNAME      VARCHAR(50)    NOT NULL, -- 회사명
	COMPANYNO          VARCHAR(50)    NOT NULL, -- 사업자번호
	IMAGE                    VARCHAR(100)                   -- 로고 이미지
);
alter table company add (zipcode varchar2(30));
alter table company add (address varchar2(200));
alter table company add (addressdetail varchar2(200));
alter table company rename column zipcode to company_zipcode;
alter table company rename column address to company_address;
alter table company rename column addressdetail to company_addressdetail;


--drop sequence COMPANY_SEQ;
create sequence COMPANY_SEQ
increment by 1
start with 1
nocache;



-- 공지사항 댓글          27
CREATE TABLE NOTICE_CMT2 (
	COMMENT_CODE    NUMBER    primary key,     -- 댓글 코드2
	MEMBER_CODE      NUMBER    NOT NULL,       -- 회원 코드
	NOTIFY_CODE        NUMBER    NOT NULL,       -- 공지사항 코드
	COMCONTENT        CLOB        NOT NULL,        -- 내용
	COMREGDATE        DATE       DEFAULT sysdate, -- 등록일
	constraint FK_MEMBER_TO_NOTICE_CMT2 foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_NOTICE_TO_NOTICE_CMT2 foreign key(NOTIFY_CODE) references NOTICE(NOTIFY_CODE)
);
--drop sequence NOTICE_CMT2_SEQ;
create sequence NOTICE_CMT2_SEQ
increment by 1
start with 1
nocache;



-- 1차직종 28
CREATE TABLE FIRST(
	FIRST_CODE          NUMBER           primary key, -- 1차직종코드
	FIRSTNAME           VARCHAR(50) ,                     -- 1차직종명
	SECOND_CODE     NUMBER                              -- 2차직종코드
);
--drop sequence FIRST_OCCUPATION_SEQ;
create sequence FIRST_SEQ
increment by 1
start with 1
nocache;



-- 스크랩  29
CREATE TABLE SCRAP (
	SCRAP_CODE                   NUMBER primary key, -- 스크랩코드
	SCRAPDATE                     DATE,                        -- 스크랩날짜
	SCRAPMEMBER_CODE     NUMBER NOT NULL,   -- 스크랩하는 회원 코드
	JOBOPENING_CODE         NUMBER NOT NULL,   -- 채용공고 코드
	RESUME_CODE                NUMBER NOT NULL,    -- 이력서 코드
	constraint FK_MEMBER_TO_SCRAP foreign key(SCRAPMEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_JOBOPENING_TO_SCRAP foreign key(JOBOPENING_CODE) references JOBOPENING(JOBOPENING),
	constraint FK_RESUME_TO_SCRAP foreign key(RESUME_CODE) references RESUME(RESUME_CODE)
);
alter table scrap modify resume_code null;      --사용자 입장에서 스크랩할시 resume_code 널로변경
alter table scrap modify jobopening_code null;     --기업사용자 입장에서 스크랩할시 jobopening_code 널로 변경
--drop sequence SCRAP_SEQ;
create sequence SCRAP_SEQ
increment by 1
start with 1
nocache;

--팝업 30
CREATE TABLE POPUP
(
ADMIN_CODE	NUMBER,
POPUP_NAME	VARCHAR(50),
POPUP_IMG	VARCHAR(100),
WIDTH		NUMBER,
HEIGHT		NUMBER,
LEFT	    NUMBER,
TOP		    NUMBER,
REGDATE		DATE,
USAGE		VARCHAR(10),
POPUP_CODE	NUMBER PRIMARY KEY,
constraint FK_RESUME_TO_ foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
create sequence POPUP_SEQ
increment by 1
start with 1
nocache;

SELECT * FROM POPUP;



-- 결제 
ALTER TABLE "PAYMENT"
	ADD
		CONSTRAINT "FK_SERVICE_TO_PAYMENT" -- 서비스  -> 결제 
		FOREIGN KEY (
			"SERVICE_CODE" -- 서비스 코드
		)
		REFERENCES "SERVICE" ( -- 서비스 
			"SERVICE_CODE" -- 서비스 코드
		);

-- 결제 
ALTER TABLE "PAYMENT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_PAYMENT" -- 회원 -> 결제 
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 열람여부(이력서) 
ALTER TABLE "OPENCHECK"
	ADD
		CONSTRAINT "FK_MEMBER_TO_OPENCHECK" -- 회원 -> 열람여부(이력서) 
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 열람여부(이력서) 
ALTER TABLE "OPENCHECK"
	ADD
		CONSTRAINT "FK_RESUME_TO_OPENCHECK" -- 이력서 -> 열람여부(이력서) 
		FOREIGN KEY (
			"RESUME_CODE" -- 이력서 코드
		)
		REFERENCES "RESUME" ( -- 이력서
			"RESUME_CODE" -- 이력서 코드
		);

-- 게시글
ALTER TABLE "POST"
	ADD
		CONSTRAINT "FK_MEMBER_TO_POST" -- 회원 -> 게시글
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 게시글
ALTER TABLE "POST"
	ADD
		CONSTRAINT "FK_BOARD_TO_POST" -- 게시판 -> 게시글
		FOREIGN KEY (
			"BOARD_CODE" -- 게시판 코드
		)
		REFERENCES "BOARD" ( -- 게시판
			"BOARD_CODE1" -- 게시판 코드
		);

-- 희망근무조건
ALTER TABLE "HOPE_WORKING"
	ADD
		CONSTRAINT "FK_LOCATION_TO_HOPE_WORKING" -- 지역 -> 희망근무조건
		FOREIGN KEY (
			"LOCAL_CODE" -- 지역코드
		)
		REFERENCES "LOCATION" ( -- 지역
			"LOCAL_CODE" -- 지역코드
		);

-- 희망근무조건
ALTER TABLE "HOPE_WORKING"
	ADD
		CONSTRAINT "FK_FIRST_TO_HOPE_WORKING" -- 1차직종 -> 희망근무조건
		FOREIGN KEY (
			"FIRSTJOB_CODE" -- 1차직종코드
		)
		REFERENCES "FIRST" ( -- 1차직종
			"FIRST_CODE" -- 1차직종코드
		);

-- 지원현황
ALTER TABLE "APPLY"
	ADD
		CONSTRAINT "FK_MEMBER_TO_APPLY" -- 회원 -> 지원현황
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 지원현황
ALTER TABLE "APPLY"
	ADD
		CONSTRAINT "FK_JOBOPENING_TO_APPLY" -- 채용공고 -> 지원현황
		FOREIGN KEY (
			"JOBOPENING" -- 채용공고 코드
		)
		REFERENCES "JOBOPENING" ( -- 채용공고
			"JOBOPENING" -- 채용공고 코드
		);

-- 고객문의답변
ALTER TABLE "CUSANSWER"
	ADD
		CONSTRAINT "FK_CUSTEXT_TO_CUSANSWER" -- 고객문의 글 정보 -> 고객문의답변
		FOREIGN KEY (
			"CUSTEXT_CODE" -- 고객문의 글 코드
		)
		REFERENCES "CUSTEXT" ( -- 고객문의 글 정보
			"CUSTEXT_CODE" -- 고객문의 글 코드
		);

-- 고객문의답변
ALTER TABLE "CUSANSWER"
	ADD
		CONSTRAINT "FK_MANAGER_TO_CUSANSWER" -- 관리자 -> 고객문의답변
		FOREIGN KEY (
			"ADMIN_CODE" -- 관리자 코드
		)
		REFERENCES "MANAGER" ( -- 관리자
			"ADMIN_CODE" -- 관리자 코드
		);

-- 게시판 댓글
ALTER TABLE "NOTICE_CMT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_NOTICE_CMT" -- 회원 -> 게시판 댓글
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 게시판 댓글
ALTER TABLE "NOTICE_CMT"
	ADD
		CONSTRAINT "FK_POST_TO_NOTICE_CMT" -- 게시글 -> 게시판 댓글
		FOREIGN KEY (
			"BOARD_CODE2" -- 게시글 코드
		)
		REFERENCES "POST" ( -- 게시글
			"BOARD_CODE2" -- 게시글 코드
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_LANGCERTIFICATION_TO_RESUME" -- 언어자격증 -> 이력서
		FOREIGN KEY (
			"LANGLICENCE_CODE" -- 언어자격증코드
		)
		REFERENCES "LANGCERTIFICATION" ( -- 언어자격증
			"LANGLICENCE_CODE" -- 언어자격증코드
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_CERTIFICATE_TO_RESUME" -- 자격증 -> 이력서
		FOREIGN KEY (
			"LICENCE_CODE" -- 자격증번호
		)
		REFERENCES "CERTIFICATE" ( -- 자격증
			"L_NO" -- 자격증번호
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_CAREER_TO_RESUME" -- 경력사항 -> 이력서
		FOREIGN KEY (
			"DV_CODE" -- 구분코드
		)
		REFERENCES "CAREER" ( -- 경력사항
			"DV_CODE" -- 구분코드
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_EDUCATION_TO_RESUME" -- 학력 -> 이력서
		FOREIGN KEY (
			"ACADEMIC_CODE" -- 학력코드
		)
		REFERENCES "EDUCATION" ( -- 학력
			"ACADEMIC_CODE" -- 학력코드
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_HOPE_WORKING_TO_RESUME" -- 희망근무조건 -> 이력서
		FOREIGN KEY (
			"DESIREDWORK_CODE" -- 희망근무코드
		)
		REFERENCES "HOPE_WORKING" ( -- 희망근무조건
			"HOPEWORK_CODE" -- 희망근무코드
		);

-- 이력서
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_MEMBER_TO_RESUME" -- 회원 -> 이력서
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 게시판
ALTER TABLE "BOARD"
	ADD
		CONSTRAINT "FK_board_kind_TO_BOARD" -- 게시판 종류 -> 게시판
		FOREIGN KEY (
			"TYPE_CODE" -- 종류 코드
		)
		REFERENCES "board_kind" ( -- 게시판 종류
			"TYPE_CODE" -- 종류 코드
		);

-- 고객문의 글 정보
ALTER TABLE "CUSTEXT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_CUSTEXT" -- 회원 -> 고객문의 글 정보
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 채용공고
ALTER TABLE "JOBOPENING"
	ADD
		CONSTRAINT "FK_COMPANY_TO_JOBOPENING" -- 회사 -> 채용공고
		FOREIGN KEY (
			"COMPANY_CODE" -- 회사코드
		)
		REFERENCES "COMPANY" ( -- 회사
			"COMPANY_CODE" -- 회사코드
		);

-- 공지사항
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "FK_MANAGER_TO_NOTICE" -- 관리자 -> 공지사항
		FOREIGN KEY (
			"ADMIN_CODE" -- 관리자 코드
		)
		REFERENCES "MANAGER" ( -- 관리자
			"ADMIN_CODE" -- 관리자 코드
		);

-- 회원
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "FK_COMPANY_TO_MEMBER" -- 회사 -> 회원
		FOREIGN KEY (
			"COMPANY_CODE" -- 회사코드
		)
		REFERENCES "COMPANY" ( -- 회사
			"COMPANY_CODE" -- 회사코드
		);

-- 업로드 정보
ALTER TABLE "upload_info"
	ADD
		CONSTRAINT "FK_POST_TO_upload_info" -- 게시글 -> 업로드 정보
		FOREIGN KEY (
			"BOARD_CODE2" -- 게시글 코드
		)
		REFERENCES "POST" ( -- 게시글
			"BOARD_CODE2" -- 게시글 코드
		);

-- 2차직종
ALTER TABLE "SECOND"
	ADD
		CONSTRAINT "FK_THIRD_TO_SECOND" -- 3차직종 -> 2차직종
		FOREIGN KEY (
			"THIRD_CODE" -- 3차직종코드
		)
		REFERENCES "THIRD" ( -- 3차직종
			"THIRD_CODE" -- 3차직종코드
		);

-- 공지사항 댓글
ALTER TABLE "NOTICE_CMT2"
	ADD
		CONSTRAINT "FK_MEMBER_TO_NOTICE_CMT2" -- 회원 -> 공지사항 댓글
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 공지사항 댓글
ALTER TABLE "NOTICE_CMT2"
	ADD
		CONSTRAINT "FK_NOTICE_TO_NOTICE_CMT2" -- 공지사항 -> 공지사항 댓글
		FOREIGN KEY (
			"NOTIFY_CODE" -- 공지사항 코드
		)
		REFERENCES "NOTICE" ( -- 공지사항
			"NOTIFY_CODE" -- 공지사항 코드
		);

-- 1차직종
ALTER TABLE "FIRST"
	ADD
		CONSTRAINT "FK_SECOND_TO_FIRST" -- 2차직종 -> 1차직종
		FOREIGN KEY (
			"SECOND_CODE" -- 2차직종코드
		)
		REFERENCES "SECOND" ( -- 2차직종
			"SECOND_CODE" -- 2차직종코드
		);

-- 스크랩
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_MEMBER_TO_SCRAP" -- 회원 -> 스크랩
		FOREIGN KEY (
			"SCRAPMEMBER_CODE" -- 스크랩하는 회원 코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원 코드
		);

-- 스크랩
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_JOBOPENING_TO_SCRAP" -- 채용공고 -> 스크랩
		FOREIGN KEY (
			"JOBOPENING_CODE" -- 채용공고 코드
		)
		REFERENCES "JOBOPENING" ( -- 채용공고
			"JOBOPENING" -- 채용공고 코드
		);

-- 스크랩
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_RESUME_TO_SCRAP" -- 이력서 -> 스크랩
		FOREIGN KEY (
			"RESUME_CODE" -- 이력서 코드
		)
		REFERENCES "RESUME" ( -- 이력서
			"RESUME_CODE" -- 이력서 코드
		);