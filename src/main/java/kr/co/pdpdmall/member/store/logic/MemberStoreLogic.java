package kr.co.pdpdmall.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pdpdmall.member.domain.Member;
import kr.co.pdpdmall.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public int insertMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.insert("MemberMapper.insertMember", member); 
		return result;
	}

	@Override
	public int updateMember(SqlSession sqlSession, Member member) {
		int result = sqlSession.insert("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int deleteMemberById(SqlSession sqlSession, String memberId) {
		int result = sqlSession.insert("MemberMapper.deleteMember", memberId);
		return result;
	}

	@Override
	public Member selectCheckLogin(SqlSession sqlSession, Member member) {
		Member mOne = sqlSession.selectOne("MemberMapper.selectCheckLogin", member);
		return mOne;
	}

	@Override
	public Member selectOneById(SqlSession sqlSession, String memberId) {
		Member mOne = sqlSession.selectOne("MemberMapper.selectOneById", memberId);
		return mOne;
	}

	@Override
	public int selectCheckById(SqlSession sqlSession, String memberId) {
		int result = sqlSession.selectOne("MemberMapper.selectCheckById", memberId);
		return result;
	}

	

}
