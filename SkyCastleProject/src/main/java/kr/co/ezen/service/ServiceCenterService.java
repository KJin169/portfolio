package kr.co.ezen.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.ServiceCenterDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ServiceCenterService {

	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
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
	
	public void addNbContent(ServiceCenterBean nbWriteBean) {
		
		MultipartFile upload_file = nbWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			nbWriteBean.setNb_file(file_name); 			
		}
		
		serviceCenterDAO.addNbContent(nbWriteBean);
	}
	
	//글목록
	 public List<ServiceCenterBean> getNbList(int page){
		 		 
		 int start = (page -1) * page_listcnt;
		 RowBounds rowBounds = new RowBounds(start, page_listcnt);
		 
		  return serviceCenterDAO.getNbList(rowBounds); 			  
	  }
	 
	 
	//검색
	 public List<ServiceCenterBean> getNbSearchList(String searchKeyword){
			return serviceCenterDAO.getNbSearchList(searchKeyword);
		}
	 
	//게시글 수
	public int getListCnt(ServiceCenterBean nbSearchBean){
		 return serviceCenterDAO.getListCnt(nbSearchBean);
	 }
	
	public int getSearchListCnt(ServiceCenterBean nbSearchBean) {
		return serviceCenterDAO.getSearchListCnt(nbSearchBean);
	}
	
	public ServiceCenterBean getNbInfo(int nb_no) { 
		  return serviceCenterDAO.getNbInfo(nb_no); 
	  }
	
	//수정 페이지 출력 화면
		public ServiceCenterBean getNbModifyPage(int nb_no){
			
			return serviceCenterDAO.getNbModifyPage(nb_no);
		}
	
	//수정
	public void modifyNbInfo(ServiceCenterBean nbModifyBean){
		
		 MultipartFile upload_file = nbModifyBean.getUpload_file();
		  
		  if(upload_file.getSize() > 0) {
			  String file_name = saveUploadfile(upload_file);				
			  nbModifyBean.setNb_file(file_name); 
		  }
		
		serviceCenterDAO.modifyNbInfo(nbModifyBean);
	}
	
	//삭제
	public void delNbInfo(int nb_no){
		
		serviceCenterDAO.delNbInfo(nb_no);
	}
	
	
	public void viewCountNbInfo(int nb_no) {
		serviceCenterDAO.viewCountNbInfo(nb_no);
	}
	
	//페이징
	public PageCountBean getContentCnt(int currentPage) {
			
	int content_cnt = serviceCenterDAO.getContentCnt();
		 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		 
		return pageCountBean;
	 } 
	
	//검색 페이징
	public PageCountBean getContentCnt2(String searchKeyword, int currentPage) {
		
		int content_cnt = serviceCenterDAO.getContentCnt2(searchKeyword);
			 
			//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
			PageCountBean pageCountBean2 = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
			 
			return pageCountBean2;
		 } 
}
