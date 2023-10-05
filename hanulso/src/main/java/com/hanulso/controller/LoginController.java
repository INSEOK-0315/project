package com.hanulso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanulso.dto.MemberDTO;
import com.hanulso.service.LoginService;

import lombok.Setter;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Setter(onMethod_=@Autowired) 
	private LoginService service;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder encode;
	
	@Setter(onMethod_=@Autowired)
	private HttpSession session;
  
	
	@GetMapping("/login")
	public String login() {
		return "/login/login";
	}

	@PostMapping("/loginpro") 
	public String LoginPro(MemberDTO dto, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		
		MemberDTO mdto = service.Login(dto);
		  
		  if(mdto != null) {
			  String inputPw = dto.getPw();
			  String DBPw = mdto.getPw();
			  if(encode.matches(inputPw, DBPw)) {
				  session.setAttribute("user", mdto);
				  rttr.addFlashAttribute("userid", mdto.getId());
				  rttr.addFlashAttribute("msg", "success");
					 return "redirect:/";  
			  } else {
				  rttr.addFlashAttribute("msg", "fail");
					 return "redirect:/login/login"; 
			  }
		  } else {
			  rttr.addFlashAttribute("msg", "fail");	
				 return "redirect:/login/login";  
		  }	
	  
	}

	@GetMapping("/logout")
	public String Logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();

		return "redirect:/";
	}
}
