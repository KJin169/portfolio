package kr.co.ezen.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.mapper.AcademyMemberMapper;

@Repository
public class AcademyMemberDAO {

	@Autowired
	public AcademyMemberMapper academyMemberMapper;
	
	public void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean) {
		
		academyMemberMapper.joinAcademyMember(joinAcademyMemberBean);
	}
	
	public AcademyMemberBean getloginAcademyMember(AcademyMemberBean academyMemberBean) {
		
		return academyMemberMapper.getloginAcademyMember(academyMemberBean);
	}
	
	public void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		academyMemberMapper.modifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		return academyMemberMapper.getModifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public void deleteAcademyMember(int a_memberNo) {
		academyMemberMapper.deleteAcademyMember(a_memberNo);
	}
	
	public void insertAcademyIntroduce(AcademyMemberBean introduceAcademyMemberBean) {
		academyMemberMapper.insertAcademyIntroduce(introduceAcademyMemberBean);
	}
	
	public AcademyMemberBean infoIntroduce(int a_memberNo) {
		return academyMemberMapper.infoIntroduce(a_memberNo);
	}
	
	public void modifyAcademyIntroduce(AcademyMemberBean infoIntroduce) {
		academyMemberMapper.modifyAcademyIntroduce(infoIntroduce);
	}
	
	public void deleteAcademyIntroduce(int a_memberNo) {
		academyMemberMapper.deleteAcademyIntroduce(a_memberNo);
	}
	//학원강사정보입력
		public void insertTeacher(AcademyTeacherBean insertAcademyTeacherBean) {
			academyMemberMapper.insertTeacher(insertAcademyTeacherBean);
		}
		
		//학원강사정보수정
		public void modifyTeacher(AcademyTeacherBean modifyAcademyTeacherBean) {
			academyMemberMapper.modifyTeacher(modifyAcademyTeacherBean);
		}
		
		//학원강사정보전체조회
		public List<AcademyTeacherBean> academyTeacherList(int a_memberNo){
			return academyMemberMapper.academyTeacherList(a_memberNo);
		}
		
		//학원강사삭제
		public void deleteTeacher(AcademyTeacherBean deleteAcademyTeacherBean) {
			academyMemberMapper.deleteTeacher(deleteAcademyTeacherBean);
		}
		
		//학원강사정보조회
		public AcademyTeacherBean teacherInfo(AcademyTeacherBean infoAcademyTeacherBean) {
			return academyMemberMapper.teacherInfo(infoAcademyTeacherBean);
		}
		
		public List<AcademyPayBean> getAcademyPayList(int a_memberNo){
			return academyMemberMapper.getAcademyPayList(a_memberNo);
		}
	
	//내가 쓴 문의사항
	public List<SiteAcaAskBean> getMyaskList(int a_memberNo, RowBounds rowBounds){
		return academyMemberMapper.getMyaskList(a_memberNo, rowBounds);
	}
	public SiteAcaAskBean getMyaskRead(Timestamp aa_time, int a_memberNo){
		return academyMemberMapper.getMyaskRead(aa_time, a_memberNo);
	}
		//게시글 수
	public int getMyAskListCnt(AcademyMemberBean myAcaAskBean) {
			return academyMemberMapper.getMyAskListCnt(myAcaAskBean);
	}
		//페이징 처리
	public int getMyAskContentCnt(int a_memberNo) { 	
		return academyMemberMapper.getMyAskContentCnt(a_memberNo);
	}
	
	//관리자 마이페이지 : 학원 목록
	public List<AcademyMemberBean> getAdAcademyList(){
			return academyMemberMapper.getAdAcademyList();	
	}
	//총학원수
	public int getAdminAcaCnt(AcademyMemberBean myAdminAcaBean) {
			return academyMemberMapper.getAdminAcaCnt(myAdminAcaBean);
	}
	//학원문의사항	
	public List<SiteAcaAskBean> getAcaAskList(int a_memberNo){
			return academyMemberMapper.getAcaAskList(a_memberNo);
	}
	//학원 블랙리스트
	public List<BlackListBean> getBlackListList(int a_memberNo){
		return academyMemberMapper.getBlackListList(a_memberNo);
	}
		
}
