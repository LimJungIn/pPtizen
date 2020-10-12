package com.spring.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.myapp.domain.Index;
import com.spring.myapp.service.IndexService;


@Controller
public class IndexController {
	
	@Autowired
	IndexService indexService;
	
	@RequestMapping(value = "/")
    public String moveIndex(@RequestParam Map<String, Object> paramMap, Model model) {
		SimpleDateFormat dateForm = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - cal.getFirstDayOfWeek();
		//해당 주의 시작
		cal.add(Calendar.DAY_OF_MONTH, - dayOfWeek);
		String startDay = dateForm.format(cal.getTime());
		//해당 주의 마지막
		cal.add(Calendar.DAY_OF_MONTH, 6);
		String endDay = dateForm.format(cal.getTime());
		
		//한달 전
		cal.add(Calendar.MONTH , -1);
		String beforeMonth = dateForm.format(cal.getTime());
		
		
		/*System.out.println("시작 : " + startDay);
		System.out.println("마지막 : " + endDay);
		System.out.println("한달 전 : " + beforeMonth);*/
		
		paramMap.put("startDay", startDay);
		paramMap.put("endDay", endDay);
		paramMap.put("beforeMonth", beforeMonth);
		
		model.addAttribute("indexBoardList", indexService.getBoardContentList(paramMap));
		model.addAttribute("indexTemplateList", indexService.getTemplateContentList(paramMap));
		model.addAttribute("indexLikeList", indexService.getTemplateLikeList(paramMap));
		model.addAttribute("indexViewList", indexService.getTemplateViewList(paramMap));
		List<Index> taglist = indexService.getTagList(paramMap);
		model.addAttribute("indexTagList", taglist);
		
		paramMap.put("hash1", (taglist.get(0)).getTags().toString());
		paramMap.put("hash2", (taglist.get(1)).getTags().toString());
		paramMap.put("hash3", (taglist.get(2)).getTags().toString());
		
		model.addAttribute("indexHash1List", indexService.getHash1TagList(paramMap));
		model.addAttribute("indexHash2List", indexService.getHash2TagList(paramMap));
		model.addAttribute("indexHash3List", indexService.getHash3TagList(paramMap));
		
        return "index";
    }
	
	@RequestMapping(value = "/like/list")
    public String test(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String user_id = (String)session.getAttribute("user_id");
		System.out.println(user_id);
		
		paramMap.put("user_id", user_id);
		
		model.addAttribute("userLikeList", indexService.getUserLikeList(paramMap));
		
        return "likeListTest";
    }
}