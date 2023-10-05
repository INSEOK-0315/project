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
import com.hanulso.dto.QaDTO;
import com.hanulso.dto.QaReplyDTO;
import com.hanulso.service.QaReplyService;
import com.hanulso.service.QaService;

import lombok.Setter;

@Controller
@RequestMapping("/qa/*")
public class QaController {

	@Setter(onMethod_=@Autowired)
	private QaService service;
	
	@Setter(onMethod_=@Autowired)
	private QaReplyService Rservice;
	
	@GetMapping("/list")
	public String qalist(Criteria cri, Model model) {
		model.addAttribute("list", service.ListQa(cri));
		int total = service.TotalCount(cri);
		PageDTO dto = new PageDTO(cri, total);
		model.addAttribute("pvo", dto);
		return "/qa/qa";
	}
	
	@GetMapping("/write")
	public String qawrite() {
		return "/qa/qawrite";
	}
	
	@PostMapping("/writepro")
	
	public String qainsert(QaDTO dto, RedirectAttributes rttr) {
		service.InsertQa(dto);
		/* rttr.addFlashAttribute("result", dto.getQbno()); */
		return "redirect:/qa/list";
	}
	
	@GetMapping("/qaview")
	public String SelectQa(@RequestParam("qbno") int qbno, Model model, Criteria cri) {
		
		QaDTO dto = service.ViewQa(qbno);
		QaDTO nextvo = service.nextPage(qbno);
		QaDTO prevo = service.prevPage(qbno);

		model.addAttribute("nextvo", nextvo);
		model.addAttribute("prevo", prevo);
		model.addAttribute("view", dto);
		model.addAttribute("cri", cri);
		model.addAttribute("aview", dto.getQaReplyDTO());
		
		return "/qa/qaview";
	}
	
	@GetMapping("/modify")
	public String Modify(@RequestParam("qbno") int qbno, Model model) {
		QaDTO dto = service.ViewQa(qbno);
		model.addAttribute("view",dto);
		
		return "/qa/qamodify";
	}
	
	@GetMapping("/delete")
	public String DeleteQa(@RequestParam("qbno") int qbno, RedirectAttributes rttr) {
		service.DeleteQa(qbno);
		return "redirect:/qa/list";
	}
	
	@PostMapping("/modifypro")
	public String UpdateQa(QaDTO dto, RedirectAttributes rttr) {
		service.UpdateProQa(dto);
		return "redirect:/qa/list";
	}
	
	
	
	// QaReply 
	
	@PostMapping("/qareply")
	public String qareplyinsert(QaReplyDTO rdto, QaDTO dto, RedirectAttributes rttr) {
		Rservice.SaveQaReply(rdto);
		service.UpdateQaState(dto);
		rttr.addFlashAttribute("result", rdto.getRbno());
		return "redirect:/qa/list";
	}
	
	@GetMapping("/replymodify")
	public String ReplyModify(@RequestParam("rbno") int rbno, Model model) {
		QaReplyDTO dto = Rservice.ViewQaReply(rbno);
		model.addAttribute("rview",dto);
		return "/qa/qamodify";
	}
	
	@PostMapping("/replymodifypro")
	public String UpdateReply(QaReplyDTO dto, RedirectAttributes rttr) {
		Rservice.UpdateQaReply(dto);
		return "redirect:/qa/list";
	}
	
	@GetMapping("/replydelete")
	public String DeleteReply(@RequestParam("rbno") int rbno, QaDTO dto, RedirectAttributes rttr) {
		Rservice.deleteQaReply(rbno);
		service.UpdateQaState2(dto);
		return "redirect:/qa/list";
	}
}
