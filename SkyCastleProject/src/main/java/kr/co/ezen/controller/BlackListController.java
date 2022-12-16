package kr.co.ezen.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.service.BlackListService;

@Controller
@RequestMapping("/blackList")
public class BlackListController {
	
	@SuppressWarnings("unused")
	@Autowired
	private BlackListService blackListService;

	@Autowired
	private MemberBean loginMemberBean;

	
	
	@GetMapping("/blackListList")
		public String main(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
							@ModelAttribute("blListBean") BlackListBean blListBean,
						   @RequestParam(value = "page", defaultValue = "1") int page,
						   Model model) {

		List<BlackListBean> bllist = blackListService.getBlList(page);
		model.addAttribute("bllist", bllist); 
			
		PageCountBean pageCountBean = blackListService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
		
		model.addAttribute("blListBean", blListBean);
		
		return "blackList/blackListList";
	}
	
	//상세보기
	@GetMapping("/blackListRead")
	 public String read(@Param("m_memberNo") int m_memberNo, @Param("a_memberNo") int a_memberNo,
			 							Model model) {
		 
				
		BlackListBean blReadBean = blackListService.getBlackInfo(m_memberNo, a_memberNo);
		model.addAttribute("blReadBean", blReadBean);
				
		return "blackList/blackListRead";
	  
	}
	
	
	//검색 화면
	@GetMapping("/blackSearchList")
	public String blSearchList(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
								@RequestParam(value = "page2", defaultValue = "1") int page2,
								@RequestParam("searchKeyword") String searchKeyword,
								Model model) {
		
		List<BlackListBean> blsearchList = blackListService.getBLSearchList(searchKeyword, page2);
		model.addAttribute("blsearchList", blsearchList);
		model.addAttribute("blSearchBean", blSearchBean);
		
		PageCountBean pageCountBean = blackListService.getContentCnt2(searchKeyword, page2);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page2", page2);
		
		return "blackList/blackSearchList";
	}
	
	//검색
	@GetMapping("/blackSearchList_pro")
	public String blSearchList_pro(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
			 					@RequestParam(value = "page2", defaultValue = "1") int page2,
								@RequestParam("searchKeyword") String searchKeyword,
								Model model) {
	
		List<BlackListBean> blsearchList = blackListService.getBLSearchList(searchKeyword, page2);
		blSearchBean.setSearchKeyword(blSearchBean.getSearchKeyword());
		blSearchBean.getM_name();
				
		model.addAttribute("blsearchList", blsearchList);
		model.addAttribute("blSearchBean", blSearchBean);
		
		PageCountBean pageCountBean = blackListService.getContentCnt2(searchKeyword, page2);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page2", page2);
		
		
		
		return "blackList/blackSearchList";
	}	
	
	@GetMapping("/blackListWrite")
	public String write(@ModelAttribute("blWriteBean") BlackListBean blWriteBean) {

		
		return "blackList/blackListWrite";
	}

	@PostMapping("blackListWrite_pro")
	public String write_pro(@ModelAttribute("blWriteBean") BlackListBean blWriteBean, 
							@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
							@ModelAttribute("blListBean") BlackListBean blListBean,
						    @RequestParam(value = "page", defaultValue = "1") int page,
							BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "blackList/blackListWrite";
		}
		
		blackListService.addBlContent(blWriteBean);
		
		List<BlackListBean> bllist = blackListService.getBlList(page);
		model.addAttribute("bllist", bllist); 
			
		PageCountBean pageCountBean = blackListService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
		
		model.addAttribute("blListBean", blListBean);
	
		return "blackList/blackListList";
	}

	@GetMapping("/blackListWrite_fail")
	public String noticeBoardWrite_fail() {
		return "blackList/blackListWrite_fail";
	}
	
	//수정
	@GetMapping("/blackListModify")
	public String modify(@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
						 @ModelAttribute("blModifyBean") BlackListBean blModifyBean,
						 Model model) {
		
		blModifyBean = blackListService.getBlModifyPage(m_memberNo, a_memberNo);
		
		model.addAttribute("m_memberNo", m_memberNo);
		model.addAttribute("a_memberNo", a_memberNo);
		
		model.addAttribute("blModifyBean", blModifyBean);
		
		BlackListBean blReadBean = blackListService.getBlackInfo(m_memberNo, a_memberNo);
		model.addAttribute("blReadBean", blReadBean);
	
		return "blackList/blackListModify";
	}
	
	@PostMapping("blackListModify_pro")
	public String modify_pro(@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
							 @ModelAttribute("blModifyBean") BlackListBean blModifyBean,
							 @RequestParam(value = "page", defaultValue = "1") int page,
							 BindingResult result,
							 Model model) {
		
		if(result.hasErrors()) {
			return "blackList/blackListModify";
		}
		
		blackListService.modifyBlInfo(blModifyBean);
		
		BlackListBean blReadBean = blackListService.getBlackInfo(m_memberNo, a_memberNo);
		model.addAttribute("blReadBean", blReadBean);
		
		return "blackList/blackListRead";
	}
	
	
	// 삭제
	@GetMapping("/blackListDelete")
	public String delete(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
						 @ModelAttribute("blListBean") BlackListBean blListBean,
						 @RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
						 Model model) {
	
	model.addAttribute("m_memberNo", m_memberNo);
	model.addAttribute("a_memberNo", a_memberNo);

	model.addAttribute("blSearchBean", blSearchBean);
	model.addAttribute("blListBean", blListBean);
	
	return "blackList/blackListDelete";
	}
	
	@GetMapping("/blackListDelete_pro")
	public String delete_pro(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
							@ModelAttribute("blListBean") BlackListBean blListBean,
							@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
							@RequestParam(value = "page", defaultValue = "1") int page,
							Model model) {
		
	blackListService.delBlInfo(m_memberNo, a_memberNo);

	model.addAttribute("m_memberNo", m_memberNo);
	model.addAttribute("a_memberNo", a_memberNo);
	
	List<BlackListBean> bllist = blackListService.getBlList(page);
	model.addAttribute("bllist", bllist); 
		
	PageCountBean pageCountBean = blackListService.getContentCnt(page);
	model.addAttribute("pageCountBean", pageCountBean);
	
	model.addAttribute("page", page);
	
	model.addAttribute("blSearchBean", blSearchBean);
	model.addAttribute("blListBean", blListBean);

	return "blackList/blackListList";
	}
	
	
	
}
