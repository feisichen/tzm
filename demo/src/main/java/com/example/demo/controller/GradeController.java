package com.example.demo.controller;

import com.example.demo.common.Result;
import com.example.demo.entity.Grade;
import com.example.demo.entity.GradePlus;
import com.example.demo.entity.GradeWithStudentName;
import com.example.demo.entity.StudentVO;
import com.example.demo.mapper.ClassesMapper;
import com.example.demo.mapper.GradeMapper;
import com.example.demo.mapper.TimeMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/grade")
public class GradeController {
    @Resource
    GradeMapper gradeMapper;

    @Resource
    ClassesMapper classesMapper;

    @Resource
    TimeMapper timeMapper;

    @PostMapping
    public Result<?> save(@RequestBody Grade grade) {
        classesMapper.newStudent(grade.getTerm(), grade.getCourseId(), grade.getTeacherId(), grade.getTime());
        gradeMapper.insert(grade);
        return Result.success();
    }

    @PostMapping("/isChosen")
    public Result<?> isChosen(@RequestBody Grade grade) {
        // 查询返回一个整数，若非0，说明不满足选课条件
        Integer res = classesMapper.isFull(grade.getTerm(), grade.getCourseId(), grade.getTeacherId(), grade.getTime());
        if (res.intValue() != 0) {
            return Result.error("-1", "选课失败，选课人数已满");
        }
        res = gradeMapper.findIsChosen(grade.getStudentId(), grade.getTerm(), grade.getCourseId(), grade.getTeacherId(), grade.getTime());
        if (res.intValue() != 0) {
            return Result.error("-2", "选课失败，你已选修过该课程");
        }
        res = gradeMapper.findIsRepeat(grade.getStudentId(), grade.getTerm(), grade.getCourseId());
        if (res.intValue() != 0) {
            return Result.error("-3", "选课失败，同一学期不能重复选择同一课程");
        }
        res = gradeMapper.findIsConflicting(grade.getStudentId(), grade.getTerm(), grade.getTime());
        if (res.intValue() != 0) {
            return Result.error("-4", "选课失败，你的时间冲突");
        }
        res = timeMapper.isTimeAllow(grade.getTerm());
        if(res.intValue() == 0){
            return Result.error("-5", "选课失败，不在选课时间内");
        }
        return Result.success();
    }

//    @DeleteMapping("/{forQuit}")
//    public Result<?> delete(@RequestBody Grade forQuit) {
//        Integer res = gradeMapper.deleteForQuit(forQuit.getTerm(), forQuit.getCourseId(), forQuit.getTeacherId(), forQuit.getStudentId());
//        if (res.intValue() == 0) {
//            return Result.error("-1", "已进行考核，禁止退课！");
//        }
//        return Result.success();
//    }
    // 上述方法中传入了一个对象作为参数，但后端无法接收，原因不明
    // 上述方法出问题可能是由于前端封装时键值没有打双引号，后端SQL语句中字段名与数据库中不匹配，或是mapper中注解使用错误造成
    // 之后写的方法能够出效果，懒得改了

    @GetMapping("/seekId")
    public Result<?> findId(@RequestParam(defaultValue = "") String term,
                            @RequestParam(defaultValue = "") String courseId,
                            @RequestParam(defaultValue = "") String teacherId,
                            @RequestParam(defaultValue = "") String studentId,
                            @RequestParam(defaultValue = "") String time) {
        Integer res = gradeMapper.findCertainId(term, courseId, teacherId, studentId, time);
        if (res == null) {
            return Result.error("-1", "已进行考核，禁止退课！");
        }
        res = timeMapper.isTimeAllow(term);
        if(res.intValue() == 0){
            return Result.error("-2", "退课失败，不在选课时间内");
        }
        classesMapper.deleteOneStudent(term, courseId, teacherId, time);
        return Result.success(res);
    }

    @DeleteMapping("/delete")
    public Result<?> delete(@RequestParam(defaultValue = "") String term,
                            @RequestParam(defaultValue = "") String courseId,
                            @RequestParam(defaultValue = "") String teacherId,
                            @RequestParam(defaultValue = "") String studentId,
                            @RequestParam(defaultValue = "") String time) {
        Integer res = classesMapper.delete(term, courseId, teacherId, time, studentId);
        return Result.success(res);
    }

    @GetMapping("/forGrade")
    public Result<?> findForGrade(@RequestParam(defaultValue = "") String term,
                                  @RequestParam(defaultValue = "") String courseId,
                                  @RequestParam(defaultValue = "") String teacherId,
                                  @RequestParam(defaultValue = "") String time) {
        List<GradeWithStudentName> data = gradeMapper.findListForGrade(term, courseId, teacherId, time);
        Integer total = data.size();
        Map<String, Object> res = new HashMap<>();
        res.put("list", data);
        res.put("total", total);
        return Result.success(res);
    }

    @GetMapping("/forStudent")
    public Result<?> findForStudent(@RequestParam(defaultValue = "") String search,
                                    @RequestParam(defaultValue = "") String term,
                                    @RequestParam(defaultValue = "") String courseId,
                                    @RequestParam(defaultValue = "") String teacherId,
                                    @RequestParam(defaultValue = "") String time) {
        List<StudentVO> data = gradeMapper.findListForStudent(search, term, courseId, teacherId, time);
        Integer total = data.size();
        Map<String, Object> res = new HashMap<>();
        res.put("list", data);
        res.put("total", total);
        return Result.success(res);
    }
    @PostMapping("/logging")
    public Result<?> logging(@RequestBody Grade grade) {
        Integer res = gradeMapper.updateByLogging(grade.getTerm(), grade.getCourseId(), grade.getTeacherId(), grade.getStudentId(), grade.getTime(), grade.getUsualGrade(), grade.getFinalGrade());
        return Result.success(res);
    }

//    @GetMapping("/update")
//    public Result<?> update(@RequestParam(defaultValue = "") String term,
//                            @RequestParam(defaultValue = "") String courseId,
//                            @RequestParam(defaultValue = "") String teacherId,
//                            @RequestParam(defaultValue = "") String time,
//                            @RequestParam(defaultValue = "") Double usualGradeProportion,
//                            @RequestParam(defaultValue = "") Double finalGradeProportion) {
//        Integer res = gradeMapper.updateTotal(term, courseId, teacherId, time, usualGradeProportion, finalGradeProportion);
//        return Result.success(res);
//    }

    @GetMapping("/forStudentDisplay")
    public Result<?> findListForStudentDisplay(@RequestParam(defaultValue = "") String studentId,
                                               @RequestParam(defaultValue = "") String selectTerm) {
        List<GradePlus> data = gradeMapper.findMyGrade(studentId, selectTerm);
        Integer total = data.size();
        Map<String, Object> res = new HashMap<>();
        res.put("list", data);
        res.put("total", total);
        return Result.success(res);
    }
    @GetMapping("/usualGrade")
    public Result<?> updateUsualGrade(@RequestParam(defaultValue = "") String term,
                                      @RequestParam(defaultValue = "") String courseId,
                                      @RequestParam(defaultValue = "") String teacherId,
                                      @RequestParam(defaultValue = "") String time,
                                      @RequestParam(defaultValue = "") String studentId,
                                      @RequestParam(defaultValue = "") Integer grade) {
//        System.out.print("Hello,World!Hello,World!Hello,World!Hello,World!Hello,World!\n\n\n");
        int res = gradeMapper.updateUsual(term,courseId,teacherId,time,studentId,grade);
        return Result.success(res);
    }

    @GetMapping("/finalGrade")
    public Result<?> updateFinalGrade(@RequestParam(defaultValue = "") String term,
                                      @RequestParam(defaultValue = "") String courseId,
                                      @RequestParam(defaultValue = "") String teacherId,
                                      @RequestParam(defaultValue = "") String time,
                                       @RequestParam(defaultValue = "") Double weight,
                                      @RequestParam(defaultValue = "") String studentId,
                                      @RequestParam(defaultValue = "") Integer grade) {
        int usualGrade = gradeMapper.getUsual(term,courseId,teacherId,time,weight,studentId);
        int res  = 0;
        if(usualGrade == -1){
            res = gradeMapper.updateNoUsualFinal(term,courseId,teacherId,time,studentId,grade);
        } else if (usualGrade >=0 && usualGrade <= 100) {
            res = gradeMapper.updateFinal(term,courseId,teacherId,time,weight,studentId,grade);
        }
        return Result.success(res);
    }

    @GetMapping("/usualGradeCheck")
    public Result<?> usualGradeCheck(@RequestParam(defaultValue = "") String term,
                                      @RequestParam(defaultValue = "") String courseId,
                                      @RequestParam(defaultValue = "") String teacherId,
                                      @RequestParam(defaultValue = "") String time) {

        Integer res = timeMapper.isUTimeAllow(term);
        if(res.intValue() == 0){
            return Result.error("-1", "登记失败！未到平时成绩登记时间");
        }
        res = timeMapper.isURepeated(term, courseId, teacherId, time);
        if(res.intValue() != 0){
            return Result.error("-1", "登记失败！已提交平时成绩");
        }
        return Result.success(res);
    }

    @GetMapping("/finalGradeCheck")
    public Result<?> finalGradeCheck(@RequestParam(defaultValue = "") String term,
                                     @RequestParam(defaultValue = "") String courseId,
                                     @RequestParam(defaultValue = "") String teacherId,
                                     @RequestParam(defaultValue = "") String time){
        Integer res = timeMapper.isFTimeAllow(term);
        if(res.intValue() == 0){
            return Result.error("-1", "登记失败！未到考试成绩登记时间");
        }
        res = timeMapper.isFRepeated(term, courseId, teacherId, time);
        if(res.intValue() != 0){
            return Result.error("-1", "登记失败！已提交考试成绩");
        }
        return Result.success(res);
    }
}
