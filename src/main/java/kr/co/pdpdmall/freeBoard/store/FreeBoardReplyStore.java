package kr.co.pdpdmall.freeBoard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.pdpdmall.freeBoard.domain.FreeBoardReply;

public interface FreeBoardReplyStore {

	/**
	 * 댓글 작성 Store
	 * @param sqlSession
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession sqlSession, FreeBoardReply reply);

	/**
	 * 댓글 전체 조회 Store
	 * @param sqlSession
	 * @param refBoardNo
	 * @return
	 */
	List<FreeBoardReply> selectReplyList(SqlSession sqlSession, int refBoardNo);

	/**
	 * 댓글 수정 Store
	 * @param sqlSession
	 * @param reply
	 * @return
	 */
	int updateReply(SqlSession sqlSession, FreeBoardReply reply);

}
