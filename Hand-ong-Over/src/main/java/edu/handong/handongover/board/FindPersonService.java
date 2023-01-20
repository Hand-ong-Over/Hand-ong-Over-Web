package edu.handong.handongover.board;

import java.util.List;

public interface FindPersonService {
    public FindPersonVO insertFindPerson(FindPersonVO vo);
    public int updateFindPerson(FindPersonVO vo);
    public int deleteFindPerson(int article_id);
    public FindPersonVO getFindPerson(int article_id);
    public List<FindPersonVO> getFindPersonList();
}
