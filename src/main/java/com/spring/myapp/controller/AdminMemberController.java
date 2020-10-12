package com.spring.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.domain.User;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.service.UserService;

@Controller
public class AdminMemberController {

	@Autowired
	UserService userService;


	@RequestMapping(value = "/admin/member")
	public String userList(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("userList", userService.getUserList(paramMap));

		return "admin_member";
	}
	
	 @ResponseBody 
	 @RequestMapping(value="/admin/member/delete", method = RequestMethod.POST)
	 public Map selectDrop(@RequestParam(value="drop[]") List<String> list, HttpServletResponse response) { 
		
		int dropUser = userService.dropUser(list);
		 /*
		 * StringBuilder sb = new StringBuilder();
		 * 
		 * for(String s : list) { sb.append(s); } System.out.println(sb.toString());
		 * System.out.println(list);
		 */
	 Map check = new HashMap();
	 
	 check.put("idx",list);
	  
	 return check;
	 
	 }	

}
