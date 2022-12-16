package edu.handong.handongover.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public UserVO getUser(UserVO vo) {
        return sqlSession.selectOne("user.getUser", vo);
    }
    public int insertUser(UserVO vo) {
        return sqlSession.insert("user.insertUser", vo);
    }
    public int updateUser(UserVO vo) {
        return sqlSession.update("user.updateUser", vo);
    }
    public int deleteUser(UserVO vo) {
        return sqlSession.delete("user.deleteUser", vo);
    }
}
