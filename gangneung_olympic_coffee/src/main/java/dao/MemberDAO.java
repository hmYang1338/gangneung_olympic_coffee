package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dto.Member;

@Repository
public class MemberDAO {
	
	private SqlSession sqlsession;
	
	public List<Member> selectAllMember() {
		return sqlsession.selectList("memberMapper.selectAllMember");
	}
	
	public int insertUser(Member member) {
		return sqlsession.insert("memberMapper.insertMember", member);
	}
}