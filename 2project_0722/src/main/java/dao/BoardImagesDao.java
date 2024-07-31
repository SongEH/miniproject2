package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardImagesVo;

public class BoardImagesDao {

	SqlSession sqlSession;	//SqlSessionTemplate의 interface 

	//Setter Injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert_board_images(BoardImagesVo ivo) {
		System.out.println("----postimagedao-----");
		return sqlSession.insert("board.board_insert_images", ivo);
	}

	public List<BoardImagesVo> selectlist(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board_image_list", b_idx);
	}


	
}
