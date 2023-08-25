package kr.co.pdpdmall.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.pdpdmall.member.domain.Member;
import kr.co.pdpdmall.member.service.MemberService;

@Controller
@SessionAttributes({"memberId", "memberName"})

public class MemberController {

	@Autowired
	private MemberService service;
	
	//회원가입
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String showRegisterForm(Model model) {
		return "member/register";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public String registerMember(HttpServletRequest request, HttpServletResponse response
			,@ModelAttribute Member member
			,Model model) {
		
		try {
			int result = service.insertMember(member);
			if(result>0) {
				model.addAttribute("msg", "🎉 폰다판다 회원이 되신걸 환영합니다. 🎉");
				model.addAttribute("url", "/member/login.do");
				return "common/serviceSuccess";
			} else {
				model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
				return "common/serviceFailed";
			}	
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}

	//로그인
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String showLoginPage(Model model) {
		return "member/loginPage";
	}	
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam("memberId") String memberId
			,@RequestParam("memberPw") String memberPw
			,Model model){
		
		try {
			Member member = new Member(memberId, memberPw);
			Member mOne = service.selectCheckLogin(member);
			if(mOne != null) {
				model.addAttribute("memberId", mOne.getMemberId());
				model.addAttribute("memberName", mOne.getMemberName());
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다.");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//로그아웃
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpSession sessionPrev
			, SessionStatus session
			, Model model) {
		
		if(session != null) {
			session.setComplete();
			if(session.isComplete()) {
				
			}
			return "member/loginPage";
		} else {
			model.addAttribute("msg", "로그아웃 실패");
			return "common/serviceFailed";
		}
	}
	
	
	//아이디 중복확인
	@RequestMapping(value="/member/checkId.do", method=RequestMethod.GET)
	public String checkMemberId(Model model
			,@RequestParam("memberId") String memberId
			) {
		//SELECT COUNT(*) FROM MEMBER_TBL WHERE MEMBER_ID =?
		
		try {        
			int result = service.selectCheckById(memberId);
			if(result>0) {
                model.addAttribute("idCheckResult", result);
				return "member/register";
			} else {
                model.addAttribute("idCheckResult", result);
                model.addAttribute("mId", memberId);
                return "member/register";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	//회원 정보
	@RequestMapping(value="/member/myInfo.do", method=RequestMethod.GET)
	public String showDetailMember(
			@RequestParam("memberId") String memberId
			, Model model) {
		
		try {
			Member member = service.selectOneById(memberId);
			if(member != null) {
				model.addAttribute("member", member);
				return "member/myPage";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패하였습니다.");
				return "common/serviceFailed";
			}		
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	//회원 탈퇴
	@RequestMapping(value="/member/withdraw.do", method=RequestMethod.GET)
	public String showDeleteMember(Model model) {
		return "member/withdraw";
	}
	
	@RequestMapping(value="/member/withdraw.do", method=RequestMethod.POST)
	public String removeMember(@RequestParam("memberId") String memberId
			,Model model) {
		
		try {
			int result = service.deleteMemberById(memberId);
			if(result>0) {
				model.addAttribute("msg", "회원이 탈퇴에 성공하였습니다.");
				model.addAttribute("url", "/member/logout.do");
				return "common/serviceSuccess";
			} else {
				model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
				return "common/serviceFailed";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
		
	}
	
	//회원 정보 수정 
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public String modifyViewMember(@RequestParam("memberId") String memberId
			, Model model) {
		
		try {
			Member member = service.selectOneById(memberId);
			if(member!=null) {
				model.addAttribute("member", member);
				return "member/modifyMemberInfo";				
			} else {
				model.addAttribute("msg", "데이터 조회에 실패하였습니다");
				return "common/serviceFailed";
			} 
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public String modifyMember(
			@RequestParam("memberId") String memberId
			,@ModelAttribute Member member		
			,RedirectAttributes redirect
			,Model model) {
		
		try {
			int result = service.updateMember(member);
			if(result>0) {
				model.addAttribute("msg", "회원정보 수정이 완료되었습니다.");
				model.addAttribute("url", "/member/myInfo.do?memberId="+memberId);
				return "common/serviceSuccess";
			} else {
				model.addAttribute("msg", "회원정보 수정이 완료되지 않았습니다.");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
		
	}
	
}
