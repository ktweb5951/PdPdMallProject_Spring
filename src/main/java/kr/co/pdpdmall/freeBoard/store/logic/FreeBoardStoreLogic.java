package kr.co.pdpdmall.freeBoard.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.PageInfo;
import kr.co.pdpdmall.freeBoard.store.FreeBoardStore;

@Repository
public class FreeBoardStoreLogic implements FreeBoardStore {

	@Override
	public int insertFreeBoard(SqlSession sqlSession, FreeBoard freeBoard) {
		int result = sqlSession.insert("FreeBoardMapper.insertFreeBoard", freeBoard);
		return result;
	}

	@Override
	public int updateFreeBoard(SqlSession sqlSession, FreeBoard freeBoard) {
		int result = sqlSession.insert("FreeBoardMapper.updateFreeBoard", freeBoard);
		return result;
	}

	@Override
	public int deleteFreeBoard(SqlSession sqlSession, FreeBoard freeBoard) {
		int result = sqlSession.insert("FreeBoardMapper.deleteFreeBoard", freeBoard);
		return result;
	}

	@Override
	public List<FreeBoard> selectFreeBoardList(SqlSession sqlSession, int currentPage) {
		int  limit = 10;
		int offset = (currentPage-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoard> fList = sqlSession.selectList("FreeBoardMapper.selectFreeBoardList", null,rowBounds);		
		return fList;
	}

	@Override
	public FreeBoard selectOneByNo(SqlSession sqlSession, FreeBoard freeBoard) {
		FreeBoard fOne = sqlSession.selectOne("FreeBoardMapper.selectOneByNo", freeBoard);
		return fOne;
	}

	@Override
	public int getTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession	.selectOne("FreeBoardMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public List<FreeBoard> selectNoticeList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage(); // 가져오는 행의 갯수
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoard> fList = sqlSession.selectList("FreeBoardMapper.selectFreeBoardList", null, rowBounds);		
		return fList;
	}

	@Override
	public int selectListCount(SqlSession sqlSession, Map<String, String> paramMap) {
		int result = sqlSession.selectOne("FreeBoardMapper.selectListByKeywordCount", paramMap);
		return result;
	}

	@Override
	public List<FreeBoard> searchByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage(); // 가져오는 행의 갯수
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoard> searchList = sqlSession.selectList("FreeBoardMapper.searchByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("FreeBoardMapper.selectListCount");
		return result;
	}

}
