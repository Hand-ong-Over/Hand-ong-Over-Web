package edu.handong.handongover.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/findperson/{id}", method= RequestMethod.GET)
    public String findPersonDetail(@PathVariable int id, Model model, HttpSession session) {
        model.addAttribute("findPerson", boardService.getFindPerson(id));
        model.addAttribute("user", session.getAttribute("login"));
        return "detailfindperson";
    }

    @RequestMapping(value = "/findperson/add", method= RequestMethod.GET)
    public String addFindPerson(Model model, HttpSession session) {
        model.addAttribute("user", session.getAttribute("login"));
        return "addfindperson";
    }

    @RequestMapping(value = "/findperson/addok", method= RequestMethod.POST)
    public String addFindPersonOk(HttpServletRequest request) {
        FindPersonFileUpload fileUpload = new FindPersonFileUpload();
        FindPersonVO vo = fileUpload.uploadPhoto(request);

        if (boardService.insertFindPerson(vo) == 0) {
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
        }
        return "redirect:/board/findperson";
    }

    @RequestMapping(value = "/findperson/editform/{id}", method= RequestMethod.GET)
    public String editFindPerson(@PathVariable("id") int id, Model model) {
        FindPersonVO findPersonVO = boardService.getFindPerson(id);
        FindPersonFileUpload fileUpload = new FindPersonFileUpload(findPersonVO);
        model.addAttribute("fileUpload", fileUpload);
        model.addAttribute("findPersonVO", findPersonVO);
        return "editfindperson";
    }

    @RequestMapping(value = "/findperson/editok", method= RequestMethod.POST)
    public String editFindPersonOk(HttpServletRequest request) {
        FindPersonFileUpload fileUpload = new FindPersonFileUpload();
        FindPersonVO vo = fileUpload.uploadPhoto(request);

        if (boardService.updateFindPerson(vo) == 0) {
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
        }
        return "redirect:/board/findperson";
    }

    @RequestMapping(value = "/findperson/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindPerson(@PathVariable("id") int id) {
        if (boardService.deleteFindPerson(id) == 0) {
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
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

    @RequestMapping(value = "/findroom/{id}", method= RequestMethod.GET)
    public String findRoomDetail(@PathVariable int id, Model model, HttpSession session) {
        model.addAttribute("findRoom", boardService.getFindRoom(id));
        model.addAttribute("user", session.getAttribute("login"));
        return "detailfindroom";
    }

    @RequestMapping(value = "/findroom/add", method= RequestMethod.GET)
    public String addFindRoom() {
        return "addfindroom";
    }

    @RequestMapping(value = "/findroom/addok", method= RequestMethod.POST)
    public String addFindRoomOk(FindRoomVO vo) {
        if (boardService.insertFindRoom(vo) == 0) {
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
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
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
        }
        return "redirect:/board/findroom";
    }

    @RequestMapping(value = "/findroom/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindRoom(@PathVariable("id") int id) {
        if (boardService.deleteFindRoom(id) == 0) {
            System.out.println("????????? ?????? ??????");
        } else {
            System.out.println("????????? ?????? ??????");
        }
        return "redirect:/board/findroom";
    }
}