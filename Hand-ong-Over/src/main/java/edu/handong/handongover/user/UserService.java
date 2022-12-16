package edu.handong.handongover.user;

public interface UserService {
    UserVO getUser(UserVO vo);
    int insertUser(UserVO vo);
    int updateUser(UserVO vo);
    int deleteUser(UserVO vo);
}
