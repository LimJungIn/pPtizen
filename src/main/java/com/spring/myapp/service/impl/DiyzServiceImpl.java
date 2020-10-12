package com.spring.myapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.DiyzDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.Diyz;
import com.spring.myapp.service.DiyzService;

@Service("diyzService")
public class DiyzServiceImpl implements DiyzService {

	@Resource(name="diyzDao")
	private DiyzDao diyzDao;

	@Override
	public int regContent(Map<String, Object> paramMap) {
		if(paramMap.get("img_id").toString().equals("")) {
			return diyzDao.regContent(paramMap);
		}else {
			return diyzDao.modifyContent(paramMap);
		}
	}
	
	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return diyzDao.getContentCnt(paramMap);
	}

	@Override
	public List<Diyz> getContentList(Map<String, Object> paramMap) {
		return diyzDao.getContentList(paramMap);
	}
	
	@Override
	public List<Diyz> getBoardList(Map<String, Object> paramMap) {
		return diyzDao.getBoardList(paramMap);
	}

	@Override
	public Diyz getContentView(Map<String, Object> paramMap) {
		return diyzDao.getContentView(paramMap);
	}

	@Override
	public int dropImg(List<String> list) {
		return diyzDao.dropImg(list);
	}

	
	@Override
	public List<Diyz> getSelectDataList(Map<String, Object> paramMap) {
		return diyzDao.getSelectDataList(paramMap);
	}
}
