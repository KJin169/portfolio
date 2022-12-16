package kr.co.ezen.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.service.MemberService;
import kr.co.ezen.service.OAuthService;

@RequestMapping("/member")
@Controller
public class OAuthController {
   @Autowired
   OAuthService oAuthService;
   
   @Autowired
   MemberService memberService;
   
   
    @RequestMapping(value="/kakao")
    public String kakaoCallback(
                         @ModelAttribute("joinMemberBean") MemberBean joinMemberBean,
                         @RequestParam("code") String code,
                         
                         Model model, HttpServletRequest request) {
       HttpSession session = request.getSession();
       model.addAttribute("code", code);
       
        String access_Token = oAuthService.getKakaoAccessToken(code);
        HashMap<String, Object> userInfo = oAuthService.getUserInfo(access_Token);
        
       
        
        
        System.out.println("login Controller : " + userInfo);
        
        model.addAttribute("userInfo", userInfo);
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        
        
        String email = oAuthService.selectEmailKakao((String) userInfo.get("email"));
        
        System.out.println(userInfo.get("email"));
        System.out.println(email);
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        if(!userInfo.get("email").equals(email)) {
           return "member/kakaoJoin"; 
        }else {
        	String m_id = (String) userInfo.get("email");
        	MemberBean mypageMemberBean = memberService.getKakaoLoginMember(m_id);
        	
        	System.out.println(mypageMemberBean.getM_memberNo());
        	session.setAttribute("loginMemberBean", mypageMemberBean);
        	memberService.getMypageMember(mypageMemberBean, request);
           return "index";
        }
    }

    @RequestMapping(value="/kakaoLogout")
    public String logout(HttpSession session) {
       oAuthService.kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        session.removeAttribute("loginMemberBean");
        return "index";
    }
}

    