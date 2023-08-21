package kr.co.pdpdmall.freeBoard.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.PageInfo;
import kr.co.pdpdmall.freeBoard.service.FreeBoardService;
import kr.co.pdpdmall.freeBoard.store.FreeBoardStore;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardStore mStore;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertFreeBoard(FreeBoard freeBoard) {
		int result = mStore.insertFreeBoard(sqlSession, freeBoard);
		return result;
	}

	@Override
	public int updateFreeBoard(FreeBoard freeBoard) {
		int result = mStore.updateFreeBoard(sqlSession, freeBoard);
		return result;
	}

	@Override
	public int deleteFreeBoard(FreeBoard freeBoard) {
		int result = mStore.deleteFreeBoard(sqlSession, freeBoard);
		return result;
	}

	@Override
	public FreeBoard selectOneByNo(FreeBoard freeBoard) {
		FreeBoard fOne = mStore.selectOneByNo(sqlSession, freeBoard);
		return fOne;
	}

	@Override
	public List<FreeBoard> selectFreeBoardList(PageInfo pInfo) {
		List<FreeBoard> fList = mStore.selectNoticeList(sqlSession, pInfo);
		return fList;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = mStore.selectListCount(sqlSession, paramMap);
		return result;
	}

	@Override
	public List<FreeBoard> searchByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<FreeBoard> searchList = mStore.searchByKeyword(sqlSession, pInfo, paramMap);
		return searchList;
	}

	@Override
	public int getListCount() {
		int result = mStore.selectListCount(sqlSession);
		return result;
	}




}
