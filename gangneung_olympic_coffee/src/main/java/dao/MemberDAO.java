package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Member> selectAllMember() {
		return sqlsession.selectList("memberMapper.selectAllMember");
	}
	
	public int insertMember(Member member) {
		return sqlsession.insert("memberMapper.insertMember2", member);
	}
	
	public Member selectMemberByEmail(String email) {
		return sqlsession.selectOne("memberMapper.selectMemberByEmail2", email);
	}
	
}