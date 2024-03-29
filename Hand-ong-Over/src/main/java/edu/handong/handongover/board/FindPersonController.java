package edu.handong.handongover.board;

import edu.handong.handongover.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FindPersonController {

    @Autowired
    FindPersonServiceImpl findPersonService;

    // FindPerson
    @RequestMapping(value = "/findperson", method= RequestMethod.GET)
    public String findPersonList(Model model, HttpSession session) {
        model.addAttribute("findPersonList", findPersonService.getFindPersonList());
        model.addAttribute("user", session.getAttribute("login"));
        return "listfindperson";
    }

    @RequestMapping(value = "/findperson/{id}", method= RequestMethod.GET)
    public String findPersonDetail(@PathVariable int id, Model model, HttpSession session) {
        model.addAttribute("findPerson", findPersonService.getFindPerson(id));
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
        FindPersonVO newFindPerson = findPersonService.insertFindPerson(vo);
        if (newFindPerson == null) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공");
        }
        return "redirect:/findperson/" + newFindPerson.getArticle_id();
    }

    @RequestMapping(value = "/findperson/editform/{id}", method= RequestMethod.GET)
    public String editFindPerson(@PathVariable("id") int id, Model model, HttpSession session) {
        String loginUserid = ((UserVO) session.getAttribute("login")).getUserid();
        FindPersonVO vo = findPersonService.getFindPerson(id);

        if (loginUserid.equals(vo.getWriter())) {
            FindPersonFileUpload fileUpload = new FindPersonFileUpload(vo);
            model.addAttribute("fileUpload", fileUpload);
            model.addAttribute("findPersonVO", vo);
            return "editfindperson";
        } else {
            return "redirect:/findperson";
        }
    }

    @RequestMapping(value = "/findperson/editok", method= RequestMethod.POST)
    public String editFindPersonOk(HttpServletRequest request, HttpSession session) {
        FindPersonFileUpload fileUpload = new FindPersonFileUpload();
        FindPersonVO vo = fileUpload.uploadPhoto(request);

        String loginUserid = ((UserVO) session.getAttribute("login")).getUserid();
        if (loginUserid.equals(vo.getWriter()) && findPersonService.updateFindPerson(vo) == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공");
        }
        return "redirect:/findperson/" + vo.getArticle_id();
    }

    @RequestMapping(value = "/findperson/deleteok/{id}", method= RequestMethod.GET)
    public String deleteFindPerson(@PathVariable("id") int id, HttpSession session) {
        String loginUserid = ((UserVO) session.getAttribute("login")).getUserid();
        FindPersonVO vo = findPersonService.getFindPerson(id);

        if (loginUserid.equals(vo.getWriter()) && findPersonService.deleteFindPerson(id) == 0) {
            System.out.println("데이터 삭제 실패");
        } else {
            System.out.println("데이터 삭제 성공");
        }
        return "redirect:../../findperson";
    }
}