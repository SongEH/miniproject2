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
		return sqlSession.selectList("reply.reply_list_page", map);
	}

	public int selectRowTotal(int b_idx) {
		return sqlSession.selectOne("reply.reply_row_total", b_idx);
	}

	public int insert(ReplyVo vo) {
		return sqlSession.insert("reply.reply_insert", vo);
	}

	public int delete(int re_idx) {
		return sqlSession.delete("reply.reply_delete", re_idx);
	}
	
	public ReplyVo selectOne(int re_idx) {
		return sqlSession.selectOne("reply.reply_modify_form", re_idx);
	}

	public int get_b_idx(int re_idx) {
		return sqlSession.selectOne("reply.reply_get_b_idx", re_idx);
	}

	public int update_re_idx(ReplyVo vo) {
		return sqlSession.update("reply.reply_update", vo);
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
