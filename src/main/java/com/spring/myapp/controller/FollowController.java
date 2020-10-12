package com.spring.myapp.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.domain.Follow;
import com.spring.myapp.service.FollowService;

@Controller
public class FollowController {
	@Autowired
	FollowService followService;

	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);

	@RequestMapping(value = "/user/follow")
	public String userList(@RequestParam Map<String, Object> paramMap, Model model) {
		System.out.println(paramMap);

		List<Follow> followlist = followService.getFollowView(paramMap);

		System.out.println("followList :" + followlist);
		model.addAttribute("followList", followlist);

		// model.addAttribute("boardList", boardService.getContentList(paramMap));
		for (Follow follow : followlist) {
			System.out.println("follow_id:" + follow.getFollow_id());
		}
		return "mypage_follow";
	}

	@RequestMapping(value = "/user/follow/board")
	@ResponseBody
	public List<String> FollowBoardList(@RequestParam Map<String, Object> paramMap) {
		System.out.println(paramMap);
		List<String> followBoardList = followService.getFollowBoard(paramMap);

		System.out.println("boardList : " + followBoardList);

		return followBoardList;
	}
}
