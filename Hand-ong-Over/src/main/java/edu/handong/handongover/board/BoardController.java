package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardServiceImpl boardService;

    public void setBoardService(BoardServiceImpl boardService) {
        this.boardService = boardService;
    }

    // FindPerson
    @RequestMapping(value = "/findperson", method= RequestMethod.GET)
    public String findPersonList(Model model, HttpSession session) {
        model.addAttribute("findPersonList", boardService.getFindPersonList());
        model.addAttribute("user", session.getAttribute("login"));
        return "listfindperson";
    }

    @RequestMapping(value = "/findperson/add", method= RequestMethod.GET)
    public String addFindPerson() {
        return "addfindperson";
    }

    @RequestMapping(value = "/findperson/addok", method= RequestMethod.POST)
    public String addFindPersonOk(FindPersonVO vo) {
        if (boardService.insertFindPerson(vo) == 0) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공");
        }
        return "redirect:/board/findperson";
    }

    @RequestMapping(value = "/findperson/editform/{id}", method= RequestMethod.GET)
    public String editFindPerson(@PathVariable("id") int id, Model model) {
        FindPersonVO findPersonVO = boardService.getFindPerson(id);
        model.addAttribute("findPersonVO", findPersonVO);
        return "editfindperson";
    }

    @RequestMapping(value = "/findperson/editok", method= RequestMethod.POST)
    public String editFindPersonOk(FindPersonVO vo) {
        if (boardService.updateFindPerson(vo) == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공");
        }
        return "redirect:/board/findperson";
    }

    @RequestMapping(value = "/findperson/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindPerson(@PathVariable("id") int id) {
        if (boardService.deleteFindPerson(id) == 0) {
            System.out.println("데이터 삭제 실패");
        } else {
            System.out.println("데이터 삭제 성공");
        }
        return "redirect:/board/findperson";
    }

    // FindRoom
    @RequestMapping(value = "/findroom", method= RequestMethod.GET)
    public String findRoomList(Model model, HttpSession session) {
        model.addAttribute("findRoomList", boardService.getFindRoomList());
        model.addAttribute("user", session.getAttribute("login"));
        return "listfindroom";
    }

    @RequestMapping(value = "/findroom/add", method= RequestMethod.GET)
    public String addFindRoom() {
        return "addfindroom";
    }

    @RequestMapping(value = "/findroom/addok", method= RequestMethod.POST)
    public String addFindRoomOk(FindRoomVO vo) {
        if (boardService.insertFindRoom(vo) == 0) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공");
        }
        return "redirect:/board/findroom";
    }

    @RequestMapping(value = "/findroom/editform/{id}", method= RequestMethod.GET)
    public String editFindRoom(@PathVariable("id") int id, Model model) {
        FindRoomVO findRoomVO = boardService.getFindRoom(id);
        model.addAttribute("findRoomVO", findRoomVO);
        return "editfindroom";
    }

    @RequestMapping(value = "/findroom/editok", method= RequestMethod.POST)
    public String editFindRoomOk(FindRoomVO vo) {
        if (boardService.updateFindRoom(vo) == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공");
        }
        return "redirect:/board/findroom";
    }

    @RequestMapping(value = "/findroom/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindRoom(@PathVariable("id") int id) {
        if (boardService.deleteFindRoom(id) == 0) {
            System.out.println("데이터 삭제 실패");
        } else {
            System.out.println("데이터 삭제 성공");
        }
        return "redirect:/board/findroom";
    }
}