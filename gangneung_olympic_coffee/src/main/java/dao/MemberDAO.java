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
	public List<Member> selectMember() {
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
	
	/**
	 * 일반회원 관리자로 인한 탈퇴
	 * @param email
	 * @return delete 안되었다면 0, 되었다면 삭제
	 */
	public int deleteMemberByManager(String email) {
		return sqlSession.delete("memberMapper.deleteMemberByManager", email);
	}
	
	/**
	 * 일반회원 자발적 탈퇴
	 * @param email
	 * @return delete 안되었다면 0, 되었다면 삭제
	 */
	public int deleteMember(String email) {
		return sqlSession.delete("memberMapper.deleteMember", email);
	}
	
	/**
	 * 일반회원 비밀번호 가져오기
	 * @param email
	 * @return 암호화된 비밀번호값
	 */
	public String selectMemberByPassword(String email) {
		return sqlSession.selectOne("memberMapper.selectMemberByPassword", email);
	}
	
	/**
	 * 일반회원 회원정보 수정
	 * @param email
	 * @return 변경값
	 */
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember",member);
	}
	
}
