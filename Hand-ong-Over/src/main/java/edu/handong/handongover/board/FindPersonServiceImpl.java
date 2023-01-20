package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindPersonServiceImpl implements FindPersonService {
    @Autowired
    FindPersonDAO findPersonDAO;

    public void setFindPersonDAO(FindPersonDAO findPersonDAO) {
        this.findPersonDAO = findPersonDAO;
    }
    @Override
    public int insertFindPerson(FindPersonVO vo) {
        return findPersonDAO.insertFindPerson(vo);
    }
    @Override
    public int deleteFindPerson(int article_id) {
        return findPersonDAO.deleteFindPerson(article_id);
    }
    @Override
    public int updateFindPerson(FindPersonVO vo) {
        return findPersonDAO.updateFindPerson(vo);
    }
    @Override
    public FindPersonVO getFindPerson(int article_id) {
        return findPersonDAO.getFindPerson(article_id);
    }
    @Override
    public List<FindPersonVO> getFindPersonList() {
        return findPersonDAO.getFindPersonList();
    }
}
