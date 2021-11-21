package com.study.firstproject.Controller;

import com.study.firstproject.repository.MemberMapper;
import com.study.firstproject.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * MyController
 */
//시작페이지 로그인 -> 로그인페이지(모달 폼) -> 로그인 완료 -> 메인페이지 (1)
//회원가입(2)


@Controller
public class MyController {

    @Autowired
    MemberService memberService;

    @GetMapping("/")
    public String nicetoMeet(){
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
    @RequestMapping("/adminuser") //admin
    public String adminuser(Model model){
        model.addAttribute("users", memberService.getMemberList());
        return "admin/adminuser";
    }

    @RequestMapping("/list") //admin
    public String listpage(Model model){
        model.addAttribute("list", memberService.getMemberList());
        return "list";
    }
    
}