package kr.co.ezen.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.MemberDAO;
@Service
public class MemberService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	public void getLoginMember(MemberBean MemberBean) {
		MemberBean loginMemberBean2 = memberDAO.getLoginMember(MemberBean);
		
		if(loginMemberBean2 != null) {
			loginMemberBean.setM_classify(loginMemberBean2.getM_classify());
			loginMemberBean.setM_memberNo(loginMemberBean2.getM_memberNo());
			loginMemberBean.setM_id(loginMemberBean2.getM_id());
			loginMemberBean.setM_pw(loginMemberBean2.getM_pw());
			loginMemberBean.setM_name(loginMemberBean2.getM_name());
			loginMemberBean.setM_birth(loginMemberBean2.getM_birth());
			loginMemberBean.setM_gender(loginMemberBean2.getM_gender());
			loginMemberBean.setM_tele(loginMemberBean2.getM_tele());
			loginMemberBean.setM_joinDate(loginMemberBean2.getM_joinDate());
			loginMemberBean.setM_email(loginMemberBean2.getM_email());
			loginMemberBean.setM_confirm(loginMemberBean2.getM_confirm());
			
			MemberBean.setMemberlogin(true);
		}
	}
	
	public MemberBean getModifyMember(MemberBean modifyMemberBean) {
		
		MemberBean modifyMemberBean2 = memberDAO.getModifyMember(loginMemberBean.getM_memberNo());
		
		
		modifyMemberBean.setM_id(modifyMemberBean2.getM_id());
		modifyMemberBean.setM_name(modifyMemberBean2.getM_name());
		
		return modifyMemberBean;
	}
	
	public void updateMember(MemberBean modifyMemberBean) {
		modifyMemberBean.setM_memberNo(loginMemberBean.getM_memberNo());
		memberDAO.updateMember(modifyMemberBean);
	}
	
	public void deleteMemeber(int m_memberNo) {
		
		memberDAO.deleteMemeber(loginMemberBean.getM_memberNo());
	}
	
	public void joinMember(MemberBean joinMemberBean) {
		memberDAO.joinMember(joinMemberBean);
	}
	
	
	
	public MemberBean getMypageMember(MemberBean mypageMemberBean, HttpServletRequest request) {
		
		
		if(loginMemberBean.getM_memberNo() != 0) {
		MemberBean mypageMemberBean2 = memberDAO.getMypageMember(loginMemberBean.getM_memberNo());

		
		mypageMemberBean.setM_id(mypageMemberBean2.getM_id());
		mypageMemberBean.setM_name(mypageMemberBean2.getM_name());
		mypageMemberBean.setM_tele(mypageMemberBean2.getM_tele());
		mypageMemberBean.setM_email(mypageMemberBean2.getM_email());
		}else {
			HttpSession session = request.getSession();
		   MemberBean memberBean = (MemberBean) session.getAttribute("loginMemberBean");
			MemberBean mypageMemberBean2 = memberDAO.getMypageMember(memberBean.getM_memberNo());
			mypageMemberBean.setM_id(mypageMemberBean2.getM_id());
			mypageMemberBean.setM_name(mypageMemberBean2.getM_name());
			mypageMemberBean.setM_tele(mypageMemberBean2.getM_tele());
			mypageMemberBean.setM_email(mypageMemberBean2.getM_email());
		}
		return mypageMemberBean;
	}
	public List<MemberChildBean> getMypageMemberChild(int m_memberNo) {
		return memberDAO.getMypageMemberChild(m_memberNo);
	}
	
	public void insertChild(MemberChildBean insertChildBean) {
		memberDAO.insertChild(insertChildBean);
 	}
	
	public MemberChildBean getModifyChild(MemberChildBean modifyChildBean) {
		modifyChildBean.setM_memberNo(loginMemberBean.getM_memberNo());
 		MemberChildBean modifyChildBean2 = memberDAO.getModifyChild(modifyChildBean);
 		
 		modifyChildBean.setC_name(modifyChildBean2.getC_name());
 		modifyChildBean.setC_grade(modifyChildBean2.getC_grade());
 		modifyChildBean.setC_gender(modifyChildBean2.getC_gender());
 		modifyChildBean.setC_level(modifyChildBean2.getC_level());
 		return modifyChildBean;
 			
 	}
	
	public void modifyChild(MemberChildBean modifyChild) {
		
		memberDAO.modifyChild(modifyChild);
 	}
	
	public void deleteChild(MemberChildBean deleteChildBean) {
		
		memberDAO.deleteChild(deleteChildBean);
 	}

	public void deleteAllChild(int m_memberNo) {
		memberDAO.deleteAllChild(m_memberNo);
 	}
	
	public void deleteWishList(int m_memberNo) {
		memberDAO.deleteWishList(m_memberNo);
 	}
	
	public MemberBean getKakaoLoginMember( String m_id) {
		  MemberBean kakaoMemberBean =  memberDAO.getKakaoLoginMember(m_id);
		return kakaoMemberBean; 
	  }
	
	// 이메일발송
	public void sendEmail(MemberBean memberBean, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = ""; //moma417@naver.com
		String hostSMTPpwd = ""; //3M5PE4G346VL
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "moma417@naver.com";
		String fromName = "SkyCastle";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "스카이캐슬 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberBean.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberBean.getM_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = memberBean.getM_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	public void findPw(HttpServletResponse response, MemberBean memberBean) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberBean ck = memberDAO.readMember(memberBean.getM_id());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (memberDAO.readMember(memberBean.getM_id()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!memberBean.getM_email().equals(ck.getM_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			memberBean.setM_pw(pw);
			// 비밀번호 변경
			memberDAO.updatePw(memberBean);
			// 비밀번호 변경 메일 발송
			sendEmail(memberBean, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
		
	//카카오톡로그인 
	
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=fbbc5c452681184de4d17b6575dd2e5d"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8700/SkyCastleProject/"); // 본인이 설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
		
	//내가 쓴 문의사항
	public List<SiteAskBean> getMyaskList(int m_memberNo, int myAskPage){
		
		 int start = (myAskPage -1) * page_listcnt;
		 RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return memberDAO.getMyaskList(m_memberNo, rowBounds);
	}
	public SiteAskBean getMyaskRead(Timestamp sa_time, int m_memberNo){
		return memberDAO.getMyaskRead(sa_time, m_memberNo);
	}
	
	public int getMyAskListCnt(MemberBean myAskBean) {
		return memberDAO.getMyAskListCnt(myAskBean);
	}
	
	public PageCountBean getMyAskContentCnt(int currentPage) {
	
		int content_cnt = memberDAO.getMyAskContentCnt(loginMemberBean.getM_memberNo());
		 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		PageCountBean mypageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		 
		return mypageCountBean;
	}
	
	//관리자 마이페이지
	//public List<MemberBean> getAdminPageList() {
	//	return memberDAO.getAdminPageList();
	//}
	
	//관리자 회원목록 페이지
	public List<MemberBean> getAdMemberList(){
		return memberDAO.getAdMemberList();
	}
	
	//총회원수
	public int getAdminMemberCnt(MemberBean myAdminMemberBean) {
		return memberDAO.getAdminMemberCnt(myAdminMemberBean);
	}
	
	//찜목록 페이지 이동
	public List<AcademyMemberBean> myWishList(int m_memberNo){
    	return memberDAO.myWishList(m_memberNo);
    }
	
	//메인 찜목록
    public List<AcademyMemberBean> mainWishList(int m_memberNo) {
    	return memberDAO.mainWishList(m_memberNo);
    }
}
