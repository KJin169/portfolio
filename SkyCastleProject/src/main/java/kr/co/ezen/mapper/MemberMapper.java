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
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.beans.SiteAskBean;

public interface MemberMapper {
	//일반회원로그인
	@Select("select * from memberT where m_id = #{m_id} and m_pw = #{m_pw}")
	 MemberBean getLoginMember(MemberBean memberBean);
	@Select("select * from memberT where m_id = #{m_id}")
	MemberBean getKakaoLoginMember(String m_id);
	//일반회원정보수정
	@Select("select m_id, m_name from memberT where m_memberNo = #{m_memberNo}")
	MemberBean getModifyMember(int m_memberNo);
	//일반회원mypage 일반회원정보
		@Select("select m_name, m_id, m_tele, m_email from memberT where m_memberNo = #{m_memberNo}")
		MemberBean getMypageMember(int m_memberNo);
	//일반회원mypage 일반회원자녀정보
	@Select("select c_name, c_grade, c_gender, c_level from memberChildT where m_memberNo = #{m_memberNo}")
	List<MemberChildBean> getMypageMemberChild(int m_memberNo);
	//일반회원수정
	@Update("update memberT set m_pw = #{m_pw}, m_tele = #{m_tele}, m_email = #{m_email} where m_memberNo = #{m_memberNo}")
	 void updateMember(MemberBean modifyMemberBean);
	//일반회원탈퇴
	@Delete("delete from memberChildT where m_memberNo = #{m_memberNo}")
	void deleteAllChild(int m_memberNo);
	@Delete("delete from memberT where m_memberNo = #{m_memberNo}")
	 void deleteMemeber(int m_memberNo);
	@Delete("delete from wishListT where m_memberNo = #{m_memberNo}")
	 void deleteWishList(int m_memberNo);
	
	//일반회원가입
	@Insert("insert into membert(m_classify, m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email) "
			+ "values(#{m_classify} ,m_sq.nextval, #{m_id}, #{m_pw}, #{m_name}, #{m_birth}, #{m_gender}, #{m_tele}, #{m_email})")
	 void joinMember(MemberBean joinMemberBean);
	//자녀정보입력
	@Insert("insert into memberChildT(m_memberNo, c_name, c_grade, c_gender, c_level)"
			+ "values(#{m_memberNo}, #{c_name}, #{c_grade}, #{c_gender}, #{c_level})")
	void insertChild(MemberChildBean insertChildBean);
	//자녀정보수정페이지
	@Select("select * from memberChildT where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	MemberChildBean getModifyChild(MemberChildBean modifyChildBean);
	//자녀정보수정
	@Update("update memberChildT set c_grade = #{c_grade}, c_gender = #{c_gender}, c_level = #{c_level} "
			+ "where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	void modifyChild(MemberChildBean modifyChild);
	//자녀정보삭제
	@Delete("delete from memberChildT where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	 void deleteChild(MemberChildBean deleteChildBean);
	//임시비밀번호로 변경
	@Update("update memberT set m_pw = #{m_pw} where m_id = #{m_id} and m_email = #{m_email}")
	int updatePw(MemberBean memberBean);
	
	//id로 멤버정보 호출 - > id 비교
	@Select("select * from memberT where m_id = #{m_id}")
	MemberBean readMember(String m_id);
	

	//내가 쓴 문의사항
	@Select("select sa_title, sa_time "
			+ "from siteAskT join memberT on sa_memberNo = m_memberNo "
			+ "where m_memberNo = #{m_memberNo} "
			+ "order by sa_time desc")
	List<SiteAskBean> getMyaskList(int m_memberNo, RowBounds rowBounds);
		
	@Select("select sa_tele, m_email, sa_time, sa_title, sa_contents, sa_file "
			+ "from siteAskT join memberT on sa_memberNo = m_memberNo "
			+ "where m_memberNo = #{m_memberNo} "
			+ "and sa_time = #{sa_time}")
	SiteAskBean getMyaskRead(@Param("sa_time") Timestamp sa_time, @Param("m_memberNo") int m_memberNo);
		
	//총 게시글 수
	@Select("select count(*) "
			+ "from siteAskT s, memberT m "
			+ "where s.sa_memberNo = m.m_memberNo "
			+ "and m.m_memberNo = #{m_memberNo, jdbcType=VARCHAR}")
	int getMyAskListCnt(MemberBean myAskBean);
		
	//페이징
	@Select("select count(*) "
			+ "from siteAskT s, memberT m "
			+ "where sa_memberNo = m_memberNo "
			+ "and m_memberNo = #{m_memberNo, jdbcType=VARCHAR}")
	int getMyAskContentCnt(int m_memberNo);
		
		//관리자 마이페이지 차후 월별 가입 회원 수 등 추가 예정
		//@Select("select m_memberNo from memberT")
		//List<MemberBean> getAdminPageList();
		
	//관리자 페이지 : 회원 목록
	@Select("select m_classify, m_name, m_memberNo, m_joinDate, m_confirm "
			+ "from memberT ")
	List<MemberBean> getAdMemberList();
	
	//총 회원 수
	@Select("select count(*) from memberT")
	int getAdminMemberCnt(MemberBean myAdminMemberBean);
	 
	//email 확인
	@Select("select m_id from memberT where m_id=#{m_id, jdbcType=VARCHAR }")
	String selectEmailKakao(String m_email);
   
	//찜목록 페이지
	@Select("select w.a_memberNo,a_mainImg, a_name, a_introduce, a_location, a_gradeMin, a_gradeMax from "
			+ "academyMemberT a1, academyInfoT a2, wishlistT w "
			+ "where a1.a_memberNo = a2.a_memberNo and a2.a_memberNo = w.a_memberNo "
			+ "and m_memberNo = #{m_memberNo}")
	List<AcademyMemberBean> myWishList(int m_memberNo);
	
	//메인 찜목록
	@Select("select a_memberNo, a_mainImg, a_name, a_introduce, a_location, a_gradeMin, a_gradeMax "
			+ "from (select ROW_NUMBER() OVER(ORDER BY a_name) rnum, w.a_memberNo, a_mainImg, a_name, a_introduce, a_location, a_gradeMin, a_gradeMax "
			+ "      	from academyMemberT a1, academyInfoT a2, wishlistT w "
			+ "         where a1.a_memberNo = a2.a_memberNo and a2.a_memberNo = w.a_memberNo "
			+ "         and m_memberNo = #{m_memberNo}) "
			+ "where rnum <=3")
	List<AcademyMemberBean> mainWishList(int m_memberNo);
	
	
	
}
