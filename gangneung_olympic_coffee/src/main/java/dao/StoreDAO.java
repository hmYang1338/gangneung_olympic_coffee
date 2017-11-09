package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Store;

@Repository
public class StoreDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Store> getStoreSelectMap(){
		return sqlSession.selectList("storeRatingMapper.storeSelectMap");
	}
	
	public List<Store> getStoreSelectDistance(){
		return sqlSession.selectList("storeRatingMapper.selectStoreByDistance");
	}
	
}