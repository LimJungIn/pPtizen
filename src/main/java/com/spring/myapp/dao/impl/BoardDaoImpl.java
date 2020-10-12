package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.BoardDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("insertContent", paramMap);
	}
	
	@Override
	public int modifyContent(Map<String, Object> paramMap) {
		return sqlSession.update("updateContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectContentCnt", paramMap);
	}
	
	//정렬
	@Override
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectContent", paramMap);
	}
	
	@Override
	public List<Board> getContentViewList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectBoardViewList", paramMap);
	}

	@Override
	public List<Board> getContentLikeList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectBoardLikeList", paramMap);
	}

	
	@Override
	public Board getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectBoardReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		if(paramMap.get("r_type").equals("main")) {
			return sqlSession.delete("deleteBoardReplyAll", paramMap);
		}else {
			return sqlSession.delete("deleteBoardReply", paramMap);
		}
		
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectBoardCnt", paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteBoard", paramMap);
	}
	
	@Override
	public int replyCount(Map<String, Object> paramMap) {
		return sqlSession.delete("replyCount", paramMap);
	}
	
	@Override
	public boolean checkReply(Map<String, Object> paramMap) {
		int result = sqlSession.selectOne("selectReplyPassword", paramMap);
				
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean updateReply(Map<String, Object> paramMap) {
		int result = sqlSession.update("updateReply", paramMap);
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int getSearchContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("searchContentCnt", paramMap);
	}

	@Override
	public List<Board> getSearchContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("searchContent", paramMap);
	}
	
	@Override
	public int getTagSearchContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("tagsearchContentCnt", paramMap);
	}

	@Override
	public List<Board> getTagSearchContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("tagsearchContent", paramMap);
	}
	
	@Override
	public List<Board> getBoardList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectBoards", paramMap);
	}
	
	@Override
	public int dropBoard(List<String> list) {
		return sqlSession.delete("dropBoard",list);
	}
	
	@Override
	public int updateBoardView(Map<String, Object> paramMap) {
		return sqlSession.update("updateBoardView",paramMap);
	}

	//Like 기능
	@Override
	public int checkBoardLike(Map<String, Object> paramMap) {
		return sqlSession.selectOne("checkBoardLike", paramMap);
	}
	
	@Override
	public int insertLike(Map<String, Object> paramMap) {	
		return sqlSession.insert("insertLike",paramMap);
	}
	
	@Override
	public int delBoardLike(Map<String, Object> paramMap) {
		return sqlSession.delete("delBoardLike", paramMap);
	}
	
	@Override
	public int updateBoardLikeCount(Map<String, Object> paramMap) {
		return sqlSession.update("updateBoardLikeCount",paramMap);
	}
	
	//팔로우
	@Override
	public int getFollowCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("followCheck", paramMap);
	}

	@Override
	public int regFollow(Map<String, Object> paramMap) {
		return sqlSession.insert("regFollow", paramMap);
	}

	@Override
	public int delFollow(Map<String, Object> paramMap) {
		return sqlSession.delete("delFollow", paramMap);
	}

	@Override
	public int getfollowCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectfollowCount", paramMap);
	}

	@Override
	public String getFollowMessage(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectfollowMessage", paramMap);
	}
	
}
