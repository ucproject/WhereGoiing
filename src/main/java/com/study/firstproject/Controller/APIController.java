package com.study.firstproject.Controller;


import java.util.List;

import com.study.firstproject.model.Map;
import com.study.firstproject.model.MapReqApiParam;
import com.study.firstproject.model.common.ResultMsg;
import com.study.firstproject.repository.MapMapper;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;






@Controller
public class APIController {
    
    @Autowired
    private MapMapper mapMapper;

    @RequestMapping(value = "/api/getLocationOnMap", method = RequestMethod.GET)
    public @ResponseBody ResultMsg<Map> hospital(MapReqApiParam model){
        System.out.println(model.getNe_lat() + " <= ne_lat");
        List<Map> list = mapMapper.getLocationListOnMap(model);
        ResultMsg<Map> rslt = new ResultMsg<>(true,"가져오기함.", list);
        return rslt;
    }
}
