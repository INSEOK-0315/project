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
import com.hanulso.dto.FaqDTO;
import com.hanulso.service.FaqService;

import lombok.Setter;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Setter(onMethod_=@Autowired)
	private FaqService service;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		model.addAttribute("list",service.ListFaq(cri));
		int total = service.TotalCount(cri);
		PageDTO dto = new PageDTO(cri,total);
		model.addAttribute("pvo",dto);
		return "/faq/faq";
	}
	
	@GetMapping("/write")
	public String Write() {
		return "/faq/faqwrite";
	}
	
	@PostMapping("/writepro")
	public String save(FaqDTO dto, RedirectAttributes rttr) {
		service.SaveFaq(dto);
		rttr.addFlashAttribute("result",dto.getBno());
		return "redirect:/faq/list";
	}
	
	@GetMapping({"/view","/modify"})
	public void ViewModify(@RequestParam("bno") int bno, Model model, Criteria cri) {
		FaqDTO dto = service.ViewFaq(bno);
		FaqDTO next = service.nextPage(bno);
		FaqDTO prev = service.prevPage(bno);
		model.addAttribute("next", next);
		model.addAttribute("prev", prev);
		model.addAttribute("view", dto);
		model.addAttribute("cri",cri);
	}
	
	@GetMapping("/delete")
	public String Delete(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		service.DeleteFaq(bno);
		return "redirect:/faq/list";
	}
	
	@PostMapping("/modifypro")
	public String Update(FaqDTO dto, RedirectAttributes rttr) {
		service.UpdateFaq(dto);
		return "redirect:/faq/list";
	}
	
}
