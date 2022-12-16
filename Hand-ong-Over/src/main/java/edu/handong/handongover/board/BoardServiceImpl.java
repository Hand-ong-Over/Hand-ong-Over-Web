package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    FindPersonDAO findPersonDAO;
    @Autowired
    FindRoomDAO findRoomDAO;

    public void setFindPersonDAO(FindPersonDAO findPersonDAO) {
        this.findPersonDAO = findPersonDAO;
    }
    @Override
    public int insertFindPerson(FindPersonVO vo) {
        return findPersonDAO.insertFindPerson(vo);
    }
    @Override
    public int deleteFindPerson(int seq) {
        return findPersonDAO.deleteFindPerson(seq);
    }
    @Override
    public int updateFindPerson(FindPersonVO vo) {
        return findPersonDAO.updateFindPerson(vo);
    }
    @Override
    public FindPersonVO getFindPerson(int seq) {
        return findPersonDAO.getFindPerson(seq);
    }
    @Override
    public List<FindPersonVO> getFindPersonList() {
        return findPersonDAO.getFindPersonList();
    }

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
