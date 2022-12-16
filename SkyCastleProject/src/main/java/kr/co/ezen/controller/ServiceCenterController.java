package kr.co.ezen.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.service.BlackListService;
import kr.co.ezen.service.ServiceCenterService;

@Controller
@RequestMapping("/serviceBoard")
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;		
	
	@Autowired
	private MemberBean loginMemberBean;
	
	
	@GetMapping("/noticeBoardList")
	public String main(@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean,
						@RequestParam(value = "page", defaultValue = "1") int page,
						Model model) {
		
		List<ServiceCenterBean> nblist = serviceCenterService.getNbList(page);		
		model.addAttribute("nblist", nblist);
		
		int totCnt = serviceCenterService.getListCnt(nbSearchBean);
		model.addAttribute("totCnt", totCnt);
		
		PageCountBean pageCountBean = serviceCenterService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
		
		return "serviceBoard/noticeBoardList";
		
	}
	
	//검색 화면
	@GetMapping("/noticeBoardSearchList")
	public String nbSearchList(@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean,
								@RequestParam(value = "page2", defaultValue = "1") int page2,
								@RequestParam("searchKeyword") String searchKeyword,
								Model model) {
	
		List<ServiceCenterBean> nbsearchList = serviceCenterService.getNbSearchList(searchKeyword);
		nbSearchBean.setSearchKeyword(nbSearchBean.getSearchKeyword());
				
		model.addAttribute("nbsearchList", nbsearchList);
		model.addAttribute("nbSearchBean", nbSearchBean);
				
		PageCountBean pageCountBean = serviceCenterService.getContentCnt2(searchKeyword, page2);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page2", page2);
		
		
		return "serviceBoard/noticeBoardSearchList";
	}	
	
	
	
	//검색	
	@GetMapping("/noticeBoardSearchList_pro")
	public String nbSearchList_pro(@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean,
									@RequestParam(value = "page2", defaultValue = "1") int page2,
									@RequestParam("searchKeyword") String searchKeyword,
									Model model) {
	
		List<ServiceCenterBean> nbsearchList = serviceCenterService.getNbSearchList(searchKeyword);
		nbSearchBean.setSearchKeyword(nbSearchBean.getSearchKeyword());
		
		int searchCnt = serviceCenterService.getSearchListCnt(nbSearchBean);
		model.addAttribute("searchCnt", searchCnt);
		
		model.addAttribute("nbsearchList", nbsearchList);
		model.addAttribute("nbSearchBean", nbSearchBean);
				
		PageCountBean pageCountBean = serviceCenterService.getContentCnt2(searchKeyword, page2);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page2", page2);
		
		
		return "serviceBoard/noticeBoardSearchList";
	}	
	
	
	
	@GetMapping("/noticeBoardRead")
	public String read(@RequestParam("nb_no") int nb_no,
						Model model) {
		
		serviceCenterService.viewCountNbInfo(nb_no);
		
		ServiceCenterBean nbReadBean = serviceCenterService.getNbInfo(nb_no);
		model.addAttribute("nbReadBean", nbReadBean);
		
		//login한 사람의 인덱스 번호				
		return "serviceBoard/noticeBoardRead";
	}	
	
	@GetMapping("/noticeBoardWrite")
	public String write(@ModelAttribute("nbWriteBean") ServiceCenterBean nbWriteBean) {
				
		return "serviceBoard/noticeBoardWrite";
	}
	
	@PostMapping("/noticeBoardWrite_pro")
	public String write_pro( 
							@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean, 
							@RequestParam(value = "page", defaultValue = "1") int page,
							@Validated@ModelAttribute("nbWriteBean") ServiceCenterBean nbWriteBean,
							BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			return "serviceBoard/noticeBoardWrite";
		}
		// upload 처리 
		serviceCenterService.addNbContent(nbWriteBean);
		
		List<ServiceCenterBean> nblist = serviceCenterService.getNbList(page);		
		model.addAttribute("nblist", nblist);
		
		int totCnt = serviceCenterService.getListCnt(nbSearchBean);
		model.addAttribute("totCnt", totCnt);
		
		PageCountBean pageCountBean = serviceCenterService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
	
		return "serviceBoard/noticeBoardList";
	}	
	
	//수정
	@GetMapping("/noticeBoardModify")
	public String modify(@ModelAttribute("nbReadBean") ServiceCenterBean nbReadsBean, 
						@RequestParam("nb_no") int nb_no, 
						@ModelAttribute("nbModifyBean") ServiceCenterBean nbModifyBean,
						Model model) {
		
		nbModifyBean = serviceCenterService.getNbModifyPage(nb_no);
		model.addAttribute("nbModifyBean", nbModifyBean);
		
				
		//idx가 0인 오류는 아래처럼 해줍니다.
		nbModifyBean.setNb_no(nb_no);	
		
		ServiceCenterBean nbReadBean = serviceCenterService.getNbInfo(nb_no);
		model.addAttribute("nbReadBean", nbReadBean);
		
		return "serviceBoard/noticeBoardModify";
	}
	
	@PostMapping("/noticeBoardModify_pro")
	public String modify_pro(@ModelAttribute("nbReadBean") ServiceCenterBean nbReadsBean, 
							 @RequestParam("nb_no") int nb_no,
							 @Validated@ModelAttribute("nbModifyBean") ServiceCenterBean nbModifyBean, 
																				BindingResult result,
																				Model model) {	
		if(result.hasErrors()) {
			return "serviceBoard/noticeBoardModify";
		}
		// upload 처리 
		serviceCenterService.modifyNbInfo(nbModifyBean);
		
		ServiceCenterBean nbReadBean = serviceCenterService.getNbInfo(nb_no);
		model.addAttribute("nbReadBean", nbReadBean);
		
		
		return "serviceBoard/noticeBoardRead";
	}
		
	
	//삭제
		@GetMapping("/noticeBoardDelete")
		public String delete(@RequestParam("nb_no") int nb_no, 
								@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean,
								Model model) {
			
			model.addAttribute("nbSearchBean", nbSearchBean);
			
			return "serviceBoard/noticeBoardDelete";
		}
		
		
		//삭제
		@GetMapping("/noticeBoardDelete_pro")
		public String delete_pro(@ModelAttribute("nbSearchBean") ServiceCenterBean nbSearchBean, 
								@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam("nb_no") int nb_no,
								Model model) {
			
			serviceCenterService.delNbInfo(nbSearchBean.getNb_no());
			
			List<ServiceCenterBean> nblist = serviceCenterService.getNbList(page);		
			model.addAttribute("nblist", nblist);
			
			int totCnt = serviceCenterService.getListCnt(nbSearchBean);
			model.addAttribute("totCnt", totCnt);
			
			PageCountBean pageCountBean = serviceCenterService.getContentCnt(page);
			model.addAttribute("pageCountBean", pageCountBean);
			
			model.addAttribute("page", page);
			
			
			return "serviceBoard/noticeBoardList";
		}
	
}
