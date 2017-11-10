package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Member> selectAllMember() {
		return sqlSession.selectList("memberMapper.selectAllMember");
	}
	
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public Member selectMemberByEmail(String email) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail", email);
	}
	
}