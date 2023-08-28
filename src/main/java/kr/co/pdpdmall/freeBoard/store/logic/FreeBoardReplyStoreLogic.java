package kr.co.pdpdmall.freeBoard.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pdpdmall.freeBoard.domain.FreeBoardReply;
import kr.co.pdpdmall.freeBoard.store.FreeBoardReplyStore;

@Repository
public class FreeBoardReplyStoreLogic implements FreeBoardReplyStore {

	@Override
	public int insertReply(SqlSession sqlSession, FreeBoardReply reply) {
		int result = sqlSession.insert("FreeBoardReplyMapper.insertReply", reply);
		return result;
	}

	@Override
	public int updateReply(SqlSession sqlSession, FreeBoardReply reply) {
		int result = sqlSession.update("FreeBoardReplyMapper.updateReply", reply);
		return result;
	}

	@Override
	public List<FreeBoardReply> selectReplyList(SqlSession sqlSession, int refBoardNo) {
		List<FreeBoardReply> rList = sqlSession.selectList("FreeBoardReplyMapper.selectReplyList", refBoardNo);
		return rList;
	}

}
