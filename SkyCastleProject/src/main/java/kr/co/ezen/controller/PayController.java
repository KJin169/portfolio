package kr.co.ezen.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.service.PayService;

@RequestMapping("/pay")
@Controller
public class PayController {

	@Autowired
	PayService payService;

	@GetMapping("/pay_success")
	public void pay_success(Model model) {
	}

	@GetMapping("/pay_howlong")
	public void pay_howlong(Model model) {
	}

	@GetMapping("/pay_whoRU")
	public int pay_whoRU(Model model, @RequestBody AcademyPayBean academyPayBean, HttpServletResponse response)
			throws Exception {

		System.out.println(academyPayBean.getA_memberNo()); // 값 받아왔는지 테스트
		int iano = Integer.parseInt(academyPayBean.getA_memberNo());
		System.out.println("iano : " + iano);
		int cd = payService.check_duplication(response, iano);
		System.out.println("cd : " + cd);

		return cd;

	}

	//아임포트 API활용 js, ajax 메서드 처리 로직
	@RequestMapping(value = "/send.do", method = RequestMethod.POST)
	@ResponseBody
	public void paycheck(@RequestBody AcademyPayBean academyPayBean, HttpServletResponse response) throws Exception {

		// 출력 테스트
		/*
		 * System.out.println(academyPayBean.getA_memberNo());
		 * System.out.println(academyPayBean.getAmount());
		 * System.out.println(academyPayBean.getA_payStart());
		 * System.out.println(academyPayBean.getA_payEnd());
		 */

		int a_memberNo = Integer.parseInt(academyPayBean.getA_memberNo());
		System.out.println("iano : " + a_memberNo);
		int cd = payService.check_duplication(response, a_memberNo);
		System.out.println("cd : " + cd);
		Timestamp a_payStart = payService.check_startday(a_memberNo);

		
		if (cd == 0) {
			switch (academyPayBean.getAmount()) {
			case "100":
				payService.insert_1month(academyPayBean);
				break;
			case "500":
				payService.insert_6month(academyPayBean);
				break;
			case "900":
				payService.insert_1year(academyPayBean);
				break;
			default:
				break;
			}
		} else {
			
			Timestamp payend = payService.check_latestpay(a_memberNo); //마지막 결제일
			System.out.println(payend);
			Timestamp now = new Timestamp(System.currentTimeMillis()); //현재 날짜
			System.out.println(now);
			
			
			int compare = payend.compareTo(now);
			System.out.println("compare: " + compare);
			
			//조건문
			if(compare < 0) { //db결제 마지막날짜가 오늘보다 작으면 = 종료일이 지났으면 insert
				switch (academyPayBean.getAmount()) {
				case "100":
					payService.insert_1month(academyPayBean);
					break;
				case "500":
					payService.insert_6month(academyPayBean);
					break;
				case "900":
					payService.insert_1year(academyPayBean);
					break;
				default:
					break;
				}
			} else {
				switch (academyPayBean.getAmount()) {
			case "100":
				payService.add_amonth(a_memberNo, a_payStart);
				break;
			case "500":
				payService.add_halfyear(a_memberNo, a_payStart);
				break;
			case "900":
				payService.add_ayear(a_memberNo, a_payStart);
				break;
			default:
				break;
			}
			}			
		}

	}
}
