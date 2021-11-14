package com.study.firstproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * MyController
 */ 
//시작페이지 로그인 -> 로그인페이지(모달 폼) -> 로그인 완료 -> 메인페이지 (1)
//회원가입(2)


@Controller
public class MyController {

    @RequestMapping("/")
    public String nicetoMeet(){
        return "guest/greetings";
    }

    @RequestMapping("/main")
    public String main(){
        return "user/main";
    }

    @RequestMapping("/login") //sign in
    public String login(){
        return "security/login";
    }

    @RequestMapping("/loginError") //sign in
    public String loginError(){
        return "security/loginError";
    }

    @RequestMapping("/join") //sing up
    public String join(){
        return "guest/join";
    }
    @RequestMapping("/board") //board
    public String board(){
        return "user/board";
    }
    @RequestMapping("/admin") 
    public String admin(){
        return "admin/admin";
    }
}