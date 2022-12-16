drop SEQUENCE ev_sq; --삭제

drop SEQUENCE eb_sq; --삭제
drop SEQUENCE mb_sq; --삭제
drop SEQUENCE gb_sq; --삭제

drop table eventBoardT; --삭제

drop table eBoardReviewT; --삭제
drop table eBoardT; --삭제
drop table mBoardReviewT; --삭제
drop table mBoardT; --삭제
drop table gBoardReviewT; --삭제
drop table gBoardT; --삭제

drop table memberConnectionT; --삭제

drop table topMenuT; --삭제

--위는 이전 버전 삭제

drop SEQUENCE fb_sq;
drop SEQUENCE nb_sq;

drop SEQUENCE a_sq;
drop SEQUENCE m_sq;


drop table siteAcaAskT;
drop table FAQBoardT;
drop table noticeBoardT;
drop table siteAskT;
drop table counselReservationT;


drop table wishListT;
drop table blacklistT;
drop table teacherReviewT;
drop table academyTeacherT;
drop table academySubjectT;
drop table reviewT;
drop table academyPayT;
drop table academyInfoT;
drop table academyMemberT;
drop table memberChildT;
drop table memberT;
--테이블을 다시 만들 때 위의 순서대로 드랍 후에 아래의 생성코드를 전체 선택해서 실행해주세요.


--1.0 일반 회원 번호 시퀀스
create SEQUENCE m_sq
    INCREMENT by 1
    START with  10000001
    MAXVALUE    99999999
    MINVALUE    10000001
    NOCYCLE;

--1. 일반회원 테이블
create table memberT(
    m_classify  number(3)
        default '100' not null,
    m_memberNo  number(8)
        PRIMARY key,
    m_id    varchar2(40)
        unique not null,
    m_pw    varchar2(30)
        not null,
    m_name  varchar2(30)
        not null,
    m_birth varchar2(6)
        not null,
    m_gender    number(1)
        not null,
    m_tele  varchar2(11)
        not null,
    m_joinDate  timestamp
        default systimestamp not null,
    m_email varchar2(60),
    m_confirm varchar2(2)
        default 'n' not null
);

--관리자, 회원 등록 예시
insert into membert(m_classify,m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email)
    values('999','1001','admin01','12345678','Admin','901010','1','01012341234','admin@asd.com');
insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email,m_confirm)
    values(m_sq.nextval,'user01','12345678','유저일','921212','2','01012124545','user01@asd.com','y');
insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email,m_confirm)
    values(m_sq.nextval,'user02','12345678','유저이','901112','1','01012120002','user02@asd.com','y');
insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email,m_confirm)
    values(m_sq.nextval,'user03','12345678','유저삼','901012','1','01012120003','user03@asd.com','y');
insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email)
    values(m_sq.nextval,'user04','12345678','유저사','900812','2','01012120004','user04@asd.com');



--2. 학부모 자녀 정보 테이블
CREATE TABLE memberChildT(
    m_memberNo    number(8) not null,
        CONSTRAINT child_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    c_name  varchar2(30)
        not null,
    c_grade varchar2(9)
        not null,
    c_gender    varchar2(3)
        not null,
    c_level varchar2(9)
        DEFAULT '미입력',
    constraint c_pk primary key(m_memberNo, c_name)
);

--자녀 등록 예시
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000001,'자녀11','7','남','미입력');
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000001,'자녀12','10','여','미입력');
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000001,'자녀13','11','여','미입력');
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000002,'자녀21','6','남','미입력');
insert into memberChildT(m_memberNo,c_name,c_grade,c_gender,c_level)
    values(10000003,'자녀31','9','여','미입력');



--3.0 학원 회원 번호 시퀀스
create SEQUENCE a_sq
    INCREMENT by 1
    START with  100001
    MAXVALUE    999999
    MINVALUE    100001
    NOCYCLE;

--3. 학원 회원 정보 테이블
CREATE TABLE academyMemberT(
    a_memberNo  number(6)
        PRIMARY key,
    a_id    varchar2(40)
        UNIQUE not null,
    a_pw    varchar2(30)
        not null,
    a_name  varchar2(60)
        unique not null,
    a_CRN   varchar2(10)
        not null,
    a_location  varchar2(60)
        not null,
    a_locationDetail    varchar2(100)
        not null,
    a_tele  varchar2(11)
        not null,
    a_joinDate  timestamp
        DEFAULT systimestamp not null,
    a_classify number(1)
        not null,
    a_infoExpose    char(1)
        default 'n' not null
);

--학원 회원 등록 예시
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca01','12345678','이젠종합학원','1234567891','서울특별시 관악구 신림동','이젠 601호','01099998888',1);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca02','12345678','b단과학원','1234567892','서울특별시 양천구 목동','222-22','01099997777',2);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca03','12345678','c미술학원','1234567893','서울특별시 영등포구 여의도동','444-44','01099996666',3);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca04','12345678','D종합학원','1234567894','경기도 수원시 팔달구','111-11','01099995555',1);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca05','12345678','E종합학원','1234567895','서울특별시 관악구 서림동','333-2','01099994444',1);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca06','12345678','F종합학원','1234567896','충청북도 충주시 금릉동','789-12','01099993333',1);
insert into academyMemberT(a_memberNo,a_id,a_pw,a_name,a_CRN,a_location,a_locationDetail,a_tele,a_classify)
    values(a_sq.nextval,'aca07','12345678','ㅎ음악학원','1234567897','서울특별시 관악구 신림동','424-44','01099992222',3);



--4. 학원 소개 정보 테이블
CREATE TABLE academyInfoT(
    a_memberNo  number(6)
        PRIMARY key,
        CONSTRAINT info_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    a_introduce long
        not null,
    a_mainImg   varchar2(3000),
    a_file  varchar2(3000),
    a_gradeMin  varchar2(6),
    a_gradeMax  varchar2(6),
    a_shuttle   varchar2(3)
        default 'n',
    a_openTime  varchar2(8),
    a_closeTime varchar2(8)
);

--학원 소개 정보 예시
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100001,'종합 학원입니다.','','','4','9','y','14:00','20:30');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100002,'단과 학원입니다.','','','7','13','n','16:00','');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100003,'미술 학원입니다.','','','1','10','n','16:00','21:00');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100004,'종합 학원입니다.','','','4','10','y','15:00','21:30');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100005,'종합 학원입니다.','','','6','12','y','15:00','21:30');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100006,'종합 학원입니다.','','','4','12','y','15:00','21:30');
insert into academyInfoT(a_memberNo,a_introduce,a_mainImg,a_file,a_gradeMin,a_gradeMax,a_shuttle,a_openTime,a_closeTime)
    values(100007,'음악 학원입니다.','','','0','12','n','16:00','21:00');



--5. 학원 결제 정보 테이블
CREATE TABLE academyPayT(
    a_memberNo number(6),
        CONSTRAINT pay_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    a_payStart  timestamp
        not null,
    a_payEnd    timestamp
        not null
);

--학원 결제 정보 예시
insert into academyPayT(a_memberNo,a_payStart,a_payEnd)
    values(100001,'22/07/01','23/01/31');
insert into academyPayT(a_memberNo,a_payStart,a_payEnd)
    values(100002,'22/07/01','22/07/31');
insert into academyPayT(a_memberNo,a_payStart,a_payEnd)
    values(100002,'22/08/05','22/09/04');
insert into academyPayT(a_memberNo,a_payStart,a_payEnd)
    values(100004,'22/07/01','22/08/31');
insert into academyPayT(a_memberNo,a_payStart,a_payEnd)
    values(100004,'22/09/01','23/08/31');


--6. 학원 리뷰 테이블
CREATE TABLE reviewT(
    a_memberNo  number(6)
        not null,
    r_no    number(4)
        not null,
    r_writerNo  number(8)
        not null,
    r_writerId  varchar2(40)
        not null,
    r_contents  varchar2(1500),
    r_score number(1)
        not null,
    r_writeTime timestamp
        default systimestamp not null,
    constraint r_pk primary key(a_memberNo, r_writerNo)
);


--학원 리뷰 예시
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100001,1,10000001,'user01','강의실이 아늑하고, 강사님이 친절해요',5);
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100001,2,10000002,'user02','강의실이 아늑하고, 강사님이 친절해요',4);
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100001,3,10000003,'user03','공부할 수 있는 분위기가 잘 갖추어져 있어요',2);
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100001,4,10000004,'user04','선생님들이 성실하게 가르쳐주세요',5);
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100004,1,10000002,'user02','그저 그래요.',3);
insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score)
    values(100004,2,10000003,'user03','그저 그래요.',4);



--7. 학원 과목 정보
CREATE TABLE academySubjectT(
    a_memberNo  number(6)   not null,
        CONSTRAINT subject_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    a_subject   varchar2(45)
        not null
);

--학원 과목 예시
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'국어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'수학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100001,'영어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100002,'영어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100003,'미술');
insert into academySubjectT(a_memberNo,a_subject)
    values(100004,'국어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100004,'수학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100004,'과학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100005,'사회');
insert into academySubjectT(a_memberNo,a_subject)
    values(100005,'수학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100005,'영어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100006,'국어');
insert into academySubjectT(a_memberNo,a_subject)
    values(100006,'수학');
insert into academySubjectT(a_memberNo,a_subject)
    values(100006,'논술');
insert into academySubjectT(a_memberNo,a_subject)
    values(100007,'음악');
insert into academySubjectT(a_memberNo,a_subject)
    values(100007,'피아노');


--8. 학원 강사 정보 테이블
CREATE TABLE academyTeacherT(
    a_memberNo  number(6)   not null,
        CONSTRAINT teacher_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    t_name  varchar2(30)
        not null,
    t_subject   varchar2(45)
        not null,
    t_contents  varchar2(3000),
    t_file  varchar2(3000),
    constraint t_pk primary key(a_memberNo, t_name)
);

--학원 강사 예시
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100001,'김강사','영어','hello~','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100001,'박강산','국어','안녕하세요.','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100002,'이하나','영어','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100003,'이그림','미술','hello~','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100004,'박국어','국어','안녕하세요.','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100004,'이영어','수학','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100004,'어버버','수학','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100004,'이사회','과학','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100005,'가가가','사회','안녕하세요.','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100005,'이이이','수학','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100005,'우우우','영어','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100006,'smith','국어','안녕하세요.','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100006,'madmath','수학','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100006,'enough','수리논술','Hi','');
insert into academyTeacherT(a_memberNo,t_name,t_subject,t_contents,t_file)
    values(100007,'김뮤직','음악','Hi','');


--9. 강사 리뷰 정보 테이블
CREATE TABLE teacherReviewT(
    a_memberNo  number(6)
        not null,
    t_name  varchar2(30)
        not null,
    t_reNo    number(4)
        not null,
    t_reWriterNo  number(8)
        not null,
    t_reWriterId  varchar2(40)
        not null,
    t_reContents    varchar2(1500),
    t_score number(1)
        not null,
    t_reWriteTime timestamp
        default systimestamp not null,
    constraint t_review_pk primary key(a_memberNo, t_name, t_reWriterNo)
);

--강사 리뷰 예시
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'박강산',1,10000001,'user01','모르는 걸 성실하게 답변해주십니다.','5');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'박강산',2,10000002,'user02','수업중 목소리가 너무 작아요.','2');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'박강산',3,10000003,'user03','노멀합니다.','3');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'박강산',4,10000004,'user04','선생님 덕분에 2등급이나 올렸어요.','5');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'김강사',1,10000001,'user01','수업이 재밌어요.','5');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'김강사',2,10000002,'user02','숙제가 너무 많아요.','1');
insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score)
    values(100001,'김강사',3,10000003,'user03','학생들을 하나하나 이끌어 주셔서 따라가기가 수월해요.','4');



--10. 신고/블랙리스트 관리 정보 테이블
CREATE TABLE blacklistT(
    m_memberNo  number(8)
        not null,
    a_memberNo  number(6)
        not null,
    black_contents  varchar2(3000)
        not null,
    black_time  timestamp
        DEFAULT systimestamp not null,
    constraint black_pk primary key(a_memberNo, m_memberNo)
);

-- 신고/블랙리스트 관리 예시
insert into blacklistT(m_memberNo, a_memberNo, black_contents)
    values(10000002, 100001, '수업 중 면학 분위기를 헤치는 학생');
insert into blacklistT(m_memberNo, a_memberNo, black_contents) 
    values(10000003, 100001, '아이의 성취도에 맞지 않는 클래스로 올려달라고 재차 요청하는 학부모');
insert into blacklistT(m_memberNo, a_memberNo, black_contents) 
    values(10000004, 100001, '기물파손 2회');
insert into blacklistT(m_memberNo, a_memberNo, black_contents) 
    values(10000005, 100001, '수업을 참관해서 봐야겠다고 우기는 어머니');


--11. 학원 찜 목록 테이블
CREATE TABLE wishListT(
    m_memberNo  number(8)
        not null,
        CONSTRAINT wish_m_memberNo_fk foreign key(m_memberNo)
            REFERENCES memberT(m_memberNo),
    a_memberNo  number(6)
        not null,
        CONSTRAINT wish_a_memberNo_fk foreign key(a_memberNo)
            REFERENCES academyMemberT(a_memberNo),
    constraint wish_pk primary key(m_memberNo, a_memberNo)
);

--11. 학원 찜 예시
insert into wishListT(m_memberNo,a_memberNo)
    values(10000001,100001);


--12. 학원상담 예약문의
CREATE TABLE counselReservationT(
    a_memberNo  number(6)
        not null,
    m_memberNo  number(8)
        not null,
    cr_name varchar2(30)
        not null,
    cr_childName    varchar2(30),
    cr_tele varchar2(11)
        not null,
    cr_writeTime    timestamp
        default systimestamp not null,
    cr_contents varchar2(1500)
);

-- 학원상담 예약문의 예시 (현재 없음)



--13. 사이트 문의 테이블
CREATE TABLE siteAskT(
    sa_memberNo number(8)
        not null,
    sa_tele varchar2(11),
    sa_time timestamp
        default systimestamp not null,
    sa_title    varchar2(100)
        not null,
    sa_contents varchar2(1500)
        not null,
    sa_file varchar2(3000)
);

-- 사이트 문의 예시

insert into siteAskT(sa_memberno, sa_tele, sa_title, sa_contents) 
    values('10000001', '01011112222', '빨리 해결해주세요', '아이디랑 비밀번호를 모르겠어요. 제 계정 정보 좀 알려주세요');
insert into siteAskT(sa_memberno, sa_tele, sa_title, sa_contents) 
    values('10000001', '01011112222', '상담문의 관련 질문입니다.', '학원으로 다이렉트 연결되는 건가요? 아니면 사이트를 통해서 연락이 오는건가요?');
insert into siteAskT(sa_memberno, sa_tele, sa_title, sa_contents) 
    values('10000001', '01011112222', '탈퇴한 이메일 때문에 비밀번호 찾기가 안됩니다', '탈퇴한 임일 때문에 비밀번호 찾기를 이용할 수 없는데 다른 방법을 제시해주세요.');



--14.0 공지사항 게시물 번호 시퀀스
create SEQUENCE nb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--14. 공지사항 게시판 테이블
CREATE TABLE noticeBoardT(
    nb_no   number(4)
        primary key,
    nb_title    varchar2(100)
        not null,
    nb_contents long
        not null,
    nb_writeTime    timestamp
        default systimestamp not null,
    nb_modifyTime   timestamp,
    nb_file varchar2(3000),
    nb_viewCount    number(8)
        default '0' not null
);


--공지사항 게시판 예시
insert into noticeBoardT(nb_no,nb_title,nb_contents,nb_file)
    values(nb_sq.nextval,'11월 영어마을 체험 관련 공지사항','공지사항 테스트입니다','');
insert into noticeBoardT(nb_no,nb_title,nb_contents,nb_file)
    values(nb_sq.nextval,'12월 공지사항','공지사항 테스트입니다.','');



--15.0  FAQ 게시물 번호 시퀀스
create SEQUENCE fb_sq
    INCREMENT by 1
    START with  1
    NOMAXVALUE
    MINVALUE    1
    NOCYCLE;

--15. FAQ 게시판 테이블
CREATE TABLE FAQBoardT(
    fb_no   number(4)
        primary key,
    fb_contentsQ    varchar2(1500)
        not null,
    fb_contentsA    varchar2(3000)
        not null
);

--FAQ 게시판 예시
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'스카이캐슬은 어떤 사이트인가요?','스카이캐슬은 학원과 학부모,학생들의 연결을 돕는 서비스를 제공합니다. 더 자세한 내용은 회사 소개를 참고하시기 바랍니다.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'스카이캐슬의 이용방법은 무엇인가요?','일반회원(학생, 학부모)으로 가입하신 분이라면 모든 서비스를 차별없이 이용할 수 있습니다. 일반회원 로그인으로 모든 사이트 기능을 누려보세요.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'비밀번호 찾기 실패 관련','이메일을 더 이상 사용할 수 없는 경우 고객센터로 연락바랍니다.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'회원탈퇴는 어떻게 하나요?','회원탈퇴는 로그인 후 마이페이지를 통해 할 수 있습니다.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'[결제]결제 수단은 무엇이 있나요?','스카이캐슬은 기본적으로 이니시스 결제툴을 통해 서비스를 제공해드리며 카카오페이, 네이버페이 등의 방법도 이용하실 수 있습니다. ');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'[결제]결제 내역을 확인할 수 있나요?','학원 회원이시라면 "마이페이지 - 결제 내역"에서 확인 가능합니다.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'한 학기는 몇 개월인가요?','한 학기는 3개월(13주)로 운영됩니다.');
insert into FAQBoardT(fb_no,fb_contentsQ,fb_contentsA)
    values(fb_sq.nextval,'학원 주소를 바꾸고 싶어요','학원 회원 - 마이페이지 정보 수정을 통해 주소, 상세주소 변경이 가능합니다.');
    


--16. 학원 문의 테이블
CREATE TABLE siteAcaAskT(
    a_memberNo number(6)
        not null,
    a_name  varchar2(60)
        not null,
    a_tele varchar2(11),
    aa_title    varchar2(100)
        not null,
    aa_contents varchar2(1500)
        not null,
    aa_time timestamp
        default systimestamp not null,
    aa_file varchar2(3000)
);

    
commit;

    
    
    
