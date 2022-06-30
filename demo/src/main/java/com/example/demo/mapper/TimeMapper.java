package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.TimeLimit;
import org.apache.ibatis.annotations.Select;


public interface TimeMapper extends BaseMapper<TimeLimit> {
    @Select("select count(*) from time_limit where term = #{term}")
    Integer isKeyRepeat(String term);

    @Select("select count(*) from time_limit where term = #{term} " +
            "and selectbegin <= (SELECT CURRENT_TIMESTAMP FROM DUAL) " +
            "and selectend >= (SELECT CURRENT_TIMESTAMP FROM DUAL);")
    Integer isTimeAllow(String term);

    @Select("select count(*) from time_limit where term = #{term} " +
            "and usualgradebegin <= (SELECT CURRENT_TIMESTAMP FROM DUAL) " +
            "and usualgradeend >= (SELECT CURRENT_TIMESTAMP FROM DUAL);")
    Integer isUTimeAllow(String term);

    @Select("select count(*) from time_limit where term = #{term} " +
            "and finalgradebegin <= (SELECT CURRENT_TIMESTAMP FROM DUAL) " +
            "and finalgradeend >= (SELECT CURRENT_TIMESTAMP FROM DUAL);")
    Integer isFTimeAllow(String term);
    @Select("select count(*) from grade where usual_grade <> 0 " +
            "and term = #{term} and course_id = #{courseId} "+
            "and teacher_id = #{teacherId} and time = #{time}")
    Integer isURepeated(String term, String courseId, String teacherId, String time);
    @Select("select count(*) from grade where final_grade <> 0 " +
            "and term = #{term} and course_id = #{courseId} "+
            "and teacher_id = #{teacherId} and time = #{time}")
    Integer isFRepeated(String term, String courseId, String teacherId, String time);
}