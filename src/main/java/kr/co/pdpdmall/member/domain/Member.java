package kr.co.pdpdmall.member.domain;

import java.sql.Timestamp;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNickname;
	private String memberPhone;
	private String memberAddress;
	private String memberPostCode;
	private String memberDetailAddress;
	private String memberEmail;
	private Timestamp memberDate;
	
	
	public Member() {
	}


	public Member(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}




	public Member(String memberId, String memberPw, String memberNickname, String memberPhone, String memberAddress,String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberEmail = memberEmail;
	}


	public Member(String memberId, String memberPw, String memberName, String memberNickname, String memberPhone,
			String memberAddress, String memberEmail) {
		
		
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberEmail = memberEmail;
	}

	public Member(String memberId, String memberPw, String memberName, String memberNickname, String memberPhone,
			String memberAddress, String memberPostCode, String memberDetailAddress, String memberEmail,
			Timestamp memberDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberPostCode = memberPostCode;
		this.memberDetailAddress = memberDetailAddress;
		this.memberEmail = memberEmail;
		this.memberDate = memberDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public String getMemberAddress() {
		return memberAddress;
	}


	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}



	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public Timestamp getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}


	public String getMemberPostCode() {
		return memberPostCode;
	}


	public void setMemberPostCode(String memberPostCode) {
		this.memberPostCode = memberPostCode;
	}


	public String getMemberDetailAddress() {
		return memberDetailAddress;
	}


	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	}


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberNickname=" + memberNickname + ", memberPhone=" + memberPhone + ", memberAddress="
				+ memberAddress + ", memberPostCode=" + memberPostCode + ", memberDetailAddress=" + memberDetailAddress
				+ ", memberEmail=" + memberEmail + ", memberDate=" + memberDate + "]";
	}










	
	
}
