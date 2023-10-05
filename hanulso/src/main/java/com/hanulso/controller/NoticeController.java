package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.PageDTO;
import com.hanulso.dto.NoticeDTO;
import com.hanulso.service.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Setter(onMethod_=@Autowired)
	private NoticeService service;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		model.addAttribute("list",service.ListNotice(cri));
		int total = service.TotalCount(cri);
		PageDTO dto = new PageDTO(cri,total);
		model.addAttribute("pvo", dto);
		return "/notice/notice";
	}
	
	
	@GetMapping("/write")
	public String write() {
		return "/notice/noticewrite";
	}

	@PostMapping("/writepro")
	public String save(NoticeDTO dto, RedirectAttributes rttr) {
		service.saveNotice(dto);
		rttr.addFlashAttribute("result", dto.getBno());
		return "redirect:/notice/list";
	}
	
	@GetMapping({"/noticeview","/noticemodify",})// 하나의 레코드를 같이 사용할 떄는 배열 형식으로 사용 가능
	public void ViewNotice(@RequestParam("bno") int bno, Model model, Criteria cri) {
		 
		NoticeDTO dto = service.viewNotice(bno);
		NoticeDTO nextvo = service.nextPage(bno);
		NoticeDTO pvo = service.prevPage(bno);
		model.addAttribute("nextvo", nextvo);
		model.addAttribute("prevo", pvo);
		model.addAttribute("view", dto);
		model.addAttribute("cri", cri);
	}
	
	@GetMapping("/delete")
	public String DeleteNotice(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		service.deleteNotice(bno);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/notice/list";
	}
	
	@PostMapping("/modifypro")
	public String UpdateNotice(NoticeDTO dto, RedirectAttributes rttr) {
		service.updateNotice(dto);
		return "redirect:/notice/list";
		
	}

}
