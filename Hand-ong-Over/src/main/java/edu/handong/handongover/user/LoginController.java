package edu.handong.handongover.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value="/login/loginOk", method = RequestMethod.POST)
    public String loginCheck(HttpSession session, UserVO vo) {
        String returnURL = "";
        if (session.getAttribute("login") != null) {
            session.removeAttribute("login");
        }

        UserVO loginVO = userService.getUser(vo);
        if (loginVO != null) {
            System.out.println("로그인 성공");
            session.setAttribute("login", loginVO);
            returnURL = "redirect:../";
        } else {
            System.out.println("로그인 실패");
            returnURL = "redirect:../login";
        }
        return returnURL;
    }

    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login";
    }
}
