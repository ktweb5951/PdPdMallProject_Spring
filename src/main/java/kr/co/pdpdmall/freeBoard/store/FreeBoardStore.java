package kr.co.pdpdmall.freeBoard.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.PageInfo;

public interface FreeBoardStore {
	
	public int insertFreeBoard(SqlSession sqlSession, FreeBoard freeBoard);

	public int updateFreeBoard(SqlSession sqlSession, FreeBoard freeBoard);
	
	public int deleteFreeBoard(SqlSession sqlSession, FreeBoard freeBoard);

	public List<FreeBoard> selectFreeBoardList(SqlSession sqlSession, int currentPage);


	public FreeBoard selectOneByNo(SqlSession sqlSession, FreeBoard freeBoard);

	public int getTotalCount(SqlSession sqlSession) ;

	public List<FreeBoard> selectNoticeList(SqlSession sqlSession, PageInfo pInfo);

	public int selectListCount(SqlSession sqlSession, Map<String, String> paramMap);

	public List<FreeBoard> searchByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap);

	public int selectListCount(SqlSession sqlSession);
	
}
