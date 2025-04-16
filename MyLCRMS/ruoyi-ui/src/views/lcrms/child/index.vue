<template>
  <div class="app-container">
    <!-- 搜索表单 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学校" prop="school"> <!-- 添加学校查询 -->
        <el-input
          v-model="queryParams.school"
          placeholder="请输入学校"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
       <el-form-item label="年级" prop="grade"> <!-- 添加年级查询 -->
        <el-input
          v-model="queryParams.grade"
          placeholder="请输入年级"
          clearable
          style="width: 100px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
       <el-form-item label="状态" prop="status"> <!-- 添加状态查询 -->
         <el-select v-model="queryParams.status" placeholder="儿童状态" clearable style="width: 100px">
           <el-option
             v-for="dict in dict.type.sys_normal_disable"
             :key="dict.value"
             :label="dict.label"
             :value="dict.value"
           />
         </el-select>
       </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:child:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:child:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:child:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:child:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="childList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="性别" align="center" prop="gender" width="50">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.gender"/>
        </template>
      </el-table-column>
      <el-table-column label="出生日期" align="center" prop="birthDate" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.birthDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="身份证号" align="center" prop="idCard" width="170"/>
      <el-table-column label="所在学校" align="center" prop="school" :show-overflow-tooltip="true"/>
      <el-table-column label="年级" align="center" prop="grade" width="80"/>
      <el-table-column label="家庭住址" align="center" prop="homeAddress" :show-overflow-tooltip="true" />

      <!-- ==================== 修改开始: 显示监护人姓名 ==================== -->
      <el-table-column label="主要监护人" align="center" prop="primaryGuardianName" />
      <!-- ==================== 修改结束 ==================== -->

      <el-table-column label="状态" align="center" prop="status" width="70">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="120">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:child:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:child:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改留守儿童信息对话框 (这部分代码保持不变，因为表单仍然使用下拉框选择ID) -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名" prop="name">
              <el-input v-model="form.name" placeholder="请输入姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性别" prop="gender">
              <el-select v-model="form.gender" placeholder="请选择性别" style="width: 100%;">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="出生日期" prop="birthDate">
              <el-date-picker clearable style="width: 100%;"
                v-model="form.birthDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择出生日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCard">
              <el-input v-model="form.idCard" placeholder="请输入身份证号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所在学校" prop="school">
              <el-input v-model="form.school" placeholder="请输入所在学校" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="年级" prop="grade">
              <el-input v-model="form.grade" placeholder="请输入年级" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="家庭住址" prop="homeAddress">
          <el-input v-model="form.homeAddress" type="textarea" placeholder="请输入家庭住址" />
        </el-form-item>
        <el-form-item label="健康状况" prop="healthStatus">
          <el-input v-model="form.healthStatus" type="textarea" placeholder="请简述健康状况" />
        </el-form-item>
        <el-form-item label="主要监护人" prop="primaryGuardianId">
          <el-select v-model="form.primaryGuardianId" placeholder="请选择主要监护人" filterable clearable style="width: 100%">
            <el-option
              v-for="item in guardianOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注信息" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// 导入儿童信息的 API 函数
import { listChild, getChild, delChild, addChild, updateChild } from "@/api/lcrms/child";
// 导入监护人 API 函数 (只需要 listAllGuardians)
import { listAllGuardians } from "@/api/lcrms/guardian";

export default {
  name: "Child",
  // 声明需要使用的字典类型
  dicts: ['sys_user_sex', 'sys_normal_disable'],
  data() {
    return {
      // ... (loading, ids, single, multiple, showSearch, total, childList, title, open 不变) ...
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      childList: [],
      title: "",
      open: false,
      // 监护人选项数据
      guardianOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        school: null, // 添加查询参数
        grade: null,  // 添加查询参数
        status: null  // 添加查询参数
      },
      // 表单参数
      form: {}, // 表单数据会在 reset() 中初始化
      // 表单校验规则
      rules: {
        name: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
         primaryGuardianId: [
             { required: true, message: "主要监护人不能为空", trigger: "change" }
        ],
        status: [ // 状态通常也是必选的
             { required: true, message: "状态不能为空", trigger: "change" }
        ]
        // 可以添加更多校验...
      }
    };
  },
  created() {
    this.getList(); // 页面创建时加载儿童列表
  },
  methods: {
    /** 查询留守儿童信息列表 */
    getList() {
      this.loading = true;
      listChild(this.queryParams).then(response => {
        this.childList = response.rows; // 后端现在返回的数据中应包含 primaryGuardianName
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 获取监护人选项 */
    loadGuardianOptions() {
      if (!this.guardianOptions || this.guardianOptions.length === 0) {
          listAllGuardians().then(response => {
            this.guardianOptions = response.data;
          }).catch(error => {
             console.error("加载监护人选项失败:", error);
             this.$modal.msgError("加载监护人选项失败，请检查后端接口！");
          });
      }
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        childId: null,
        name: null,
        gender: null,
        birthDate: null,
        idCard: null,
        school: null,
        grade: null,
        homeAddress: null,
        healthStatus: null,
        primaryGuardianId: null,
        status: "0", // 默认状态为正常
        // primaryGuardianName 字段不需要在表单中，它是后端查询带过来的
        remark: null
        // createBy, createTime 等由 BaseEntity 处理，不需要在表单中
      };
      // 清空 guardianOptions 可以在这里做，或者在每次打开弹窗时重新加载
      // this.guardianOptions = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.childId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.loadGuardianOptions(); // 加载下拉选项
      this.open = true;
      this.title = "添加留守儿童信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.loadGuardianOptions(); // 加载下拉选项
      const childId = row.childId || this.ids[0]
      getChild(childId).then(response => {
        this.form = response.data;
        // 注意：如果 getChild 接口没有返回 primaryGuardianName,
        // 那么修改表单的下拉框能正常工作，但列表依赖 list 接口的数据。
        this.open = true;
        this.title = "修改留守儿童信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 提交时不需要手动处理 primaryGuardianName，后端保存的是 primaryGuardianId
          if (this.form.childId != null) {
            updateChild(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChild(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const childIds = row.childId || this.ids;
      this.$modal.confirm('是否确认删除留守儿童信息编号为"' + childIds + '"的数据项？').then(function() {
        return delChild(childIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      // 导出时，后端通常会根据查询条件重新查询并导出包含关联名称的数据
      this.download('system/child/export', {
        ...this.queryParams
      }, `child_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

<style scoped>
/* 如果需要可以添加一些自定义样式 */
</style>