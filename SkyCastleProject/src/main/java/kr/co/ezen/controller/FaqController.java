package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.beans.FaqBoardBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.service.FaqService;

@RequestMapping("/faq")
@Controller
public class FaqController {
	
	
	//FAQ 게시판
	@Autowired
	public FaqService faqService;
	
	@GetMapping("/faqBoard")
	public String faqlist(@ModelAttribute("fbListBean") FaqBoardBean fbListBean, 
							Model model) {
		
	 	List<FaqBoardBean> faqlist = faqService.getFaqList(fbListBean);
	 	model.addAttribute("faqlist", faqlist);
	 	
	 	model.addAttribute("fbListBean", fbListBean);
	 	
		return "faq/faqBoard";
	}
	
	//글쓰기
	@GetMapping("/faqWrite")
	public String write(@ModelAttribute("fbWriteBean") FaqBoardBean fbWriteBean) {
				
		return "faq/faqWrite";
	}
	
	@PostMapping("/faqWrite_pro")
	public String write_pro(@ModelAttribute("fbListBean") FaqBoardBean fbListBean, 
							@ModelAttribute("fbWriteBean") FaqBoardBean fbWriteBean, 
							BindingResult result, 
							Model model) {
		
		if(result.hasErrors()) {
			return "faq/faqWrite";
		}
		// upload 처리 
		faqService.fbWrite(fbWriteBean);
		
		List<FaqBoardBean> faqlist = faqService.getFaqList(fbListBean);
	 	model.addAttribute("faqlist", faqlist);
	
		return "faq/faqBoard";
	}	
	
	//수정
	@GetMapping("/faqModify")
	public String modify(@RequestParam("fb_no") int fb_no, 
						@ModelAttribute("fbModifyBean") FaqBoardBean fbModifyBean,
						Model model) {
		
		fbModifyBean = faqService.getFbModifyPage(fb_no);
		model.addAttribute("fbModifyBean", fbModifyBean);
	
		//idx가 0인 오류는 아래처럼 해줍니다.
		fbModifyBean.setFb_no(fb_no);	
		
		return "faq/faqModify";
	}
	
	@PostMapping("/faqModify_pro")
	public String modify_pro(@ModelAttribute("fbListBean") FaqBoardBean fbListBean, 
							@ModelAttribute("fbModifyBean") FaqBoardBean fbModifyBean, 
							  BindingResult result,
							  Model model) {	
		
		if(result.hasErrors()) {
			return "faq/faqModify";
		}
		
		// upload 처리 
	 	faqService.fbModify(fbModifyBean);
	 	
	 	List<FaqBoardBean> faqlist = faqService.getFaqList(fbListBean);
	 	model.addAttribute("faqlist", faqlist);
	 	
	 	model.addAttribute("fbListBean", fbListBean);
	 			
	 	return "faq/faqBoard";
	}
	
	//삭제
	@GetMapping("/faqDelete")
	public String delete(@ModelAttribute("fbListBean") FaqBoardBean fbListBean,
						@RequestParam("fb_no") int fb_no,
						Model model) {	
		
		return "faq/faqDelete";
	}
	
	@GetMapping("/faqDelete_pro")
	public String delete_pro(@ModelAttribute("fbListBean") FaqBoardBean fbListBean, 
							@RequestParam("fb_no") int fb_no,
							 Model model) {
		
		faqService.fbDelete(fbListBean.getFb_no());
		
		List<FaqBoardBean> faqlist = faqService.getFaqList(fbListBean);
	 	model.addAttribute("faqlist", faqlist);
	 
	 	model.addAttribute("fbListBean", fbListBean);
	 	
	 	
		return "faq/faqBoard";
	}
}
