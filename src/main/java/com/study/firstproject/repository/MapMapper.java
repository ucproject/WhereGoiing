package com.study.firstproject.repository;

import java.util.List;

import com.study.firstproject.model.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
   
    public List<Map> GetMapList() throws Exception;
    List<Map> getLocationList();
    
}
