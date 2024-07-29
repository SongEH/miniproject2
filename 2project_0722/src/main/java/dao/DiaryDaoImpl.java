package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FeedingVo;
import vo.HealthVo;
import vo.NoteVo;
import vo.StollVo;
import vo.WeightVo;


@Repository //component이구나 알고 자동 생성한다. 
public class DiaryDaoImpl implements DiaryDao {

	public DiaryDaoImpl() {
		System.out.println("--DiaryDaoImpl()--");
		// 자동 생성하는지 확인 위해서
	}
	
	@Autowired
	SqlSession sqlSession;
	
	String now_date = "2024-07-26";
	
	@Override
	public List<WeightVo> selectList_weight() {
		
		return sqlSession.selectList("diary.diary_list_weight", now_date);
	}

	@Override
	public int diary_insert_weight(WeightVo vo) {
		return sqlSession.insert("diary.diary_insert_weight", vo);
	}

	@Override
	public int diary_insert_stoll(StollVo vo) {
		return sqlSession.insert("diary.diary_insert_stoll", vo);
	}

	@Override
	public int diary_insert_feeding(FeedingVo vo) {
		return sqlSession.insert("diary.diary_insert_feeding", vo);
	}

	@Override
	public int diary_insert_health(HealthVo vo) {
		return sqlSession.insert("diary.diary_insert_health", vo);
	}

	@Override
	public int diary_insert_note(NoteVo vo) {
		return sqlSession.insert("diary.diary_insert_note", vo);
	}
	
	@Override
	public List<WeightVo> diary_select_weight_date(String date) {
		return sqlSession.selectList("diary.diary_select_weight_date", date);
	}

	
	
	@Override
	public WeightVo selectOne_weight(int w_idx) {
		return sqlSession.selectOne("diary.diary_select_one_weight", w_idx);
	}
	

	// 상세보기 합침 
	@Override
    public Map<String, Object> selectOne(String table_name, int idx) {
        Map<String, Object> map = new HashMap<>();
        map.put("table_name", table_name);
        map.put("idx", idx);

        return sqlSession.selectOne("diary.diary_select_one", map);
    }
	


	@Override
	public int update_weight(WeightVo vo) {
		return sqlSession.update("diary.diary_update_weight", vo);
	}
	
	// 수정 합침 
	@Override
    public int diary_update(String table_name, Map<String, Object> params) {
        params.put("table_name", table_name);
        return sqlSession.update("diary.diary_update_" + table_name, params);
    }

	/* @Override
	public int diary_delete_weight(int w_idx) {
		return sqlSession.delete("diary.diary_delete_weight", w_idx);
	} */
	
	@Override
	public int diary_delete_weight(Map<String, Object> map ) {
		return sqlSession.delete("diary.diary_delete_weight", map);
	}

	@Override
	public List<StollVo> diary_select_stoll_date(String date) {
		return sqlSession.selectList("diary.diary_select_stoll_date", date);
	}

	@Override
	public List<FeedingVo> diary_select_feeding_date(String date) {
		return sqlSession.selectList("diary.diary_select_feeding_date", date);
		
	}

	@Override
	public List<HealthVo> diary_select_health_date(String date) {
		return sqlSession.selectList("diary.diary_select_health_date", date);
	}

	@Override
	public List<NoteVo> diary_select_note_date(String date) {
		return sqlSession.selectList("diary.diary_select_note_date", date);
	}




	

}
