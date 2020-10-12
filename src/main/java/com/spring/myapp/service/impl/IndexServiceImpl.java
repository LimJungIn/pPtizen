package com.spring.myapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.IndexDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.Index;
import com.spring.myapp.domain.Template;
import com.spring.myapp.service.IndexService;

@Service("IndexService")
public class IndexServiceImpl implements IndexService {

	@Resource(name="indexDao")
	private IndexDao indexDao;

	@Override
	public List<Board> getBoardContentList(Map<String, Object> paramMap) {
		return indexDao.getBoardContentList(paramMap);
	}

	@Override
	public List<Template> getTemplateContentList(Map<String, Object> paramMap) {
		return indexDao.getTemplateContentList(paramMap);
	}

	@Override
	public List<Template> getTemplateLikeList(Map<String, Object> paramMap) {
		return indexDao.getTemplateLikeList(paramMap);
	}

	@Override
	public List<Template> getTemplateViewList(Map<String, Object> paramMap) {
		return indexDao.getTemplateViewList(paramMap);
	}

	@Override
	public List<Template> getUserLikeList(Map<String, Object> paramMap) {
		return indexDao.getUserLikeList(paramMap);
	}
	
	@Override
	public List<Index> getTagList(Map<String, Object> paramMap) {
		return indexDao.getTagList(paramMap);
	}
	
	@Override
	public List<Template> getHash1TagList(Map<String, Object> paramMap) {
		return indexDao.getHash1TagList(paramMap);
	}
	
	@Override
	public List<Template> getHash2TagList(Map<String, Object> paramMap) {
		return indexDao.getHash2TagList(paramMap);
	}
	
	@Override
	public List<Template> getHash3TagList(Map<String, Object> paramMap) {
		return indexDao.getHash3TagList(paramMap);
	}
}
