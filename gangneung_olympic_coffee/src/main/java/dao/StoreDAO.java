package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Store;
import dto.UserGPS;

/**
 * 가게를 관리하는 DAO 객체
 * @author 신승엽
 *
 */
@Repository
public class StoreDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 모든 가게 목록 리스트를 받아옴
	 * @return 모든 가게 목록
	 */
	public List<Store> getStoreSelectMap(){
		return sqlSession.selectList("storeMapper.selectStore");
	}
	/**
	 * 사용자의 GPS 정보를 받아와 근처의 커피숍을 리턴함
	 * @param userGPS 사용자의 GPS x,y 좌표 값
	 * @return 근처의 가게 목록
	 */
	public List<Store> getStoreSelectMapByDistance(UserGPS userGPS){
		return sqlSession.selectList("storeMapper.selectStoreByDistance",userGPS);
	}
	
	/**
	 * 가게 id를 받아와 해당 가게의 정보를 출력함
	 * @param id 가게의 id
	 * @return 해당 가게의 정보
	 */
	public Store getStoreSelectById(int id){
		return sqlSession.selectOne("storeMapper.selectStoreById",id);
	}
	
}