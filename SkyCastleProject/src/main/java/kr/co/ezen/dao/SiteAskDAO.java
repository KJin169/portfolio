package kr.co.ezen.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.mapper.MemberMapper;
import kr.co.ezen.mapper.SiteAskMapper;

@Repository
public class SiteAskDAO {
	
	@Autowired
	private SiteAskMapper siteAskMapper;
	private MemberMapper memberMapper;
		
	public void addSaContent(SiteAskBean saWriteBean) {			  
			 			  
		siteAskMapper.addSaContent(saWriteBean);		  		 
	}	
		  	  
		 
	public List<SiteAskBean> getSaList(RowBounds rowBounds){		   
			
		return siteAskMapper.getSaList(rowBounds); 			  
	}
		  
	public SiteAskBean getSaInfo(Timestamp sa_time) { 
			
		return siteAskMapper.getSaInfo(sa_time); 
	}

	//총개수
	public int getSaListCnt(SiteAskBean saBean) {
				
		return siteAskMapper.getSaListCnt(saBean);
	}
			
	//페이징
	public int getSaContentCnt() {
					
		return siteAskMapper.getSaContentCnt();
	} 
}