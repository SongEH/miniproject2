package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.HealthVo;

@Repository
public class HealthDAO {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<HealthVo> getAllHealthRecords() {
        return sqlSession.selectList("health.getAllHealthRecords");
    }

    public HealthVo getHealthRecordById(int h_idx) {
        return sqlSession.selectOne("health.getHealthRecordById", h_idx);
    }
    
    public void insertHealthRecord(HealthVo health) {
        sqlSession.insert("health.insertHealthRecord", health);
    }

    public void updateHealthRecord(HealthVo health) {
        sqlSession.update("health.updateHealthRecord", health);
    }

    public void deleteHealthRecord(int h_idx) {
        sqlSession.delete("health.deleteHealthRecord", h_idx);
    }

    public List<HealthVo> getHealthRecordsWithPaging(Map<String, Object> params) {
        return sqlSession.selectList("health.getHealthRecordsWithPaging", params);
    }

    public int getHealthRecordCount(Map<String, Object> params) {
        return sqlSession.selectOne("health.getHealthRecordCount", params);
    }
}
