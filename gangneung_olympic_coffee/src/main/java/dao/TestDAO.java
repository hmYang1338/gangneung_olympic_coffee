package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Test;

@Repository
public class TestDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Test> selectAllTest(){
		return sqlSession.selectList("testMapper.selectTest");
	}
	
}
