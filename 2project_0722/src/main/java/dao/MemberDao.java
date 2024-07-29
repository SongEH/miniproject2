package dao;

import java.util.List;

import vo.MemberVo;


public interface MemberDao{

	List<MemberVo> selectList();	//회원 리스트 조회
	
	MemberVo selectOne(int m_idx);	//m_idx에 대한 1건의 정보 조회
	
	MemberVo selectName(String m_nickname);	//m_nickname에 대한 1건의 정보를 조회
	
	MemberVo selectOne(String m_email);		//m_email에 대한 1건의 정보 조회
	
	int insert (MemberVo vo);

	int delete(int mem_idx);
	
	int update(MemberVo vo);

}
