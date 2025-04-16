<template>
  <div class="app-container">
    <!-- 搜索表单 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          style="width: 200px" 
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入联系电话"
          clearable
          style="width: 200px" 
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5"> <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:guardian:add']">新增</el-button> </el-col>
      <el-col :span="1.5"> <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:guardian:edit']">修改</el-button> </el-col>
      <el-col :span="1.5"> <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:guardian:remove']">删除</el-button> </el-col>
      <el-col :span="1.5"> <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:guardian:export']">导出</el-button> </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="guardianList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="监护人ID" align="center" prop="guardianId" /> --> <!-- 隐藏ID -->
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="与儿童关系" align="center" prop="relationship" /> <!-- 调整标签 -->
      <el-table-column label="联系电话" align="center" prop="phone" width="120"/> <!-- 调整宽度 -->
      <el-table-column label="当前住址" align="center" prop="address" :show-overflow-tooltip="true"/>
      <el-table-column label="工作情况" align="center" prop="workInfo" :show-overflow-tooltip="true"/> <!-- 添加工作情况列 -->
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/> <!-- 添加备注列 -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="120">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:guardian:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:guardian:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改监护人信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body> <!-- 加宽对话框 -->
      <el-form ref="form" :model="form" :rules="rules" label-width="100px"> <!-- 调整标签宽度 -->
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入监护人姓名" />
        </el-form-item>
        <el-form-item label="与儿童关系" prop="relationship">
          <el-input v-model="form.relationship" placeholder="例如: 祖父, 外婆, 叔叔等" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" maxlength="11"/> <!-- 增加长度限制 -->
        </el-form-item>
        <el-form-item label="当前住址" prop="address">
          <el-input v-model="form.address" type="textarea" :rows="2" placeholder="请输入当前住址" />
        </el-form-item>
        <el-form-item label="工作情况" prop="workInfo"> <!-- 调整标签 -->
          <el-input v-model="form.workInfo" type="textarea" :rows="3" placeholder="可简述监护人工作或外出务工父母信息" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" :rows="2" placeholder="请输入备注信息" />
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
import { listGuardian, getGuardian, delGuardian, addGuardian, updateGuardian } from "@/api/lcrms/guardian";

export default {
  name: "Guardian",
  data() {
    return {
      // ... (loading, ids, single, multiple, showSearch, total, guardianList, title, open 不变) ...
      loading: true, ids: [], single: true, multiple: true, showSearch: true,
      total: 0, guardianList: [], title: "", open: false,
      // 查询参数
      queryParams: {
        pageNum: 1, pageSize: 10, name: null, phone: null,
      },
      // 表单参数
      form: {},
      // ==================== 修改开始: 添加校验规则 ====================
      // 表单校验
      rules: {
        name: [
          { required: true, message: "监护人姓名不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '姓名长度应在 2 到 20 个字符之间', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" },
          { pattern: /^1[3-9]\d{9}$/, message: "请输入正确的手机号码", trigger: ["blur", "change"] }
        ],
        relationship: [
             { max: 50, message: '关系描述不能超过 50 个字符', trigger: 'blur' }
        ],
        address: [
             { max: 255, message: '地址不能超过 255 个字符', trigger: 'blur' }
        ],
        workInfo: [
            { max: 255, message: '工作情况描述不能超过 255 个字符', trigger: 'blur' }
        ],
        remark: [
             { max: 500, message: '备注不能超过 500 个字符', trigger: 'blur' }
        ]
      }
      // ==================== 修改结束 ====================
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询监护人信息列表 */
    getList() { /* ... 不变 ... */
        this.loading = true; listGuardian(this.queryParams).then(response => { this.guardianList = response.rows; this.total = response.total; this.loading = false; });
    },
    // 取消按钮
    cancel() { /* ... 不变 ... */
        this.open = false; this.reset();
    },
    // 表单重置
    reset() { /* ... 不变 ... */
        this.form = { guardianId: null, name: null, relationship: null, phone: null, address: null, workInfo: null, createBy: null, createTime: null, updateBy: null, updateTime: null, remark: null };
        this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() { /* ... 不变 ... */
        this.queryParams.pageNum = 1; this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() { /* ... 不变 ... */
        this.resetForm("queryForm"); this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) { /* ... 不变 ... */
        this.ids = selection.map(item => item.guardianId); this.single = selection.length!==1; this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() { /* ... 不变 ... */
        this.reset(); this.open = true; this.title = "添加监护人信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) { /* ... 不变 ... */
        this.reset(); const guardianId = row.guardianId || this.ids[0]; getGuardian(guardianId).then(response => { this.form = response.data; this.open = true; this.title = "修改监护人信息"; });
    },
    /** 提交按钮 */
    submitForm() { /* ... 不变 ... */
        this.$refs["form"].validate(valid => { if (valid) { if (this.form.guardianId != null) { updateGuardian(this.form).then(response => { this.$modal.msgSuccess("修改成功"); this.open = false; this.getList(); }); } else { addGuardian(this.form).then(response => { this.$modal.msgSuccess("新增成功"); this.open = false; this.getList(); }); } } });
    },
    /** 删除按钮操作 */
    handleDelete(row) { /* ... 不变 ... */
        const guardianIds = row.guardianId || this.ids; this.$modal.confirm('是否确认删除监护人信息编号为"' + guardianIds + '"的数据项？').then(function() { return delGuardian(guardianIds); }).then(() => { this.getList(); this.$modal.msgSuccess("删除成功"); }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() { /* ... 不变 ... */
        this.download('system/guardian/export', { ...this.queryParams }, `guardian_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style scoped>
/* 如果需要自定义样式，可以在这里添加 */
</style>