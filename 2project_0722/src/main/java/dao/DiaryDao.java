package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import vo.FeedingVo;
import vo.HealthVo;
import vo.NoteVo;
import vo.StollVo;
import vo.WeightVo;

public interface DiaryDao {

	List<WeightVo> selectList_weight();

	int diary_insert_weight(WeightVo vo);

	// 특정 날짜의 체중 데이터를 조회하는 메서드
    List<WeightVo> diary_select_weight_date(String date);

	WeightVo selectOne_weight(int w_idx);

	int update_weight(WeightVo vo);

	// int diary_delete_weight(int w_idx);
	int diary_delete_weight(Map<String, Object> map);

	int diary_insert_stoll(StollVo vo);

	int diary_insert_feeding(FeedingVo vo);

	int diary_insert_health(HealthVo vo);

	int diary_insert_note(NoteVo vo);

	Map<String, Object> selectOne(String table_name, int idx);

	int diary_update(String table_name, Map<String, Object> params);

	List<StollVo> diary_select_stoll_date(String date);

	List<FeedingVo> diary_select_feeding_date(String date);

	List<HealthVo> diary_select_health_date(String date);

	List<NoteVo> diary_select_note_date(String date);

	
}
