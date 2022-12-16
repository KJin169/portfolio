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

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.dao.AcademyMemberDAO;
import kr.co.ezen.dao.SiteAcaAskDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class SiteAcaAskService {

	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private AcademyMemberBean loginAcademyMemberBean;
	
	@Autowired
	private SiteAcaAskDAO siteAcaAskDAO;
	
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
	
	public void addAaContent(SiteAcaAskBean aaWriteBean) {
		
		MultipartFile upload_file = aaWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			aaWriteBean.setAa_file(file_name); 			
		}

		aaWriteBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		aaWriteBean.setA_name(loginAcademyMemberBean.getA_name());
		aaWriteBean.setA_tele(loginAcademyMemberBean.getA_tele());
		
		siteAcaAskDAO.addAaContent(aaWriteBean);
	}
		
	//글목록
	public List<SiteAcaAskBean> getAaList(int pageA){		
		
		int start = (pageA -1) * page_listcnt;
		 RowBounds rowBounds = new RowBounds(start, page_listcnt);
		 
		
		return siteAcaAskDAO.getAaList(rowBounds); 			  
	}
	
	
	public SiteAcaAskBean getAaInfo(Timestamp aa_time) { 
		return siteAcaAskDAO.getAaInfo(aa_time); 
	}
	
	//게시글 수
	public int getAacaListCnt(SiteAcaAskBean siteAcaAskBean) {
		return siteAcaAskDAO.getAacaListCnt(siteAcaAskBean);
	}
			
	//페이징
	public PageCountBean getAacaContentCnt(int currentPage) {
		
		int content_cnt = siteAcaAskDAO.getAacaContentCnt();
		 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		 
		return pageCountBean;
	}

}
