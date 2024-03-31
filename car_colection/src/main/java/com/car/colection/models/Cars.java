package com.car.colection.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cars {
    private Long id;
    private String brand;
    private String model;
    private String registrationNumber;
    private String color;
}