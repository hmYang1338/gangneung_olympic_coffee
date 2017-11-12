package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Member;
/**
 * 일반 회원 DAO
 * @author 정태준
 *
 */
@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 전체 일반 회원 관련 비밀번호를 제외한 모든 정보
	 * @return member 테이블에 존재하는 모든 member
	 */
	public List<Member> selectMemberAll() {
		return sqlSession.selectList("memberMapper.selectMemberAll");
	}
	
	/**
	 * 일반회원 회원가입
	 * @param member
	 * @return insert 안되었다면 0, 되었다면 insert된 행의 개수
	 */
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public Member selectMemberByEmail(String email) {
		return sqlSession.selectOne("memberMapper.selectMemberByEmail", email);
	}
	
	public int deleteMember(String email) {
		return sqlSession.delete("memberMapper.deleteMember", email);
	}
}
