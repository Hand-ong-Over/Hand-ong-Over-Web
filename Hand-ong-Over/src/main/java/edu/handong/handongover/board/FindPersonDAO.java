package edu.handong.handongover.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

@Repository
public class FindPersonDAO {
    @Autowired
    SqlSession sqlSession;

    public FindPersonVO insertFindPerson(FindPersonVO vo) {
        sqlSession.insert("FindPerson.insertFindPerson", vo);
        return vo;
    }
    public int deleteFindPerson(int article_id) {
        return sqlSession.delete("FindPerson.deleteFindPerson", article_id);
    }
    public int updateFindPerson(FindPersonVO vo) {
        return sqlSession.update("FindPerson.updateFindPerson", vo);
    }
    public FindPersonVO getFindPerson(int article_id) {
        return sqlSession.selectOne("FindPerson.getFindPerson", article_id);
    }
    public List<FindPersonVO> getFindPersonList() {
        return sqlSession.selectList("FindPerson.getFindPersonList");
    }


}
