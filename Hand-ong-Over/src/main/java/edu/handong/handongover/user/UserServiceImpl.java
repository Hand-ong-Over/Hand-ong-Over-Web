package edu.handong.handongover.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO userDAO;

    @Override
    public UserVO getUser(UserVO vo) {
        return userDAO.getUser(vo);
    }

    @Override
    public int insertUser(UserVO vo) {
        return userDAO.insertUser(vo);
    }

    @Override
    public int updateUser(UserVO vo) {
        return userDAO.updateUser(vo);
    }

    @Override
    public int deleteUser(UserVO vo) {
        return userDAO.deleteUser(vo);
    }
}
