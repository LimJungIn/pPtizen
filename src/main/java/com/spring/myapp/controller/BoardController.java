package com.spring.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myapp.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board/list")
	public String boardList(@RequestParam Map<String, Object> paramMap, Model model) {
		
		int startPage = 0;
		int visiblePages = 0;
		String listCheck = "";
		
		if(paramMap.get("sortList")==null) {
			listCheck = "latestList";
		}else {
			listCheck = paramMap.get("sortList").toString();
		}

		if(paramMap.get("startPage")==null || paramMap.get("startPage").toString()=="") {
			startPage = 1;
		}else {
			startPage = Integer.parseInt(paramMap.get("startPage").toString());
		}
		
		if(paramMap.get("visiblePages")==null || paramMap.get("visiblePages").toString()=="") {
			visiblePages = 9;
		}else {
			visiblePages = Integer.parseInt(paramMap.get("visiblePages").toString());
		}
		int totalCnt = boardService.getContentCnt(paramMap);

		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		if(startPage==1){
			startLimitPage = 0;
		}else{
			startLimitPage = (startPage-1)*visiblePages;
		}

		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);

		model.addAttribute("startPage", startPage+"");    
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listCheck", listCheck);
		
		if(paramMap.get("sortList")==null || paramMap.get("sortList").toString().equals("") || paramMap.get("sortList").toString().equals("latestList")) {
			model.addAttribute("boardList", boardService.getContentList(paramMap));
		}else if(paramMap.get("sortList").toString().equals("viewList")) {
			model.addAttribute("boardList", boardService.getContentViewList(paramMap));
		}else if(paramMap.get("sortList").toString().equals("likeList")) {
			model.addAttribute("boardList", boardService.getContentLikeList(paramMap));
		}
		
		return "boardList";
	}
	
	@RequestMapping(value = "/board/search")
	public String boardSearch(@RequestParam Map<String, Object> paramMap, Model model) {

		int startPage = 0;
		int visiblePages = 0;

		if(paramMap.get("startPage")==null || paramMap.get("startPage").toString()=="") {
			startPage = 1;
			System.out.println("startPage null");
		}else {
			System.out.println("startPage:"+paramMap.get("startPage").toString());
			startPage = Integer.parseInt(paramMap.get("startPage").toString());
		}

		if(paramMap.get("visiblePages")==null || paramMap.get("visiblePages").toString()=="") {
			visiblePages = 9;
		}else {
			System.out.println("visiblePages:"+paramMap.get("visiblePages").toString());
			visiblePages = Integer.parseInt(paramMap.get("visiblePages").toString());
		}
	
		int totalCnt = boardService.getSearchContentCnt(paramMap);
		System.out.println(totalCnt);
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		if(startPage==1){
			startLimitPage = 0;
		}else{
			startLimitPage = (startPage-1)*visiblePages;
		}

		paramMap.put("start", startLimitPage);
		paramMap.put("end", visiblePages);

		model.addAttribute("startPage", startPage+"");    
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("boardList", boardService.getSearchContentList(paramMap));
		
		for ( String key : paramMap.keySet() ) {
			    System.out.println("방법2) key : " + key +" / value : " + paramMap.get(key));
		}
		return "boardList";
	}
	
	@RequestMapping(value = "/board/tagsearch")
	public String boardTagSearch(@RequestParam Map<String, Object> paramMap, Model model) {

		int startPage = (paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
		int visiblePages = (paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):9);
		int totalCnt = boardService.getTagSearchContentCnt(paramMap);
		System.out.println(totalCnt);
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);

		int startLimitPage = 0;
		if(startPage==1){
			startLimitPage = 0;
		}else{
			startLimitPage = (startPage-1)*visiblePages;
		}

		paramMap.put("start", startLimitPage);

		paramMap.put("end", visiblePages);

		model.addAttribute("startPage", startPage+"");    
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("boardList", boardService.getTagSearchContentList(paramMap));

		return "boardList";
	}
	
	//�Խñ� �� ����
	@RequestMapping(value = "/board/view")
	public String boardView(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String user_id = (String)session.getAttribute("user_id");
		
		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("like_boardId", paramMap.get("id"));
		checkMap.put("like_sendUserId", user_id);
		
		Cookie[] cookies=request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			 for (int i = 0; i < cookies.length; i++) {
				 if (cookies[i].getName().equals("cookie_board_" + paramMap.get("id").toString()) && cookies[i].getValue().equals(user_id)) { 
					 viewCookie = cookies[i];
				 }
			 }
		}
		
		if(viewCookie == null){
			Cookie c1 = new Cookie("cookie_board_" + paramMap.get("id").toString(), user_id);
			c1.setMaxAge(1*24*60*60);
			response.addCookie(c1);
			
			boardService.updateBoardView(paramMap);
		}
		
		int check = boardService.checkBoardLike(checkMap);
		if(check > 0) {
			model.addAttribute("likeCheck", "/img/default/like_icon.png");
		}else {
			model.addAttribute("likeCheck", "/img/default/unlike_icon.png");
		}
		
		model.addAttribute("replyList", boardService.getReplyList(paramMap));
		model.addAttribute("boardView", boardService.getContentView(paramMap));

		return "layer_popup";

	}
	
	@RequestMapping(value = "/board/edit")
	public String boardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, Model model) {

		String Referer = request.getHeader("referer");

		if(Referer!=null){
			if(paramMap.get("id") != null){
				if(Referer.indexOf("/board/view")>-1){

					model.addAttribute("boardView", boardService.getContentView(paramMap));
					return "community_editor";
				}else{
					return "redirect:/board/list";
				}
			}else{
				if(Referer.indexOf("/board/list")>-1){
					return "community_editor";
				}else{
					return "redirect:/board/list";
				}
			}
		}else{
			return "redirect:/board/list";
		}

	}

	@RequestMapping(value="/board/save", method=RequestMethod.POST)
	@ResponseBody
	public Object boardSave(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.regContent(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("message", "게시글을 등록하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "게시글 등록에 실패하였습니다.");
		}
		
		return retVal;

	}

	//AJAX ȣ�� (�Խñ� ����)
	@RequestMapping(value="/board/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardDel(@RequestParam Map<String, Object> paramMap) {

		//���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		//�����Է�
		int result = boardService.delBoard(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}

	@RequestMapping(value="/board/check", method=RequestMethod.POST)
	@ResponseBody
	public Object boardCheck(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.getBoardCheck(paramMap);
		HttpSession session = request.getSession(true);
		String visitedStr = (String)session.getAttribute("visited");
		if(result>0){
			retVal.put("code", "OK");
		}else if(visitedStr.equals(paramMap.get("writer"))) {
			retVal.put("code", "SUCCESS");
		}
		else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/save", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.regReply(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("parent_id", paramMap.get("parent_id"));
		}else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.delReply(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/check", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyCheck(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		boolean check = boardService.checkReply(paramMap);

		if(check){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
		}else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/update", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyUpdate(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		System.out.println(paramMap);

		boolean check = boardService.updateReply(paramMap);

		if(check){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
		}else{
			retVal.put("code", "FAIL");
		}

		return retVal;

	}
	
	//Like 기능
	@RequestMapping(value="/board/like", method=RequestMethod.POST)
	@ResponseBody
	public Object Like(@RequestParam Map<String, Object> paramMap) {

	
		Map<String, Object> retVal = new HashMap<String, Object>();

		int check = boardService.checkBoardLike(paramMap);
		int state = 0;
		
		if(check>0) {
			state = boardService.delBoardLike(paramMap);
			retVal.put("message", "언라이크");
			retVal.put("state", "unlike");
		}else {
			state = boardService.insertLike(paramMap);
			retVal.put("message", "라이크");
			retVal.put("state", "like");
		}

		if(state>0){
			retVal.put("code", "OK");
			boardService.updateBoardLikeCount(paramMap);
			retVal.put("likeCnt", boardService.getContentView(paramMap).getLike_count());
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "실패");
		}

		return retVal;
	}
	
	//팔로우 구현 부분 시작
	@RequestMapping(value = "/board/follow/check", method = RequestMethod.POST)
	@ResponseBody
	public Object boardFollowCheck(@RequestParam Map<String, Object> paramMap, Model model) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int check = boardService.checkFollow(paramMap);

		System.out.println("paramMap : " + paramMap);

		if (check == 0) {
			retVal.put("code", "NULL");
		} else {
			retVal.put("code", "NOT NULL");
		}
		return retVal;
	}

	@RequestMapping(value = "/board/follow/message", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String boardFollowMessage(@RequestParam Map<String, Object> paramMap) {

		System.out.println(paramMap);
		String followMessage = boardService.getFollowMessage(paramMap);
		System.out.println("followMessage :" + followMessage);
		return followMessage;
	}

	@RequestMapping(value = "/board/follow/count", method = RequestMethod.POST)
	@ResponseBody
	public int boardFollowCount(@RequestParam Map<String, Object> paramMap) {

		int followCount = boardService.getfollowCount(paramMap);
		System.out.println("followCount :" + followCount);
		return followCount;
	}

	@RequestMapping(value = "/board/follow", method = RequestMethod.POST)
	@ResponseBody
	public Object boardFollow(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int check = boardService.follow(paramMap);

		if (check == 1) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
		}

		return retVal;
	}

	@RequestMapping(value = "/board/unfollow", method = RequestMethod.POST)
	@ResponseBody
	public Object boardUnfollow(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int check = boardService.unfollow(paramMap);

		if (check == 1) {
			retVal.put("code", "OK");
		} else {
			retVal.put("code", "FAIL");
		}
		return retVal;
	}

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "community";
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String menu(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "menu";
	}
}
