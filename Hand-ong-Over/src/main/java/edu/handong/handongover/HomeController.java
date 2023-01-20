package edu.handong.handongover;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    // Home
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model, HttpSession session) {
        model.addAttribute("user", session.getAttribute("login"));
        return "index";
    }
}
