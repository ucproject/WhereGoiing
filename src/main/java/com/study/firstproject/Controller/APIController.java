package com.study.firstproject.Controller;


import com.study.firstproject.repository.MapMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
public class APIController {
    
    @Autowired
    private MapMapper mapMapper;

    @RequestMapping(value = "/api/test", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String getApiTest() {
        return"{\"result\":\"ok\"}";
    }

    @RequestMapping(value = "/api/test2 ", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String getApiTest2() {
        return"{\"result\":\"ok2\"}";
    }

    @RequestMapping(value = "/hospital", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String hospital(Model model){
        model.addAttribute("hospitalmaps", mapMapper.getLocationList());
        return "map/hospitalMap";
    }
}
