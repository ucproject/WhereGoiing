package com.study.firstproject.model;

import lombok.Data;

@Data
public class Member {
    int number;
    String id;
    String password;
    String name;
    String nickname;
    String email;
}
