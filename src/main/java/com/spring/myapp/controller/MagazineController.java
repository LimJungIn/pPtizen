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

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.myapp.service.MagazineService;

@Controller
public class MagazineController {
	@Autowired
	MagazineService magazineService;
	
	@RequestMapping(value = "/magazine/list")
	public String magazineList(@RequestParam Map<String, Object> paramMap, Model model) {

		int startPage = (paramMap.get("startPage")!=null?Integer.parseInt(paramMap.get("startPage").toString()):1);
		int visiblePages = (paramMap.get("visiblePages")!=null?Integer.parseInt(paramMap.get("visiblePages").toString()):9);
		int totalCnt = magazineService.getContentCnt(paramMap);


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
		model.addAttribute("magazineList", magazineService.getContentList(paramMap));

		return "magazineList";

	}

	//�Խñ� �� ����
	@RequestMapping(value = "/magazine/view")
	public String magazineView(@RequestParam Map<String, Object> paramMap, Model model) {

		model.addAttribute("magazineView", magazineService.getContentView(paramMap));

		return "magazineView";

	}

	@RequestMapping(value = "/magazine/edit")
	public String magazineEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, Model model) {

		//Referer �˻�
		String Referer = request.getHeader("referer");

		if(Referer!=null){
			if(paramMap.get("id") != null){ 
				if(Referer.indexOf("/magazine/view")>-1){

					model.addAttribute("magazineView", magazineService.getContentView(paramMap));
					return "magazineEdit";
				}else{
					return "redirect:/magazine/list";
				}
			}else{ //�Խñ� ���
				if(Referer.indexOf("/magazine/list")>-1){
					return "magazineEdit";
				}else{
					return "redirect:/magazine/list";
				}
			}
		}else{
			return "redirect:/magazine/list";
		}

	}
	@ResponseBody
	@RequestMapping(value="/magazine/save",method=RequestMethod.POST)
	public Object magazineSave(MultipartHttpServletRequest multi) throws UnsupportedEncodingException{
		Map<String, Object> paramMap=new HashMap<String, Object>();
		
		String check=multi.getParameter("check");
		check = new String(check.getBytes("8859_1"),"utf-8");
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		String uploadPath = root + "resources/magazineImg/";
		String fileUrl = "http://localhost:8888/";
		
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
				paramMap.put("main_img_path", fileUrl);
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
			paramMap.put("main_img_path", imgSrc);
		}
		
		String id=multi.getParameter("id");
		String subject=multi.getParameter("subject");
		String subtitle=multi.getParameter("subtitle");
		String content=multi.getParameter("content");
		
		id=new String(id.getBytes("8859_1"),"utf-8");
		subject=new String(subject.getBytes("8859_1"),"utf-8");
		subtitle=new String(subtitle.getBytes("8859_1"),"utf-8");
		content=new String(content.getBytes("8859_1"),"utf-8");
		
		System.out.println(id);
		
		paramMap.put("id",id);
		paramMap.put("subject",subject);
		paramMap.put("subtitle",subtitle);
		paramMap.put("content",content);
		
		for(String key : paramMap.keySet()) {
			String value=paramMap.get(key).toString();
			System.out.println(key+" : "+value);
		}
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int result = magazineService.regContent(paramMap);

		if(result>0){
			retVal.put("code", "OK");
			retVal.put("message", "등록에 성공 하였습니다.");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}
			
		return retVal;
	}
	
	@RequestMapping(value="/magazine/del", method=RequestMethod.POST)
	@ResponseBody
	public Object magazineDel(@RequestParam Map<String, Object> paramMap) {

		//���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();

		//�����Է�
		int result = magazineService.delMagazine(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "실패");
		}

		return retVal;

	}

	@RequestMapping(value="/magazine/check", method=RequestMethod.POST)
	@ResponseBody
	public Object magazineCheck(@RequestParam Map<String, Object> paramMap) {

		//���ϰ�
		Map<String, Object> retVal = new HashMap<String, Object>();


		//�����Է�
		int result = magazineService.getMagazineCheck(paramMap);

		if(result>0){
			retVal.put("code", "OK");
		}else{
			retVal.put("code", "FAIL");
			retVal.put("message", "�н����带 Ȯ�����ּ���.");
		}

		return retVal;

	}

	private static final Logger logger = LoggerFactory.getLogger(MagazineController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/magazine", method = RequestMethod.GET)
    public String home(Locale locale) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        return "magazine";
    }
}
