package com.kh.chemin.member.contoller;

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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.chemin.member.model.service.MemberService;
import com.kh.chemin.member.model.vo.Member;

@SessionAttributes(value = { "memberLoggedIn" })
@Controller
public class MemberController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Autowired
   MemberService service;

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

      if (m == null) {
         msg = "존재하지 않는 아이디입니다.";
      } else {
         if (bCryptPasswordEncoder.matches(password, m.getPassword())) {
            msg = "로그인 성공!";
            mv.addObject("memberLoggedIn", m);
         } else {
            msg = "비밀번호가 일치하지 않습니다";
         }
      }
      loc = "/";
      mv.addObject("msg", msg);
      mv.addObject("loc", loc);
      mv.addObject("status", "loginSuccess");
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

   @RequestMapping(value = "/member/memberEnrollEnd.do", method = { RequestMethod.POST })
   public String memberEnrollEnd(HttpServletRequest request, HttpServletResponse response, MultipartFile originalImg, Model model)
         throws ServletException, IOException, ParseException {

      Member member = new Member();

      SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

      member.setUserId(request.getParameter("userId"));
      member.setPassword(request.getParameter("password"));
      member.setUserName(request.getParameter("userName"));
      member.setGender(request.getParameter("gender"));
      member.setBirthDay(sdf.parse(request.getParameter("birthDay").replaceAll("-", "/")));// 데이트는 어떻게 가져오지??
      member.setEmail(request.getParameter("email"));
      member.setPhone(request.getParameter("phone"));
      member.setAddress(request.getParameter("address1") + "/" + request.getParameter("address2") + "/"
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
      String loc = "";
      if (result > 0) {
         msg = "회원가입에 성공하였습니다.";
         loc = "/";
      }

      else {
         msg = "회원가입에 실패하였습니다.";
         loc = "/views/member/memberEndroll";

      }
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);
      model.addAttribute("status", "endrollSuccess");
      return "common/msg";

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
   @RequestMapping("/member/find_Id.do")
   public String findId() {
      return "member/find_Id";
   }
   
  @RequestMapping("/member/memberInfoUpdate")
   public String memberInfoUpdate(Member member, String address1, String address2, String address3, HttpServletRequest request,Model model){
	  String address = address1+"/"+address2+"/"+address3;
	  member.setAddress(address);
	  
	  SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
	  String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");

      String enPw = bCryptPasswordEncoder.encode(request.getParameter("password"));
      member.setPassword(enPw);
      bCryptPasswordEncoder.encode(enPw);

     /* File dir = new File(saveDir);

      if (dir.exists() == false)
         dir.mkdirs();

      if (!orImg.isEmpty()) {
         String originalFilename = orImg.getOriginalFilename();
          bs.html 
         String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
         SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
         int rndNum = (int) (Math.random() * 1000);
         String renamedFileName = sdf1.format(new Date(System.currentTimeMillis()));
         renamedFileName += "_" + rndNum + "." + ext;
         try {
             서버의 해당경로에 파일을 저장하는 명령 
        	 orImg.transferTo(new File(saveDir + "/" + renamedFileName));
            member.setOriginalImg(originalFilename);
            member.setRenameImage(renamedFileName);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }*/
      
	  int result = service.memberInfoUpdate(member);
	  String msg = "";
      String loc = "";
 
      if (result > 0) {
         msg = "회원정보 수정이 완료되었습니다";
         loc = "/mypage/myMember.do?userId="+member.getUserId();
      }

      else {
         msg = "회원정보 수정이 되지 않았습니다";
         loc = "/mypage/myMember.do?userId="+member.getUserId();

      }
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);

      return "common/msg";
  }
   
//   @RequestMapping("/member/findIdEnd.do")
//   public void findIdEnd(HttpServletRequest request, HttpServletResponse response) throws ParseException {
//
//   }
}