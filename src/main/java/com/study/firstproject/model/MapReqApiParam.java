package com.study.firstproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MapReqApiParam {
    private String cate;
    private double sw_lat;
    private double sw_lng;
    private double ne_lat;
    private double ne_lng;
}
