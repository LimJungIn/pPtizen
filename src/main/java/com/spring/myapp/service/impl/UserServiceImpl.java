package com.spring.myapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.UserDao;
import com.spring.myapp.domain.User;
import com.spring.myapp.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public int insertUser(Map<String, Object> paramMap) {
		if(paramMap.get("id")==null) {
			return userDao.insertUser(paramMap);
		}else {
			return userDao.updateUser(paramMap);
		}
	}

	@Override
	public int deleteUser(Map<String, Object> paramMap) {
		return userDao.deleteUser(paramMap);
	}

	@Override
	public int checkId(Map<String,Object> paramMap) {
		return userDao.checkId(paramMap);
	}

	@Override
	public int checkNickName(Map<String, Object> paramMap) {
		return userDao.checkNickName(paramMap);
	}

	@Override
	public int checkEmail(Map<String, Object> paramMap) {
		return userDao.checkEmail(paramMap);
	}

	@Override
	public int login(Map<String, Object> paramMap) {
		return userDao.login(paramMap);
	}
	
	@Override
	public User getUserView(Map<String, Object> paramMap) {
		return userDao.getUserView(paramMap);
	}

	@Override
	public List<User> getUserList(Map<String, Object> paramMap) {
		return userDao.getUserList(paramMap);
	}

	@Override
	public int updateWithdraw(Map<String, Object> paramMap) {
		return userDao.updateWithdraw(paramMap);
	}

	@Override
	public int dropUser(List<String> list) {
		return userDao.dropUser(list);
	}

	@Override
	public String getNickName(Map<String, Object> paramMap) {
		return userDao.getNickName(paramMap);
	}
	
	
	//follow+내 정보 수정 최종본
	@Override
	public int updateEmail(Map<String, Object> paramMap) {
		return userDao.updateEmail(paramMap);
	}
	
	@Override
	public int updatePhonenum(Map<String, Object> paramMap) {
		return userDao.updatePhonenum(paramMap);
	}
	
	@Override
	public int updateJob(Map<String, Object> paramMap) {
		return userDao.updateJob(paramMap);
	}
	
	@Override
	public int updateProfile(Map<String, Object> paramMap) {
		return userDao.updateProfile(paramMap);
	}
}
