package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.TemplateDao;
import com.spring.myapp.domain.Template;
import com.spring.myapp.domain.TemplateReply;

@Repository("templateDao")
public class TemplateDaoImpl implements TemplateDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("insertTemplateContent", paramMap);
	}
	
	@Override
	public int modifyContent(Map<String, Object> paramMap) {
		return sqlSession.update("updateTemplateContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectTemplateContentCnt", paramMap);
	}
	
	//정렬
	@Override
	public List<Template> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectTemplateContent", paramMap);
	}
	
	@Override
	public List<Template> getContentViewList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectTemplateViewList", paramMap);
	}

	@Override
	public List<Template> getContentLikeList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectTemplateLikeList", paramMap);
	}

	
	@Override
	public Template getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectTemplateContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertTemplateReply", paramMap);
	}

	@Override
	public List<TemplateReply> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectTemplateReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		if(paramMap.get("r_type").equals("main")) {
			//부모부터 하위 다 지움
			return sqlSession.delete("deleteTemplateReplyAll", paramMap);
		}else {
			//자기 자신만 지움
			return sqlSession.delete("deleteTemplateReply", paramMap);
		}
		
		
	}

	@Override
	public int getTemplateCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectTemplateCnt", paramMap);
	}

	@Override
	public int delTemplate(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteTemplate", paramMap);
	}

	@Override
	public boolean checkReply(Map<String, Object> paramMap) {
		int result = sqlSession.selectOne("selectTemplateReplyPassword", paramMap);
				
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean updateReply(Map<String, Object> paramMap) {
		int result = sqlSession.update("updateTemplateReply", paramMap);
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public int getSearchContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("searchTemplateContentCnt", paramMap);
	}

	@Override
	public List<Template> getSearchContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("searchTemplateContent", paramMap);
	}
	
	@Override
	public int getTagSearchContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("tagsearchTemplateContentCnt", paramMap);
	}

	@Override
	public List<Template> getTagSearchContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("tagsearchTemplateContent", paramMap);
	}
	
	@Override
	public List<Template> getTemplateList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectTemplates", paramMap);
	}
	
	@Override
	public int dropTemplate(List<String> list) {
		return sqlSession.delete("dropTemplate",list);
	}

	//조회수
	@Override
	public int updateTemplateView(Map<String, Object> paramMap) {
		return sqlSession.update("updateTemplateView",paramMap);
	}

	//Like
	@Override
	public int checkTemplateLike(Map<String, Object> paramMap) {
		return sqlSession.selectOne("checkTemplateLike", paramMap);
	}

	@Override
	public int delTemplateLike(Map<String, Object> paramMap) {
		return sqlSession.delete("delTemplateLike", paramMap);
	}

	@Override
	public int updateTemplateLikeCount(Map<String, Object> paramMap) {
		return sqlSession.update("updateTemplateLikeCount",paramMap);
	}

	@Override
	public int insertTemplateLike(Map<String, Object> paramMap) {
		return sqlSession.insert("insertTemplateLike",paramMap);
	}

	@Override
	public List<Template> getTemplateAdminList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getTemplateAdminList", paramMap);
	}

	@Override
	public int dropAdminTemplate(List<String> list) {
		return sqlSession.delete("dropAdminTemplate", list);
	}
	
}
