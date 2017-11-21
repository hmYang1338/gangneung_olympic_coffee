package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Manager;
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
	 * @param 사용자의 언어코드를 받아 옴
	 * @return 모든 가게 목록
	 */
	public List<Store> getStoreSelectMap(int lanCode){
		return sqlSession.selectList("storeMapper.selectStore",lanCode);
	}
	/**
	 * 모든 가게 목록 리스트를 받아옴(추천인 평가 포함)
	 * @param lanCode 사용자의 언어 코드를 받아 옴
	 * @return 모든 가게 목록
	 */
	public List<HashMap<String,Object>> getStoreSelectHashMap(int lanCode){
		return sqlSession.selectList("storeMapper.selectStoreAndRating",lanCode);
	}
	/**
	 * 사용자의 GPS 정보를 받아와 근처의 커피숍을 리턴함
	 * @param userGPS 사용자의 GPS x,y 좌표 값 그리고 언어 값
	 * @return 가까운 거리로 정렬된 가게리스트
	 */
	public List<HashMap<String,Object>> getStoreSelectMapByDistance(UserGPS userGPS){
		return sqlSession.selectList("storeMapper.selectStoreByDistanceAndRating",userGPS);
	}
	
	public List<HashMap<String,Object>> getStoreSelectByName(String name, int lanCode){
		HashMap<String,Object> data = new HashMap<>();
		data.put("name", name);
		data.put("lanCode", lanCode);
		return sqlSession.selectList("storeMapper.selectStoreByName",data);
	}
	
	/**
	 * 가게 id를 받아와 해당 가게의 정보를 출력함
	 * @param id 가게의 id
	 * @return 해당 가게의 정보
	 */
	public Store getStoreSelectById(int id, int lanCode){
		HashMap<String,Object> data = new HashMap<>();
		data.put("id", id);
		data.put("lanCode", lanCode);
		return sqlSession.selectOne("storeMapper.selectStoreById",data);
	}
	
	/* 관리자_카페 정보 통합관리 @author 양현모 */
	/**
	 * 카페 정보 입력
	 * @param manager
	 * @return insert 안되었다면 0, 되었다면 insert된 행의 개수 
	 */
	public int insertStore(Store store) {
		return sqlSession.insert("storeMapper.insertStore", store);
	}
	
	/**
	 * 카페 정보 수정
	 * @param managerstore
	 * @return update 안되었다면 0, 되었다면 update된 행의 개수
	 */
	public int updateStore(int id, String tel) {
		HashMap<String,Object> updateStore = new HashMap<>();
		updateStore.put("id", id);
		updateStore.put("tel", tel);
		return sqlSession.update("storeMapper.updateStore", updateStore);
	}
	
	
	/**
	 * 카페 정보 삭제
	 * @param email
	 * @return delete 안되었다면 0, 되었다면 delete된 행의 개수
	 */
	public int deleteStore(int id) {
		return sqlSession.delete("storeMapper.deleteStore", id);
	}
	
	/***********************************************************************/
}