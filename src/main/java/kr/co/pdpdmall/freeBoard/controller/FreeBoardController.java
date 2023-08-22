package kr.co.pdpdmall.freeBoard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kr.co.pdpdmall.freeBoard.domain.FreeBoard;
import kr.co.pdpdmall.freeBoard.domain.PageInfo;
import kr.co.pdpdmall.freeBoard.service.FreeBoardService;
import kr.co.pdpdmall.member.domain.Member;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;
	
	//글작성
	@RequestMapping(value="/bulletinBoard/freeBoard/insert.do", method=RequestMethod.GET)
	public String showWritingPage() {
		return "bulletinBoard/freeBoard/write";
	}
	
	@RequestMapping(value="/bulletinBoard/freeBoard/insert.do", method=RequestMethod.POST)
	public String insertFreeBoard(Model model
			,@ModelAttribute FreeBoard freeBoard
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request
			) {
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
				String fileName = uploadFile.getOriginalFilename();
				String root =request.getSession().getServletContext().getRealPath("resources");
				String saveFolder = root + "\\nuploadFiles";
				File folder = new File(saveFolder);
				if(!folder.exists()) {
					folder.mkdir();
				}
				// ================= 파일 경로 =================
				String savePath = saveFolder + "\\" + fileName;
				File file = new File(savePath);
				// ================= 파일 저장 =================
				uploadFile.transferTo(file);
				// ================= 파일 크기 =================
				long fileLength = uploadFile.getSize();
				
				// DB에 저장하기 위해 notice에 데이터를 set하는 부분임.
				
				freeBoard.setFreeBoardFilename(fileName);
				freeBoard.setFreeBoardFilepath(savePath);
				freeBoard.setFreeBoardFilelength(fileLength);
			}
			int result = service.insertFreeBoard(freeBoard);
			if(result>0) {
				model.addAttribute("msg", "게시글 등록이 완료되었습니다.");
				model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
				return "common/serviceSuccess";
			} else {
				model.addAttribute("msg", "게시글 등록이 완료되지 않았습니다.");
				model.addAttribute("url", "bulletinBoard/freeBoard/freeBoard");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
		
	}
	
	//게시글 리스트
	
	@RequestMapping(value="/bulletinBoard/freeBoard/list.do", method=RequestMethod.GET)
	public String showFreeBoardList(Model model
			,@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			) {
		try {
			int totalCount = service.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<FreeBoard> fList = service.selectFreeBoardList(pInfo);
			if(!fList.isEmpty()) {
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("fList",	fList);
				return "bulletinBoard/freeBoard/freeBoard";
			} else {
				model.addAttribute("msg", "게시글이 존재하지 않습니다.");
				model.addAttribute("url", "index");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}

	public PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		// Math.ceil((double)totalCount/recordCountPerPage)
		// curretnPage값이 1~5일때 startNavi가 1로 고정되도록 구해주는 식
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)* naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage -1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최대값보다 커질 수 있음.
		if(endNavi>naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}
	
	
	//게시글 조회
	@RequestMapping(value="/bulletinBoard/freeBoard/detail.do", method=RequestMethod.GET) 
	public String showPost(Model model
			,@ModelAttribute FreeBoard freeBoard
			) {
		//SELECT * FROM FREEBOARD_TBL WHERE FREEBOARD_NO = ?
		
		try {
			FreeBoard fOne = service.selectOneByNo(freeBoard);
			if(fOne!=null) {
				model.addAttribute("freeBoard", fOne);
				return "bulletinBoard/freeBoard/detail";
			}else {
				model.addAttribute("msg", "게시글이 존재하지 않습니다.");
				model.addAttribute("url", "index");
				return "common/serviceFailed";
			}		
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	
	//게시글 검색
	@RequestMapping(value="/bulletinBoard/freeBoard/search.do", method=RequestMethod.GET)
	public String searchFreeBoardList(@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {

		// 2개의 값을 하나의 변수로 다루는 방법
		// 1. VO클래스 만드는 방법
		// 2. HashMap 사용
		Map<String, String> paramMap = new HashMap<String, String>();
		// put() 메소드를 사용해서 key-value설정을 하는데
		// key값(파란색)이 mapper.xml에서 사용된다.
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = service.getListCount(paramMap);
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<FreeBoard> searchList = service.searchByKeyword(pInfo ,paramMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pInfo", pInfo);
			model.addAttribute("fList", searchList);
			return "bulletinBoard/freeBoard/search";
		} else {
			model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
			model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
			return "common/serviceFailed";	
		}
		
	}
	
	//게시글 삭제
	@RequestMapping(value="/bulletinBoard/freeBoard/delete.do", method=RequestMethod.GET)
	public String deletePost(Model model
			,@ModelAttribute FreeBoard freeBoard
			,HttpSession session
			) {
		
		try {
			String loggedInMemberId = (String) session.getAttribute("memberId");
			FreeBoard fOne = service.selectOneByNo(freeBoard);
			String boardAuthorId = fOne.getFreeBoardWriter();
			
			//로그인 시에만 삭제 처리 가능
			if (loggedInMemberId == null || loggedInMemberId.isEmpty()) {
			    model.addAttribute("msg", "로그인 후에 삭제할 수 있습니다.");
			    model.addAttribute("url", "/member/login.do"); 
			    return "common/serviceFailed";
			}
			
			if (loggedInMemberId != null && loggedInMemberId.equals(boardAuthorId)) {
			    // 로그인한 사용자의 아이디와 작성자 아이디가 일치하는 경우에만 삭제 처리
				int result = service.deleteFreeBoard(freeBoard);
				if(result>0) {
					model.addAttribute("msg", "게시글 삭제가 완료되었습니다..");
					model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
					return "common/serviceSuccess";
				} else {
					model.addAttribute("msg", "게시글 삭제가 완료되지 않았습니다.");
					model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
					return "common/serviceFailed";
				}			
			} else {
			    // 작성자 아이디와 로그인한 사용자의 아이디가 일치하지 않는 경우
			    model.addAttribute("msg", "게시글 작성자만 삭제할 수 있습니다.");
			    model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
			    return "common/serviceFailed";
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	//게시글 수정
	@RequestMapping(value="/bulletinBoard/freeBoard/update.do", method=RequestMethod.GET)
	public String modifyCheckPost(Model model
			,@ModelAttribute FreeBoard freeBoard
			,HttpSession session
			) {
	    FreeBoard fOne = service.selectOneByNo(freeBoard);
	    if (fOne != null) {
	        String loggedInMemberId = (String) session.getAttribute("memberId");
	        String boardAuthorId = fOne.getFreeBoardWriter();

			if (loggedInMemberId == null || loggedInMemberId.isEmpty()) {
			    model.addAttribute("msg", "로그인 후에 수정할 수 있습니다.");
			    model.addAttribute("url", "/member/login.do"); 
			    return "common/serviceFailed";
			}
	        
	        if (loggedInMemberId != null && loggedInMemberId.equals(boardAuthorId)) {
	            model.addAttribute("freeBoard", fOne);        
	            return "bulletinBoard/freeBoard/modify";
	        } else {
	            model.addAttribute("msg", "게시글 작성자만 수정할 수 있습니다.");
	            model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
	            return "common/serviceFailed";
	        }
	    } else {
	        model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
	        model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
	        return "common/serviceFailed";
	    }
	}
	
	@RequestMapping(value="/bulletinBoard/freeBoard/update.do", method=RequestMethod.POST)
	public String modifyPost(Model model
			,@ModelAttribute FreeBoard freeBoard
            ,@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
            ,@RequestParam(value = "freeBoardFilename") String existingFileName
            ,@RequestParam(value = "freeBoardFilepath") String existingFilePath
            ,@RequestParam(value = "freeBoardFilelength") Long existingFileLength
			,HttpServletRequest request
			,HttpSession session
			) {
		
		try {	        
            if (!uploadFile.getOriginalFilename().equals("")) {
                // 기존 파일 삭제
                File oldFile = new File(existingFilePath);
                if (oldFile.exists()) {
                    oldFile.delete();
                }
		            
            	String fileName = uploadFile.getOriginalFilename();
				String root =request.getSession().getServletContext().getRealPath("resources");
				String saveFolder = root + "\\nuploadFiles";
				File folder = new File(saveFolder);
				if(!folder.exists()) {
					folder.mkdir();
				}
				// ================= 파일 경로 =================
				String savePath = saveFolder + "\\" + fileName;
				File file = new File(savePath);
				// ================= 파일 저장 =================
				uploadFile.transferTo(file);
				// ================= 파일 크기 =================
				long fileLength = uploadFile.getSize();
				
				freeBoard.setFreeBoardFilename(fileName);
				freeBoard.setFreeBoardFilepath(savePath);
				freeBoard.setFreeBoardFilelength(fileLength);
            } else {
                // 파일이 업로드되지 않은 경우 기존 파일 정보 사용
                freeBoard.setFreeBoardFilename(existingFileName);
                freeBoard.setFreeBoardFilepath(existingFilePath);
                freeBoard.setFreeBoardFilelength(existingFileLength);
            }		
			

			int result = service.updateFreeBoard(freeBoard);
			if(result>0) {
				model.addAttribute("msg", "게시글 수정이 완료되었습니다..");
				model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
				return "common/serviceSuccess";
			} else {
				model.addAttribute("msg", "게시글 수정이 완료되지 않았습니다.");
				model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
				return "common/serviceFailed";
			}	
	
	        
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "/bulletinBoard/freeBoard/list.do");
			return "common/serviceFailed";
		}
		
	}
}
	
	

