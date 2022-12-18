package edu.handong.handongover.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public UserVO getUser(UserVO vo) {
        return sqlSession.selectOne("User.getUser", vo);
    }
    public int insertUser(UserVO vo) {
        return sqlSession.insert("User.insertUser", vo);
    }
    public int updateUser(UserVO vo) {
        return sqlSession.update("User.updateUser", vo);
    }
    public int deleteUser(UserVO vo) {
        return sqlSession.delete("User.deleteUser", vo);
    }
}
