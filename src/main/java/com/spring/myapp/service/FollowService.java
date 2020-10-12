package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Follow;

public interface FollowService {
	List<Follow> getFollowView(Map<String, Object> paramMap);

	List<String> getFollowBoard(Map<String, Object> paramMap);
}
