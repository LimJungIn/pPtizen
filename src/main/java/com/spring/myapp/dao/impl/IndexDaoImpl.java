package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.IndexDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.Index;
import com.spring.myapp.domain.Template;

@Repository("indexDao")
public class IndexDaoImpl implements IndexDao{
	
	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<Board> getBoardContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getBoardContentList", paramMap);
	}

	@Override
	public List<Template> getTemplateContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getTemplateContentList", paramMap);
	}

	@Override
	public List<Template> getTemplateLikeList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getTemplateLikeList", paramMap);
	}

	@Override
	public List<Template> getTemplateViewList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getTemplateViewList", paramMap);
	}

	@Override
	public List<Template> getUserLikeList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getUserLikeList", paramMap);
	}

	@Override
	public List<Index> getTagList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getTagList", paramMap);
	}

	@Override
	public List<Template> getHash1TagList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getHash1TagList", paramMap);
	}

	@Override
	public List<Template> getHash2TagList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getHash2TagList", paramMap);
	}

	@Override
	public List<Template> getHash3TagList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getHash3TagList", paramMap);
	}
}
