package com.spring.myapp.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.myapp.service.DiyzService;

@Controller
public class AdminDiyzController {

	@Autowired
	DiyzService diyzService;
	
	@RequestMapping(value = "/admin/diyz")
	public String diyzImgList(@RequestParam Map<String, Object> paramMap, Model model) {
		int startPage = 0;
		int visiblePages = 0;
		
		if(paramMap.get("startPage")==null || paramMap.get("startPage").toString()=="") {
			startPage = 1;
		}else {
			startPage = Integer.parseInt(paramMap.get("startPage").toString());
		}
		
		if(paramMap.get("visiblePages")==null || paramMap.get("visiblePages").toString()=="") {
			visiblePages = 10;
		}else {
			visiblePages = Integer.parseInt(paramMap.get("visiblePages").toString());
		}

		int totalCnt = diyzService.getContentCnt(paramMap);

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
		model.addAttribute("diyzList", diyzService.getContentList(paramMap));
		 
		return "admin_diyz";
	}
	
	@RequestMapping(value = "/admin/diyz/edit")
	public String diyzImgInput(@RequestParam Map<String, Object> paramMap, Model model) {
		 
		model.addAttribute("diyzView", diyzService.getContentView(paramMap));
		
		return "admin_diyz_edit";
	}
	
	//AJAX 호출 (이미지 등록, 수정)
	@ResponseBody
	@RequestMapping(value="/admin/diyz/save", method=RequestMethod.POST)
	public Object diyzImgSave( MultipartHttpServletRequest multi) throws UnsupportedEncodingException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String check = multi.getParameter("check");
		check = new String(check.getBytes("8859_1"),"utf-8");
		
		String kinds = multi.getParameter("kinds");
		kinds = new String(kinds.getBytes("8859_1"),"utf-8");

		String root = multi.getSession().getServletContext().getRealPath("/");
		String uploadPath = root + "resources/diyzImg/";
		String fileUrl = "http://localhost:8888/";
		
		if(kinds.equals("pictogram")) {
			uploadPath += "pictogram/";
			fileUrl += "diyzPictogram/";
		}else if(kinds.equals("diagram")) {
			uploadPath += "diagram/";
			fileUrl += "diyzDiagram/";
		}else if(kinds.equals("picture")) {
			uploadPath += "picture/";
			fileUrl += "diyzPicture/";
		} else if(kinds.equals("background_img")) {
			uploadPath += "background_img/";
			fileUrl += "diyzBackground/";
		}
		
		String newFileName = "";
		
		File dir = new File(uploadPath);
		if(!dir.exists()) {
			try{
				dir.mkdirs();
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			} 
		}
		
		Iterator<String> files = multi.getFileNames();
		MultipartFile mpf = multi.getFile(files.next());
		
		List<MultipartFile> fileList = multi.getFiles("imgUp");
		if(check.equals("yes")) {
			for(MultipartFile filePart : fileList) {
				String fileName = filePart.getOriginalFilename();
				System.out.println("=====================================");
				System.out.println("실제 파일 이름 : " + fileName);
				newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+ 1);
				System.out.println("새로운 파일 이름 : " + newFileName);
				
				fileUrl += newFileName;
				paramMap.put("img_path", fileUrl);
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
		}else if(check.equals("no")){
			String imgSrc = multi.getParameter("imgSrc");
			imgSrc = new String(imgSrc.getBytes("8859_1"),"utf-8");
			System.out.println(imgSrc);
			paramMap.put("img_path", imgSrc);
		}
		
		String img_id = multi.getParameter("img_id");
		String color_data = multi.getParameter("color_data");
		String layout_data = multi.getParameter("layout_data");
		String theme_data = multi.getParameter("theme_data");
		
		img_id = new String(img_id.getBytes("8859_1"),"utf-8");
		color_data = new String(color_data.getBytes("8859_1"),"utf-8");
		layout_data = new String(layout_data.getBytes("8859_1"),"utf-8");
		theme_data = new String(theme_data.getBytes("8859_1"),"utf-8");
		
		System.out.println(img_id);
		
		paramMap.put("img_id", img_id);
		paramMap.put("kinds", kinds);
		paramMap.put("tag1", color_data);
		paramMap.put("tag2", layout_data);
		paramMap.put("tag3", theme_data);
		
		/*for(int j=0; j<tags.length; j++)
			paramMap.put("tag" + (j+1), tags[j]);*/
		
		for(String key : paramMap.keySet()){
			 
            String value = paramMap.get(key).toString();
 
            System.out.println(key+" : "+value);
 
        }
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int result = diyzService.regContent(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("message", "등록에 성공 하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}
			
		return retVal;
	}
	
	 @ResponseBody 
	 @RequestMapping(value="/admin/diyz/delete", method = RequestMethod.POST)
	 public Map selectThema(@RequestParam(value="drop[]") List<String> list, HttpServletResponse response) { 
		
		int dropTemplate = diyzService.dropImg(list);
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
