package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Language;

/**
 * 언어를 관리하는 DAO 객체
 * @author 정태준
 *
 */
@Repository
public class LanguageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 모든 언어 목록 리스트를 받아옴
	 * @return 모든 언어 목록
	 */
	public List<Language> selectLanguage(){
		return sqlSession.selectList("languageMapper.selectLanguage");
	}
	
	/**
	 * 언어 Code를 받아와 해당 언어의 정보를 출력함
	 * @param lanCode
	 * @return 해당 언어의 정보
	 */
	public List<Language> selectLaguageByCode(int lanCode){
		return sqlSession.selectOne("languageMapper.selectLanguageByCode",lanCode);
	}
}
