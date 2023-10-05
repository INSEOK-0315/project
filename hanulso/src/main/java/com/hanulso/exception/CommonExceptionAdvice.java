package com.hanulso.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice // 예외처리를 목적으로 생성하는 캘래스이므로 별도의 로직을 처리하지는 않는다.
public class CommonExceptionAdvice {
	
	@ExceptionHandler(Exception.class) //예외 타입을 처리하는 메소드를 의미
	public void except(Exception e, Model model) {
		System.out.println("예외발생 >>"+e.getMessage());
		model.addAttribute("exception",e);
		//return "errorPage";//exception 속성을 errorpage.jsp로 포워딩
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handler404(NoHandlerFoundException e) {
		System.out.println("예외발생 >>"+e.getMessage());
		return "404";//custom404.jsp 를 실행
	}
}
