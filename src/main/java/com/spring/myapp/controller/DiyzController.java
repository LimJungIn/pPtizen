package com.spring.myapp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.domain.Diyz;
import com.spring.myapp.service.DiyzService;

@Controller
public class DiyzController {
	
	Diyz diyz = new Diyz();
	
	Map<String, Object> selectMap = new HashMap<String, Object>();
	
	@Autowired
	DiyzService diyzService;
	
	@RequestMapping(value = "/diyz/select/color")
	public String moveColor(Model model) {
		
		return "diyz_select_color";
	}

	@RequestMapping(value = "/diyz/select/layout")
	public String moveLayout(HttpServletRequest request, Model model) {
		
		String Referer = request.getHeader("referer");
		
		System.out.println(diyz.getColor());
		
		if(Referer!=null){
			if(Referer.indexOf("/diyz/select/color")>-1){
				return "diyz_select_layout";
			}else{
				return Referer;
			}
		}else{
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/diyz/select/theme")
	public String moveTheme(HttpServletRequest request, Model model) {
		
		String Referer = request.getHeader("referer");
		
		System.out.println("==========================");
		System.out.println(diyz.getColor());
		System.out.println(diyz.getLayout());
		
		if(Referer!=null){
			if(Referer.indexOf("/diyz/select/layout")>-1){
				return "diyz_select_theme";
			}else{
				return Referer;
			}
		}else{
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/diyz")
	public String moveDiyz(HttpServletRequest request, Model model) {
		
		String Referer = request.getHeader("referer");
		
		System.out.println("==========================");
		System.out.println(diyz.getColor());
		System.out.println(diyz.getLayout());
		System.out.println(diyz.getTheme());
		
		if(Referer!=null){
			if(Referer.indexOf("/diyz/select/theme")>-1){
				List<String> colors = new ArrayList<String>();
				List<String> layouts = new ArrayList<String>();
				List<String> themes = new ArrayList<String>();
				colors = diyz.getColor();
				layouts = diyz.getLayout();
				themes = diyz.getTheme();
				selectMap.put("colors", colors);
				selectMap.put("layouts", layouts);
				selectMap.put("themes", themes);

				return "diyz";
			}else{
				return Referer;
			}
		}else{
			return "redirect:/";
		}
	}
	
	/* 너무 비효율적. 방법 찾아보기 */
	@RequestMapping(value = "/diyz-navASideTap1")
	public String changeTab(Locale locale, Model model) {
		
		return "diyz-navASideTap1";
	}
	
	@RequestMapping(value = "/diyz-navASideTap2")
	public String changeTab2(Locale locale, Model model) {

		model.addAttribute("diyzSelectList", diyzService.getSelectDataList(selectMap));
		
		return "diyz-navASideTap2";
	}
	
	@RequestMapping(value = "/diyz-navASideTap3")
	public String changeTab3(Locale locale, Model model) {

		return "diyz-navASideTap3";
	}
	
	@RequestMapping(value = "/diyz-navASideTap4")
	public String changeTab4(Locale locale, Model model) {

		return "diyz-navASideTap4";
	}
	
	/* 진심 비효율적이다.. 방법을 빨리 강구하자 */
	@RequestMapping(value = "/diyz-diagram_picture")
	public String changeCategory(Locale locale, Model model) {
		
		model.addAttribute("diyzSelectList", diyzService.getSelectDataList(selectMap));
		
		return "diyz-diagram_picture";
	}
	@RequestMapping(value = "/diyz-diagram_diagram")
	public String changeCategory2(Locale locale, Model model) {

		model.addAttribute("diyzSelectList", diyzService.getSelectDataList(selectMap));
		
		return "diyz-diagram_diagram";
	}
	@RequestMapping(value = "/diyz-diagram_pictogram")
	public String changeCategory3(Locale locale, Model model) {

		model.addAttribute("diyzSelectList", diyzService.getSelectDataList(selectMap));
		
		return "diyz-diagram_pictogram";
	}
	
	/*AJAX - 색상 선택 */
	@ResponseBody
	@RequestMapping(value="/selectColor", method = RequestMethod.POST)
	public void selectColor(@RequestParam(value="colors[]") List<String> list, HttpServletResponse response) {
		
		diyz.setColor(list);
	}
	
	/*AJAX - 레이아웃 선택 */
	@ResponseBody
	@RequestMapping(value="/selectLayout", method = RequestMethod.POST)
	public void selectLayout(@RequestParam(value="layouts[]") List<String> list, HttpServletResponse response) {

		diyz.setLayout(list);
	}
	
	/*AJAX - 테마 선택 */
	@ResponseBody
	@RequestMapping(value="/selectTheme", method = RequestMethod.POST)
	public void selectTheme(@RequestParam(value="themes[]") List<String> list, HttpServletResponse response) {

		diyz.setTheme(list);
	}
}
