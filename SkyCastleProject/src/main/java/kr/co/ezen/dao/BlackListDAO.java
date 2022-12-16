package kr.co.ezen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.mapper.BlackListMapper;

@Repository
public class BlackListDAO {
	
		@Autowired
		private BlackListMapper blackListMapper;
		
		  public void addBlContent(BlackListBean blWriteBean) {			  
			 
			  blackListMapper.addBlContent(blWriteBean);		  		 
		  }	
		 
		 
		  public List<BlackListBean> getBlList(RowBounds rowBounds){		   
			  return blackListMapper.getBlList(rowBounds); 		  
		  }
		  
		  //상세보기
		  public BlackListBean getBlackInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo) {
			  return blackListMapper.getBlackInfo(m_memberNo, a_memberNo);
		  }
		  
		  //검색
		  public List<BlackListBean> getBLSearchList(String  searchKeyword){
			   return blackListMapper.getBLSearchList(searchKeyword);
		  }
		  
		  
		//수정 페이지
		public BlackListBean getBlModifyPage(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo) {
			return blackListMapper.getBlModifyPage(m_memberNo, a_memberNo);
		}
			
		  
		//수정
		public void modifyBlInfo(BlackListBean blModifyBean) {
			blackListMapper.modifyBlInfo(blModifyBean);
		}
		
		//삭제
		public void delBlInfo(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo) {
			
			blackListMapper.delBlInfo(m_memberNo, a_memberNo);
		}
		
		  public int getContentCnt() { 
			  return blackListMapper.getContentCnt();
		  
		  }
		  
		  
		  public int getContentCnt2(String searchKeyword) {
			  return blackListMapper.getContentCnt2(searchKeyword);
		  }
		 
}
