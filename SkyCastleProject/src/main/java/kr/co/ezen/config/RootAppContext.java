package kr.co.ezen.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;





@Configuration
public class RootAppContext {
	//login.jsp에서 다루는 데이터를 loginUserDataBean 객체를 이용할 예정입니다.
	@Bean("loginMemberBean")
	@SessionScope
	public MemberBean loginMemberBean() {
		return new MemberBean();
	}
	
	@Bean("loginAcademyMemberBean")
	   @SessionScope
	   public AcademyMemberBean loginAcademyMemberBean() {
	      return new AcademyMemberBean();
	   }
}
