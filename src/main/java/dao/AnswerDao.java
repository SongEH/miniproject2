package dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import vo.AnswerVo;

public class AnswerDao {

	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public List<AnswerVo> seletList(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("answer.answer_list", b_idx);
	}


	public int insert(AnswerVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("answer.answer_insert", vo);
	}


	public int delete(int a_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("answer.answer_delete", a_idx);
	}


	public AnswerVo selectOne(int a_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("answer.answer_list_one", a_idx);
	}


	public int update(AnswerVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("answer.answer_update", vo);
	}


	public List<AnswerVo> seletList(Optional<Integer> b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("answer.answer_list_int", b_idx);
	}


	
}
