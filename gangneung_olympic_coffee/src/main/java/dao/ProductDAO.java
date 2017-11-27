package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Product;


/**
 * 물품 목록을 리턴하는 DAO 클레스
 * @author 신승엽
 *
 */
@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Product> getProductSelectMap(int lanCode){
		return sqlSession.selectList("productMapper.selectProduct",lanCode);
	}
	
	public List<Product> getProductSelectById(int id, int lanCode){
		HashMap<String,Object> data = new HashMap<>();
		data.put("id", id);
		data.put("lanCode", lanCode);
		return sqlSession.selectList("productMapper.selectProductById",data);
	}
}
