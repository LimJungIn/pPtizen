package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.MagazineDao;
import com.spring.myapp.domain.Magazine;

@Repository("magazineDao")
public class MagazineDaoImpl implements MagazineDao {
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("insertMagazineContent", paramMap);
	}
	
	@Override
	public int modifyContent(Map<String, Object> paramMap) {
		return sqlSession.update("updateMagazineContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectMagazineContentCnt", paramMap);
	}
	
	@Override
	public List<Magazine> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectMagazineContent", paramMap);
	}

	@Override
	public Magazine getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectMagazineContentView", paramMap);
	}


	@Override
	public int getMagazineCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectMagazineCnt", paramMap);
	}

	@Override
	public int delMagazine(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteMagazine", paramMap);
	}

}
