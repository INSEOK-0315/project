package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanulso.dto.NoticeDTO;
import com.hanulso.service.NoticeService;

import lombok.Setter;
/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {
	
	@Setter(onMethod_=@Autowired)
	NoticeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(NoticeDTO dto,Model model) { //model : 포워딩하는 객체
		model.addAttribute("notice", service.recentnotice(dto));
		System.out.println("header >> "+dto);
		return "index";
	}
	
}
