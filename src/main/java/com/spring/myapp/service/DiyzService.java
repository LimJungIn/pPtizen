package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Diyz;

public interface DiyzService {
	
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Diyz> getContentList(Map<String, Object> paramMap);
	
	List<Diyz> getBoardList(Map<String, Object> paramMap);
	
	Diyz getContentView(Map<String, Object> paramMap);
	
	int dropImg(List<String> list);
	
	
	List<Diyz> getSelectDataList(Map<String, Object> paramMap);
}
