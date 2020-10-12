package com.spring.myapp.dao;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.domain.Index;
import com.spring.myapp.domain.Template;

public interface IndexDao {
	List<Board> getBoardContentList(Map<String, Object> paramMap);
	
	List<Template> getTemplateContentList(Map<String, Object> paramMap);

	List<Template> getTemplateLikeList(Map<String, Object> paramMap);

	List<Template> getTemplateViewList(Map<String, Object> paramMap);

	List<Template> getUserLikeList(Map<String, Object> paramMap);

	List<Index> getTagList(Map<String, Object> paramMap);

	List<Template> getHash1TagList(Map<String, Object> paramMap);

	List<Template> getHash2TagList(Map<String, Object> paramMap);

	List<Template> getHash3TagList(Map<String, Object> paramMap);
}
