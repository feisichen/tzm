<template>
  <div style="margin: 10px;">
    <el-button type="primary" plain :icon="ArrowLeft"
               @click="back">返回课程列表
    </el-button>
    <div style="text-align: center;">
      <h1 style="color: #409EFF;">学生名单</h1>
      <span >
        院系号：<ins style="color: ;">&nbsp;{{ id }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        院系名：<ins>&nbsp;{{ name }}&nbsp;</ins>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>
      <div style="margin: 10px 0;" align="left">
        <el-input v-model="search" placeholder="请输入关键字" style="width: 30%;" clearable/>
        <el-button type="primary" style="margin-left: 5px;" @click="load">查询</el-button>
      </div>
      <hr>
      <!--表格-->
      <el-table :data="tableData" border stripe style="width: 100%;">
        <el-table-column prop="id" label="学生学号" sortable/>
        <el-table-column prop="name" label="学生姓名"/>
        <el-table-column prop="sex" label="性别"/>
        <el-table-column prop="gpa" label="平均绩点"/>
      </el-table>
    </div>
  </div>
</template>

<script>
import {ArrowLeft} from '@element-plus/icons-vue'
import request from "@/utils/request";
import * as echarts from "echarts";

export default {
  name: "ManageDepStudent",
  data() {
    return {
      ArrowLeft,
      id: sessionStorage.getItem("currentCheckDepartment"),
      name: sessionStorage.getItem("currentCheckDepartmentName"),
      tableData: [],
      search: '',
      // 用于录入平时成绩和期末成绩暂存当前字段
      row: {},
    }
  },
  created() {
    this.load();
  },
  methods: {
    back() {
      if (this.needToUpdate) {
        this.$message({
          type: 'warning',
          message: '综合成绩未更新'
        })
        return;
      } else {
        this.$router.push('/managedepartment');
      }
    },
    load() {
      request.get("/department/forStudent", {
        params: {
          search: this.search,
          department:this.id
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.list;
        this.total = res.data.total;
      })
    }
  }
}
</script>

<style scoped>

</style>