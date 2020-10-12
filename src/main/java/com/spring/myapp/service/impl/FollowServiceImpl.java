package com.spring.myapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.FollowDao;
import com.spring.myapp.domain.Follow;
import com.spring.myapp.service.FollowService;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Resource(name = "followDao")
	private FollowDao followDao;

	@Override
	public List<Follow> getFollowView(Map<String, Object> paramMap) {
		return followDao.getFollowView(paramMap);
	}

	@Override
	public List<String> getFollowBoard(Map<String, Object> paramMap) {
		return followDao.getFollowBoard(paramMap);
	}
}
