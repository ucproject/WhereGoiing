package com.study.firstproject.model.common;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResultMsg <T> {
    private String code;
    private String msg;
    private Boolean status;
    private List<T> data;
    private T item;

    public ResultMsg(boolean status, String msg){
        this.code=(status)?"success":"error";
        this.msg = msg;
    }
    public ResultMsg(boolean status, String msg, List<T> data){
        this.code=(status)?"success":"error";
        this.msg = msg;
        this.data = data;
    }
    public ResultMsg(boolean status, String msg, T item){
        this.code=(status)?"success":"error";
        this.msg = msg;
        this.item = item;
    }
}
