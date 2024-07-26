package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.BoardVO;

import java.util.List;

@Repository("boardDAO")
public class BoardDAO {

    private SqlSession sqlSession;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    private static final String NAMESPACE = "mapper.BoardMapper";

    public List<BoardVO> getAllBoards() {
        return sqlSession.selectList(NAMESPACE + ".getAllBoards");
    }

    public BoardVO getBoardById(int b_idx) {
        return sqlSession.selectOne(NAMESPACE + ".getBoardById", b_idx);
    }

    public void createBoard(BoardVO board) {
        sqlSession.insert(NAMESPACE + ".createBoard", board);
    }
}
