package kr.co.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.service.MemberService;


@Controller
public class HomeController {
	
	@Autowired
	@Lazy
	private MemberBean loginMemberBean;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean,
						Model model,
						HttpSession session) {
		model.addAttribute("loginMemberBean", loginMemberBean);
		System.out.println("home");
		
		if(session.getAttribute("loginMemberBean")!=null) {
			MemberBean loginbean = (MemberBean) session.getAttribute("loginMemberBean");
			List<AcademyMemberBean> mainFavoritelist = memberService.mainWishList(loginbean.getM_memberNo());
			model.addAttribute("mainFavoritelist", mainFavoritelist);
		}
		
		return "index";
	}
	
}
