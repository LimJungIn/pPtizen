package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.User;

public interface UserService {
	int insertUser(Map<String,Object> paramMap);
	int deleteUser(Map<String,Object> paramMap);
	int updateWithdraw(Map<String,Object> paramMap);
	int checkId(Map<String,Object> paramMap);
	int checkNickName(Map<String,Object> paramMap);
	int checkEmail(Map<String,Object> paramMap);
	int login(Map<String,Object> paramMap);
	User getUserView(Map<String, Object> paramMap);
	List<User> getUserList(Map<String,Object> paramMap);
	int dropUser(List<String> list);
	String getNickName(Map<String, Object> paramMap);
	
	//follow+내 정보 수정 최종본
	int updateEmail(Map<String, Object> paramMap);
	int updatePhonenum(Map<String, Object> paramMap);
	int updateJob(Map<String, Object> paramMap);
	int updateProfile(Map<String, Object> paramMap);
}
