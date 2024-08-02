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
	/*
	public List<BoardVo> selectList(Map<String, Object> map){
		
		return sqlSession.selectList("board.board_list_page", map);
	}
	
/*-----------------------전체조회-----------------------   */

	
/*-----------------------전체조회 + 검색 -----------------------   */
	public List<BoardVo> selectList(Map<String, Object> map){
		
		return sqlSession.selectList("board.board_list_page_condition", map);
	}
/*-----------------------전체조회 + 검색 -----------------------   */	
	
	

/*-----------------------전체조회-----------------------   */
	public List<BoardVo> selectList() {
		return sqlSession.selectList("board.board_list");
	}
/*-----------------------전체조회-----------------------   */
	
	
/*-----------------------전체조회(카테고리구분)-----------------------   */
//	public List<BoardVo> selectList(String b_cate) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("board.board_list_b_cate", b_cate);
//	}
/*-----------------------전체조회(카테고리구분)-----------------------   */
	
	public List<BoardVo> selectList_b_cate(String b_cate) {
		return sqlSession.selectList("board.board_list_b_cate", b_cate);
	}
	
	
	
		
	public int insert(BoardVo vo) {
		
		return sqlSession.insert("board.board_insert", vo);
		
	}

	public int selectRowTotal(String b_cate) {
		
		return sqlSession.selectOne("board.board_row_total", b_cate);
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


	public int update_readhit(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update_readhit", b_idx);
	}


	public String select_get_content(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_select_content", b_idx);
	}


	public List<BoardVo> selectList(String b_cate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_select_main", b_cate);
	}

    public List<BoardVo> selectAdminList(Map<String, Object> map) {
        return sqlSession.selectList("board.admin_board_list_page", map);
    }
	
    public int selectAdminRowTotal(Map<String, Object> map) {
        return sqlSession.selectOne("board.admin_board_row_total", map);
    }

	


}
