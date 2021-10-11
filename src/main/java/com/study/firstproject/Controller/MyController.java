package com.study.firstproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * MyController
 */
@Controller
public class MyController {

    @GetMapping("/")
    public String nicetoMeet(Model model){
        model.addAttribute("username", "홍길동");
        return "greetings";
    }

    @GetMapping("/main")
    public String main(Model model){
        model.addAttribute("username", "홍길동");
        return "hello";
    }
}