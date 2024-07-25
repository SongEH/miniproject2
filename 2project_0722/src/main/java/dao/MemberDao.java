<<<<<<< HEAD
package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {

	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberVo selectOne(String mem_id) {

		return sqlSession.selectOne("member.member_one_id", mem_id);
	
	}
}
=======
package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {

	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberVo selectOne(String mem_id) {

		return sqlSession.selectOne("member.member_one_id", mem_id);
	
	}
}
>>>>>>> refs/remotes/origin/CheonTk's-Branch
