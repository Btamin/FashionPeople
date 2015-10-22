-- 회원
CREATE TABLE `Member` (
	`USER_ID`  VARCHAR(25)  NOT NULL COMMENT '아이디', -- 아이디
	`EMAIL`    VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	`PWD`      VARCHAR(25)  NOT NULL COMMENT '비밀번호', -- 비밀번호
	`NICKNAME` VARCHAR(20)  NOT NULL COMMENT '별명', -- 별명
	`MALE`     BOOLEAN      NOT NULL DEFAULT true COMMENT '성별', -- 성별
	`BIRTH`    VARCHAR(25)  NOT NULL COMMENT '생년월일', -- 생년월일
	`CAUTION`  BOOLEAN      NOT NULL DEFAULT false COMMENT '경고', -- 경고
	`PICTURE`  VARCHAR(255) NULL     COMMENT '사진', -- 사진
	`LEVEL`    INT(2)       NOT NULL DEFAULT 0 COMMENT '등급' -- 등급
)
COMMENT '회원';

-- 회원
ALTER TABLE `Member`
	ADD CONSTRAINT `PK_Member` -- 회원 기본키
		PRIMARY KEY (
			`USER_ID` -- 아이디
		);

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX `UIX_Member`
	ON `Member` ( -- 회원
		`EMAIL` ASC,    -- 이메일
		`NICKNAME` ASC  -- 별명
	);

-- 게시판
CREATE TABLE `Board` (
	`Board_Num` INT(30)      NOT NULL COMMENT '글번호', -- 글번호
	`TITLE`     VARCHAR(25)  NOT NULL COMMENT '글제목', -- 글제목
	`PICTURE`   VARCHAR(255) NOT NULL COMMENT '사진', -- 사진
	`TEXT`      VARCHAR(255) NULL     COMMENT '글내용', -- 글내용
	`CRE_DATE`  DATE         NOT NULL COMMENT '등록시간', -- 등록시간
	`CLICK`     INT(30)      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	`GOOD`      INT(20)      NULL     DEFAULT 0 COMMENT '좋아요', -- 좋아요
	`BAD`       INT(20)      NULL     DEFAULT 0 COMMENT '별로', -- 별로
	`WARNING`   INT(20)      NULL     DEFAULT 0 COMMENT '신고', -- 신고
	`USER_ID`   VARCHAR(25)  NULL     COMMENT '아이디' -- 아이디
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `Board`
	ADD CONSTRAINT `PK_Board` -- 게시판 기본키
		PRIMARY KEY (
			`Board_Num` -- 글번호
		);

ALTER TABLE `Board`
	MODIFY COLUMN `Board_Num` INT(30) NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 댓글
CREATE TABLE `REPLY` (
	`REPLY_NUM` INT(20)      NOT NULL COMMENT '답글번호', -- 답글번호
	`WRITER`    VARCHAR(25)  NOT NULL COMMENT '리플작성자', -- 리플작성자
	`TEXT`      VARCHAR(255) NOT NULL COMMENT '리플내용', -- 리플내용
	`CRE_DATE`  DATE         NOT NULL COMMENT '작성날짜', -- 작성날짜
	`WARNING`   INT(20)      NOT NULL DEFAULT 0 COMMENT '신고', -- 신고
	`Board_Num` INT(30)      NULL     COMMENT '글번호' -- 글번호
)
COMMENT '댓글';

-- 댓글
ALTER TABLE `REPLY`
	ADD CONSTRAINT `PK_REPLY` -- 댓글 기본키
		PRIMARY KEY (
			`REPLY_NUM` -- 답글번호
		);

ALTER TABLE `REPLY`
	MODIFY COLUMN `REPLY_NUM` INT(20) NOT NULL AUTO_INCREMENT COMMENT '답글번호';

-- 자유게시판
CREATE TABLE `FREEBOARD` (
	`Board_Num` INT(30)      NOT NULL COMMENT '글번호', -- 글번호
	`TITLE`     VARCHAR(25)  NOT NULL COMMENT '글제목', -- 글제목
	`TEXT`      VARCHAR(255) NOT NULL COMMENT '글내용', -- 글내용
	`PICTURE`   VARCHAR(255) NULL     COMMENT '사진', -- 사진
	`CRE_DATA`  DATE         NOT NULL COMMENT '등록시간', -- 등록시간
	`CLICK`     INT(30)      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	`WARNING`   INT(20)      NOT NULL DEFAULT 0 COMMENT '신고', -- 신고
	`USER_ID`   VARCHAR(25)  NULL     COMMENT '아이디' -- 아이디
)
COMMENT '자유게시판';

-- 자유게시판
ALTER TABLE `FREEBOARD`
	ADD CONSTRAINT `PK_FREEBOARD` -- 자유게시판 기본키
		PRIMARY KEY (
			`Board_Num` -- 글번호
		);

ALTER TABLE `FREEBOARD`
	MODIFY COLUMN `Board_Num` INT(30) NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 게시판
ALTER TABLE `Board`
	ADD CONSTRAINT `FK_Member_TO_Board` -- 회원 -> 게시판
		FOREIGN KEY (
			`USER_ID` -- 아이디
		)
		REFERENCES `Member` ( -- 회원
			`USER_ID` -- 아이디
		);

-- 댓글
ALTER TABLE `REPLY`
	ADD CONSTRAINT `FK_Board_TO_REPLY` -- 게시판 -> 댓글
		FOREIGN KEY (
			`Board_Num` -- 글번호
		)
		REFERENCES `Board` ( -- 게시판
			`Board_Num` -- 글번호
		);

-- 댓글
ALTER TABLE `REPLY`
	ADD CONSTRAINT `FK_FREEBOARD_TO_REPLY` -- 자유게시판 -> 댓글
		FOREIGN KEY (
			`Board_Num` -- 글번호
		)
		REFERENCES `FREEBOARD` ( -- 자유게시판
			`Board_Num` -- 글번호
		);

-- 자유게시판
ALTER TABLE `FREEBOARD`
	ADD CONSTRAINT `FK_Member_TO_FREEBOARD` -- 회원 -> 자유게시판
		FOREIGN KEY (
			`USER_ID` -- 아이디
		)
		REFERENCES `Member` ( -- 회원
			`USER_ID` -- 아이디
		);