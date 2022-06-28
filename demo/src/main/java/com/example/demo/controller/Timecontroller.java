package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.entity.TimeLimit;
import com.example.demo.mapper.TimeMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/timelimit")

public class Timecontroller {

    @Resource
    TimeMapper timeMapper;

    @PostMapping
    public Result<?> save(@RequestBody TimeLimit timelimit){
        if (timeMapper.isKeyRepeat(timelimit.getTerm()).intValue() != 0) {
            return Result.error("-1", "学期已存在");
        }
        timeMapper.insert(timelimit);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody TimeLimit timeLimit){
        timeMapper.updateById(timeLimit);
        return Result.success();
    }

    @DeleteMapping("/{term}")
    public Result<?> delete(@PathVariable String term){
        timeMapper.deleteById(term);
        return Result.success();
    }

    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search) {
        LambdaQueryWrapper<TimeLimit> wrapper = Wrappers.<TimeLimit>lambdaQuery();
        if (StrUtil.isNotBlank(search)) {
            wrapper.like(TimeLimit::getTerm,search);
        }
        Page<TimeLimit> TimelimitPage = timeMapper.selectPage(new Page<>(pageNum, pageSize), wrapper);
        return Result.success(TimelimitPage);
    }

}

