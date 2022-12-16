package kr.co.ezen.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.dao.BlackListDAO;
import kr.co.ezen.dao.ServiceCenterDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BlackListService {

	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private BlackListDAO blackListDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
		
	public void addBlContent(BlackListBean blWriteBean) {
		
		blackListDAO.addBlContent(blWriteBean);
	}
	
	public List<BlackListBean> getBlList(int page){	  
		
		int start = (page -1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return blackListDAO.getBlList(rowBounds); 	  
	}
	
	//검색
	 public List<BlackListBean> getBLSearchList(String searchKeyword, int page2){
		 
		return blackListDAO.getBLSearchList(searchKeyword);
	  }
	 
	//상세보기
	 public BlackListBean getBlackInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo) {
		  return blackListDAO.getBlackInfo(m_memberNo, a_memberNo);
	 }
	
	//삭제
	public void delBlInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo){
		
		blackListDAO.delBlInfo(m_memberNo, a_memberNo);
	}
	
	//수정 페이지
	public BlackListBean getBlModifyPage(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo) {
		return blackListDAO.getBlModifyPage(m_memberNo, a_memberNo);
	}
	
	//수정
	public void modifyBlInfo(BlackListBean blModifyBean) {
		blackListDAO.modifyBlInfo(blModifyBean);
	}
	
	//페이징
	 public PageCountBean getContentCnt( int currentPage) {
	
		 int content_cnt = blackListDAO.getContentCnt();
		 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		 PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		 
		 return pageCountBean;
	 } 
	
	//검색 페이징
		 public PageCountBean getContentCnt2(String searchKeyword, int currentPage) {
		
			 int content_cnt = blackListDAO.getContentCnt2(searchKeyword);
			 
			//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
			 PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
			 
			 return pageCountBean;
		 } 
	 
}
