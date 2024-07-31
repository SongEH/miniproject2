package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAO {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public int getTotalMembers() {
        Integer result = sqlSession.selectOne("statistics.selectTotalMembers");
        return result != null ? result : 0;
    }

    public List<Map<String, Object>> getMembersByRegion() {
        return sqlSession.selectList("statistics.selectMembersByRegion");
    }

    public int getTotalPets() {
        Integer result = sqlSession.selectOne("statistics.selectTotalPets");
        return result != null ? result : 0;
    }

    public double getAveragePetsPerMember() {
        Double result = sqlSession.selectOne("statistics.selectAveragePetsPerMember");
        return result != null ? result : 0.0;
    }

    public List<Map<String, Object>> getPetsByBreed() {
        return sqlSession.selectList("statistics.selectPetsByBreed");
    }

    public List<Map<String, Object>> getPValueStatistics() {
        return sqlSession.selectList("statistics.getPValueStatistics");
    }
}
