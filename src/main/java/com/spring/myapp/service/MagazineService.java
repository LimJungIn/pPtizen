package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Magazine;


public interface MagazineService {
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Magazine> getContentList(Map<String, Object> paramMap);
	
	Magazine getContentView(Map<String, Object> paramMap);
	
	int getMagazineCheck(Map<String, Object> paramMap);
	
	int delMagazine(Map<String, Object> paramMap);
}
