package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.StoreFavorite;

/**
 * 가게 즐겨찾기 DAO 객체
 * @author 정태준
 *
 */
@Repository
public class StoreFavoriteDAO {
	@Autowired
	private SqlSession sqlSession;
	

	public List<StoreFavorite> selectStoreFavorite(String email){
		return sqlSession.selectList("storeFavoriteMapper.selectStoreFavorite",email);
	}
	
	/**
	 * 해당 email에 있는 가장 큰 favNum값 가져오기
	 * @param email 접속되어 있는 email
	 * @return 해당 email에 있는 가장 큰 favNum값을 가져옴
	 */
	public int selectStoreFavoriteByNum(String email) {
		int maxNum;
		try {
			maxNum = sqlSession.selectOne("storeFavoriteMapper.selectStoreFavoriteByNum",email);
		}catch(NullPointerException e) {
			maxNum = 0;
		}
		return maxNum;
	}
	
	/**
	 * 가게 즐겨찾기 추가
	 * @param storeFavorite
	 * @return insert 안되었다면 0, 되었다면 1(추가)
	 */
	public int insertStoreFavorite(StoreFavorite storeFavorite) {
		return sqlSession.insert("storeFavoriteMapper.insertStoreFavorite",storeFavorite);
	}
	
	/**
	 * 가게 즐겨찾기 삭제
	 * @param favNum
	 * @return delete 안되었다면 0, 되었다면 1(삭제)
	 */
	public int deleteStoreFavorite(int favNum) {
		return sqlSession.delete("storeFavoriteMapper.deleteStoreFavorite",favNum);
	}
}
