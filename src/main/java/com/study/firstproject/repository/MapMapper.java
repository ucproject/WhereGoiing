package com.study.firstproject.repository;

import java.util.List;

import com.study.firstproject.model.Map;
import com.study.firstproject.model.MapReqApiParam;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
   
    public List<Map> GetMapList() throws Exception;
    List<Map> getLocationList();
    List<Map> getLocationListOnMap(MapReqApiParam param);
    
}
