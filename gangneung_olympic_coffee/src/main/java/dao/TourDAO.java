package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Tour;

/**
 * 
 * 관광지 목록을 나타내는 DAO
 * @author sinseung-yeob
 *
 */
@Repository
public class TourDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Tour> getStoreSelectMap(int lanCode){
		return sqlSession.selectList("tourMapper.selectTour",lanCode);
	}
	
	public Tour getTourSelectById(int id, int lanCode){
		HashMap<String,Object> data = new HashMap<>();
		data.put("id", id);
		data.put("lanCode", lanCode);
		return sqlSession.selectOne("tourMapper.selectTourById",data);
	}
}
