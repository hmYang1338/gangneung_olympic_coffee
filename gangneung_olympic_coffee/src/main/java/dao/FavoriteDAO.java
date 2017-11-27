package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Favorite;

/**
 * 즐겨찾기 DAO 객체
 * @author 정태준
 *
 */
@Repository
public class FavoriteDAO {
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 즐겨찾기 목록 리스트 받아옴
	 * @param 사용자의 언어코드를 받아
	 * @return 모든 즐겨찾기 목록
	 */
	public List<Favorite> selectFavoriteAll(int lanCode) {
		return sqlSession.selectList("favoriteMapper.selectFavorite",lanCode);
	}
	
	public int selectFavoriteByNum(String email) {
		int maxNum;
		try {
			maxNum = sqlSession.selectOne("favoriteMapper.selectFavoriteByNum",email);
		}catch(NullPointerException e) {
			maxNum = 0;
		}
		return maxNum;
	}
	
	/**
	 * 즐겨찾기 추가
	 * @param favorite
	 * @return insert 안되었다면 0, 되었다면 insert된 행의 개수
	 */
	public int insertFavorite(Favorite favorite) {
		return sqlSession.insert("favoriteMapper.insertFavorite", favorite);
	}
	
	/**
	 * 즐겨찾기 삭제
	 * @param favNum
	 * @return delete 안되었다면 0, 되었다면 삭제
	 */
	public int deleteFavorite(int favNum) {
		return sqlSession.delete("favoriteMapper.deleteFavorite",favNum);
	}
}
