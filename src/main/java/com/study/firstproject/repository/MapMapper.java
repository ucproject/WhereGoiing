package com.study.firstproject.repository;

import java.util.List;

import com.study.firstproject.model.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
   
    public void create(Map map) throws Exception;
    public List<Map> list() throws Exception;
    public Map read(long mapNo) throws Exception;
    public void update(Map map) throws Exception;
    public void delete(long MapNo) throws Exception;
    List<Map> getLocationList();

}
