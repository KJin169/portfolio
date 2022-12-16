package kr.co.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.TeacherReviewBean;
import kr.co.ezen.service.BoardService;

//HTML형태의 데이터가 아니라면 사용합니다. 아니라면 json으로 처리를 합니다.
@RestController
public class RestApiController {
	
	@Autowired
	MemberBean loginMemberBean;
	
	@Autowired
	private BoardService boardService;
	
	//찜 목록 불러오기
	@GetMapping("/board/boardListWish/{a_memberNo}")
	public String boardListWish(@PathVariable int a_memberNo, HttpSession session) {
		
		boolean wishCheck = false;
		
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		//System.out.println(mBean.getM_memberNo());
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				int m_memberNo = mBean.getM_memberNo();
				
				if(boardService.getWishIs(m_memberNo, a_memberNo)!=null) {
					wishCheck = true;
				}
			}
		}
		
		return wishCheck+"";
	}
	
	//찜 등록, 해제
	@GetMapping("/board/boardListWishOnOff/{a_memberNo}")
	public String boardListWishOnOff(@PathVariable int a_memberNo, HttpSession session) {
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				
				int m_memberNo = mBean.getM_memberNo();
				
				if(boardService.getWishIs(m_memberNo, a_memberNo)!=null) {
					result = "off";
					boardService.deleteWish(m_memberNo, a_memberNo);
				} else if(boardService.getWishIs(m_memberNo, a_memberNo)==null) {
					result = "on";
					boardService.insertWish(m_memberNo, a_memberNo);
				} else {
					result = "error";
				}
			}
		}
		
		return result;
	}
	
	//학원 리뷰 작성
	@PostMapping("/board/academyReviewWrite")
	public String academyReviewWrite(AcademyReviewBean academyReviewBean_write,
									HttpSession session) {
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				if(academyReviewBean_write.getR_score()==0)
					result = "noScore";
				
				else {
				
					academyReviewBean_write.setR_writerNo(mBean.getM_memberNo());
					academyReviewBean_write.setR_writerId(mBean.getM_id());

					boardService.insertAcademyReview(academyReviewBean_write);
					
					result = "true";
				}
			}
		}
		
		return result;
	}
	
	//학원 리뷰 삭제
	@PostMapping("/board/academyReviewRemove")
	public String academyReviewRemove(AcademyReviewBean academyReviewBean_del,
									HttpSession session) { 
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo() == academyReviewBean_del.getR_writerNo()) {
				boardService.deleteAcademyReview(academyReviewBean_del.getA_memberNo(), academyReviewBean_del.getR_no());
				result = "selfDel";
			} else if(Integer.toString((mBean.getM_memberNo())).length() == 4) {
				boardService.deleteAcademyReview(academyReviewBean_del.getA_memberNo(), academyReviewBean_del.getR_no());
				result = "adminDel";
			} else {
				result = "unmatched";
			}
		}
		return result;
	}
	
	//강사 리뷰 작성
	@PostMapping("/board/teacherReviewWrite")
	public String teacherReviewWrite(TeacherReviewBean teacherReviewBean_write,
									HttpSession session) {
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				if(teacherReviewBean_write.getT_score()==0)
					result = "noScore";
				
				else {
				
					teacherReviewBean_write.setT_reWriterNo(mBean.getM_memberNo());
					teacherReviewBean_write.setT_reWriterId(mBean.getM_id());

					boardService.insertTeacherReview(teacherReviewBean_write);
					
					result = "true";
				}
			}
		}
		
		return result;
	}
	
	//강사 리뷰 삭제
	@PostMapping("/board/teacherReviewRemove")
	public String teacherReviewRemove(TeacherReviewBean teacherReviewBean_del,
									HttpSession session) { 
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo() == teacherReviewBean_del.getT_reWriterNo()) {
				boardService.deleteTeacherReview(teacherReviewBean_del.getA_memberNo(), teacherReviewBean_del.getT_name(), teacherReviewBean_del.getT_reNo());
				result = "selfDel";
			} else if(Integer.toString((mBean.getM_memberNo())).length() == 4) {
				boardService.deleteTeacherReview(teacherReviewBean_del.getA_memberNo(), teacherReviewBean_del.getT_name(), teacherReviewBean_del.getT_reNo());
				result = "adminDel";
			} else {
				result = "unmatched";
			}
		}
		return result;
	}
	
}
