package com.example.demo.entity;

import lombok.Data;

@Data
public class StudentVO {
    public String id;
    private String name;
    private String sex;
    private String departmentName;
    private Double gpa;
    private Integer usualGrade;
    private Integer finalGrade;
    private Integer totalGrade;

    public StudentVO(String id, String name, String sex, String departmentName, Double gpa, Integer usualGrade, Integer finalGrade, Integer totalGrade) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.departmentName = departmentName;
        this.gpa = gpa;
        this.usualGrade = usualGrade;
        this.finalGrade = finalGrade;
        this.totalGrade = totalGrade;
    }
}