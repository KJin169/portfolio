package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.TeacherReviewBean;
import kr.co.ezen.beans.WishListBean;


public interface BoardMapper {
	
	//종합 학원 게시판 목록 호출
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_classify like '%'||#{a_classify} "
			+ "order by a_joinDate desc")
	List<AcademyMemberBean> getGBoardList(String a_classify);
	
	//종합 학원 게시판 목록 호출(검색)
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_classify like '%'||#{a_classify} "
			+ "	and a_location like '%'||#{searchLoc}||'%' "
			+ "	and (#{searchGrade} between a_gradeMin and a_gradeMax or #{searchGrade} = '-1') "
			+ "	and (a_name like '%'||#{searchAcaName}||'%' or a_memberNo in (select a_memberNo"
			+ "                                                    		from ACADEMYSUBJECTT"
			+ "                                                    		where A_SUBJECT like '%'||#{searchAcaName}||'%'))"
			+ "order by a_joinDate desc")
	List<AcademyMemberBean> getGBoardSearchList(@Param("a_classify") String a_classify,
												@Param("searchLoc") String searchLoc,
												@Param("searchGrade") String searchGrade,
												@Param("searchAcaName") String searchAcaName);
	
	

	//종합 학원 정보 상세 보기
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_memberNo = #{a_memberNo}"
			+ "order by a_joinDate desc")
	AcademyMemberBean getAcademyInfoBasic(int a_memberNo);
	
	//학원 리뷰 조회
	@Select("select a_memberNo, r_no, r_writerNo, r_writerId, r_contents, r_score, r_writeTime "
			+ "from reviewT "
			+ "where a_memberNo = #{a_memberNo} "
			+ "order by (CASE WHEN r_writerNo = #{m_memberNo} THEN 1 ELSE 2 END), r_no desc")
	List<AcademyReviewBean> getAcademyInfoReview(@Param("a_memberNo") int a_memberNo, @Param("m_memberNo") int m_memberNo);
	
	//학원 과목 조회
	@Select("select a_memberNo, a_subject "
			+ "from academySubjectT "
			+ "where a_memberNo = #{a_memberNo} "
			+ "order by a_subject")
	List<AcademySubjectBean> getAcademyInfoSubject(int a_memberNo);
	
	//학원별 강사 조회
	@Select("select a_memberNo, t_name, t_subject, t_contents, t_file "
			+ "from academyTeacherT "
			+ "where a_memberNo = #{a_memberNo}")
	List<AcademyTeacherBean> getAcademyInfoTeacher(int a_memberNo);
	
	//개별 강사 조회
	@Select("select a_memberNo, t_name, t_subject, t_contents, t_file, a_name "
			+ "from academyTeacherT natural join academyMemberT "
			+ "where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
	AcademyTeacherBean getTeacherInfo(@Param("a_memberNo") int a_memberNo, @Param("t_name") String t_name);
	
	//개별 강사 리뷰 조회
	@Select("select a_memberNo, t_name, t_reNo, t_reWriterNo, t_reWriterId, t_reContents, t_score, t_reWriteTime "
			+ "from teacherReviewT "
			+ "where a_memberNo = #{a_memberNo} and t_name = #{t_name} "
			+ "order by (CASE WHEN t_reWriterNo = #{m_memberNo} THEN 1 ELSE 2 END), t_reNo desc")
	List<TeacherReviewBean> getTeacherReviewInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo, @Param("t_name") String t_name);
	
	//찜목록 확인(학원리스트)
	@Select("select * "
			+ "from wishListT "
			+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
	WishListBean getWishIs(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
	
	//찜목록 삭제
	@Delete("delete from wishListT "
			+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
	void deleteWish(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
	
	//찜목록 등록
	@Insert("insert into wishListT(m_memberNo, a_memberNo) "
			+ "values(#{m_memberNo},#{a_memberNo})")
	void insertWish(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
	
	//학원 리뷰 작성
	@SelectKey(statement = "select nvl(max(r_no),0)+1 from reviewT where a_memberNo = #{a_memberNo}",
			keyProperty = "r_no", before=true, resultType=int.class)
	@Insert("insert into reviewT(a_memberNo,r_no,r_writerNo,r_writerId,r_contents,r_score) "
			+ "values(#{a_memberNo},#{r_no},#{r_writerNo},#{r_writerId},#{r_contents},#{r_score})")
	void insertAcademyReview(AcademyReviewBean academyReviewBean_write);
	
	//학원 리뷰 삭제
	@Delete("delete from reviewT "
			+ "where a_memberNo = #{a_memberNo} and r_no = #{r_no}")
	void deleteAcademyReview(@Param("a_memberNo") int a_memberNo,@Param("r_no") int r_no);
	
	//강사 리뷰 작성
	@SelectKey(statement = "select nvl(max(t_reNo),0)+1 from teacherReviewT "
			+ "where a_memberNo = #{a_memberNo} and t_name = #{t_name}",
			keyProperty = "t_reNo", before=true, resultType=int.class)
	@Insert("insert into teacherReviewT(a_memberNo,t_name,t_reNo,t_reWriterNo,t_reWriterId,t_reContents,t_score) "
			+ "values(#{a_memberNo},#{t_name},#{t_reNo},#{t_reWriterNo},#{t_reWriterId},#{t_reContents},#{t_score})")
	void insertTeacherReview(TeacherReviewBean teacherReviewBean_write);
	
	//강사 리뷰 삭제
	@Delete("delete from teacherReviewT "
			+ "where a_memberNo = #{a_memberNo} and t_name=#{t_name} and t_reNo = #{t_reNo}")
	void deleteTeacherReview(@Param("a_memberNo") int a_memberNo,@Param("t_name") String t_name, @Param("t_reNo") int t_reNo);
	
}
