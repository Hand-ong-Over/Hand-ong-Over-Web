package edu.handong.handongover.board;

import java.util.List;

public interface BoardService {
    public int insertFindPerson(FindPersonVO vo);
    public int updateFindPerson(FindPersonVO vo);
    public int deleteFindPerson(int article_id);
    public FindPersonVO getFindPerson(int article_id);
    public List<FindPersonVO> getFindPersonList();
    public int insertFindRoom(FindRoomVO vo);
    public int updateFindRoom(FindRoomVO vo);
    public int deleteFindRoom(int seq);
    public FindRoomVO getFindRoom(int seq);
    public List<FindRoomVO> getFindRoomList();
}
