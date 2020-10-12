package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.DiyzDao;
import com.spring.myapp.domain.Diyz;

@Repository("diyzDao")
public class DiyzDaoImpl implements DiyzDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
    @Override
	public int getContentCnt(Map<String, Object> paramMap) {
    	return sqlSession.selectOne("selectDiyzContentCnt", paramMap);
	}
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("insertDiyzImg", paramMap);
	}
	
	@Override
	public int modifyContent(Map<String, Object> paramMap) {
		return sqlSession.update("updateDiyzImg", paramMap);
	}
	
	@Override
	public List<Diyz> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectDiyzImg", paramMap);
	}

	@Override
	public Diyz getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectDiyzImgView", paramMap);
	}
	@Override
	public int dropImg(List<String> list) {
		return sqlSession.delete("dropDiyzImg",list);
	}

	@Override
	public List<Diyz> getBoardList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectDiyzBoards", paramMap);
	}

	
	@Override
	public List<Diyz> getSelectDataList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectDiyzSelectData", paramMap);
	}
}
