package kr.co.ezen.controller;

import java.sql.Timestamp;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.service.MemberService;
import kr.co.ezen.service.SiteAskService;

@Controller
@RequestMapping("/serviceBoard")
public class SiteAskController {

	@Autowired
	private SiteAskService siteAskService;		

	@Autowired
	private MemberBean loginMemberBean;

	//관리자가 보는 문의 목록
	@GetMapping("/siteAskList")
	public String main(@ModelAttribute("saBean") SiteAskBean saBean,
						@RequestParam(value = "pageM", defaultValue = "1") int pageM,			
						Model model) {
			
		List<SiteAskBean> salist =  siteAskService.getSaList(pageM);		
		model.addAttribute("salist", salist);
		
		int saListCnt = siteAskService.getSaListCnt(saBean);
		model.addAttribute("saListCnt", saListCnt);
		
		PageCountBean pageCountBeanM = siteAskService.getSaContentCnt(pageM);
		model.addAttribute("pageCountBeanM", pageCountBeanM);
		
		model.addAttribute("pageM", pageM);
		
		return "serviceBoard/siteAskList";
	}
	
	@GetMapping("/siteAskRead")
	public String read(@RequestParam("sa_time") Timestamp sa_time,
						Model model) {
		
		SiteAskBean saReadBean = siteAskService.getSaInfo(sa_time);
		model.addAttribute("saReadBean", saReadBean);
		
		//login한 사람의 인덱스 번호				
		return "serviceBoard/siteAskRead";
	}	
	
	@GetMapping("/siteAskWrite")
	public String write(@ModelAttribute("saWriteBean") SiteAskBean saWriteBean,
						Model model) {
		
		saWriteBean.setSa_memberNo(loginMemberBean.getM_memberNo());
		
		saWriteBean.setM_id(loginMemberBean.getM_id());
		saWriteBean.setM_name(loginMemberBean.getM_name());
		saWriteBean.setM_email(loginMemberBean.getM_email ());
		
		model.addAttribute("saWriteBean", saWriteBean);
	
		return "serviceBoard/siteAskWrite";
	}

	@PostMapping("/siteAskWrite_pro")
	public String write_pro(@Validated@ModelAttribute("saWriteBean") SiteAskBean saWriteBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "serviceBoard/siteAskWrite";
		}
		// upload 처리 
		siteAskService.addSaContent(saWriteBean);
	
		return "serviceBoard/siteAskWrite_success";
	}	
	
}
