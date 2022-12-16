package kr.co.ezen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExpectionController {

	private Logger logger = LoggerFactory.getLogger(ExpectionController.class);
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex, Model model) {
		logger.error("예외 발생 : {}", ex.getMessage());
		model.addAttribute("msg", "잘못된 접근");
		
		return "error/error";
	}
}
