package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Manager;

/**
 * 관리자 & 운영자 관련 DAO
 * @author hyunmoYang
 */
@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	/**
	 * 전체 manager 관련 비밀번호를 제외한 모든 정보
	 * @return manager 테이블에 존재하는 모든 manager
	 */
	public List<Manager> selectManagerAll() {
		return sqlsession.selectList("managerMapper.selectManagerAll");
	}
	
	/**
	 * Manager[email, name, id(store_id의 FK)]로 manager 검색
	 * @param manager
	 * @return 검색한 manager의 정보
	 */
	public List<Manager> selectManagerById(List<Manager> manager) {
		return sqlsession.selectList("managerMapper.selectManagerById", manager);
	}
	
	/**
	 * 수정해야함
	 * Join문으로 카페정보를 포함한 카페 운영자의 모든 정보
	 * @param manager
	 * @return 검색한 해당 정보
	 */
	public List<Manager> selectManagerById2() {
		System.out.println(sqlsession.selectMap("managerMapper.selectManagerById2", "email"));
		return null;
	}
	
	/**
	 * (관리자 & 운영자) 회원가입
	 * @param manager
	 * @return insert 안되었다면 0, 되었다면 insert된 행의 개수 
	 */
	public int insertManager(Manager manager) {
		return sqlsession.insert("managerMapper.insertManager", manager);
	}
	
	/**
	 * (관리자 & 운영자) 계정 삭제
	 * @param email
	 * @return delete 안되었다면 0, 되었다면 delete된 행의 개수
	 */
	public int deleteManager(String email) {
		return sqlsession.delete("managerMapper.deleteManager", email);
	}
	
}
