package com.kh.chemin.member.contoller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.common.AuthKey;
import com.kh.chemin.member.model.service.MemberService;
import com.kh.chemin.member.model.vo.Member;

import net.sf.json.JSONArray;

@SessionAttributes(value = { "memberLoggedIn" })
@Controller
public class MemberController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;

   @Autowired
   BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/login/login.do")
	public String login() {
		return "login/login";
	}

   @RequestMapping("/login/loginCheck.do")
   public ModelAndView loginCheck(String userId, String password, Model model,ModelAndView mv) {
      Member m = service.selectOne(userId);
     
      String msg = "";
      String loc = "";
      String status="";
      if (m == null) {
         msg = "존재하지 않는 아이디입니다.";
         status="loginFail";
      } else {
         if (bCryptPasswordEncoder.matches(password, m.getPassword()) && m.getMgrade() == 0) {
            msg = "로그인 성공!";
            mv.addObject("memberLoggedIn", m);
            status="loginSuccess";
         } 
         else if (bCryptPasswordEncoder.matches(password, m.getPassword()) && m.getMgrade() == 1) {
            msg="회원님의 아이디는 3번 이상의 신고 누적으로 정지당하셨습니다.";
            status="loginFail";
          } 
         else if (bCryptPasswordEncoder.matches(password, m.getPassword()) && m.getMgrade() == 2) {
            msg="존재하지 않은 아이디입니다.";
            status="loginFail";
          }
         else {
            msg = "비밀번호가 일치하지 않습니다";
            status="loginFail";
         }
      }
      
     System.out.println("status================= +" + status);
      loc = "/";
      mv.addObject("msg", msg);
      mv.addObject("loc", loc);
      mv.addObject("status",status);
      mv.setViewName("common/msg");
      return mv;
	}

   @RequestMapping("/login/memberlogout.do")
   public String memberLogout(SessionStatus ss) {
      if (!ss.isComplete()) {
         ss.setComplete();
      }
      return "redirect:/";
   }

   @RequestMapping(value = "/member/memberEnrollEnd.do", method = { RequestMethod.POST })
   public String memberEnrollEnd(HttpServletRequest request, HttpServletResponse response, MultipartFile originalImg)
         throws ServletException, IOException, ParseException {

      Member member = new Member();
      SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

      member.setUserId(request.getParameter("userId"));
      member.setPassword(request.getParameter("password"));
      member.setUserName(request.getParameter("userName"));
      member.setGender(request.getParameter("gender"));
      member.setBirthDay((request.getParameter("birthDay").replaceAll("-", "/")));
      member.setEmail(request.getParameter("email"));
      member.setPhone(request.getParameter("phone"));
      member.setAddress(request.getParameter("address1") + "," + request.getParameter("address2") + ","
            + request.getParameter("address3"));
      member.setHobby(request.getParameterValues("hobby"));// 배열은 어떻게 하지???

      String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");

      String enPw = bCryptPasswordEncoder.encode(request.getParameter("password"));
      member.setPassword(enPw);
      bCryptPasswordEncoder.encode(enPw);

      File dir = new File(saveDir);

      if (dir.exists() == false)
         dir.mkdirs();

      if (!originalImg.isEmpty()) {
         String originalFilename = originalImg.getOriginalFilename();
         /* bs.html */
         String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
         SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
         int rndNum = (int) (Math.random() * 1000);
         String renamedFileName = sdf1.format(new Date(System.currentTimeMillis()));
         renamedFileName += "_" + rndNum + "." + ext;
         try {
            /* 서버의 해당경로에 파일을 저장하는 명령 */
            originalImg.transferTo(new File(saveDir + "/" + renamedFileName));
            member.setOriginalImg(originalFilename);
            member.setRenameImage(renamedFileName);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

      int result = service.insertMember(member);

      String msg = "";
      String loc = "/";
      if (result > 0) {
         msg = "회원가입에 성공하였습니다.";
         loc = "/";
      }

      else {
         msg = "회원가입에 실패하였습니다.";
         loc = "/views/member/memberEndroll";

      }
      return "common/msg";

   }

	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
	
	@RequestMapping("/login/findId.do")
	public String findId() {
		return "login/findId";
	}
	
	@RequestMapping("/login/findPw.do")
	public String findPw() {
		return "login/findPw";
	}
	
	@RequestMapping("/login/findIdMail.do")
	public void findIdMail(String name, String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("userName", name);
		map.put("userEmail", email);
		Member m = service.selectFindId(map);
		int result = 0; // 존재 하는지 여부 (해당 회원) 0이면 존재x 1이면 존재
		String key = "";
		String userId = "";
		if(m!=null) {
			result = 1;
			userId = m.getUserId();
			key = new AuthKey().getKey(30, false);

			String content = "안녕하세요. "+name+"님! Free Fleuri 입니다.\n";
			content+="ID 찾기 인증번호를 발송해드립니다.\n\n";
			content+="key : "+key+"\n\n";
			content+="위의 key 값을 인증번호 입력 칸에 입력해주시기 바랍니다.\n";
			content+="오늘도 Free Fleuri를 이용해주셔서 감사합니다.";
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom("bly0319@naver.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email);     // 받는사람 이메일
				messageHelper.setSubject(name+"님! Free Fleuri ID 찾기 인증 메일입니다."); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
				 
				mailSender.send(message);
		    } catch(Exception e){
		    	e.printStackTrace();
		    }
			
		}
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(result);
		jsonArr.add(key);
		jsonArr.add(userId);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	@RequestMapping("/login/findPwMail.do")
	public void findPwMail(String userId, String name, String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userName", name);
		map.put("userEmail", email);
		Member m = service.selectFindPw(map);
		int result = 0; // 존재 하는지 여부 (해당 회원) 0이면 존재x 1이면 존재
		String key = "";
		if(m!=null) {
			result = 1;
			key = new AuthKey().getKey(30, false);

			String content = "안녕하세요. "+name+"님! Free Fleuri 입니다.\n";
			content+="PW 찾기 인증번호를 발송해드립니다.\n\n";
			content+="key : "+key+"\n\n";
			content+="위의 key 값을 인증번호 입력 칸에 입력해주시기 바랍니다.\n";
			content+="오늘도 Free Fleuri를 이용해주셔서 감사합니다.";
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom("bly0319@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email);     // 받는사람 이메일
				messageHelper.setSubject(name+"님! Free Fleuri PW 찾기 인증 메일입니다."); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
				 
				mailSender.send(message);
		    } catch(Exception e){
		    	e.printStackTrace();
		    }
			
		}
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(result);
		jsonArr.add(key);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	@RequestMapping("/login/changePw.do")
	public String changePw(Model model, String userId) {
		model.addAttribute("userId", userId);
		return "login/changePw";
	}
	
	@RequestMapping("/login/updatePw.do")
	public void updatePw(String userId, @RequestParam("pw") String pw, HttpServletResponse response) throws Exception {
		String password = bCryptPasswordEncoder.encode(pw);
		System.out.println("pw:"+pw+" -> "+password);
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("password", password);
		int result = service.updatePw(map);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	

   @RequestMapping("/member/checkDuplicate.do")
   public void duplicateId(String userId, HttpServletResponse res) throws IOException {
      boolean idFlag = service.selectOne(userId) != null ? true : false;

      res.getWriter().println(idFlag);
   }

   @RequestMapping("/member/checkEmail.do")
   public void checkEmail(String email, HttpServletResponse res) throws IOException {
      boolean emailFlag = service.checkEmail(email) != null ? true : false;

      res.getWriter().println(emailFlag);
   }

   @RequestMapping("/member/checkPhone.do")
   public void checkPhone(String phone, HttpServletResponse res) throws IOException {
      boolean phoneFlag = service.checkPhone(phone) != null ? true : false;
      res.getWriter().println(phoneFlag);
   }
   
   @RequestMapping("/member/memberInfoUpdate")
   public String memberInfoUpdate(Member member,MultipartFile file, String address1, String address2, String address3, HttpServletRequest request,Model model){
      String address = address1+"/"+address2+"/"+address3;
     member.setAddress(address);
     String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");
     
     String enPw = bCryptPasswordEncoder.encode(member.getPassword());
     member.setPassword(enPw);
     bCryptPasswordEncoder.encode(enPw);
     
     if(!file.isEmpty()) {
    	 String image = request.getSession().getServletContext().getRealPath("/resources/upload/member/"+member.getRenameImage());
    	 File file1 = new File(image);
    	 if(file1.exists() == true) {
    		 file1.delete();
    	 }
    	 
    	 String originalFilename = file.getOriginalFilename();
         /* bs.html */
         String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
         SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
         int rndNum = (int) (Math.random() * 1000);
         String renamedFileName = sdf1.format(new Date(System.currentTimeMillis()));
         renamedFileName += "_" + rndNum + "." + ext;
         try {
            /* 서버의 해당경로에 파일을 저장하는 명령 */
        	 file.transferTo(new File(saveDir + "/" + renamedFileName));
            member.setOriginalImg(originalFilename);
            member.setRenameImage(renamedFileName);
         } catch (Exception e) {
            e.printStackTrace();
         }
    	 
     }
    
    int result = service.memberInfoUpdate(member);
 
     String msg = "";
      String loc = "";
      String status="";
      if (result > 0) {
         msg = "회원정보 수정이 완료되었습니다";
         loc = "/mypage/myMember.do?userId="+member.getUserId();
         status="loginSuccess";
      }

      else {
         msg = "회원정보 수정이 되지 않았습니다";
         loc = "/mypage/myMember.do?userId="+member.getUserId();

      }
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);
      model.addAttribute("status", status);
      return "common/msg";
  }
   
   @RequestMapping("/member/memberWithdraw")
   public String memberWithdraw(String userId, int mgrade, Model model,SessionStatus ss) {
	   Map<String, Object> map = new HashMap<>();
	   map.put("userId", userId);
	   map.put("mgrade", mgrade);
	   int result = service.memberWithdraw(map);
	   
	    String msg = "";
	    String loc = "/";
	    String status="";
	   if(result>0) {
		   msg = "회원 탈퇴가 되었습니다";
	         status="loginSuccess";
	         if (!ss.isComplete()) {
	             ss.setComplete();
	          }
	   }else {
		   msg = "회원탈퇴가 되지 않았습니다";
	   }
	   model.addAttribute("msg", msg);
	      model.addAttribute("loc", loc);
	      model.addAttribute("status", status);
	      return "common/msg";
   }
   
//   @RequestMapping("/member/findIdEnd.do")
//   public void findIdEnd(HttpServletRequest request, HttpServletResponse response) throws ParseException {
//
//   }

}