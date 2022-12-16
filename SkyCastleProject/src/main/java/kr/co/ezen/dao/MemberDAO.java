package kr.co.ezen.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.mapper.MemberMapper;
@Repository
public class MemberDAO {

	@Autowired
	MemberMapper memberMapper;
	
	public MemberBean getLoginMember(MemberBean MemberBean) {
		return memberMapper.getLoginMember(MemberBean);
		
	}
	
	public MemberBean getModifyMember(int m_memberNo) {
		return memberMapper.getModifyMember(m_memberNo);
	}
	
	public void updateMember(MemberBean modifyMemberBean) {
		memberMapper.updateMember(modifyMemberBean);
	}
	
	public void deleteMemeber(int m_memberNo) {
		memberMapper.deleteMemeber(m_memberNo);
	}
	
	public void joinMember(MemberBean joinMemberBean) {
		memberMapper.joinMember(joinMemberBean);
	}
	
	public MemberBean getMypageMember(int m_memberNo) {
		return memberMapper.getMypageMember(m_memberNo);
	}
	
	public List<MemberChildBean> getMypageMemberChild(int m_memberNo) {
		return memberMapper.getMypageMemberChild(m_memberNo);
	}
	
 	public void insertChild(MemberChildBean insertChildBean) {
 		memberMapper.insertChild(insertChildBean);
 	}
 	
 	public MemberChildBean getModifyChild(MemberChildBean modifyChildBean) {
 		return memberMapper.getModifyChild(modifyChildBean);
 	}
 	
 	public void modifyChild(MemberChildBean modifyChild) {
 		memberMapper.modifyChild(modifyChild);
 	}
 	
 	public void deleteChild(MemberChildBean deleteChildBean) {
 		memberMapper.deleteChild(deleteChildBean);
 	}
 	
 	public void deleteAllChild(int m_memberNo) {
 		memberMapper.deleteAllChild(m_memberNo);
 	}
 	
 	public void deleteWishList(int m_memberNo) {
 		memberMapper.deleteWishList(m_memberNo);
 	}
 	
  public MemberBean getKakaoLoginMember(String m_id) {
	  return memberMapper.getKakaoLoginMember(m_id);
  }
 	
 	//임시비밀번호변경
 	public int updatePw(MemberBean memberBean) throws Exception {		
 		return memberMapper.updatePw(memberBean);
		
 	}

	//멤버전체정보 조회 -> 아이디 대조용
	public MemberBean readMember(String m_id) {
		return memberMapper.readMember(m_id);
	}
	
	//내가 쓴 문의사항
	public List<SiteAskBean> getMyaskList(int m_memberNo, RowBounds rowBounds){
		return memberMapper.getMyaskList(m_memberNo, rowBounds);
	}
	public SiteAskBean getMyaskRead(Timestamp sa_time, int m_memberNo){
		return memberMapper.getMyaskRead(sa_time, m_memberNo);
	}
	//게시글 수
	public int getMyAskListCnt(MemberBean myAskBean) {
		 return memberMapper.getMyAskListCnt(myAskBean);
	 }
	//페이징 처리
	public int getMyAskContentCnt(int m_memberNo) { 	
		return memberMapper.getMyAskContentCnt(m_memberNo);
	}
	
	//관리자 마이페이지 출력
	
	//public List<MemberBean> getAdminPageList() {
	//	return memberMapper.getAdminPageList();
	//}
		
	//관리자 마이페이지 리스트(회원, 학원, 문의사항)
	
	//관리자 마이페이지 : 회원 목록
	public List<MemberBean> getAdMemberList(){
		return memberMapper.getAdMemberList();
	}
	//총회원수
	public int getAdminMemberCnt(MemberBean myAdminMemberBean) {
		return memberMapper.getAdminMemberCnt(myAdminMemberBean);
	}
		
	//email 확인
    public String selectEmailKakao(String m_email) {
        return memberMapper.selectEmailKakao(m_email);
     }
    
    //찜목록 페이지 이동
    public List<AcademyMemberBean> myWishList(int m_memberNo){
    	return memberMapper.myWishList(m_memberNo);
    }
    
    //메인 찜목록
    public List<AcademyMemberBean> mainWishList(int m_memberNo) {
    	return memberMapper.mainWishList(m_memberNo);
    }
 		
}
