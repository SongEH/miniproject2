package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CommentVo;
import vo.ReplyVo;

public class CommentDao {

	
	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ReplyVo> select_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmt.cmt_list", map);
	}

	public int selectRowTotal(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cmt.cmt_row_total", b_idx);
	}

	public List<CommentVo> select_list(int cmt_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmt.cmt_reply_list", cmt_idx);
	}

	public int insert(CommentVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cmt.cmt_insert", vo);
	}

	public int delete(int cmt_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cmt.cmt_delelte", cmt_idx);
	}
	
	
}
