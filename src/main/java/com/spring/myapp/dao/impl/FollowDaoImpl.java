package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.FollowDao;
import com.spring.myapp.domain.Follow;

@Repository("followDao")
public class FollowDaoImpl implements FollowDao {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Follow> getFollowView(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectFollowView", paramMap);
	}

	@Override
	public List<String> getFollowBoard(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectFollowBoard", paramMap);
	}
}
