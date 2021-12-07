package com.study.firstproject.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class Map {
    String category;
    String name;
    String address;
    double latitude;
    double longitude;
}
