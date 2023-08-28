package kr.co.pdpdmall.freeBoard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kr.co.pdpdmall.freeBoard.domain.FreeBoardReply;
import kr.co.pdpdmall.freeBoard.service.FreeBoardReplyService;

@Controller
@RequestMapping("/reply")
public class FreeBoardReplyController {
	
	
	@Autowired
	private FreeBoardReplyService rService;	
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mv
			,@ModelAttribute FreeBoardReply reply
			,HttpSession session) {
		String url="";
		try {
			String replyWriter = (String)session.getAttribute("memberName");
			reply.setReplyWriter(replyWriter);
			int result = rService.insertReply(reply);
			url = "/bulletinBoard/freeBoard/detail.do?freeBoardNo="+ reply.getRefBoardNo();
					
					
			if(result>0) {
				mv.setViewName("redirect:"+url);
			} else {
				mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
				mv.addObject("error", "댓글 등록 실패");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute FreeBoardReply reply
			, HttpSession session) {
		String url="";		
		try {
			String replyWriter = (String)session.getAttribute("memberId");
			if(replyWriter != null && !replyWriter.equals("")) {
				reply.setReplyWriter(replyWriter);		
				url = "/bulletinBoard/freeBoard/detail.do?freeBoardNo="+ reply.getRefBoardNo();
				int result = rService.updateReply(reply);
				mv.setViewName("redirect:"+url);
			} else {
				mv.addObject("msg", "로그인이 되지 않았습니다.");
				mv.addObject("error", "로그인 정보확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
}