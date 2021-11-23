package com.study.firstproject.Controller;

import javax.servlet.http.HttpSession;

import com.study.firstproject.model.Member;
import com.study.firstproject.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class userLoginController {
    @Autowired
	MemberService memberServic;
	
	@GetMapping("/userlogin")
	public String userlogin() {
		return "userlogin";
	}
	
	@PostMapping("/userlogin")
	public String userlogin(HttpSession session, Member member) {
        Member loginMember = memberServic.getSelectOne(member);
		if(loginMember == null) {
			// login 실패!
			return "redirect:/userlogin";
		}
		session.setAttribute("loginMember", loginMember);
		    return "map/hospitalMap";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //session전체삭제
		return "greetings"; 
	}
}
