package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVo;


public class BoardDao {
	
	
	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
/*-----------------------전체조회-----------------------   */
	public List<BoardVo> selectList(Map<String, Object> map){
		
		return sqlSession.selectList("board.board_list_page", map);
	}
/*-----------------------전체조회-----------------------   */
	

/*-----------------------전체조회-----------------------   */
	public List<BoardVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_list_all");
	}
/*-----------------------전체조회-----------------------   */
	
	
/*-----------------------전체조회(카테고리구분)-----------------------   */
	public List<BoardVo> selectList(String b_cate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_list", b_cate);
	}
/*-----------------------전체조회(카테고리구분)-----------------------   */
	
	
		
	public int insert(BoardVo vo) {
		
		return sqlSession.insert("board.board_insert", vo);
		
	}

	public int selectRowTotal() {
		
		return sqlSession.selectOne("board.board_row_total");
	}


	public int select_get_b_idx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_get_b_idx");
	}


	public BoardVo selectOne(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_list_one", b_idx);
	}


	public int update(BoardVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update", vo);
	}


	public int delete(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.board_delete", b_idx);
	}


}


	




	


	

	

	





	

	

