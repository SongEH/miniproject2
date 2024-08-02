package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.TooManyResultsException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;
import vo.PetVO;

@Repository
public class MemberDAO {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<MemberVO> getAllMembers() {
        return sqlSession.selectList("member.selectAll");
    }

    public MemberVO getMemberById(int m_idx) {
        return sqlSession.selectOne("member.selectById", m_idx);
    }
    
    public void updateMember(MemberVO member) {
        sqlSession.update("member.updateMember", member);
    }

    public void deleteMember(int m_idx) {
        sqlSession.delete("member.deleteById", m_idx);
    }
    
    public List<MemberVO> getMembersWithPaging(int offset, int limit, String searchKeyword, String gradeFilter, String yearFilter) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("searchKeyword", searchKeyword);
        params.put("gradeFilter", gradeFilter);
        params.put("yearFilter", yearFilter);
        return sqlSession.selectList("member.selectWithPagingAndFilters", params);
    }
    
    public int getMemberCount(String searchKeyword, String gradeFilter, String yearFilter) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchKeyword", searchKeyword);
        params.put("gradeFilter", gradeFilter);
        params.put("yearFilter", yearFilter);
        return sqlSession.selectOne("member.selectMemberCountWithFilters", params);
    }
    
    public List<PetVO> getPetsByMemberId(int m_idx) {
        return sqlSession.selectList("pet.selectByMemberId", m_idx);
    }
    
    public void updateMemberForUser(MemberVO member) {
        sqlSession.update("member.updateMemberForUser", member);
    }
    
    public void insertMember(MemberVO member) {
        sqlSession.insert("member.insertMember", member);
    }
    
	public int insert(MemberVO vo) {
		return sqlSession.insert("member.member_insert", vo);
	}
	
	public MemberVO selectName(String m_nickname) {
	    List<MemberVO> members = sqlSession.selectList("member.member_one_nickname", m_nickname);
	    if (members.size() == 1) {
	        return members.get(0);
	    } else if (members.isEmpty()) {
	        return null;
	    } else {
	        throw new TooManyResultsException("Expected one result (or null) to be returned by selectOne(), but found: " + members.size());
	    }
	}
	
	public MemberVO selectOne(String m_email) {
		return sqlSession.selectOne("member.member_one_email", m_email);
	}
}
