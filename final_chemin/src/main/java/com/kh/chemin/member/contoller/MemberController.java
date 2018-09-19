package com.kh.chemin.member.contoller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.common.AuthKey;
import com.kh.chemin.member.model.service.MemberService;
import com.kh.chemin.member.model.vo.Member;

import net.sf.json.JSONArray;

@SessionAttributes(value = { "memberLoggedIn" })
@Controller
public class MemberController {

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
	 public ModelAndView loginCheck(String userId, String password, Model model) {

	      Member m = service.selectOne(userId);

	      ModelAndView mv = new ModelAndView();
	      
	      String msg = "";
	      String loc = "";
	      String status="";
	      if (m == null) {
	         msg = "존재하지 않는 아이디입니다.";
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
	         else {
	            msg = "비밀번호가 일치하지 않습니다";
	            status="loginFail";
	         }
	      }
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

	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	// @RequestMapping("/login/memberlogout.do")
	// public String updateMember(String userId, Model model) {
	// Member
	// }
	
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
	
}
