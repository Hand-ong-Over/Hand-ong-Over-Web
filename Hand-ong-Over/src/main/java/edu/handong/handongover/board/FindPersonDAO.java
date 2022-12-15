package edu.handong.handongover.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FindPersonDAO {
    @Autowired
    SqlSession sqlSession;

    public int insertFindPerson(FindPersonVO vo) {
        return sqlSession.insert("FindPerson.insertFindPerson", vo);
    }
    public int deleteFindPerson(int seq) {
        return sqlSession.delete("FindPerson.deleteFindPerson", seq);
    }
    public int updateFindPerson(FindPersonVO vo) {
        return sqlSession.update("FindPerson.updateFindPerson", vo);
    }
    public FindPersonVO getFindPerson(int seq) {
        return sqlSession.selectOne("FindPerson.getFindPerson", seq);
    }
    public List<FindPersonVO> getFindPersonList() {
        return sqlSession.selectList("FindPerson.getFindPersonList");
    }


}
