package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.FaqBoardBean;
import kr.co.ezen.dao.FaqDAO;

@Service
public class FaqService {

	@Autowired
	public FaqDAO faqDAO;
	
	public List<FaqBoardBean> getFaqList(FaqBoardBean fbListBean){
		
		return faqDAO.getFaqList(fbListBean);
	}
	
	//입력
	public void fbWrite(FaqBoardBean fbWriteBean) {
		faqDAO.fbWrite(fbWriteBean);
	}
	
	//수정 페이지
	public FaqBoardBean getFbModifyPage(int fb_no) {
		return faqDAO.getFbModifyPage(fb_no);
	}
	
	//수정
	public void fbModify(FaqBoardBean fbModifyBean) {
		faqDAO.fbModify(fbModifyBean);
	}
	
	//삭제
	public void fbDelete(int fb_no) {
		faqDAO.fbDelete(fb_no);
	}
}
