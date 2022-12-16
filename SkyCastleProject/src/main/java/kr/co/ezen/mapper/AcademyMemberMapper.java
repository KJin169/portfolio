package kr.co.ezen.mapper;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;

public interface AcademyMemberMapper {
	//학원회원가입
	@Insert("insert into academyMemberT(a_memberNo, a_id, a_pw, a_name,"
			+ " a_CRN, a_location, a_locationDetail, a_tele, a_classify)"
			+ "values(a_sq.nextval, #{a_id}, #{a_pw}, #{a_name}, #{a_CRN},"
			+ " #{a_location}, #{a_locationDetail}, #{a_tele}, #{a_classify})")
	void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean);
	//학원회원로그인	
	@Select("select * from academyMemberT where a_id = #{a_id, jdbcType=VARCHAR} and a_pw = #{a_pw, jdbcType=VARCHAR}")
	AcademyMemberBean getloginAcademyMember(AcademyMemberBean academyMemberBean);
	//학원회원수정페이지
	@Select("select * from academyMemberT where a_memberNo = #{a_memberNo}")
	AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean);
	//학원회원수정
	@Update("update academyMemberT set a_pw = #{a_pw}, a_location = #{a_location}, a_locationDetail = #{a_locationDetail},"
			+ "a_tele = #{a_tele}, a_classify = #{a_classify} where a_memberNo = #{a_memberNo}")
	void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean);
	//학원회원삭제
	@Delete("delete from academyMemberT where a_memberNo = #{a_memberNo}")
	void deleteAcademyMember(int a_memberNo);
	//학원소개입력
	@Insert("insert into academyInfoT(a_memberNo, a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, "
			+ "a_shuttle, a_openTime, a_closeTime) values(#{a_memberNo}, #{a_introduce}, #{a_mainImg, jdbcType=VARCHAR}, #{a_file, jdbcType=VARCHAR}, "
			+ "#{a_gradeMin}, #{a_gradeMax}, #{a_shuttle}, #{a_openTime}, #{a_closeTime})")
	void insertAcademyIntroduce(AcademyMemberBean introduceAcademyMemberBean);
	//학원소개정보조회
	@Select("select * from academyInfoT where a_memberNo = #{a_memberNo}")
	AcademyMemberBean infoIntroduce(int a_memberNo);
	//학원소개정보수정
	@Update("update academyInfoT set a_introduce = #{a_introduce}, a_mainImg = #{a_mainImg, jdbcType=VARCHAR}, a_file = #{a_file, jdbcType=VARCHAR}, "
			+ "a_gradeMin = #{a_gradeMin}, a_gradeMax = #{a_gradeMax}, a_shuttle = #{a_shuttle}, a_openTime = #{a_openTime}, a_closeTime = #{a_closeTime}"
			+ " where a_memberNo = #{a_memberNo}")
	void modifyAcademyIntroduce(AcademyMemberBean infoIntroduce);
	//학원소개정보삭제
	@Delete("delete from academyInfoT where a_memberNo = #{a_memberNo}")
	void deleteAcademyIntroduce(int a_memberNo);
	//강사정보입력
		@Insert("insert into academyteacherT(a_memberNo, t_name, t_subject, t_contents, t_file) "
				+ "values(#{a_memberNo}, #{t_name}, #{t_subject}, #{t_contents}, #{t_file, jdbcType=VARCHAR})")
		void insertTeacher(AcademyTeacherBean insertAcademyTeacherBean);
		
		//강사정보수정
		@Update("update academyteacherT set t_subject = #{t_subject}, t_contents = #{t_contents}, "
				+ "t_file = #{t_file, jdbcType=VARCHAR} where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
		void modifyTeacher(AcademyTeacherBean modifyAcademyTeacherBean);
		
		//강사개인정보조회
		@Select("select * from academyteacherT where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
		AcademyTeacherBean teacherInfo(AcademyTeacherBean infoAcademyTeacherBean);
		
		//강사정보조회
		@Select("select * from academyteacherT where a_memberNo = #{a_memberNo}")
		List<AcademyTeacherBean> academyTeacherList(int a_memberNo);
		
		//강사정보삭제
		@Delete("delete from academyteacherT where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
		void deleteTeacher(AcademyTeacherBean deleteAcademyTeacherBean);
		
		//결제내역조회
		@Select("select a_payStart, a_payEnd from academypayT where a_memberNo = #{a_memberNo}")
		List<AcademyPayBean> getAcademyPayList(int a_memberNo);
	
	
	
	//관리자 페이지 : 학원 목록
		@Select("select a_classify, a_name, a_memberNo, a_joinDate, a_infoExpose "
				+ "from academyMemberT ")
		List<AcademyMemberBean> getAdAcademyList();
		//총 학원 수
		@Select("select count(*) from academyMemberT")
		int getAdminAcaCnt(AcademyMemberBean myAdminAcaBean);
	
		
	//내가 쓴 문의사항
		@Select("select a2.aa_title, a2.aa_time "
				+ "from siteAcaAskT a2, academyMemberT a1 "
				+ "where a2.a_memberNo = a1.a_memberNo "
				+ "and a2.a_memberNo = #{a_memberNo} "
				+ "order by a2.aa_time desc")
		List<SiteAcaAskBean> getMyaskList(int a_memberNo, RowBounds rowBounds);
				
		@Select("select a1.a_tele, a2.aa_time, a2.aa_title, a2.aa_contents, a2.aa_file "
				+ "from siteAcaAskT a2, academyMemberT a1 "
				+ "where a2.a_memberNo = a1.a_memberNo "
				+ "and a2.a_memberNo = #{a_memberNo} "
				+ "and a2.aa_time = #{aa_time}")
		SiteAcaAskBean getMyaskRead(@Param("aa_time") Timestamp aa_time, @Param("a_memberNo") int a_memberNo);
		//총 게시글 수
		@Select("select count(*) "
				+ "from siteAcaAskT a2, academyMemberT a1 "
				+ "where a2.a_memberNo = a1.a_memberNo "
				+ "and a2.a_memberNo = #{a_memberNo, jdbcType=VARCHAR}")
		int getMyAskListCnt(AcademyMemberBean myAcaAskBean);
		//페이징
		@Select("select count(*) "
				+ "from siteAcaAskT a2, academyMemberT a1 "
				+ "where a2.a_memberNo = a1.a_memberNo "
				+ "and a2.a_memberNo = #{a_memberNo, jdbcType=VARCHAR}")
		int getMyAskContentCnt(int a_memberNo);	
		
		
	//학원 마이페이지 문의사항
	@Select("select * from siteAcaAskT where a_memberNo = #{a_memberNo} ")
	List<SiteAcaAskBean> getAcaAskList(int a_memberNo);
	
	//학원 블랙리스트
	@Select("select a_name, m_name, black_contents, black_time from "
			+ "academymemberT a, memberT m, blacklistT b "
			+ "where a.a_memberNo = b.a_memberNo and m.m_memberNo = b.m_memberNo "
			+ "and a.a_memberNo = #{a_memberNo}")
	List<BlackListBean> getBlackListList(int a_memberNo);
}
