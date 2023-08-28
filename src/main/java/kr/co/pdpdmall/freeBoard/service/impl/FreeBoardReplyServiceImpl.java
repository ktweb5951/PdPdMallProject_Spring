package kr.co.pdpdmall.freeBoard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.FreeBoardReply;
import kr.co.pdpdmall.freeBoard.service.FreeBoardReplyService;
import kr.co.pdpdmall.freeBoard.store.FreeBoardReplyStore;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FreeBoardReplyStore rStore;
	
	@Override
	public int insertReply(FreeBoardReply reply) {
		int result = rStore.insertReply(sqlSession, reply);
		return result;
	}

	@Override
	public int updateReply(FreeBoardReply reply) {
		int result = rStore.updateReply(sqlSession, reply);
		return result;
	}

	@Override
	public List<FreeBoardReply> selectReplyList(int refBoardNo) {
		List<FreeBoardReply> rList = rStore.selectReplyList(sqlSession, refBoardNo);
		return rList;
	}

}
