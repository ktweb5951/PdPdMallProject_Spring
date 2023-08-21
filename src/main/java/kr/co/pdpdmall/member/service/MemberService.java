package kr.co.pdpdmall.member.service;

import kr.co.pdpdmall.member.domain.Member;

public interface MemberService {
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMemberById(String memberId);
	
	public Member selectCheckLogin(Member member);
	
	public Member selectOneById(String memberId);
	
}
