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

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.service.AcademyMemberService;
import kr.co.ezen.service.SiteAcaAskService;

@Controller
@RequestMapping("/serviceBoard")
public class SiteAcaAskController {

	@Autowired
	private SiteAcaAskService siteAcaAskService;		

	@Autowired
	private AcademyMemberBean loginAcademyMemberBean;

	@GetMapping("/siteAcaAskList")
	public String main(@ModelAttribute("siteAcaAskBean") SiteAcaAskBean siteAcaAskBean,
						@RequestParam(value = "pageA", defaultValue = "1") int pageA,			
						Model model) {
			
		List<SiteAcaAskBean> aalist =  siteAcaAskService.getAaList(pageA);		
		model.addAttribute("aalist", aalist);
		
		int acaAskCnt = siteAcaAskService.getAacaListCnt(siteAcaAskBean);
		model.addAttribute("acaAskCnt", acaAskCnt);
		
		PageCountBean pageCountBeanA = siteAcaAskService.getAacaContentCnt(pageA);
		model.addAttribute("pageCountBeanA", pageCountBeanA);
		
		model.addAttribute("pageA", pageA);
		
		
		return "serviceBoard/siteAcaAskList";
	}
	
	@GetMapping("/siteAcaAskRead")
	public String read(@RequestParam("aa_time") Timestamp aa_time,
						Model model) {
		
		SiteAcaAskBean aaReadBean = siteAcaAskService.getAaInfo(aa_time);
		model.addAttribute("aaReadBean", aaReadBean);
		
		//login한 사람의 인덱스 번호				
		return "serviceBoard/siteAcaAskRead";
	}	
	
	@GetMapping("/siteAcaAskWrite")
	public String write(@ModelAttribute("aaWriteBean") SiteAcaAskBean aaWriteBean,
						Model model) {
		
		aaWriteBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		aaWriteBean.setA_name(loginAcademyMemberBean.getA_name());
		aaWriteBean.setA_tele(loginAcademyMemberBean.getA_tele());
		
		model.addAttribute("aaWriteBean", aaWriteBean);
	
		return "serviceBoard/siteAcaAskWrite";
	}

	@PostMapping("/siteAcaAskWrite_pro")
	public String write_pro(@Validated@ModelAttribute("aaWriteBean") SiteAcaAskBean aaWriteBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "serviceBoard/siteAcaAskWrite";
		}
		// upload 처리 
		siteAcaAskService.addAaContent(aaWriteBean);
	
		return "serviceBoard/siteAcaAskWrite_success";
	}	
}
