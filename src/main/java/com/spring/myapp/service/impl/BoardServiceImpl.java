package com.spring.myapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.BoardDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDao")
	private BoardDao boardDao;

	@Override
	public int regContent(Map<String, Object> paramMap) {
		if(paramMap.get("id")==null) {
			return boardDao.regContent(paramMap);
		}else {
			return boardDao.modifyContent(paramMap);
		}
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return boardDao.getContentCnt(paramMap);
	}

	//보드 썸네일
	public List<Board> setBoardThumbnail(List<Board> list) {
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		
		for(int i=0; i<list.size(); i++) {
			Matcher match = pattern.matcher(list.get(i).getContent());
			if(match.find()) {
				list.get(i).setThumbnail(match.group(1));
			}
		}
		return list;
	}
	
	//정렬
	@Override
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return setBoardThumbnail(boardDao.getContentList(paramMap));
	}
	
	@Override
	public List<Board> getContentViewList(Map<String, Object> paramMap) {
		return setBoardThumbnail(boardDao.getContentViewList(paramMap));
	}

	@Override
	public List<Board> getContentLikeList(Map<String, Object> paramMap) {
		return setBoardThumbnail(boardDao.getContentLikeList(paramMap));
	}
	

	@Override
	public Board getContentView(Map<String, Object> paramMap) {
		return boardDao.getContentView(paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return boardDao.regReply(paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {

		List<BoardReply> boardReplyList = boardDao.getReplyList(paramMap);

		List<BoardReply> boardReplyListParent = new ArrayList<BoardReply>();
		
		List<BoardReply> boardReplyListChild = new ArrayList<BoardReply>();
		
		List<BoardReply> newBoardReplyList = new ArrayList<BoardReply>();

		for(BoardReply boardReply: boardReplyList){
			if(boardReply.getDepth().equals("0")){
				boardReplyListParent.add(boardReply);
			}else{
				boardReplyListChild.add(boardReply);
			}
		}

		for(BoardReply boardReplyParent: boardReplyListParent){
			
			newBoardReplyList.add(boardReplyParent);
			
			for(BoardReply boardReplyChild: boardReplyListChild){
				
				if(boardReplyParent.getReply_id().equals(boardReplyChild.getParent_id())){
					newBoardReplyList.add(boardReplyChild);
				}

			}

		}
		return newBoardReplyList;
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return boardDao.delReply(paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return boardDao.getBoardCheck(paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return boardDao.delBoard(paramMap);
	}

	@Override
	public boolean checkReply(Map<String, Object> paramMap) {
		return boardDao.checkReply(paramMap);
	}

	@Override
	public boolean updateReply(Map<String, Object> paramMap) {
		return boardDao.updateReply(paramMap);
	}

	@Override
	public int replyCount(Map<String, Object> paramMap) {
		return boardDao.replyCount(paramMap);
	}
	
	@Override
	public int getSearchContentCnt(Map<String, Object> paramMap) {
		return boardDao.getSearchContentCnt(paramMap);
	}

	@Override
	public List<Board> getSearchContentList(Map<String, Object> paramMap) {
		return boardDao.getSearchContentList(paramMap);
	}
	
	@Override
	public int getTagSearchContentCnt(Map<String, Object> paramMap) {
		return boardDao.getTagSearchContentCnt(paramMap);
	}

	@Override
	public List<Board> getTagSearchContentList(Map<String, Object> paramMap) {
		return boardDao.getTagSearchContentList(paramMap);
	}
	
	@Override
	public List<Board> getBoardList(Map<String, Object> paramMap) {
		return boardDao.getBoardList(paramMap);
	}

	@Override
	public int dropBoard(List<String> list) {
		return boardDao.dropBoard(list);
	}
	
	//조회수
	@Override
	public int updateBoardView(Map<String, Object> paramMap) {
		return boardDao.updateBoardView(paramMap);
	}
	
	//Like 기능
	@Override
	public int checkBoardLike(Map<String, Object> paramMap) {
		return boardDao.checkBoardLike(paramMap);
	}
	
	@Override
	public int insertLike(Map<String, Object> paramMap) {	
		return boardDao.insertLike(paramMap);
	}
	
	@Override
	public int delBoardLike(Map<String, Object> paramMap) {
		return boardDao.delBoardLike(paramMap);
	}
	
	@Override
	public int updateBoardLikeCount(Map<String, Object> paramMap) {
		return boardDao.updateBoardLikeCount(paramMap);
	}

	// 팔로우 구현 부분 시작
	@Override
	public int checkFollow(Map<String, Object> paramMap) {
		return boardDao.getFollowCheck(paramMap);
	}

	@Override
	public int follow(Map<String, Object> paramMap) {
		return boardDao.regFollow(paramMap);
	}

	@Override
	public int unfollow(Map<String, Object> paramMap) {
		return boardDao.delFollow(paramMap);
	}

	@Override
	public int getfollowCount(Map<String, Object> paramMap) {
		return boardDao.getfollowCount(paramMap);
	}

	// 팔로우 구현 부분 시작
	@Override
	public String getFollowMessage(Map<String, Object> paramMap) {
		return boardDao.getFollowMessage(paramMap);
	}
}
