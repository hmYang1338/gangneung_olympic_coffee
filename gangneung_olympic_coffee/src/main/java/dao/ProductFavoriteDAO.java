package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Member;
import dto.ProductFavorite;

/**
 * 제품 즐겨찾기 DAO 객체
 * @author 정태준
 *
 */
@Repository
public class ProductFavoriteDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductFavorite> selectProductFavoriteAll(String email) {
		return sqlSession.selectList("productFavoriteMapper.selectProductFavorite",email);
	}
	
	/**
	 * 해당 email에 있는 가장 큰 favNum값 가져오기
	 * @param email 접속되어 있는 email
	 * @return 해당 email에 있는 가장 큰 favNum값을 가져옴
	 */
	public int selectProductFavoriteByNum(String email) {
		int maxNum;
		try {
			maxNum = sqlSession.selectOne("productFavoriteMapper.selectProductFavoriteByNum",email);
		}catch(NullPointerException e) {
			maxNum = 0;
		}
		return maxNum;
	}
	
	/**
	 * 해당 email에 있는 가장 큰 favNum값 가져오기
	 * @param email 접속되어 있는 email
	 * @return 해당 email에 있는 가장 큰 favNum값을 가져옴
	 */
	public List<Map<String,Object>> selectProductFavoriteByEmail(Member member) {
		return sqlSession.selectList("productFavoriteMapper.selectStoreFavoriteByEmail",member);
	}
	
	/**
	 * 제품 즐겨찾기 추가
	 * @param productFavorite
	 * @return insert 안되었다면 0, 되었다면 1(추가)
	 */
	public int insertProductFavorite(ProductFavorite productFavorite) {
		return sqlSession.insert("productFavoriteMapper.insertProductFavorite", productFavorite);
	}
	
	/**
	 * 제품 즐겨찾기 삭제
	 * @param favNum
	 * @return delete 안되었다면 0, 되었다면 1(삭제)
	 */
	public int deleteProductFavorite(int favNum) {
		return sqlSession.delete("productFavoriteMapper.deleteProductFavorite",favNum);
	}
}
