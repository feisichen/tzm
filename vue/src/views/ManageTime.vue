<template>
  <div style="padding: 10px;">
    <div style="margin: 10px 0;">
      <el-button type="primary" @click="add">新增</el-button>
    </div>

    <div style="margin: 10px 0;">
      <el-input v-model="search" placeholder="请输入学期" style="width: 30%;" clearable/>
      <el-button type="primary" style="margin-left: 5px;" @click="load">查询</el-button>
<!--      <el-select v-model="selectDep" placeholder="&#45;&#45;选择学院&#45;&#45;" style="margin-left: 400px;" @change="load">-->
<!--        <el-option label="&#45;&#45;选择学院&#45;&#45;" :value="0">&#45;&#45;选择学院&#45;&#45;</el-option>-->
<!--        <el-option-->
<!--            v-for="item in dep"-->
<!--            :label="item.departmentName"-->
<!--            :value="item.department"-->
<!--        />-->
<!--      </el-select>-->
    </div>

    <el-table :data="tableData" border stripe style="width: 100%;">
      <el-table-column prop="term" label="学期" width="80%" sortable/>
      <el-table-column prop="selectbegin" label="选课开始时间" :formatter="timechange"/>
      <el-table-column prop="selectend" label="选课结束时间" :formatter="timechange"/>
      <el-table-column prop="usualgradebegin" label="平时成绩登记开始时间" :formatter="timechange"/>
      <el-table-column prop="usualgradeend" label="平时成绩登记结束时间" :formatter="timechange"/>
      <el-table-column prop="finalgradebegin" label="考试成绩登记开始时间" :formatter="timechange"/>
      <el-table-column prop="finalgradeend" label="考试成绩登记结束时间" :formatter="timechange"/>

      <el-table-column fixed="right" label="操作" width="150px">
        <template #default="scope">
          <el-button type="primary" plain size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <el-popconfirm title="确定删除此学期吗？" @confirm="handleDelete(scope.row.term)">
            <template #reference>
              <el-button type="primary" plain size="small">删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
        style="margin-top: 10px;"
        :currentPage="currentPage"
        :page-size="pageSize"
        :page-sizes="[5, 10, 20]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
    />

    <el-dialog v-model="dialogVisible" title="新增学期" width="30%"  >
      <el-form :model="form" label-width="150px" label-position="top"  style="margin-left: 30px ; margin-right: 30px">
        <el-form-item label="学年">
          <el-input v-model="form.year" style="width: 100%;" placeholder="请填写19/20/21"/>
        </el-form-item>
        <el-form-item label="季节" style="width:100%;">
          <el-select v-model="form.season" placeholder="--选择季节--" style="width: 100%;">
            <el-option label="--选择季节--" disabled></el-option>
            <el-option label="秋季学期" value="秋"></el-option>
            <el-option label="冬季学期" value="冬"></el-option>
            <el-option label="春季学期" value="春"></el-option>
            <el-option label="夏季学期" value="夏"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item label="选课起止时间" style="height: 60px">
            <el-date-picker
                value-format="YYYY-MM-DDTHH:mm:ss"
                v-model="form.select"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="截止时间"
            />
        </el-form-item>
        <el-form-item label="平时成绩登记时间">
          <el-date-picker
              value-format="YYYY-MM-DDTHH:mm:ss"
              v-model="form.usual"
              type="datetimerange"
              range-separator="至"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
          />
        </el-form-item>
        <el-form-item label="考试成绩登记时间" >
          <el-date-picker
              value-format="YYYY-MM-DDTHH:mm:ss"
              v-model="form.finall"
              type="datetimerange"
              range-separator="至"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
          />
        </el-form-item>
      </el-form>
      <template #footer>
      <span>
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </span>
      </template>
    </el-dialog>

    <el-dialog v-model="dialogVisible2" title="编辑学期信息" width="30%">
      <el-form :model="form2" label-width="150px" label-position="top"  style="margin-left: 30px ; margin-right: 30px">
        <el-form-item label="学年">
          <el-input v-model="form2.year" style="width: 100%;" placeholder="请填写19/20/21/22"/>
        </el-form-item>
        <el-form-item label="季节" style="width:100%;">
          <el-select v-model="form2.season" placeholder="--选择季节--" style="width: 100%;">
            <el-option label="--选择季节--" disabled></el-option>
            <el-option label="秋季学期" value="秋"></el-option>
            <el-option label="冬季学期" value="冬"></el-option>
            <el-option label="春季学期" value="春"></el-option>
            <el-option label="夏季学期" value="夏"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item> </el-form-item>
        <el-form-item label="选课起止时间" style="height: 60px">
          <el-date-picker
              v-model="form2.select"
              value-format="YYYY-MM-DDTHH:mm:ss"
              type="datetimerange"
              range-separator="至"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
          />
        </el-form-item>
        <el-form-item label="平时成绩登记时间">
          <el-date-picker
              v-model="form2.usual"
              value-format="YYYY-MM-DDTHH:mm:ss"
              type="datetimerange"
              range-separator="至"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
          />
        </el-form-item>
        <el-form-item label="考试成绩登记时间" >
          <el-date-picker
              v-model="form2.finall"
              value-format="YYYY-MM-DDTHH:mm:ss"
              type="datetimerange"
              range-separator="至"
              start-placeholder="开始时间"
              end-placeholder="截止时间"
          />
        </el-form-item>


      </el-form>
      <template #footer>
      <span>
        <el-button @click="dialogVisible2 = false;load();">取 消</el-button>
        <el-button type="primary" @click="update">确 定</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<script>
import request from "@/utils/request";


export default{
  name:'ManageTime',

  data() {
    return {
      search: '',
      tableData: [],
      currentPage: 1,
      pageSize: 10,
      total: 0,
      dialogVisible: false,
      dialogVisible2: false,
      form: {},
      form2: {},
      dep: [],
      value1:'',
      selectDep: ''
    }
  },
  created() {
    this.load();
  },
  methods: {

    timechange(row,column) {
      //格式化日期显示
        let data = row[column.property]
        let dt = new Date(data)
        // console.log(dt)
        return dt.getFullYear() + '-' +(dt.getMonth()+ 1+'').padStart(2,'0')+ '-'+
            (dt.getDate()+'').padStart(2,'0')+ ' ' + (dt.getHours()+'').padStart(2,'0')+':'+ (dt.getMinutes()+'').padStart(2,'0')
            + ':' + (dt.getSeconds()+'').padStart(2,'0')
      },

        load() {
      request.get("/timelimit", {
        params: {
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          search: this.search,
          // selectDep: this.selectDep
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.records

        this.total = res.data.total
      })
    },
    add() {
      this.dialogVisible = true;
      this.form = {};
    },
    save() {
      let formObj = {
        "term": this.form.year + "年" + this.form.season,
        "selectbegin": this.form.select[0],
        "selectend": this.form.select[1],
        "usualgradebegin": this.form.usual[0],
        "usualgradeend": this.form.usual[1],
        "finalgradebegin": this.form.finall[0],
        "finalgradeend": this.form.finall[1],
      }
      // console.log(formObj)
      request.post("/timelimit", formObj).then(res => {
        console.log(res);
        if (res.code === '0') {
          this.$message({
            type: "success",
            message: "新增成功"
          })
          this.dialogVisible = false;
          this.load();
        } else {
          this.$message({
            type: "warning",
            message: res.msg
          })
        }
      })
    },
    update() {
      let formObj = {
        "term": this.form2.year + "年" + this.form2.season,
        "selectbegin": this.form2.select[0],
        "selectend": this.form2.select[1],
        "usualgradebegin": this.form2.usual[0],
        "usualgradeend": this.form2.usual[1],
        "finalgradebegin": this.form2.finall[0],
        "finalgradeend": this.form2.finall[1],
      }
      // console.log(formObj)
      request.put("/timelimit", formObj).then(res => {
        console.log(res);
        if (res.code === '0') {
          this.$message({
            type: "success",
            message: "更新成功"
          })
          this.dialogVisible = false;
          this.load();
        } else {
          this.$message({
            type: "warning",
            message: res.msg
          })
        }
      })
    },

    handleEdit(row) {
      let formObj = {
        "year": row.term.substr(0, 2),
        "season": row.term[3],
        "select":[row.selectbegin,row.selectend],
        "usual":[row.usualgradebegin,row.usualgradeend],
        "finall":[row.finalgradebegin,row.finalgradeend],
      };
      this.form2 = formObj;
      console.log(row);
      this.dialogVisible2 = true;
    },
    handleDelete(term) {
      request.delete("/timelimit/" + term).then(res => {
        if (res.code === '0') {
          this.$message({
            type: "success",
            message: "删除成功"
          })
          this.load();
        } else {
          this.$message({
            type: "error",
            message: res.msg
          })
        }
      })
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(currentPage) {
      this.currentPage = currentPage
      this.load()
    }
  }
}


</script>
<!--<style lang="scss" scoped>-->
<!--.popperClass.el-date-picker {-->
<!--  width: 220px;-->
<!--  height:200px;-->
<!--}-->

<!--</style>-->


