package kr.co.ezen.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.FaqBoardBean;
import kr.co.ezen.mapper.FaqMapper;

@Repository
public class FaqDAO {

	@Autowired
	public FaqMapper faqMapper;
	
	public List<FaqBoardBean> getFaqList(FaqBoardBean fbListBean){
		return faqMapper.getFaqList(fbListBean);
	}
	
	//입력
	public void fbWrite(FaqBoardBean fbWriteBean) {
		faqMapper.fbWrite(fbWriteBean);
	}

	//수정 페이지
	public FaqBoardBean getFbModifyPage(int fb_no) {
		return faqMapper.getFbModifyPage(fb_no);
	}
	
	//수정
	public void fbModify(FaqBoardBean fbModifyBean) {
		faqMapper.fbModify(fbModifyBean);
	}
	
	//삭제
	public void fbDelete(int fb_no) {
		faqMapper.fbDelete(fb_no);
	}
}
