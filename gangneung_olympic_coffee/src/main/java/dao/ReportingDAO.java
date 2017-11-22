package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Reporting;

/**
 * 신고 테이블
 * @author hyunmoYang
 */
@Repository
public class ReportingDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 운영자가 신고하였을 때, 테이블에 저장함
	 * @param reporting
	 * @return 
	 */
	public int insertReport(Reporting reporting) {
		return sqlSession.insert("reportingMapper.insertReporting", reporting);
	}
	
	/**
	 * 신고삭제
	 * @param seq
	 * @return
	 */
	public int deleteReport(int seq) {
		return sqlSession.delete("reportingMapper.deleteReporting", seq);
	}
	
	/**
	 * 전체 신고건수 조회
	 * @return
	 */
	public List<Reporting> selectReporting() {
		return sqlSession.selectList("reportingMapper.selectReporting");
	}
	
	/**
	 * 해당 운영자에 대한 신고건수 조회
	 * @param seq, email
	 * @return
	 */
	public Reporting selectOneReportingByEmail(int seq, String email) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("seq", seq);
		data.put("email", email);
		return sqlSession.selectOne("reportingMapper.selectReportingByEmail", data);
	}
}
