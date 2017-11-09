package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ProductRating;


/**
 * 사용자가 입력한 음료수에 대한 평가 정보를 관리하는 클래스
 * @author 신승엽
 */
@Repository
public class ProductRatingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 모든 사용자의 평가를 가지고 옴
	 * @return 사용자가 입력한 모든 평가 리스트
	 */
	public List<ProductRating> selectAllProductRating() {
		return sqlSession.selectList("productMapper.selectProductRating");
	}
	
	/**
	 * 특정 가게에 관한 평가만 가지고 옴
	 * @param productRating 언어 코드와 가게 id를 가지고 있는 productRating DTO 객체
	 * @return 특정 id의 가게 평가 리스트
	 */
	public List<ProductRating> selectAllProductRatingById(ProductRating productRating) {
		return sqlSession.selectList("productMapper.selectProductRatingById",productRating);
	}
	
	/**
	 * 사용자의 평가를 입력 함
	 * @param productRating 사용자의 평가 DTO
	 * @return 입력이 실패하면 0을 입력이 성공하면 1을 리턴
	 */
	public int insertProductRating(ProductRating productRating) {
		return sqlSession.insert("productMapper.insertProduct",productRating);
	}
	
	/**
	 * 사용자의 평가를 수정함
	 * @param productRating 사용자의 평가 DTO
	 * @return 수정에 실패하면 0을 수정에 성공하면 1을 리턴
	 */
	public int updateProductRating(ProductRating productRating) {
		return sqlSession.update("productMapper.updateProduct",productRating);
	}
	
	/**
	 * 사용자의 평가를 삭제 함
	 * @param productRating 언어 코드와 가게 id를 가지고 있는 productRating DTO 객체
	 * @return 삭제에 실패하면 0을 삭제를 성공하면 1을 리턴
	 */
	public int deleteProductRating(ProductRating productRating) {
		return sqlSession.delete("productMapper.deleteProduct",productRating);
	}

}
