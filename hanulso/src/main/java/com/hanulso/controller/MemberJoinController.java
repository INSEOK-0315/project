package com.hanulso.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.hanulso.dto.MemberDTO;
import com.hanulso.dto.PostDTO;
import com.hanulso.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member/*")
public class MemberJoinController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder encode;

	@GetMapping("/member")
	public String Member() {

		return "/member/member";
	}

	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date); // 2023-05-24
		return str.replace("-", File.separator);
		// window에서는 \를 구분자로 사용하지만 Linux는 /를 구분자로 사용한다
		// File.separator 프로그램이 실행중인 OS에 해당하는 구분자로 리턴한다.
		// 2023-05-24 -> 2023\05\24
	}

	@PostMapping("/memberinsert")
	public String register(@RequestParam("upload") MultipartFile upload, MemberDTO dto, HttpServletRequest request) {

		System.out.println("file >> "+upload.getOriginalFilename());
		System.out.println("size >> "+upload.getSize());
		
		String uploadFileName = upload.getOriginalFilename();

		/* 중복파일처리 */
		UUID uuid = UUID.randomUUID(); // UUID : 16진수 형태로 변환
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		System.out.println("UUID FILE >> " + uploadFileName);

		String uploadFolder = "d:\\upload"; 

		// 업로드 패스 구하기
		File uploadPath = new File(uploadFolder, getFolder()); // 업로드와 관련된 객체생성 file 클래스
		System.out.println("절대경로 >> " + uploadPath);

		// 날짜별로 업로드 하는 폴더 만들기
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// 업로드 경로 다시 구하기
		File uploadSavePath = new File(uploadPath, uploadFileName); // 파일객체 uploadFileName : 리네임 시킨것.
		System.out.println("실제 업로드 경로  >> " + uploadSavePath);

		String profileimg = uploadSavePath.toString().substring(10);
		System.out.println("DB에 저장하는 경로 >> " + profileimg);

		// 폴더에 첨부파일 저장

		try {
			upload.transferTo(uploadSavePath);// 위에서 만든 파일객체의 경로와 리네임으로 실제 업로드 파일 저장
			dto.setProfileimg(profileimg);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String pw = dto.getPw();
		
		String dbpw = encode.encode(pw);
		
		dto.setPw(dbpw);
		
		service.MemberInsert(dto);

		return "redirect:/";
	}
	
	
	@RequestMapping(value="/idcheck")  
	@ResponseBody public int idcheck(@RequestBody Map<String,String> paramMap){
	  
		System.out.println("controller idcheck>> "+paramMap);
		  
		String id = paramMap.get("id");
		  
		int result = service.IdCheck(id);
		  
		System.out.println("idcheck result>> "+result);
		  
		return result; 
	  
	}
	 

	@RequestMapping(value = "/nicknamecheck")
	public @ResponseBody int NickNamecheck(@RequestBody Map<String, String> paramMap) {

		System.out.println("controller >> " + paramMap);

		String nickname = paramMap.get("nickname");

		int result = service.NickNameCheck(nickname);
		System.out.println("controller result >> " + result);

		return result;
	}
	
	@RequestMapping(value = "/sendemail")
	public @ResponseBody void sendemail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String email = request.getParameter("email");
		
		String host = "smtp.naver.com";
		String user = "savas7@naver.com";
		String password = "dlstjr149300!!";
		String to_email = email;
		
		Properties props = new Properties(); 
		
        props.put("mail.smtp.host", host);// 호스트컴퓨터
        props.put("mail.smtp.port", 465);// 포트 번호
        props.put("mail.smtp.auth", "true");// 권한 true
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		
		StringBuffer temp = new StringBuffer();
		
		Random rnd = new Random();
		
		for(int i=0; i<10; i++) {
			int rindex = rnd.nextInt(3);
			switch(rindex) {
			case 0: 
				temp.append((char)((int)(rnd.nextInt(26))+97));

				break;
			case 1:
				temp.append((char)((int)(rnd.nextInt(26))+65));

				break;
			case 2:
				temp.append(rnd.nextInt(30));

				break;
			}
		}
		
		String authnumber = temp.toString(); 
		System.out.println(authnumber);
		
		//session 객체 생성
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){ 
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(user, password);
			}

		});


		
		try {
			MimeMessage msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(user, "BLOG"));// 보내는사람
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));// 받는사람
			//메일제목
			msg.setSubject("BLOG에서 보내는 인증번호 입니다");
			//메일내용
			msg.setText("인증번호 : "+authnumber+ "인증번호를 복사하여 붙여넣기 하세요");
			//메세지 전송
			Transport.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		HttpSession authNumberkey = request.getSession();
		
		authNumberkey.setAttribute("authNumberKey", authnumber);

		JsonObject obj = new JsonObject();
		
		obj.addProperty("mssg", "메일전송완료");
		
		
		//호출한 곳으로 되돌려 주기.
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json, charset=utf-8");
		response.getWriter().print(obj);
		
	}

	@RequestMapping(value = "/certiNumberCheck")
	@ResponseBody
	public void certinumCheck(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		String certiNumber = request.getParameter("certinumber");
		//비교할 값

		String authNumberKey = (String)request.getSession().getAttribute("authNumberKey");		


		System.out.println(certiNumber);
		System.out.println(authNumberKey);
		
		JsonObject obj = new JsonObject();
		
		if(certiNumber.equals(authNumberKey)) {

			obj.addProperty("msg", "인증번호가 일치합니다");
			obj.addProperty("check", "ok");
		}else {
			obj.addProperty("msg", "인증번호가 일치하지 않습니다");
			obj.addProperty("check", "no");
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json,charset=utf-8");
		response.getWriter().print(obj);
	}
	
	@GetMapping("/view")
	public String ViewMember(@RequestParam("bno") int bno, Model model) {
		
		MemberDTO dto = service.ViewMember(bno);
		model.addAttribute("view", dto);
		
		return "/member/memberview";
	}
	
	
	@GetMapping("/modify")
	public String ModifyMember(@RequestParam("bno") int bno, Model model) {
		
		MemberDTO dto = service.ViewMember(bno);
		model.addAttribute("view", dto);
		
		return "/member/membermodify";
	}
	
	@PostMapping("/modifypro")
	public String UpdateMember(@RequestParam("upload") MultipartFile upload, MemberDTO dto, RedirectAttributes rttr, HttpServletRequest request) {
		
		System.out.println("file >> "+upload.getOriginalFilename());
		System.out.println("size >> "+upload.getSize());
		
		String uploadFileName = upload.getOriginalFilename();

		/* 중복파일처리 */
		UUID uuid = UUID.randomUUID(); // UUID : 16진수 형태로 변환
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		System.out.println("UUID FILE >> " + uploadFileName);

		String uploadFolder = "d:\\upload"; 

		// 업로드 패스 구하기
		File uploadPath = new File(uploadFolder, getFolder()); // 업로드와 관련된 객체생성 file 클래스
		System.out.println("절대경로 >> " + uploadPath);

		// 날짜별로 업로드 하는 폴더 만들기
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// 업로드 경로 다시 구하기
		File uploadSavePath = new File(uploadPath, uploadFileName); // 파일객체 uploadFileName : 리네임 시킨것.
		System.out.println("실제 업로드 경로  >> " + uploadSavePath);

		String profileimg = uploadSavePath.toString().substring(10);
		System.out.println("DB에 저장하는 경로 >> " + profileimg);

		// 폴더에 첨부파일 저장

		try {
			upload.transferTo(uploadSavePath);
			dto.setProfileimg(profileimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String pw = dto.getPw();
		
		String dbpw = encode.encode(pw);
		
		dto.setPw(dbpw);
		
		service.UpdateMember(dto);
		
		return "redirect:/login/logout";
	}
	
	@RequestMapping("/delete")
	public String DeleteMember(@RequestParam("bno") int bno, String profileimg, HttpServletRequest request) {
		
		File file;
		
		System.out.println("fileName >> "+profileimg);
		
		try {
			
			// 썸네일 파일 삭제 
			file = new File("d:\\upload\\" + URLDecoder.decode(profileimg, "UTF-8"));
			
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
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		service.DeleteMember(bno);
		return "redirect:/";
	}
}
