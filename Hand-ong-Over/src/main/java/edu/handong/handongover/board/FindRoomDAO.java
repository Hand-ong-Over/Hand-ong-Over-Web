package edu.handong.handongover.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FindRoomDAO {
    @Autowired
    SqlSession sqlSession;

    public int insertFindRoom(FindRoomVO vo) {
        return sqlSession.insert("FindRoom.insertFindRoom", vo);
    }
    public int deleteFindRoom(int seq) {
        return sqlSession.delete("FindRoom.deleteFindRoom", seq);
    }
    public int updateFindRoom(FindRoomVO vo) {
        return sqlSession.update("FindRoom.updateFindRoom", vo);
    }
    public FindRoomVO getFindRoom(int seq) {
        return sqlSession.selectOne("FindRoom.getFindRoom", seq);
    }
    public List<FindRoomVO> getFindRoomList() {
        return sqlSession.selectList("FindRoom.getFindRoomList");
    }
}
