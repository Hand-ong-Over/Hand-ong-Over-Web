package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindRoomServiceImpl implements FindRoomService {
    @Autowired
    FindRoomDAO findRoomDAO;

    public void setFindRoomDAO(FindRoomDAO findRoomDAO) {
        this.findRoomDAO = findRoomDAO;
    }
    @Override
    public int insertFindRoom(FindRoomVO vo) {
        return findRoomDAO.insertFindRoom(vo);
    }
    @Override
    public int deleteFindRoom(int seq) {
        return findRoomDAO.deleteFindRoom(seq);
    }
    @Override
    public int updateFindRoom(FindRoomVO vo) {
        return findRoomDAO.updateFindRoom(vo);
    }
    @Override
    public FindRoomVO getFindRoom(int seq) {
        return findRoomDAO.getFindRoom(seq);
    }
    @Override
    public List<FindRoomVO> getFindRoomList() {
        return findRoomDAO.getFindRoomList();
    }
}
