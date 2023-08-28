package kr.co.pdpdmall.freeBoard.service;

import java.util.List;

import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.FreeBoardReply;

public interface FreeBoardReplyService {

	
	/**
	 * 댓글 작성 Service
	 * @param reply
	 * @return
	 */
	int insertReply(FreeBoardReply reply);

	/**
	 * 댓글 전체 조회 Service
	 * @param freeBoardNo
	 * @return
	 */
	List<FreeBoardReply> selectReplyList(int refBoardNo);

	/**
	 * 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(FreeBoardReply reply);

}
