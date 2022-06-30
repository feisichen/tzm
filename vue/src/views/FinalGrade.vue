<template>
  <div style="margin: 10px;">
    <el-button type="primary" plain :icon="ArrowLeft"
               @click="back">返回
    </el-button>
    <div style="text-align: center;">
      <h1 style="color: #409EFF;">学生名单</h1>
      <span >
        课程号：<ins style="color: ;">&nbsp;{{ id }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        课程名：<ins>&nbsp;{{ courseName }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        学期：<ins>&nbsp;{{ term }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--        <br><br>-->
        学分：<ins>&nbsp;{{ credit }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        教师号：<ins>&nbsp;{{ teacherId }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        教师名：<ins>&nbsp;{{ teacherName }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        时间：<ins>&nbsp;{{ time }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        考试成绩权重：<ins>&nbsp;{{ weight }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--        <br><br>-->
        选课人数上限：<ins>&nbsp;{{ limitNum }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        当前选课人数：<ins>&nbsp;{{ currentNum }}&nbsp;</ins>
      </span>
      <hr>

      <!--表格-->
      <el-table :data="tableData" border stripe style="width: 100%;">
        <el-table-column prop="id" label="学生学号" sortable/>
        <el-table-column prop="name" label="学生姓名"/>
        <el-table-column fixed="right" label="考试成绩" width="480px">
          <template #default="scope">
            <el-input v-model="scope.row.grade1" placeholder="请输入成绩"  clearable/>
          </template>
        </el-table-column>
        <el-table-column fixed="right" label="确认考试成绩" width="480px">
          <template #default="scope">
            <el-input v-model="scope.row.grade2" placeholder="请输入成绩"  clearable/>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <el-row>
      <el-col :span="12">
        <div style="margin: 10px 10px 10px; font-size: 10px; color: rgb(96, 98, 102);">选课人数：{{ currentNum }}</div>
      </el-col>
      <el-col :span="4">
        <div style="margin-top: 15px; margin-left: 20px; color: red;" v-if="badGrade">输入成绩不合法，请确认！</div>
      </el-col>
      <el-col :span="4">
        <div style="margin-top: 15px; margin-left: 20px; color: red;" v-if="disagreeGrade">两次成绩不一致，请确认！</div>
      </el-col>
      <el-col :span="4">
        <el-button style="margin: 10px;" type="primary" plain @click="save">提交</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {ArrowLeft} from '@element-plus/icons-vue'
import request from "@/utils/request";
import * as echarts from "echarts";

export default {
  name: "TeacherGrade",
  data() {
    return {
      ArrowLeft,
      id: sessionStorage.getItem("id"),
      courseId: sessionStorage.getItem("currentCourse"),
      courseName: sessionStorage.getItem("currentCourseName"),
      teacherId: sessionStorage.getItem("currentId"),
      teacherName: sessionStorage.getItem("currentName"),
      term: sessionStorage.getItem("currentTerm"),
      time: sessionStorage.getItem("currentTime"),
      weight: sessionStorage.getItem("currentWeight"),
      credit: sessionStorage.getItem("currentCredit"),
      limitNum: sessionStorage.getItem("currentLimitNum"),
      currentNum: sessionStorage.getItem("currentCurrentNum"),

      checked: false,
      tableData: [],
      grade1: null,
      grade2: null,
      row: {},
      badGrade: false,
      disagreeGrade: false
    }
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      request.get("/grade/forGrade", {
        params: {
          term: this.term,
          courseId: this.courseId,
          teacherId: this.teacherId,
          time: this.time
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.list;
        this.total = res.data.total;
      })
    },
    save() {
      this.badGrade = false;
      this.disagreeGrade = false;
      request.get("/grade/finalGradeCheck", {
        params: {
          term:this.term,
          courseId:this.courseId,
          teacherId:this.teacherId,
          time:this.time
        }
      }).then(res => {
        console.log(res);
        if (res.code === '0') {
          let index=0;
          let isvalid = true;
          let isequal = true;
          for(index=0;index < this.tableData.length;index++){
            if(this.tableData[index].grade1 !== this.tableData[index].grade2){
              isequal = false;
            }
            if(!(this.tableData[index].grade1 <= 100 && this.tableData[index].grade1 >= 0 && this.tableData[index].grade2 <= 100 && this.tableData[index].grade2 >= 0) || this.tableData[index].grade1 === undefined || this.tableData[index].grade2 === undefined){
              isvalid = false;
            }
          }
          if(isvalid === true && isequal === true){
            for(index=0;index < this.tableData.length;index++){
              request.get("/grade/finalGrade", {
                params: {
                  term:this.term,
                  courseId:this.courseId,
                  teacherId:this.teacherId,
                  time:this.time,
                  weight:this.weight,
                  studentId:this.tableData[index].id,
                  grade:this.tableData[index].grade1
                }
              }).then(res => {
              })
            }
            this.$message({
              type: 'success',
              message: '考试成绩提交成功'
            })
          }
          else if(isvalid === false){
            this.badGrade = true;
          }
          else if(isequal === false){
            this.disagreeGrade = true;
          }
        } else {
          this.$message({
            type: 'error',
            message: res.msg
          })
        }
      })
    },

    back() {
      this.$router.push('/teacherGrade');
    }
  }
}
</script>

<style scoped>

</style>