package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FindRoomController {

    @Autowired
    FindRoomServiceImpl FindRoomService;

    @RequestMapping(value = "/findroom", method= RequestMethod.GET)
    public String findRoomList(Model model, HttpSession session) {
        model.addAttribute("findRoomList", FindRoomService.getFindRoomList());
        model.addAttribute("user", session.getAttribute("login"));
//        return "listfindroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/{id}", method= RequestMethod.GET)
    public String findRoomDetail(@PathVariable int id, Model model, HttpSession session) {
        model.addAttribute("findRoom", FindRoomService.getFindRoom(id));
        model.addAttribute("user", session.getAttribute("login"));
//        return "detailfindroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/add", method= RequestMethod.GET)
    public String addFindRoom() {
//        return "addfindroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/addok", method= RequestMethod.POST)
    public String addFindRoomOk(FindRoomVO vo) {
        if (FindRoomService.insertFindRoom(vo) == 0) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공");
        }
//        return "redirect:/board/findroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/editform/{id}", method= RequestMethod.GET)
    public String editFindRoom(@PathVariable("id") int id, Model model) {
        FindRoomVO findRoomVO = FindRoomService.getFindRoom(id);
        model.addAttribute("findRoomVO", findRoomVO);
//        return "editfindroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/editok", method= RequestMethod.POST)
    public String editFindRoomOk(FindRoomVO vo) {
        if (FindRoomService.updateFindRoom(vo) == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공");
        }
//        return "redirect:/findroom";
        return "developingPage";
    }

    @RequestMapping(value = "/findroom/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindRoom(@PathVariable("id") int id) {
        if (FindRoomService.deleteFindRoom(id) == 0) {
            System.out.println("데이터 삭제 실패");
        } else {
            System.out.println("데이터 삭제 성공");
        }
//        return "redirect:/findroom";
        return "developingPage";
    }
}