package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Manager;
import dto.ManagerStoreJOIN;

/**
 * 관리자 & 운영자 관련 DAO
 * @author hyunmoYang
 */
@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	/**
	 * 전체 운영자 관련 비밀번호를 제외한 모든 정보
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
	/*수정*/
/*	public List<Manager> selectManagerById2() {
		System.out.println(sqlsession.selectMap("managerMapper.selectManagerById2", "email"));
		return null;
	}
*/	
	/**
	 * 운영자 상세조회(Table[manager, store] JOIN) [m_email, m_name, m_tel, s_name, s_addr, s_tel]
	 * @param email
	 * @return 검색한 해당 정보
	 */
	public ManagerStoreJOIN selectOneManagerDetail(String email) {
		return sqlsession.selectOne("managerMapper.selectOneManagerDetail", email);
	}
	
	/**
	 * 운영자 계정 생성
	 * @param manager
	 * @return insert 안되었다면 0, 되었다면 insert된 행의 개수 
	 */
	public int insertManager(Manager manager) {
		return sqlsession.insert("managerMapper.insertManager", manager);
	}
	
	/**
	 * 운영자 계정 수정 _ 휴대폰만 수정
	 * @param managerstore
	 * @return update 안되었다면 0, 되었다면 update된 행의 개수
	 */
	public int updateManager(String email, String tel) {
		HashMap<String,Object> updateManager = new HashMap<>();
		updateManager.put("email", email);
		updateManager.put("tel", tel);
		return sqlsession.update("managerMapper.updateManager", updateManager);
	}
	
	/**
	 * 운영자 계정 삭제
	 * @param email
	 * @return delete 안되었다면 0, 되었다면 delete된 행의 개수
	 */
	public int deleteManager(String email) {
		return sqlsession.delete("managerMapper.deleteManager", email);
	}
	
}
