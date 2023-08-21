package kr.co.pdpdmall.freeBoard.service;

import java.util.List;
import java.util.Map;

import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.PageInfo;


public interface FreeBoardService {

	public int insertFreeBoard(FreeBoard freeBoard);

	public int updateFreeBoard(FreeBoard freeBoard);

	public int deleteFreeBoard(FreeBoard freeBoard);

	public FreeBoard selectOneByNo(FreeBoard freeBoard);
	
	public int getListCount();
	
	public int getListCount(Map<String, String> paramMap);

	List<FreeBoard> selectFreeBoardList(PageInfo pInfo);

	public List<FreeBoard> searchByKeyword(PageInfo pInfo, Map<String, String> paramMap);
}

