package com.hanulso.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.PageDTO;
import com.hanulso.dto.PostDTO;
import com.hanulso.service.PostService;

import lombok.Setter;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Setter(onMethod_=@Autowired)
	private PostService service;
	
	
	@GetMapping("/list")
	public String ListPost(Criteria cri, Model model){
		
		int amount = 5;
		
		cri.setAmount(amount);
		
		model.addAttribute("list", service.ListPost(cri));
		int total = service.TotalCount(cri);
		PageDTO dto = new PageDTO(cri, total);
		model.addAttribute("pvo", dto);
		return "/post/post";
	}
	
	@GetMapping("/write")
	public String WritePf() {
		return "/post/postwrite";
	}
	
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);

	}

	@PostMapping("/writepro")
	public String WritePro(PostDTO dto,@RequestParam("upload") MultipartFile upload) {
		
		System.out.println("file >> "+upload.getOriginalFilename());
		System.out.println("size >> "+upload.getSize());
		
		String uploadFileName = upload.getOriginalFilename();
		
		/* 중복파일처리 */
		UUID uuid = UUID.randomUUID(); 
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		System.out.println("UUID FILE >> "+uploadFileName);
		
		String uploadFolder = "d:\\upload";  
		
		//업로드 패스 구하기
		File uploadPath = new File(uploadFolder, getFolder()); 
		System.out.println("절대경로 >> "+uploadPath);
		
		//날짜별로 업로드 하는 폴더 만들기
		if(uploadPath.exists() == false) { 
			uploadPath.mkdirs(); 
		}
		
		//업로드 경로 다시 구하기
		File uploadSavePath = new File(uploadPath, uploadFileName);
		System.out.println("실제 업로드 경로  >> " + uploadSavePath);
		
		String imgUrl = uploadSavePath.toString().substring(10);
		System.out.println("DB에 저장하는 경로 >> "+imgUrl);
		
		//폴더에 첨부파일 저장
	
		try {
			upload.transferTo(uploadSavePath);
			dto.setImgurl(imgUrl);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			service.SavePost(dto);
		return "redirect:/post/list";
	}
	
	@GetMapping("/view")
	public String ViewPost(@RequestParam("bno") int bno, Model model, Criteria cri) {
		
		PostDTO dto = service.ViewPost(bno);
		PostDTO nextvo = service.nextPage(bno);
		PostDTO prevo = service.prevPage(bno);
		model.addAttribute("view", dto);
		model.addAttribute("nextvo", nextvo);
		model.addAttribute("prevo", prevo);
		model.addAttribute("cri", cri);
		
		return "/post/postview";
	}
	
	@GetMapping("modify")
	public String ModifyView(@RequestParam("bno") int bno, Model model) {
		PostDTO dto = service.ViewPost(bno);
		model.addAttribute("view", dto);
		
		return "/post/postmodify";
	}
	
	@RequestMapping("/delete")
	public String DeletePost(@RequestParam("bno") int bno, String imgurl, RedirectAttributes rttr){ 
		
		File file;
		
		System.out.println("fileName >> "+imgurl);
		
		try {
			
			// 썸네일 파일 삭제 
			file = new File("d:\\upload\\" + URLDecoder.decode(imgurl, "UTF-8"));
			
			System.out.println("file >> "+file);
			
			file.delete();
			
			// 원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("_", "");
			
			System.out.println("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}

		service.DeletePost(bno);
		return "redirect:/post/list"; 
	}
	
	@PostMapping("/modifypro")
	public String UpdatePost(@RequestParam("upload") MultipartFile upload, PostDTO dto, RedirectAttributes rttr) {
		
		System.out.println("file >> "+upload.getOriginalFilename());
		System.out.println("size >> "+upload.getSize());
		
		String uploadFileName = upload.getOriginalFilename();
		
		/* 중복파일처리 */
		UUID uuid = UUID.randomUUID(); 
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		System.out.println("UUID FILE >> "+uploadFileName);
		
		String uploadFolder = "d:\\upload";  
		
		//업로드 패스 구하기
		File uploadPath = new File(uploadFolder, getFolder()); // 업로드와 관련된 객체생성 file 클래스 
		System.out.println("절대경로 >> "+uploadPath);
		
		//날짜별로 업로드 하는 폴더 만들기
		if(uploadPath.exists() == false) { // 업로드 폴더 존재여부 확인
			uploadPath.mkdirs();
		}
		
		//업로드 경로 다시 구하기
		File uploadSavePath = new File(uploadPath, uploadFileName);
		System.out.println("실제 업로드 경로  >> " + uploadSavePath);
		
		String imgUrl = uploadSavePath.toString().substring(10);
		System.out.println("DB에 저장하는 경로 >> "+imgUrl);
		
		//폴더에 첨부파일 저장
	
		try {
			upload.transferTo(uploadSavePath);
			dto.setImgurl(imgUrl);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		service.UpdatePost(dto);
		return "redirect:/post/list";
	}
	
	@GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> DownloadPF(@RequestHeader("User-Agent") String userAgent, @RequestParam(value="fileName") String fileName) { //responseEntity : 상태코드, 전송하고자하는 데이터
		
		System.out.println("fileName >>" + fileName);
		Resource resource = new FileSystemResource("d:\\upload\\" + fileName);
		
		System.out.println("Resource >> "+resource);
		
		if(resource.exists() == false) { // 다운받고자 하는 파일이 없는 경우
			System.out.println("파일이 없습니다");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename(); // 파일 이름 가져오기
		System.out.println("resourceName >> "+resourceName);
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1); // UUID 부분은 제거 하고 순수한 파일만 지정
		System.out.println("순수한 파일 이름"+resourceOriginalName);
		
		HttpHeaders headers = new HttpHeaders();
		
		String download = null;
		
		try {
			if(userAgent.contains("Edge")) {
				download = URLEncoder.encode(resourceOriginalName,"UTF-8");
				System.out.println(download);
			}else {
				download = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1"); // ISO-8859-1 :chrome 브라우저에서 사용하는 인코딩 코드
				System.out.println(download);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		headers.add("Content-Disposition", "attachment; filename=" +download); // 다운받고자 하는 이미지 정보 보내기
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
}
