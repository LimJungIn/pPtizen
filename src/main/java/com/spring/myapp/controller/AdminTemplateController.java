package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.service.TemplateService;
import com.spring.myapp.service.UserService;

@Controller
public class AdminTemplateController {
	

	@Autowired
	TemplateService templateService;

	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(UserController.class);
	 * 
	 * 
	 * @RequestMapping(value = "/admin/template", method = RequestMethod.GET) public
	 * String home(Locale locale) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * return "admin_template"; }
	 */
	
	@RequestMapping(value = "/admin/template")
	public String templateAdminList(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("templateAdminList", templateService.getTemplateAdminList(paramMap));

		return "admin_template";
	}
	
	 @ResponseBody 
	 @RequestMapping(value="/admin/template/delete", method = RequestMethod.POST)
	 public Map selectDrop(@RequestParam(value="drop[]") List<String> list, HttpServletResponse response) { 
		
		int dropAdminTemplate = templateService.dropAdminTemplate(list);
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
