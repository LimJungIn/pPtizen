package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.ResultMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.UserDao;
import com.spring.myapp.domain.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
	    this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertUser(Map<String, Object> paramMap) {
		return sqlSession.insert("insertUser", paramMap);
	}

	@Override
	public int deleteUser(Map<String, Object> paramMap) {
		return sqlSession.update("deleteUser", paramMap);
	}

	@Override
	public int updateUser(Map<String, Object> paramMap) {
		return sqlSession.update("updateUser", paramMap);
	}

	@Override
	public int checkId(Map<String,Object> paramMap) {
		return sqlSession.selectOne("checkId", paramMap);
	}

	@Override
	public int checkNickName(Map<String, Object> paramMap) {
		return sqlSession.selectOne("checkNickName", paramMap);
	}

	@Override
	public int checkEmail(Map<String, Object> paramMap) {
		return sqlSession.selectOne("checkEmail", paramMap);
	}

	@Override
	public int login(Map<String, Object> paramMap) {
		return sqlSession.selectOne("login", paramMap);
	}
	
	@Override
	public User getUserView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectUserView",paramMap);
	}

	@Override
	public List<User> getUserList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectUsers", paramMap);
	}

	@Override
	public int updateWithdraw(Map<String, Object> paramMap) {
		return sqlSession.update("updateWithdraw",paramMap);
	}

	@Override
	public int dropUser(List<String> list) {
		return sqlSession.delete("dropUser",list);
	}
	
	@Override
	public String getNickName(Map<String, Object> paramMap) {
		return sqlSession.selectOne("getNickName", paramMap);
	}
	
	@Override
	public int updateEmail(Map<String, Object> paramMap) {
		return sqlSession.update("updateEmail",paramMap);
	}
	
	@Override
	public int updatePhonenum(Map<String, Object> paramMap) {
		return sqlSession.update("updatePhonenum",paramMap);
	}
	
	@Override
	public int updateJob(Map<String, Object> paramMap) {
		return sqlSession.update("updateJob",paramMap);
	}
	
	@Override
	public int updateProfile(Map<String, Object> paramMap) {
		return sqlSession.update("updateProfile",paramMap);
	}
}
