package com.study.firstproject.repository;

import java.util.List;

import com.study.firstproject.model.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
   
    List<Map> getcinemaMapList();

    List<Map> gethospitalMapList();

    List<Map> getmarketMapList();

    List<Map> getmartMapList();

    List<Map> getparkMapList();

    List<Map> getrestaurantMapList();
}
