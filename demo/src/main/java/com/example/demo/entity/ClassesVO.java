package com.example.demo.entity;

import lombok.Data;

@Data
public class ClassesVO {
    private String id;
    private String term;
    private String courseId;
    private String courseName;
    private String teacherId;
    private String teacherName;
    private String time;
    private Float weight;
    private Integer limitNum;
    private Integer currentNum;

    public ClassesVO(String id, String term, String courseId, String courseName, String teacherId, String teacherName, String time, Float weight, Integer limitNum, Integer currentNum) {
        this.id = id;
        this.term = term;
        this.courseId = courseId;
        this.courseName = courseName;
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.time = time;
        this.weight = weight;
        this.limitNum = limitNum;
        this.currentNum = currentNum;
    }
}