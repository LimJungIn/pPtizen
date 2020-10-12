package com.spring.myapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.MagazineDao;
import com.spring.myapp.domain.Magazine;
import com.spring.myapp.service.MagazineService;


@Service("magazineService")
public class MagazineServiceImpl implements MagazineService {
	@Resource(name="magazineDao")
	private MagazineDao magazineDao;

	@Override
	public int regContent(Map<String, Object> paramMap) {
		if(paramMap.get("id")==null) {
			return magazineDao.regContent(paramMap);
		}else {
			return magazineDao.modifyContent(paramMap);
		}
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return magazineDao.getContentCnt(paramMap);
	}

	@Override
	public List<Magazine> getContentList(Map<String, Object> paramMap) {
		return magazineDao.getContentList(paramMap);
	}

	@Override
	public Magazine getContentView(Map<String, Object> paramMap) {
		return magazineDao.getContentView(paramMap);
	}

	
	@Override
	public int getMagazineCheck(Map<String, Object> paramMap) {
		return magazineDao.getMagazineCheck(paramMap);
	}

	@Override
	public int delMagazine(Map<String, Object> paramMap) {
		return magazineDao.delMagazine(paramMap);
	}

}
