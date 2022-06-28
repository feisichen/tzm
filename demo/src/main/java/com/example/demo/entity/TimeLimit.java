package com.example.demo.entity;

import cn.hutool.core.date.DateTime;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@TableName("time_limit")
@Data
public class TimeLimit {
    @TableId(value = "term", type = IdType.AUTO)
    private String term;
    private LocalDateTime selectbegin;
    private LocalDateTime selectend;
    private LocalDateTime usualgradebegin;
    private LocalDateTime usualgradeend;
    private LocalDateTime finalgradebegin;
    private LocalDateTime finalgradeend;

}
