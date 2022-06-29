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


}