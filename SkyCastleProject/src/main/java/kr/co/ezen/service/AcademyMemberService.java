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
import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.AcademyMemberDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class AcademyMemberService {

	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Autowired
	private AcademyMemberDAO academyMemberDAO;
	
	@Autowired
	private AcademyMemberBean loginAcademyMemberBean;
	
	private String saveUploadfile(MultipartFile upload_file) {
		
		String file_name = upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
		
	}
	
	
	public void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean) {
		academyMemberDAO.joinAcademyMember(joinAcademyMemberBean);
	}
	
	public void getloginAcademyMember(AcademyMemberBean academyMemberBean) {
		AcademyMemberBean loginacademyMemberBean2 = academyMemberDAO.getloginAcademyMember(academyMemberBean);
		
		if(loginacademyMemberBean2 != null) {
			loginAcademyMemberBean.setA_memberNo(loginacademyMemberBean2.getA_memberNo());
			loginAcademyMemberBean.setA_id(loginacademyMemberBean2.getA_id());
			loginAcademyMemberBean.setA_pw(loginacademyMemberBean2.getA_pw());
			loginAcademyMemberBean.setA_name(loginacademyMemberBean2.getA_name());
			loginAcademyMemberBean.setA_CRN(loginacademyMemberBean2.getA_CRN());
			loginAcademyMemberBean.setA_location(loginacademyMemberBean2.getA_location());
			loginAcademyMemberBean.setA_locationDetail(loginacademyMemberBean2.getA_locationDetail());
			loginAcademyMemberBean.setA_tele(loginacademyMemberBean2.getA_tele());
			loginAcademyMemberBean.setA_joinDate(loginacademyMemberBean2.getA_joinDate());
			loginAcademyMemberBean.setA_classify(loginacademyMemberBean2.getA_classify());
			loginAcademyMemberBean.setA_infoExpose(loginacademyMemberBean2.getA_infoExpose());
			
			academyMemberBean.setAcademymemberlogin(true);
			
		}
	}
	
	public void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		academyMemberDAO.modifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		AcademyMemberBean modifyAcademyMemberBean2 = academyMemberDAO.getModifyAcademyMember(modifyAcademyMemberBean);
		
		modifyAcademyMemberBean.setA_id(modifyAcademyMemberBean2.getA_id());
		modifyAcademyMemberBean.setA_name(modifyAcademyMemberBean2.getA_name());
		modifyAcademyMemberBean.setA_location(modifyAcademyMemberBean2.getA_location());
		modifyAcademyMemberBean.setA_locationDetail(modifyAcademyMemberBean2.getA_locationDetail());
		modifyAcademyMemberBean.setA_tele(modifyAcademyMemberBean2.getA_tele());
		modifyAcademyMemberBean.setA_classify(modifyAcademyMemberBean2.getA_classify());
		return modifyAcademyMemberBean;
	}
	
	public void deleteAcademyMember(int a_memberNo) {
		academyMemberDAO.deleteAcademyMember(a_memberNo);
	}
	
	public void insertAcademyIntroduce(AcademyMemberBean introduceAcademyMemberBean) {
		
		
		MultipartFile upload_file = introduceAcademyMemberBean.getUpload_file();
		MultipartFile upload_file2 = introduceAcademyMemberBean.getUpload_file2();
		
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadfile(upload_file);
			
			introduceAcademyMemberBean.setA_mainImg(file_name);
		}
		if(upload_file2.getSize() > 0) {
			String file_name2 = saveUploadfile(upload_file2);
			
			introduceAcademyMemberBean.setA_file(file_name2);
		}
	
		academyMemberDAO.insertAcademyIntroduce(introduceAcademyMemberBean);
	}
	
	public AcademyMemberBean infoIntroduce(AcademyMemberBean infoIntroduce) {
		
		if((academyMemberDAO.infoIntroduce(loginAcademyMemberBean.getA_memberNo()) !=null)){
		
	 	AcademyMemberBean infoIntroduce2 = academyMemberDAO.infoIntroduce(loginAcademyMemberBean.getA_memberNo());
		infoIntroduce.setA_memberNo(infoIntroduce2.getA_memberNo());
		infoIntroduce.setA_introduce(infoIntroduce2.getA_introduce());
		infoIntroduce.setA_mainImg(infoIntroduce2.getA_mainImg());
		infoIntroduce.setA_file(infoIntroduce2.getA_file());
		infoIntroduce.setA_gradeMin(infoIntroduce2.getA_gradeMin());
		infoIntroduce.setA_gradeMax(infoIntroduce2.getA_gradeMax());
		infoIntroduce.setA_shuttle(infoIntroduce2.getA_shuttle());
		infoIntroduce.setA_openTime(infoIntroduce2.getA_openTime());
		infoIntroduce.setA_closeTime(infoIntroduce2.getA_closeTime());
	 	
		return infoIntroduce;
		}
	
		return infoIntroduce;
	}
	
	public void modifyAcademyIntroduce(AcademyMemberBean infoIntroduce) {
		
		MultipartFile upload_file = infoIntroduce.getUpload_file();
		MultipartFile upload_file2 = infoIntroduce.getUpload_file2();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadfile(upload_file);
			
			infoIntroduce.setA_mainImg(file_name);
		}
		if(upload_file2.getSize() > 0) {
			String file_name2 = saveUploadfile(upload_file2);
			
			infoIntroduce.setA_file(file_name2);
		}
		academyMemberDAO.modifyAcademyIntroduce(infoIntroduce);
	}
	
	public void deleteAcademyIntroduce(int a_memberNo) {
		academyMemberDAO.deleteAcademyIntroduce(a_memberNo);
	}
	//학원강사입력
		public void insertTeacher(AcademyTeacherBean insertAcademyTeacherBean) {
			MultipartFile upload_file = insertAcademyTeacherBean.getUpload_file();
			
			if(upload_file.getSize() > 0) {
				String file_name = saveUploadfile(upload_file);
				insertAcademyTeacherBean.setT_file(file_name);
			}
			academyMemberDAO.insertTeacher(insertAcademyTeacherBean);
		}
		
		//학원강사수정
		public void modifyTeacher(AcademyTeacherBean modifyAcademyTeacherBean) {
			MultipartFile upload_file = modifyAcademyTeacherBean.getUpload_file();
			
			if(upload_file.getSize() > 0) {
				String file_name = saveUploadfile(upload_file);
				modifyAcademyTeacherBean.setT_file(file_name);
			}
			academyMemberDAO.modifyTeacher(modifyAcademyTeacherBean);
		}
		
		//학원강사정보전체조회
		public List<AcademyTeacherBean> academyTeacherList(int a_memberNo){
			return academyMemberDAO.academyTeacherList(a_memberNo);
		}
			
		//학원강사삭제
		public void deleteTeacher(AcademyTeacherBean deleteAcademyTeacherBean) {
			academyMemberDAO.deleteTeacher(deleteAcademyTeacherBean);
		}
		
		//학원강사정보조회
		public AcademyTeacherBean teacherInfo(AcademyTeacherBean infoAcademyTeacherBean) {
			return academyMemberDAO.teacherInfo(infoAcademyTeacherBean);
		}
		
		//학원결제내역조회
		public List<AcademyPayBean> getAcademyPayList(int a_memberNo){
			return academyMemberDAO.getAcademyPayList(a_memberNo);
		}
	
	
	
	
	//내가 쓴 문의사항
	public List<SiteAcaAskBean> getMyaskList(int a_memberNo, int myAcaAskPage){
			
		int start = (myAcaAskPage -1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
			
		return academyMemberDAO.getMyaskList(a_memberNo, rowBounds);
	}	
	public SiteAcaAskBean getMyaskRead(Timestamp aa_time, int a_memberNo){
		return academyMemberDAO.getMyaskRead(aa_time, a_memberNo);
	}
			
	public int getMyAskListCnt(AcademyMemberBean myAcaAskBean) {
		return academyMemberDAO.getMyAskListCnt(myAcaAskBean);
	}
			
	public PageCountBean getMyAskContentCnt(int currentPage) {
			
		int content_cnt = academyMemberDAO.getMyAskContentCnt(loginAcademyMemberBean.getA_memberNo());
				 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		PageCountBean myAcapageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
				 
		return myAcapageCountBean;
	}
	
	//관리자 학원 목록 페이지
	public List<AcademyMemberBean> getAdAcademyList(){
			return academyMemberDAO.getAdAcademyList();	
	}
	//총학원수
	public int getAdminAcaCnt(AcademyMemberBean myAdminAcaBean) {
			return academyMemberDAO.getAdminAcaCnt(myAdminAcaBean);
	}
		
	public List<SiteAcaAskBean> getAcaAskList(int a_memberNo){
			return academyMemberDAO.getAcaAskList(a_memberNo);
	}
	
	public List<BlackListBean> getBlackListList(int a_memberNo){
		
		return academyMemberDAO.getBlackListList(a_memberNo);
		
	}
}
