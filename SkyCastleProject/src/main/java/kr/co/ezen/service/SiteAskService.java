package kr.co.ezen.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.MemberDAO;
import kr.co.ezen.dao.SiteAskDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class SiteAskService {

	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	@Autowired
	private SiteAskDAO siteAskDAO;
	
	@SuppressWarnings("unused")
	private String saveUploadfile(MultipartFile upload_file) {
		
		String file_name = upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addSaContent(SiteAskBean saWriteBean) {
		
		MultipartFile upload_file = saWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			saWriteBean.setSa_file(file_name); 			
		}

		saWriteBean.setM_memberNo(loginMemberBean.getM_memberNo());
		saWriteBean.setSa_memberNo(loginMemberBean.getM_memberNo());
		
		siteAskDAO.addSaContent(saWriteBean);
	}
		
	//글목록
	 public List<SiteAskBean> getSaList(int pageM){	
		 
		 int start = (pageM -1) * page_listcnt;
		 RowBounds rowBounds = new RowBounds(start, page_listcnt);
		 
		  return siteAskDAO.getSaList(rowBounds); 			  
	  }
	
	
	public SiteAskBean getSaInfo(Timestamp sa_time) { 
		  return siteAskDAO.getSaInfo(sa_time); 
	  }

	//개수
	public int getSaListCnt(SiteAskBean saBean) {
		
		return siteAskDAO.getSaListCnt(saBean);
	}
	
	//페이징
	public PageCountBean getSaContentCnt(int currentPage) {
		
		int content_cnt = siteAskDAO.getSaContentCnt();
			 
			//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
			PageCountBean pageCountBeanM = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
			 
			return pageCountBeanM;
		 } 
}
