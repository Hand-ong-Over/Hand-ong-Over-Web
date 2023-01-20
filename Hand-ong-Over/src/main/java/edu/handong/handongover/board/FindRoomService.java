package edu.handong.handongover.board;

import java.util.List;

public interface FindRoomService {
    public int insertFindRoom(FindRoomVO vo);
    public int updateFindRoom(FindRoomVO vo);
    public int deleteFindRoom(int seq);
    public FindRoomVO getFindRoom(int seq);
    public List<FindRoomVO> getFindRoomList();
}
