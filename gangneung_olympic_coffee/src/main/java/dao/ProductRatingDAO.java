package dao;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ProductRating;
import oracle.sql.TIMESTAMP;


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
		return sqlSession.selectList("productRatingMapper.selectProductRating");
	}
	
	/**
	 * 특정 가게에 관한 평가만 가지고 옴
	 * @param productRating 언어 코드와 가게 id를 가지고 있는 productRating DTO 객체
	 * @return 특정 id의 가게 평가 리스트
	 */
	public List<ProductRating> selectAllProductRatingById(ProductRating productRating) {
		return sqlSession.selectList("productRatingMapper.selectProductRatingById",productRating);
	}
	
	/**
	 * 특정 가게에 관한 평가를 정리하여 가지고 옴
	 * @param productRating 언어 코드와 가게 id를 가지고 있는 productRating DTO 객체
	 * @return 정리된 특정 id의 가게 평가 리스트
	 */
	public List<Map<String,Object>> selectAllProductRatingJoinById(ProductRating productRating) {
		List<Map<String,Object>> list = sqlSession.selectList("productRatingMapper.selectProductRatingJoinById",productRating);
		//타임스탬프 타입을 long 타입으로 변경
		if(list!=null)
			list.forEach(t->{
				try {
					t.put("RATDATE",((TIMESTAMP)t.get("RATDATE")).dateValue().getTime());
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
	public int selectProductRaingByRatNum(String email) {
		return sqlSession.selectOne("productRatingMapper.selectProductRaingByRatNum",email);
	}
	
	/**
	 * 사용자의 평가를 입력 함
	 * @param productRating 사용자의 평가 DTO
	 * @return 입력이 실패하면 0을 입력이 성공하면 1을 리턴
	 */
	public int insertProductRating(ProductRating productRating) {
		return sqlSession.insert("productRatingMapper.insertProduct",productRating);
	}
	
	/**
	 * 사용자의 평가를 수정함
	 * @param productRating 사용자의 평가 DTO
	 * @return 수정에 실패하면 0을 수정에 성공하면 1을 리턴
	 */
	public int updateProductRating(ProductRating productRating) {
		return sqlSession.update("productRatingMapper.updateProduct",productRating);
	}
	
	/**
	 * 사용자의 평가를 삭제 함
	 * @param productRating 언어 코드와 가게 id를 가지고 있는 productRating DTO 객체
	 * @return 삭제에 실패하면 0을 삭제를 성공하면 1을 리턴
	 */
	public int deleteProductRating(ProductRating productRating) {
		return sqlSession.delete("productRatingMapper.deleteProduct",productRating);
	}

}
