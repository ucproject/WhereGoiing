package com.study.firstproject.service;

import java.util.List;

import com.study.firstproject.model.Map;
import com.study.firstproject.repository.MapMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MapService {

    @Autowired
    static
    MapMapper mapMapper;

    public static List<Map> getcinemaMapList() {
        return mapMapper.getcinemaMapList();
    }

    public List<Map> gethospitalMapList() {
        return mapMapper.gethospitalMapList();
    }

    public List<Map> getmarketMapList() {
        return mapMapper.getmarketMapList();
    }

    public List<Map> getmartMapList() {
        return mapMapper.getmartMapList();
    }

    public List<Map> getparkMapList() {
        return mapMapper.getparkMapList();
    }

    public List<Map> getrestaurantMapList() {
        return mapMapper.getrestaurantMapList();
    }
}
