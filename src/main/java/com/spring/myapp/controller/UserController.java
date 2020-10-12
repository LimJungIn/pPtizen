package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.spring.myapp.domain.User;
import com.spring.myapp.service.UserService;

@Controller
public class UserController {

   @Autowired
   UserService userService;

   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String home(Locale locale) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        return "join";
    }
   
   @RequestMapping(value = "/join/save", method = RequestMethod.POST)
   @ResponseBody
   public Object join(@RequestParam Map<String, Object> paramMap) {
      
      Map<String, Object> retVal = new HashMap<String, Object>();
      
      int result = userService.insertUser(paramMap);

      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "회원가입 성공.");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "회원가입 실패.");
      }
      
      return retVal;
   }
   
   @RequestMapping(value = "/join/checkId" ,method = RequestMethod.POST)
   @ResponseBody
   public Object CheckId(@RequestParam Map<String, Object> paramMap) {
      
      Map<String, Object> retVal = new HashMap<String, Object>();
      
      
      int resultCnt = userService.checkId(paramMap);
   

      if(resultCnt == 0) {
         retVal.put("code", "OK");
         retVal.put("message", "사용 가능한 아이디입니다.");
      }else {
         retVal.put("code", "FAIL");
         retVal.put("message", "중복된 아이디입니다.");
      }
      
      return retVal;
   }
      
   @RequestMapping(value = "/join/checkNickName" ,method = RequestMethod.POST)
   @ResponseBody
   public Object checkNickName(@RequestParam Map<String, Object> paramMap) {
      
      Map<String, Object> retVal = new HashMap<String, Object>();
      
      
      int resultCnt = userService.checkNickName(paramMap);
   

      if(resultCnt == 0) {
         retVal.put("code", "OK");
         retVal.put("message", "사용 가능한 닉네임입니다.");
      }else {
         retVal.put("code", "FAIL");
         retVal.put("message", "중복된 닉네임입니다.");
      }
      
      return retVal;
   }

   @RequestMapping(value = "/join/checkEmail", method = RequestMethod.POST)
   @ResponseBody
   public Object checkEmail(@RequestParam Map<String, Object> paramMap) {
      
      Map<String, Object> retVal = new HashMap<String, Object>();
      
      
      int resultCnt = userService.checkEmail(paramMap);
   

      if(resultCnt == 0) {
         retVal.put("code", "OK");
         retVal.put("message", "사용 가능한 이메일입니다.");
      }else {
         retVal.put("code", "FAIL");
         retVal.put("message", "중복된 이메일 입니다.");
      }
      
      return retVal;
   }
      
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String loginForm(Locale locale) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        return "login";
    }
   
   @RequestMapping(value = "/login/login", method = RequestMethod.POST)
   @ResponseBody
   public Object login(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, Model model) {
      
      Map<String, Object> retVal = new HashMap<String, Object>();

      int resultCnt = userService.login(paramMap);
      String user_nickname = userService.getNickName(paramMap);
      
      if(resultCnt>0) {
         HttpSession session = request.getSession(true);
         //session을 쓸 수 있도록 new.session은 서버가 유지되어 있는 동안 정보를 유지할 수 있는 공간이다.
         session.setAttribute("user_id", paramMap.get("user_id"));
         session.setAttribute("user_nickname", user_nickname);
         retVal.put("code", "OK");
         retVal.put("message", "로그인 성공");
      }else {
         retVal.put("code", "FAIL");
         retVal.put("message", "로그인 실패");
      }
      
      return retVal;
   }
   
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(Locale locale, HttpSession session) {
        logger.info("Welcome home! The client locale is {}.", locale);
        session.invalidate();
        return "login";
    }
   
   @RequestMapping(value = "/user/view/loading")
   public String userViewLoading(@RequestParam Map<String, Object> paramMap, Model model) {
      model.addAttribute("userView", userService.getUserView(paramMap));
      return "mypage_modify_contacts";
   }
   
   @RequestMapping(value="/user/view/withdraw", method = RequestMethod.POST)
   @ResponseBody
   public Object updateWithdraw(@RequestParam Map<String, Object> paramMap) {

      Map<String, Object> retVal = new HashMap<String, Object>();

      int result = userService.updateWithdraw(paramMap);

      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "회원 탈퇴 신청되었습니다.");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "이미 회원 탈퇴를 신청하셨습니다.");
      }
      return retVal;

   }
   
   //정보 수정
   @RequestMapping(value="user/email/update", method=RequestMethod.POST)
   @ResponseBody
   public Object updateEmail(@RequestParam Map<String, Object> paramMap) {
      Map<String, Object> retVal = new HashMap<String, Object>();
      int result=userService.updateEmail(paramMap);
      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "이메일 수정 OK");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "아쉽지만 이메일 수정은 실패ㅜㅜ");
      }
      return retVal;
   }
   
   @RequestMapping(value="user/phonenum/update", method=RequestMethod.POST)
   @ResponseBody
   public Object updatePhonenum(@RequestParam Map<String, Object> paramMap) {
      Map<String, Object> retVal = new HashMap<String, Object>();
      int result=userService.updatePhonenum(paramMap);
      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "전화번호 수정 OK");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "아쉽지만 전화번호 수정은 실패ㅜㅜ");
      }
      return retVal;
   }
   
   @RequestMapping(value="user/job/update", method=RequestMethod.POST)
   @ResponseBody
   public Object updateJob(@RequestParam Map<String, Object> paramMap) {
      Map<String, Object> retVal = new HashMap<String, Object>();
      int result=userService.updateJob(paramMap);
      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "직업 수정 OK");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "아쉽지만 직업 수정은 실패ㅜㅜ");
      }
      return retVal;
   }
   
   //이번에 follow하면서 만든 유저 상태메시지
   @RequestMapping(value="user/profile/update", method=RequestMethod.POST)
   @ResponseBody
   public Object updateProfile(@RequestParam Map<String, Object> paramMap) {
      Map<String, Object> retVal = new HashMap<String, Object>();
      int result=userService.updateProfile(paramMap);
      if(result>0){
         retVal.put("code", "OK");
         retVal.put("message", "프로필 메시지 수정 OK");
      }else{
         retVal.put("code", "FAIL");
         retVal.put("message", "아쉽지만 프로필 메시지 수정은 실패ㅜㅜ");
      }
      return retVal;
   }
}