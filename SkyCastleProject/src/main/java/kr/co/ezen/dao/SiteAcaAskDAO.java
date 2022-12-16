package kr.co.ezen.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.mapper.AcademyMemberMapper;
import kr.co.ezen.mapper.SiteAcaAskMapper;

@Repository
public class SiteAcaAskDAO {
	
		@Autowired
		private SiteAcaAskMapper siteAcaAskMapper;
		private AcademyMemberMapper AcademyMemberMapper;
		
		//글쓰기
		public void addAaContent(SiteAcaAskBean aaWriteBean) {			  
			 			  
			siteAcaAskMapper.addAaContent(aaWriteBean);		  		 
		}	
		 		 		  
		//글목록 
		public List<SiteAcaAskBean> getAaList(RowBounds rowBounds){		   
			
			return siteAcaAskMapper.getAaList(rowBounds); 			  
		}
		
		//상세보기
		public SiteAcaAskBean getAaInfo(Timestamp sa_time) { 
			
			return siteAcaAskMapper.getAaInfo(sa_time); 
		}

		//게시글 수
		public int getAacaListCnt(SiteAcaAskBean siteAcaAskBean) {
			return siteAcaAskMapper.getAacaListCnt(siteAcaAskBean);
		}
		
		//페이징
		public int getAacaContentCnt() {
			return siteAcaAskMapper.getAacaContentCnt();
		}
}