package com.spring.myapp.dao;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;

public interface BoardDao {
	
	int regContent(Map<String, Object> paramMap);
	
	int modifyContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Board> getContentList(Map<String, Object> paramMap);
	
	List<Board> getBoardList(Map<String, Object> paramMap);
	
	Board getContentView(Map<String, Object> paramMap);
	
	int regReply(Map<String, Object> paramMap);
	
	List<BoardReply> getReplyList(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getBoardCheck(Map<String, Object> paramMap);
	
	int delBoard(Map<String, Object> paramMap);
	
	int replyCount(Map<String, Object> paramMap);
	
	boolean checkReply(Map<String, Object> paramMap);
	
	boolean updateReply(Map<String, Object> paramMap);

	int getSearchContentCnt(Map<String, Object> paramMap);

	List<Board> getSearchContentList(Map<String, Object> paramMap);
	
	int getTagSearchContentCnt(Map<String, Object> paramMap);

	List<Board> getTagSearchContentList(Map<String, Object> paramMap);
	
	int dropBoard(List<String> list);
	
	int updateBoardView(Map<String, Object> paramMap);
	
	//Like 기능
	int checkBoardLike(Map<String, Object> paramMap);
	
	int delBoardLike(Map<String, Object> paramMap);
	
	int updateBoardLikeCount(Map<String, Object> paramMap);
	
	int insertLike(Map<String,Object> paramMap);

	List<Board> getContentViewList(Map<String, Object> paramMap);

	List<Board> getContentLikeList(Map<String, Object> paramMap);
	
	//팔로우
	int getFollowCheck(Map<String, Object> paramMap);

	int regFollow(Map<String, Object> paramMap);

	int delFollow(Map<String, Object> paramMap);

	int getfollowCount(Map<String, Object> paramMap);

	String getFollowMessage(Map<String, Object> paramMap);
}
