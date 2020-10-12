package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Template;
import com.spring.myapp.domain.TemplateReply;

public interface TemplateService {
	
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	//정렬
	List<Template> getContentList(Map<String, Object> paramMap);
	
	List<Template> getContentViewList(Map<String, Object> paramMap);
	
	List<Template> getContentLikeList(Map<String, Object> paramMap);
	
	
	List<Template> getTemplateList(Map<String, Object> paramMap);
	
	Template getContentView(Map<String, Object> paramMap);
	
	int regReply(Map<String, Object> paramMap);
	
	List<TemplateReply> getReplyList(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getTemplateCheck(Map<String, Object> paramMap);
	
	int delTemplate(Map<String, Object> paramMap);
	
	boolean checkReply(Map<String, Object> paramMap);
	
	boolean updateReply(Map<String, Object> paramMap);
	
	
	int getSearchContentCnt(Map<String, Object> paramMap);

	List<Template> getSearchContentList(Map<String, Object> paramMap);
	
	int getTagSearchContentCnt(Map<String, Object> paramMap);
	
	List<Template> getTagSearchContentList(Map<String, Object> paramMap);
	
	int dropTemplate(List<String> list);
	
	//조회수
	int updateTemplateView(Map<String, Object> paramMap);

	//Like 기능
	int checkTemplateLike(Map<String, Object> paramMap);
	
	int delTemplateLike(Map<String, Object> paramMap);
	
	int updateTemplateLikeCount(Map<String, Object> paramMap);
	
	int insertTemplateLike(Map<String,Object> paramMap);
	
	List<Template> getTemplateAdminList(Map<String,Object> paramMap);
	
	int dropAdminTemplate(List<String> list);
}
