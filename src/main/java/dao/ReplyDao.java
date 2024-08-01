package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReplyVo;


public class ReplyDao {

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}



	public List<ReplyVo> select_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.reply_list_page", map);
	}



	public int selectRowTotal(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reply.reply_row_total", b_idx);
	}



	public int insert(ReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reply.reply_insert", vo);
	}



	public int delete(int re_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reply.reply_delete", re_idx);
	}
	
    public List<ReplyVo> admin_select_list(Map<String, Object> map) {
        return sqlSession.selectList("reply.admin_reply_list_page", map);
    }

    public int admin_selectRowTotal(Map<String, Object> map) {
        return sqlSession.selectOne("reply.admin_reply_row_total");
    }

    public int admin_delete(int re_idx) {
        return sqlSession.delete("reply.admin_reply_delete", re_idx);
    }
	
}
