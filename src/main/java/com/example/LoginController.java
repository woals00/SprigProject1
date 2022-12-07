package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
//@RequestMapping(value = "/login")
public class LoginController {
    @Autowired
    UserServiceImpl service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/loginOk", method = RequestMethod.POST)
    public String loginCheck(HttpSession session, UserVO vo) {
        String returnURL = "";
        if(session.getAttribute("login") != null){
            session.removeAttribute("login");
        }
        UserVO loginvo = service.getUser(vo);
        if(loginvo != null){
            System.out.println("로그인 성공!");
            session.setAttribute("login", loginvo);
            returnURL = "redirect:/board/list";
        }
        else{
            System.out.println("로그인 실패!");
            System.out.println(loginvo);
            returnURL = "redirect:/";
        }
        return returnURL;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login/login";
    }
}