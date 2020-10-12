package com.spring.myapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.TemplateDao;
import com.spring.myapp.domain.Template;
import com.spring.myapp.domain.TemplateReply;
import com.spring.myapp.service.TemplateService;

@Service("templateService")
public class TemplateServiceImpl implements TemplateService {

	@Resource(name="templateDao")
	private TemplateDao templateDao;

	@Override
	public int regContent(Map<String, Object> paramMap) {
		//아이디가 없으면 입력
		if(paramMap.get("board_id").toString().equals("")) {
			return templateDao.regContent(paramMap);
		}else {//아이디가 있으면 수정
			return templateDao.modifyContent(paramMap);
		}
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return templateDao.getContentCnt(paramMap);
	}

	//정렬
	@Override
	public List<Template> getContentList(Map<String, Object> paramMap) {
		return templateDao.getContentList(paramMap);
	}
	
	@Override
	public List<Template> getContentViewList(Map<String, Object> paramMap) {
		return templateDao.getContentViewList(paramMap);
	}

	@Override
	public List<Template> getContentLikeList(Map<String, Object> paramMap) {
		return templateDao.getContentLikeList(paramMap);
	}
	

	@Override
	public Template getContentView(Map<String, Object> paramMap) {
		return templateDao.getContentView(paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return templateDao.regReply(paramMap);
	}

	@Override
	public List<TemplateReply> getReplyList(Map<String, Object> paramMap) {

		List<TemplateReply> templateReplyList = templateDao.getReplyList(paramMap);

		//msyql 에서 계층적 쿼리가 어려우니 여기서 그냥 해결하자

		//부모
		List<TemplateReply> templateReplyListParent = new ArrayList<TemplateReply>();
		//자식
		List<TemplateReply> templateReplyListChild = new ArrayList<TemplateReply>();
		//통합
		List<TemplateReply> newTemplateReplyList = new ArrayList<TemplateReply>();

		//1.부모와 자식 분리
		for(TemplateReply templateReply: templateReplyList){
			if(templateReply.getDepth().equals("0")){
				templateReplyListParent.add(templateReply);
			}else{
				templateReplyListChild.add(templateReply);
			}
		}

		//2.부모를 돌린다.
		for(TemplateReply templateReplyParent: templateReplyListParent){
			//2-1. 부모는 무조건 넣는다.
			newTemplateReplyList.add(templateReplyParent);
			//3.자식을 돌린다.
			for(TemplateReply templateReplyChild: templateReplyListChild){
				//3-1. 부모의 자식인 것들만 넣는다.
				if(templateReplyParent.getReply_id().equals(templateReplyChild.getParent_id())){
					newTemplateReplyList.add(templateReplyChild);
				}

			}

		}

		//정리한 list return
		return newTemplateReplyList;
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return templateDao.delReply(paramMap);
	}

	@Override
	public int getTemplateCheck(Map<String, Object> paramMap) {
		return templateDao.getTemplateCheck(paramMap);
	}

	@Override
	public int delTemplate(Map<String, Object> paramMap) {
		return templateDao.delTemplate(paramMap);
	}

	@Override
	public boolean checkReply(Map<String, Object> paramMap) {
		return templateDao.checkReply(paramMap);
	}

	@Override
	public boolean updateReply(Map<String, Object> paramMap) {
		return templateDao.updateReply(paramMap);
	}
	
	@Override
	public int getSearchContentCnt(Map<String, Object> paramMap) {
		return templateDao.getSearchContentCnt(paramMap);
	}

	@Override
	public List<Template> getSearchContentList(Map<String, Object> paramMap) {
		return templateDao.getSearchContentList(paramMap);
	}
	
	@Override
	public int getTagSearchContentCnt(Map<String, Object> paramMap) {
		return templateDao.getTagSearchContentCnt(paramMap);
	}

	@Override
	public List<Template> getTagSearchContentList(Map<String, Object> paramMap) {
		return templateDao.getTagSearchContentList(paramMap);
	}
	
	@Override
	public List<Template> getTemplateList(Map<String, Object> paramMap) {
		return templateDao.getTemplateList(paramMap);
	}

	@Override
	public int dropTemplate(List<String> list) {
		return templateDao.dropTemplate(list);
	}
	
	//조회수
	@Override
	public int updateTemplateView(Map<String, Object> paramMap) {
		return templateDao.updateTemplateView(paramMap);
	}

	//Like
	@Override
	public int checkTemplateLike(Map<String, Object> paramMap) {
		return templateDao.checkTemplateLike(paramMap);
	}

	@Override
	public int delTemplateLike(Map<String, Object> paramMap) {
		return templateDao.delTemplateLike(paramMap);
	}

	@Override
	public int updateTemplateLikeCount(Map<String, Object> paramMap) {
		return templateDao.updateTemplateLikeCount(paramMap);
	}

	@Override
	public int insertTemplateLike(Map<String, Object> paramMap) {
		return templateDao.insertTemplateLike(paramMap);
	}

	@Override
	public List<Template> getTemplateAdminList(Map<String, Object> paramMap) {
		return templateDao.getTemplateAdminList(paramMap);
	}

	@Override
	public int dropAdminTemplate(List<String> list) {
		return templateDao.dropAdminTemplate(list);
	}
}
