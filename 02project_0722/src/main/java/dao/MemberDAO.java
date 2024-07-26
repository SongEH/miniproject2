package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
