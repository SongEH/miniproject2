package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

//@Repository("member_dao")
public class MemberDaoImpl implements MemberDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MemberVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.member_list");
	}

	@Override
	public MemberVo selectOne(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_idx", m_idx);
	}

	@Override
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_insert", vo);
	}

	@Override
	public int delete(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.member_delete", mem_idx);
	}

	@Override
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.member_update", vo);
	}

	@Override
	public MemberVo selectName(String m_nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_nickname", m_nickname);
	}

	@Override
	public MemberVo selectOne(String m_email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_email", m_email);
	}

}
