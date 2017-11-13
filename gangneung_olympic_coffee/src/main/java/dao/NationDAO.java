package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Nation;

/**
 * 국가를 관리하는 DAO 객체
 * @author 정태준
 *
 */
@Repository
public class NationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 모든 국가 목록 리스트를 받아옴
	 * @return 모든 국가 목록
	 */
	public List<Nation> selectNation(){
		return sqlSession.selectList("nationMapper.selectNation");
	}
	
	/**
	 * 국가 Code를 받아와 해당 국가의 정보를 출력함
	 * @param nationCode
	 * @return 해당 국가의 정보
	 */
	public List<Nation> selectNationByCode(int nationCode){
		return sqlSession.selectOne("nationMapper.selectNationByCode",nationCode);
	}
}
