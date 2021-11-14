package com.study.firstproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * MyController
 */
//시작페이지 로그인 -> 로그인페이지(모달 폼) -> 로그인 완료 -> 메인페이지 (1)
//회원가입(2)


@Controller
public class MyController {

    @GetMapping("/")
    public String nicetoMeet(Model model){
        model.addAttribute("username", "홍길동");
        return "greetings";
    }

    @GetMapping("/main")
    public String main(){
        return "main";
    }

    @GetMapping("/login") //sign in
    public String login(){
        return "login";
    }

    @GetMapping("/join") //sing up
    public String join(){
        return "join";
    }
    @GetMapping("/admin") //admin
    public String admin(){
        return "admin";
    }
}