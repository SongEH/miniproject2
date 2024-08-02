package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PetVO;

@Repository
public class PetDAO {
    
    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    private static final String NAMESPACE = "mapper.PetMapper";
    
    public List<PetVO> getAllPets() {
        return sqlSession.selectList(NAMESPACE + ".getAllPets");
    }
    
    public PetVO getPetById(int p_idx) {
        return sqlSession.selectOne(NAMESPACE + ".getPetById", p_idx);
    }
    
    public List<PetVO> getPetsByMemberId(int m_idx) {
        return sqlSession.selectList(NAMESPACE + ".getPetsByMemberId", m_idx);
    }

    public void insertPet(PetVO pet) {
        sqlSession.insert(NAMESPACE + ".insertPet", pet);
    }

    public void updatePet(PetVO pet) {
        sqlSession.update(NAMESPACE + ".updatePet", pet);
    }

    public void deletePet(int p_idx) {
        sqlSession.delete(NAMESPACE + ".deletePet", p_idx);
    }
    
    public void updatePetPhoto(Map<String, Object> params) {
        sqlSession.update(NAMESPACE + ".updatePetPhoto", params);
    }
    
    public List<PetVO> getPetsWithPaging(int offset, int limit, String searchKeyword) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("searchKeyword", searchKeyword != null ? searchKeyword : "");
        return sqlSession.selectList(NAMESPACE + ".getPetsWithPaging", params);
    }

    public int getPetCount(String searchKeyword) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchKeyword", searchKeyword != null ? searchKeyword : "");
        return sqlSession.selectOne(NAMESPACE + ".getPetCount", params);
    }
    
	public String getPetNameById(int p_idx) {
		return sqlSession.selectOne(NAMESPACE + ".getPetNameById", p_idx);
	}
}
