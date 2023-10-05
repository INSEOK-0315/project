package com.hanulso.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hanulso.dto.PostReplyDTO;
import com.hanulso.service.PostReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Setter(onMethod_=@Autowired)
	private PostReplyService service; 
	
	@RequestMapping(value="/replyinsert")
	public ResponseEntity<PostReplyDTO> ReplyInsert(@RequestBody PostReplyDTO dto) {
		
		int rbno = service.ReplyInsert(dto);
		System.out.println("DTO >>"+dto);
		
		return new ResponseEntity(rbno, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/replylist/{bno}")
	public @ResponseBody Map<String, Object> ReplyList(@PathVariable("bno") int bno){
		System.out.println(bno);
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<PostReplyDTO> rlist = new ArrayList<PostReplyDTO>();

		rlist = service.ReplyList(bno);
		System.out.println(("get : "+rlist));
		
		map.put("rlist", rlist);
		
		return map;
	}
	
	@RequestMapping(value="/replydelete/{rbno}")
	public @ResponseBody ResponseEntity<PostReplyDTO> ReplyDelete(@PathVariable("rbno") int rbno) {
		System.out.println("delete : " + rbno);
		service.ReplyDelete(rbno);
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping(value="/replyview/{rbno}")
	public PostReplyDTO ReplyView(@PathVariable("rbno") int rbno) {
		
		System.out.println("rbno >> "+rbno);
		
		return service.ReplyView(rbno);
	}
	
	@RequestMapping(value="/replyupdatepro/{rbno}")
	public ResponseEntity<PostReplyDTO> ReplyUpdate(@RequestBody PostReplyDTO dto){
		
		int rbno = service.ReplyModify(dto);
		
		System.out.println("PostReplyDTO >> " + dto);
		return new ResponseEntity(rbno, HttpStatus.OK);
	}

}
