package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.service.BoardService;

@Controller
public class AdminBoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/admin/board")
	public String boardList(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("boardList",boardService.getBoardList(paramMap));
		 
		return "admin_board";
	}
	
	 @ResponseBody 
	 @RequestMapping(value="/admin/board/delete", method = RequestMethod.POST)
	 public Map selectThema(@RequestParam(value="drop[]") List<String> list, HttpServletResponse response) { 
		
		int dropTemplate = boardService.dropBoard(list);
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
