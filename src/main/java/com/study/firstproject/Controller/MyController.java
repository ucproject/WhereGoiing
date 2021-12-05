package com.study.firstproject.Controller;


import com.study.firstproject.model.Member;
import com.study.firstproject.model.common.ResultMsg;
import com.study.firstproject.service.MapService;
import com.study.firstproject.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * MyController
 */
//시작페이지 로그인 -> 로그인페이지(모달 폼) -> 로그인 완료 -> 메인페이지 (1)
//회원가입(2)


@Controller
public class MyController {

    @Autowired
    MapService mapService;

    @Autowired
    MemberService memberService;

    @GetMapping("/")
    public String nicetoMeet(){
        return "greetings";
    }
    @RequestMapping("/main")
    public String main(){
        //model.addAttribute("maps", mapService.gethospitalMapList());
        return "main";
    }
    @RequestMapping("/cineme")
    public String cinemamain(){
        //model.addAttribute("cinememaps", mapService.getcinemeMapList());
        return "map/cinemeMap";
    }
   

    @RequestMapping("/hospital")
    public String hospital(Model model){
        //model.addAttribute("hospitalmaps", mapService.gethospitalMapList());
        return "map/hospitalMap";
    }


  

    @RequestMapping("/market")
    public String market(){
        //map.addAttribute("marketmaps", mapService.getmarketMapList());
        return "map/marketMap";
    }

    @RequestMapping("/mart")
    public String mart(){
        //model.addAttribute("martmaps", mapService.getmartMapList());
        return "map/martMap";
    }

    @RequestMapping("/park")
    public String park(){
        //model.addAttribute("parkmaps", mapService.getparkMapList());
        return "map/parkMap";
    }

    @RequestMapping("/restaurant")
    public String restaurant(){
        //model.addAttribute("restaurantmaps", mapService.getrestaurantMapList());
        return "map/restaurantMap";
    }


    @RequestMapping("/join") //sign up
    public String join(){
        return "join";
    }
    
    @PostMapping("/createMember") //sign up
    public @ResponseBody ResultMsg<String> createMember(Member member){
        ResultMsg<String> rslt = null;
        try{
            memberService.createMember(member);
            rslt = new ResultMsg<>(true, "Success");
        }catch(Exception e){
            rslt = new ResultMsg<>(false, e.getMessage());
        }
        return rslt;
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