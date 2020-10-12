package com.spring.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CkeditorFileUploadController {
	@RequestMapping(value = "/community/imageUpload", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		OutputStream out = null; 
        PrintWriter printWriter = null; 
        response.setCharacterEncoding("utf-8"); 
        response.setContentType("text/html;charset=utf-8"); 
  
        try{ 
  
            String fileName = upload.getOriginalFilename(); 
            byte[] bytes = upload.getBytes(); 
            
            //실제 업로드 될 톰캣서버의 물리적 경로
			HttpSession session = request.getSession();
			String root_path = session.getServletContext().getRealPath("/");
            
            //저장 경로
			String uploadPath =root_path + "WEB-INF\\resources\\community-upload\\"+fileName;
            //String uploadPath =root_path + "resources\\cheditoruploads\\"+fileName;
            System.out.println("uploadPath:"+uploadPath); 
     
             
            out = new FileOutputStream(new File(uploadPath)); 
            out.write(bytes); 
            String callback = request.getParameter("CKEditorFuncNum"); 
            System.out.println("callback:"+callback);
             
            printWriter = response.getWriter(); 
           
            //URL 경로
            String fileUrl = "http://localhost:8888/community-upload/" + fileName;
            System.out.println("fileUrl :" + fileUrl); 
  
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" 
                    + callback 
                    + ",'" 
                    + fileUrl 
                    + "','이미지를 업로드 하였습니다.'" 
                    + ")</script>"); 
            printWriter.flush(); 
  
        }catch(IOException e){ 
            e.printStackTrace(); 
        } finally { 
            try { 
                if (out != null) { 
                    out.close(); 
                } 
                if (printWriter != null) { 
                    printWriter.close(); 
                } 
            } catch (IOException e) { 
                e.printStackTrace(); 
            } 
        } 
  
        return; 
    }
}