package kr.co.ezen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.TeacherReviewBean;
import kr.co.ezen.beans.WishListBean;
import kr.co.ezen.mapper.BoardMapper;

@Repository
public class BoardDAO {

	@Autowired
	private BoardMapper boardMapper;
	
	//종합 학원 게시판 목록 호출
	public List<AcademyMemberBean> getGBoardList(String a_classify) {
		return boardMapper.getGBoardList(a_classify);
	}
	
	//종합 학원 게시판 목록 호출(검색)
	public List<AcademyMemberBean> getGBoardSearchList(String a_classify,String searchLoc,String searchGrade,String searchAcaName) {
		return boardMapper.getGBoardSearchList(a_classify,searchLoc,searchGrade,searchAcaName);
	}
	
	//종합 학원 정보 상세 보기
	public AcademyMemberBean getAcademyInfoBasic(int a_memberNo) {
		return boardMapper.getAcademyInfoBasic(a_memberNo);
	}
	
	//학원 리뷰 조회
	public List<AcademyReviewBean> getAcademyInfoReview(int a_memberNo, int m_memberNo) {
		return boardMapper.getAcademyInfoReview(a_memberNo, m_memberNo);
	}
	
	//학원 과목 조회
	public List<AcademySubjectBean> getAcademyInfoSubject(int a_memberNo) {
		return boardMapper.getAcademyInfoSubject(a_memberNo);
	}
	
	//학원별 강사 조회
	public List<AcademyTeacherBean> getAcademyInfoTeacher(int a_memberNo){
		return boardMapper.getAcademyInfoTeacher(a_memberNo);
	}
	
	//개별 강사 조회
	public AcademyTeacherBean getTeacherInfo(int a_memberNo, String t_name) {
		return boardMapper.getTeacherInfo(a_memberNo, t_name);
	}
	
	//개별 강사 리뷰 조회
	public List<TeacherReviewBean> getTeacherReviewInfo(int m_memberNo, int a_memberNo, String t_name) {
		return boardMapper.getTeacherReviewInfo(m_memberNo, a_memberNo, t_name);
	}
	
	//찜목록 확인(학원리스트)
	public WishListBean getWishIs(int m_memberNo, int a_memberNo) {
		return boardMapper.getWishIs(m_memberNo, a_memberNo);
	}
	
	//찜목록 삭제
	public void deleteWish(int m_memberNo, int a_memberNo) {
		boardMapper.deleteWish(m_memberNo, a_memberNo);
	}
	
	//찜목록 등록
	public void insertWish(int m_memberNo, int a_memberNo) {
		boardMapper.insertWish(m_memberNo, a_memberNo);
	}
	
	//학원 리뷰 작성
	public void insertAcademyReview(AcademyReviewBean academyReviewBean_write) {
		boardMapper.insertAcademyReview(academyReviewBean_write);
	}
	
	//학원 리뷰 삭제
	public void deleteAcademyReview(int a_memberNo, int r_no) {
		boardMapper.deleteAcademyReview(a_memberNo, r_no);
	}
	
	//강사 리뷰 작성
	public void insertTeacherReview(TeacherReviewBean teacherReviewBean_write) {
		boardMapper.insertTeacherReview(teacherReviewBean_write);
	}
	
	//강사 리뷰 삭제
	public void deleteTeacherReview(int a_memberNo, String t_name, int t_reNo) {
		boardMapper.deleteTeacherReview(a_memberNo, t_name, t_reNo);
	}
}
