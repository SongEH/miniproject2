package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.HealthVO;

@Repository
public class HealthDAO {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    private static final String NAMESPACE = "mapper.HealthMapper";
    
    public List<HealthVO> getAllHealthRecords() {
        return sqlSession.selectList(NAMESPACE + ".getAllHealthRecords");
    }

    public HealthVO getHealthRecordById(int h_idx) {
        return sqlSession.selectOne(NAMESPACE + ".getHealthRecordById", h_idx);
    }
    
    public void insertHealthRecord(HealthVO health) {
        sqlSession.insert(NAMESPACE + ".insertHealthRecord", health);
    }

    public void updateHealthRecord(HealthVO health) {
        sqlSession.update(NAMESPACE + ".updateHealthRecord", health);
    }

    public void deleteHealthRecord(int h_idx) {
        sqlSession.delete(NAMESPACE + ".deleteHealthRecord", h_idx);
    }

    public List<HealthVO> getHealthRecordsWithPaging(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".getHealthRecordsWithPaging", params);
    }

    public int getHealthRecordCount(Map<String, Object> params) {
        return sqlSession.selectOne(NAMESPACE + ".getHealthRecordCount", params);
    }
}
