package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.StoreRating;
import oracle.sql.TIMESTAMP;

/**
 * 사용자가 입력한 상점에 대한 평가 정보를 관리하는 클래스
 * @author 신승엽
 */
@Repository
public class StoreRatingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 모든 사용자의 평가를 가지고 옴
	 * @return 사용자가 입력한 모든 평가 리스트
	 */
	public List<StoreRating> selectAllStoreRating() {
		return sqlSession.selectList("storeRatingMapper.selectStoreRating");
	}
	
	/**
	 * 특정 상점에 관한 평가만 가지고 옴
	 * @param storeRating 언어 코드와 가게 id를 가지고 있는 StoreRating DTO 객체
	 * @return 특정 id의 상점 평가 리스트
	 */
	public List<StoreRating> selectAllStoreRatingById(StoreRating storeRating) {
		return sqlSession.selectList("storeRatingMapper.selectStoreRatingById",storeRating);
	}
	
	/**
	 * 특정 상점에 관한 평가를 이용자가 보기 편하게 조인 함
	 * @param storeRating 언어 코드와 가게 id를 가지고 있는 StoreRating DTO 객체
	 * @return 특정 id의 정리된 상점 평가 리스트
	 */
	public List<Map<String,Object>> selectAllStoreRatingJoinById(StoreRating storeRating) {
		List<Map<String,Object>> list = sqlSession.selectList("storeRatingMapper.selectStoreRatingJoinById",storeRating);
		//타임스탬프 타입을 long 타입으로 변경
		if (list != null)
			list.forEach(t -> {
				try {
					t.put("RATDATE", ((TIMESTAMP) t.get("RATDATE")).dateValue().getTime());
				} catch (SQLException e) {
					t.put("RATDATE", 0);
				}
			});
		return list;
	}
	
	/**
	 * 해당 email에 있는 가장 큰 ratNum값 가져오기
	 * @param email 접속되어 있는 email
	 * @return 해당 email에 있는 가장 큰 ratNum값을 가져옴
	 */
	public int selectStoreRaingByRatNum(String email) {
		int maxNum;
		try {
			maxNum = sqlSession.selectOne("storeRatingMapper.selectStoreRaingByRatNum",email);
		}catch(NullPointerException e) {
			maxNum = 0;
		}
		return maxNum;
	}

	/**
	 * 사용자의 평가를 입력 함
	 * @param storeRating 사용자의 평가 DTO
	 * @return 입력이 실패하면 0을 입력이 성공하면 1을 리턴
	 */
	public int insertStoreRating(StoreRating storeRating) {
		return sqlSession.insert("storeRatingMapper.insertStoreRating",storeRating);
	}
	
	
	/**
	 * 사용자의 평가를 수정함
	 * @param storeRating 사용자의 평가 DTO
	 * @return 수정에 실패하면 0을 수정에 성공하면 1을 리턴
	 */
	public int updateStoreRating(StoreRating storeRating) {
		return sqlSession.update("storeRatingMapper.updateStoreRating",storeRating);
	}
	
	/**
	 * 사용자의 평가를 삭제 함
	 * @param storeRating 언어 코드와 가게 id를 가지고 있는 StoreRating DTO 객체
	 * @return 삭제에 실패하면 0을 삭제를 성공하면 1을 리턴
	 */
	public int deleteStoreRating(StoreRating storeRating) {
		return sqlSession.delete("storeRatingMapper.deleteStoreRating",storeRating);
	}

}
