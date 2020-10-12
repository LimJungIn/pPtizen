package com.spring.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.myapp.service.TemplateService;

@Controller
public class TemplateController {
	
	@Autowired
	TemplateService templateService;
	
	//템플릿 리스트 조회
	@RequestMapping(value = "/template/list")
	public String templateList(@RequestParam Map<String, Object> paramMap, Model model) {
		
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
			visiblePages = 12;
		}else {
			visiblePages = Integer.parseInt(paramMap.get("visiblePages").toString());
		}

		int totalCnt = templateService.getContentCnt(paramMap);

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

		model.addAttribute("startPage", startPage+"");//현재 페이지      
		model.addAttribute("totalCnt", totalCnt);//전체 게시물수
		model.addAttribute("totalPage", totalPage);//페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("listCheck", listCheck);
		
		if(paramMap.get("sortList")==null || paramMap.get("sortList").toString().equals("") || paramMap.get("sortList").toString().equals("latestList")) {
			model.addAttribute("templateList", templateService.getContentList(paramMap));//검색
		}else if(paramMap.get("sortList").toString().equals("viewList")) {
			model.addAttribute("templateList", templateService.getContentViewList(paramMap));
		}else if(paramMap.get("sortList").toString().equals("likeList")) {
			model.addAttribute("templateList", templateService.getContentLikeList(paramMap));
		}
		
		return "templateList";
	}
	
	//템플릿 검색
	@RequestMapping(value = "/template/search")
	public String templateSearch(@RequestParam Map<String, Object> paramMap, Model model) {

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
			visiblePages = 12;
		}else {
			System.out.println("visiblePages:"+paramMap.get("visiblePages").toString());
			visiblePages = Integer.parseInt(paramMap.get("visiblePages").toString());
		}
	
		int totalCnt = templateService.getSearchContentCnt(paramMap);
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
		model.addAttribute("templateList", templateService.getSearchContentList(paramMap));
		
		/*
		 * for ( String key : paramMap.keySet() ) { System.out.println("템플릿 검색 key : " +
		 * key +" / value : " + paramMap.get(key)); }
		 */
		
		return "templateList";
	}
	
	//템플릿 태그 검색
	@RequestMapping(value = "/template/tagsearch")
	public String templateTagSearch(@RequestParam Map<String, Object> paramMap, Model model) {

		int startPage = (paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
		int visiblePages = (paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):9);
		int totalCnt = templateService.getTagSearchContentCnt(paramMap);
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
		model.addAttribute("templateList", templateService.getTagSearchContentList(paramMap));

		return "templateList";
	}
	
	//템플릿 글 상세 보기
	@RequestMapping(value = "/template/view")
	public String templateView(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		String user_id = (String)session.getAttribute("user_id");
		
		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("like_templateId", paramMap.get("id"));
		checkMap.put("like_sendUserId", user_id);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			 for (int i = 0; i < cookies.length; i++) {
				 if (cookies[i].getName().equals("cookie_template_" + paramMap.get("id").toString()) && cookies[i].getValue().equals(user_id)) { 
					 viewCookie = cookies[i];
				 }
			 }
		}
		
		if(viewCookie == null){
			Cookie c1 = new Cookie("cookie_template_" + paramMap.get("id").toString(), user_id);
			c1.setMaxAge(1*24*60*60);
			response.addCookie(c1);
			
			templateService.updateTemplateView(paramMap);
		}
		
		int check = templateService.checkTemplateLike(checkMap);
		if(check > 0) {
			model.addAttribute("likeCheck", "/img/default/like_icon.png");
		}else {
			model.addAttribute("likeCheck", "/img/default/unlike_icon.png");
		}
		
		model.addAttribute("replyList", templateService.getReplyList(paramMap));
		model.addAttribute("templateView", templateService.getContentView(paramMap));

		return "templateView";

	}
	
	//템플릿 등록 및 수정
	@RequestMapping(value = "/template/edit")
	public String editTemplate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, Model model) {
		
		String Referer = request.getHeader("referer");
		
		//URL로 직접 접근 불가
		if(Referer!=null) {
			if(paramMap.get("id") != null) {  //템플릿 수정
				if(Referer.indexOf("/template/view")>-1) {
					
					model.addAttribute("templateView", templateService.getContentView(paramMap));
					return "template_editor";
				} else {
					return "redirect:/template/list";
				}
			} else {  //템플릿 등록
				if(Referer.indexOf("/template/list")>-1 || Referer.indexOf("/diyz")>-1) {
					return "template_editor";
				} else {
					return "redirect:/template/list";
				}
			} 
		} else {
			return "redirect:/template/list";
		}
	}
	
	//AJAX 호출 (템플릿 등록, 수정)
	@RequestMapping(value="/template/save", method=RequestMethod.POST)
	@ResponseBody
	public Object templateSave(MultipartHttpServletRequest multi) throws UnsupportedEncodingException {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();

		String root = multi.getSession().getServletContext().getRealPath("/");
		String uploadPath =root + "resources/template-upload/";
		
		String newFileName = "";
		
		File dir = new File(uploadPath);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		Iterator<String> files = multi.getFileNames();
		MultipartFile mpf = multi.getFile(files.next());
		
		int i=1;
		List<MultipartFile> fileList = multi.getFiles("fileUP");
		for(MultipartFile filePart : fileList) {
			String fileName = filePart.getOriginalFilename();
			System.out.println("=====================================");
			System.out.println("실제 파일 이름 : " + fileName);
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+ 1);
			System.out.println("새로운 파일 이름 : " + newFileName);
			
			String fileUrl = "http://localhost:8888/templateUpload/" + newFileName;
			paramMap.put("file" + i, fileUrl);
			i++;
			if(!newFileName.equals("")) {
				try {
					FileOutputStream fs = new FileOutputStream(uploadPath + newFileName);
					fs.write(filePart.getBytes());
					fs.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		String board_id = multi.getParameter("board_id");
		String writer = multi.getParameter("writer");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String tagstr = multi.getParameter("tagsinput");
		
		board_id = new String(board_id.getBytes("8859_1"),"utf-8");
		writer = new String(writer.getBytes("8859_1"),"utf-8");
		subject = new String(subject.getBytes("8859_1"),"utf-8");
		content = new String(content.getBytes("8859_1"),"utf-8");
		tagstr = new String(tagstr.getBytes("8859_1"),"utf-8");
		
		String [] tags = tagstr.split(",");
		
		paramMap.put("board_id", board_id);
		paramMap.put("writer", writer);
		paramMap.put("subject", subject);
		paramMap.put("content", content);
		
		for(int j=0; j<tags.length; j++)
			paramMap.put("tag" + (j+1), tags[j]);
		
		for(String key : paramMap.keySet()){
			 
            String value = paramMap.get(key).toString();
 
            System.out.println(key+" : "+value);
 
        }
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		//String url = fileUploadService.restore(file);
		//model.addAttribute("url", url);
		//paramMap.put("file1", url);
		//정보입력
		
		
		int result = templateService.regContent(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("message", "등록에 성공 하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}
			
		return retVal;
	}
	
	//AJAX 호출 (템플릿 삭제)
	@RequestMapping(value="/template/del", method=RequestMethod.POST)
	@ResponseBody
	public Object templateDel(@RequestParam Map<String, Object> paramMap) {

		
		Map<String, Object> retVal = new HashMap<String, Object>();

		//정보입력
		int result = templateService.delTemplate(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "패스워드를 확인해주세요.");
		}

		return retVal;

	}
	
	//AJAX 호출 (게시글 패스워드 확인)
	@RequestMapping(value="/template/check", method=RequestMethod.POST)
	@ResponseBody
	public Object templateCheck(@RequestParam Map<String, Object> paramMap) {

		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();


		//정보입력
		int result = templateService.getTemplateCheck(paramMap);

		if(result>0){
				retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "패스워드를 확인해주세요.");
		}

		return retVal;

	}
	
	//AJAX 호출 (댓글 등록)
	@RequestMapping(value="/template/reply/save", method=RequestMethod.POST)
	@ResponseBody
	public Object templateReplySave(@RequestParam Map<String, Object> paramMap) {

		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		//정보입력
		int result = templateService.regReply(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("parent_id", paramMap.get("parent_id"));
			retVal.put("message", "등록에 성공 하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}

		return retVal;

	}
		
	//AJAX 호출 (댓글 삭제)
	@RequestMapping(value="/template/reply/del", method=RequestMethod.POST)
	@ResponseBody
	public Object templateReplyDel(@RequestParam Map<String, Object> paramMap) {

		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		//정보입력
		int result = templateService.delReply(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
			//retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
		}

		return retVal;
	}
	
	//AJAX 호출 (댓글 패스워드 확인)
	@RequestMapping(value="/template/reply/check", method=RequestMethod.POST)
	@ResponseBody
	public Object templateReplyCheck(@RequestParam Map<String, Object> paramMap) {

		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
	
		//패스워드 암호화
		//ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		//String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		//paramMap.put("reply_password", password);
	
		//정보입력
		boolean check = templateService.checkReply(paramMap);
	
		if(check){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
		}else{
			retVal.put("code", "FAIL");
			//retVal.put("message", "패스워드를 확인해 주세요.");
		}
	
		return retVal;
	
	}
		
	//AJAX 호출 (댓글 수정)
	@RequestMapping(value="/template/reply/update", method=RequestMethod.POST)
	@ResponseBody
	public Object templateReplyUpdate(@RequestParam Map<String, Object> paramMap) {

		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		System.out.println(paramMap);

		//정보입력
		boolean check = templateService.updateReply(paramMap);

		if(check){
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "수정에 성공 하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "수정에 실패 하였습니다.");
		}

		return retVal;
	}
	
	//Like 기능
	@RequestMapping(value="/template/like", method=RequestMethod.POST)
	@ResponseBody
	public Object TemplateLike(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> retVal = new HashMap<String, Object>();

		int check = templateService.checkTemplateLike(paramMap);
		int state = 0;
			
		if(check>0) {
			state = templateService.delTemplateLike(paramMap);
			retVal.put("message", "언라이크");
			retVal.put("state", "unlike");
		}else {
			state = templateService.insertTemplateLike(paramMap);
			retVal.put("message", "라이크");
			retVal.put("state", "like");
		}
		if(state>0){
			retVal.put("code", "OK");
			templateService.updateTemplateLikeCount(paramMap);
			retVal.put("likeCnt", templateService.getContentView(paramMap).getLike_count());
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "실패");
		}

		return retVal;
	}
}
