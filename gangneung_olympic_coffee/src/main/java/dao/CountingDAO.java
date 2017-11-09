package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Counting;

/**
 * 사용자의 방문 기록에 따라서 카운팅 하는 클래스
 * @author 신승엽
 *
 */
@Repository
public class CountingDAO {
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 사용자의 방문 기록을 데이터베이스로 실시간으로 저장함
	 * 직접 컨트롤러에서 호출 가능하며, 같은 기능을 프로시저로 구현 가능할 듯
	 * 
	 * @param counting 사용자의 이용기록 DTO를 받아옴.
	 */
	public void insertCounting(Counting counting) {
		sqlSession.insert("countingMapper.insertCounting",counting);
	}
}
