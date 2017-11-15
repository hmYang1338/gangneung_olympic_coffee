package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.StoreRating;

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
