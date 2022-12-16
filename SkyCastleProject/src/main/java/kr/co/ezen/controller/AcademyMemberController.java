package kr.co.ezen.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.hibernate.validator.internal.util.stereotypes.Lazy;
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

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAcaAskBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.service.AcademyMemberService;
import kr.co.ezen.service.SiteAcaAskService;
@RequestMapping("/academymember")
@Controller
public class AcademyMemberController {
	
	@Autowired
	@Lazy
	private AcademyMemberBean loginAcademyMemberBean;
	
	@Autowired
	private AcademyMemberService academyMemberService;
	
	
	
	//학원회원가입페이지
	@GetMapping("/join")
	public String join(@ModelAttribute("joinAcademyMemberBean") AcademyMemberBean joinAcademyMemberBean) {
	 
		return "academymember/join";
	}
	//학원회원가입
	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinAcademyMemberBean") AcademyMemberBean joinAcademyMemberBean, BindingResult result){
	if(result.hasErrors()) {
		return "academymember/join";
	}
	academyMemberService.joinAcademyMember(joinAcademyMemberBean);
		return "index";
	}
	//학원로그인페이지
	@GetMapping("/login")
	public String login(@ModelAttribute("loginAcademyMemberBean") AcademyMemberBean loginAcademyMemberBean, Model model){
		
		model.addAttribute("loginAcademyMemberBean", loginAcademyMemberBean);
		
		return "academymember/login";
	}
	//학원로그인
	@PostMapping("login_pro")
	public String login_pro(@ModelAttribute("loginAcademyMemberBean") AcademyMemberBean loginAcademyMemberBean, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "academymember/login";
		}
		academyMemberService.getloginAcademyMember(loginAcademyMemberBean);
		
		if(loginAcademyMemberBean.isAcademymemberlogin() == true) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAcademyMemberBean", this.loginAcademyMemberBean);
			loginAcademyMemberBean.setAcademymemberlogin(true);
			return "index";
		}else {
			loginAcademyMemberBean.setAcademymemberlogin(false);
			return "academymember/login_fail";
		}
		
	}

	//학원로그아웃
	@GetMapping("logout")
	public String logout() {
		return "academymember/logout";
	}
	
	//학원로그아웃처리
	@GetMapping("logout_pro")
	public String logout_pro(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
	//학원정보조회(마이페이지)
		@GetMapping("my_academypage")
		public String my_academypage(@ModelAttribute("modifyAcademyMemberBean") AcademyMemberBean modifyAcademyMemberBean) {
			modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			academyMemberService.getModifyAcademyMember(modifyAcademyMemberBean);
			return "academymember/my_academypage";
			
		}
	//학원정보수정페이지
	@GetMapping("modify")
	public String modify(@ModelAttribute("modifyAcademyMemberBean") AcademyMemberBean modifyAcademyMemberBean) {
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.getModifyAcademyMember(modifyAcademyMemberBean);
		return "academymember/modify";
	}
	//학원정보수정
	@PostMapping("modify_pro")
	public String modify_pro(@Validated@ModelAttribute("modifyAcademyMemberBean") AcademyMemberBean modifyAcademyMemberBean, BindingResult result) {
		if(result.hasErrors()) {
			return "academymember/modify";
		}
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.modifyAcademyMember(modifyAcademyMemberBean);
		return "academymember/my_academypage";
	}
	@GetMapping("delete")
	public String delete() {
		return "academymember/delete";
	}
	//학원정보삭제
	@GetMapping("delete_pro")
	public String delete_pro(HttpSession session) {
		academyMemberService.deleteAcademyIntroduce(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.deleteAcademyMember(loginAcademyMemberBean.getA_memberNo());
		session.invalidate();
		return "index";
	}
	//학원소개페이지
	@GetMapping("/academyinfo")
	public String academyinfo(@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce) {
		infoIntroduce.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.infoIntroduce(infoIntroduce);
		return "academymember/academyinfo";
	}
	
	@GetMapping("/academyinfo_write")
	public String academyinfo_write(@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce){
		infoIntroduce.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		return "academymember/academyinfo_write";
	}
	
		//학원소개작성
		@PostMapping("/academyinfo_write_pro")
		public String academyinfo_write_pro(@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce, BindingResult result) {
			
			if(result.hasErrors()) {
				return "academymember/academyinfo_write";
			}
		
			infoIntroduce.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			
			academyMemberService.insertAcademyIntroduce(infoIntroduce);
			academyMemberService.getModifyAcademyMember(infoIntroduce);
			return "academymember/academyinfo";
		}
	//학원소개확인
	@GetMapping("/introduce_info")
	public String introduce_info(@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce) {
		
		if(academyMemberService.infoIntroduce(infoIntroduce).getA_memberNo() == 0) {
			return "academymember/introduce_infonull";
		}
			
		academyMemberService.infoIntroduce(infoIntroduce);
		return "academymember/introduce_info";
		
		
		
	}
	//학원소개수정페이지
		@GetMapping("/academyinfo_modify")
		public String introduce_modify(@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce) {
			infoIntroduce.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			academyMemberService.infoIntroduce(infoIntroduce);
			return "academymember/academyinfo_modify";
		}
	//학원소개수정
	@PostMapping("/introduce_modifyPro")
	public String introduce_modifyPro(@ModelAttribute("modifyAcademyMemberBean")AcademyMemberBean modifyAcademyMemberBean , @Validated@ModelAttribute("infoIntroduce")AcademyMemberBean infoIntroduce, BindingResult result) {
			if(result.hasErrors()) {
				return "academymember/academyinfo_modify";
			}
			
			academyMemberService.modifyAcademyIntroduce(infoIntroduce);
			modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			academyMemberService.getModifyAcademyMember(modifyAcademyMemberBean);
			return "academymember/academyinfo";
	}
		
	@GetMapping("/introduce_delete")
	public String introduce_delete() {
		return "academymember/introduce_delete";
	}
		
	//학원소개삭제
	@GetMapping("/introduce_delete_pro")
	public String introduce_delete_pro(@ModelAttribute("modifyAcademyMemberBean")AcademyMemberBean modifyAcademyMemberBean) {
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.getModifyAcademyMember(modifyAcademyMemberBean);
		academyMemberService.deleteAcademyIntroduce(loginAcademyMemberBean.getA_memberNo());
		return "academymember/my_academypage";
	}
		
	//블랙리스트 조회
	@GetMapping("academyBlacklist")
	public String blacklistview(Model model) {
		List<BlackListBean> acablacklist = academyMemberService.getBlackListList(loginAcademyMemberBean.getA_memberNo());
		model.addAttribute("acablacklist", acablacklist);
		
		return "academymember/academyBlacklist";
		
	}
	
	//학원강사리스트페이지
		@GetMapping("/academyteacher")
		public String academyteacher(Model model) {
			
			List<AcademyTeacherBean> academyteacherlist = academyMemberService.academyTeacherList(loginAcademyMemberBean.getA_memberNo());
			model.addAttribute("academyteacherlist", academyteacherlist);
			return "academymember/academyteacher";
		}
		
		//학원강사 입력페이지
		@GetMapping("/academyteacher_insert")
		public String academyteacher_insert(@ModelAttribute("teacherInsertBean")AcademyTeacherBean teacherInsertBean) {
			return "academymember/academyteacher_insert";
		}
		
		//학원강사입력
		@PostMapping("/academyteacher_insertPro")
		public String academyteacher_insertPro(@Validated@ModelAttribute("teacherInsertBean")AcademyTeacherBean teacherInsertBean, BindingResult result, Model model) {
			if(result.hasErrors()) {
				return "academymember/academyteacher_insert";
			}
			academyMemberService.insertTeacher(teacherInsertBean);
			List<AcademyTeacherBean> academyteacherlist = academyMemberService.academyTeacherList(loginAcademyMemberBean.getA_memberNo());
			model.addAttribute("academyteacherlist", academyteacherlist);
			return "academymember/academyteacher";
		}
		//학원강사 수정페이지
		@GetMapping("academyteacher_modify")
		public String academyteacher_modify(@ModelAttribute("teacherModifyBean") AcademyTeacherBean teacherModifyBean, @RequestParam("t_name") String t_name) {
			
			teacherModifyBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			teacherModifyBean.setT_name(t_name);
			AcademyTeacherBean teacherModifyBean2 = academyMemberService.teacherInfo(teacherModifyBean);
			teacherModifyBean.setT_subject(teacherModifyBean2.getT_subject());
			teacherModifyBean.setT_contents(teacherModifyBean2.getT_contents());
			teacherModifyBean.setT_file(teacherModifyBean2.getT_file());
			return "academymember/academyteacher_modify";
			
		}
		
		//학원강사수정
		@PostMapping("academyteacher_modifyPro")
		public String academyteacher_modifyPro(@Validated@ModelAttribute("teacherModifyBean") AcademyTeacherBean teacherModifyBean, BindingResult result, Model model) {
			
			if(result.hasErrors()) {
				return "academymember/academyteacher_modify";
			}
			
			academyMemberService.modifyTeacher(teacherModifyBean);
			List<AcademyTeacherBean> academyteacherlist = academyMemberService.academyTeacherList(loginAcademyMemberBean.getA_memberNo());
			model.addAttribute("academyteacherlist", academyteacherlist);
			return "academymember/academyteacher";
		}
		
		//학원강사삭제선택
		@GetMapping("academyteacher_delete")
		public String academyteacher_delete(@RequestParam("t_name") String t_name, Model model) {
			model.addAttribute("t_name", t_name);
			return "academymember/academyteacher_delete";
		}
		
		//학원강사삭제
		@GetMapping("academyteacher_deletePro")
		public String academyteacher_deletePro(@RequestParam("t_name")String t_name, @ModelAttribute("deleteAcademyTeacherBean") AcademyTeacherBean deleteAcademyTeacherBean, Model model) {
			
			deleteAcademyTeacherBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
			deleteAcademyTeacherBean.setT_name(t_name);
			academyMemberService.deleteTeacher(deleteAcademyTeacherBean);
			List<AcademyTeacherBean> academyteacherlist = academyMemberService.academyTeacherList(loginAcademyMemberBean.getA_memberNo());
			model.addAttribute("academyteacherlist", academyteacherlist);
			
			return "academymember/academyteacher";
		}
		
		//결제조회
		@GetMapping("academypay")
		public String academypay(Model model) {
			
			List<AcademyPayBean> academypaylist = academyMemberService.getAcademyPayList(loginAcademyMemberBean.getA_memberNo());
			
			model.addAttribute("academypaylist", academypaylist);
			
			return "academymember/academypay";
		}
		
	
	
	//내가 쓴 문의사항
			@GetMapping("/mypage_siteAcaAsk")
			public String myAsk(@ModelAttribute("myAcaAskBean") AcademyMemberBean myAcaAskBean,
								@RequestParam(value = "myAcaAskPage", defaultValue = "1") int myAcaAskPage,
								Model model) {
				
				List<SiteAcaAskBean> myasklist = academyMemberService.getMyaskList(loginAcademyMemberBean.getA_memberNo(), myAcaAskPage);
				model.addAttribute("myasklist", myasklist);
				
				int myAkaAskCnt = academyMemberService.getMyAskListCnt(myAcaAskBean);
				model.addAttribute("myAkaAskCnt", myAkaAskCnt);
				
				PageCountBean myAcapageCountBean = academyMemberService.getMyAskContentCnt(myAcaAskPage);
				model.addAttribute("myAcapageCountBean", myAcapageCountBean);
				
				model.addAttribute("myAcaAskPage", myAcaAskPage);
				
				return "academymember/mypage_siteAcaAsk";
			}
			
			@GetMapping("/mypage_siteAcaAskRead")
			public String myAskRead(@RequestParam("aa_time") Timestamp aa_time, 
									Model model) {
				
				SiteAcaAskBean myaskreadBean = academyMemberService.getMyaskRead(aa_time, loginAcademyMemberBean.getA_memberNo());
				
				model.addAttribute("myaskreadBean", myaskreadBean);
				
				return "academymember/mypage_siteAcaAskRead";
			}
	
	//관리자 학원 목록 페이지
		@GetMapping("/mypageAdmin_academy")
		public String abAacademyList(@ModelAttribute("myAdminAcaBean") AcademyMemberBean myAdminAcaBean,
									Model model) {
							
		List<AcademyMemberBean> adAcademylist = academyMemberService.getAdAcademyList();
		model.addAttribute("adAcademylist", adAcademylist);
						
		int adacatotCnt = academyMemberService.getAdminAcaCnt(myAdminAcaBean);
		model.addAttribute("adacatotCnt", adacatotCnt);
									
		return "academymember/mypageAdmin_academy";
		}
}
