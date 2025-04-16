<template>
  <div class="app-container">
    <!-- 搜索表单 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="活动名称" prop="activityName">
        <el-input v-model="queryParams.activityName" placeholder="请输入活动名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="活动时间">
        <el-date-picker v-model="daterangeActivityTime" style="width: 240px" value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期"></el-date-picker>
      </el-form-item>
       <el-form-item label="负责人" prop="organizerName">
         <el-input v-model="queryParams.organizerName" placeholder="请输入负责人姓名" clearable @keyup.enter.native="handleQuery"/>
       </el-form-item>
        <el-form-item label="状态" prop="status">
         <!-- 搜索下拉框使用手动定义的选项 -->
         <el-select v-model="queryParams.status" placeholder="活动状态" clearable style="width: 120px">
           <el-option v-for="item in activityStatusOptions" :key="item.value" :label="item.label" :value="item.value"/>
         </el-select>
       </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行 -->
    <el-row :gutter="10" class="mb8">
       <el-col :span="1.5"><el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:activity:add']">新增</el-button></el-col>
       <el-col :span="1.5"><el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:activity:edit']">修改</el-button></el-col>
       <el-col :span="1.5"><el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:activity:remove']">删除</el-button></el-col>
       <el-col :span="1.5"><el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:activity:export']">导出</el-button></el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="activityList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="活动名称" align="center" prop="activityName" :show-overflow-tooltip="true"/>
      <el-table-column label="活动时间" align="center" prop="activityTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.activityTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="活动地点" align="center" prop="location" :show-overflow-tooltip="true"/>
      <el-table-column label="活动内容" align="center" prop="content" :show-overflow-tooltip="true"/>
      <el-table-column label="负责人姓名" align="center" prop="organizerName" />
      <el-table-column label="活动状态" align="center" prop="status" width="90">
        <template slot-scope="scope">
          <!-- 表格显示使用 formatStatus 方法 -->
          <span>{{ formatStatus(scope.row.status) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="120">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:activity:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:activity:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改关爱活动对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="活动名称" prop="activityName">
          <el-input v-model="form.activityName" placeholder="请输入活动名称" />
        </el-form-item>
        <el-form-item label="活动时间" prop="activityTime">
          <el-date-picker clearable style="width: 100%;"
            v-model="form.activityTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择活动时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="活动地点" prop="location">
          <el-input v-model="form.location" placeholder="请输入活动地点" />
        </el-form-item>
        <el-form-item label="活动内容" prop="content">
          <el-input v-model="form.content" type="textarea" :rows="3" placeholder="请描述活动内容" />
        </el-form-item>
        <el-form-item label="负责人" prop="organizerUserId">
          <el-select v-model="form.organizerUserId" placeholder="请选择负责人" filterable clearable style="width: 100%">
            <el-option
              v-for="item in userOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="活动状态" prop="status">
           <!-- 表单 Radio Group 使用手动定义的选项 -->
           <el-radio-group v-model="form.status">
             <el-radio v-for="item in activityStatusOptions" :key="item.value" :label="item.value">{{item.label}}</el-radio>
           </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" :rows="2" placeholder="请输入备注" />
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
// 导入活动 API
import { listActivity, getActivity, delActivity, addActivity, updateActivity } from "@/api/lcrms/activity";
// 导入用户 API
import { listAllSimpleUser } from "@/api/system/user";
// 不再需要导入 DictMixin

export default {
  name: "Activity",
  // 不再需要 mixins 和 dicts
  data() {
    return {
      loading: true, ids: [], single: true, multiple: true, showSearch: true,
      total: 0, activityList: [], title: "", open: false,
      daterangeActivityTime: [],
      userOptions: [], // 用户选项
      // ==================== 新增: 手动定义活动状态选项 ====================
      activityStatusOptions: [
        { value: "0", label: "未开始" },
        { value: "1", label: "进行中" },
        { value: "2", label: "已结束" }
      ],
      // ==================== 结束 ====================
      queryParams: {
        pageNum: 1, pageSize: 10, activityName: null, organizerName: null, status: null, params: {}
      },
      form: {}, // 在 reset() 中初始化
      rules: {
        activityName: [ { required: true, message: "活动名称不能为空", trigger: "blur" } ],
        activityTime: [ { required: true, message: "活动时间不能为空", trigger: "change" } ],
        status: [ { required: true, message: "活动状态不能为空", trigger: "change" } ],
        organizerUserId: [ { required: true, message: "负责人不能为空", trigger: "change" } ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询关爱活动列表 */
    getList() { /* ... 不变 ... */
        this.loading = true; this.queryParams.params = {};
        if (this.daterangeActivityTime && this.daterangeActivityTime.length == 2) { this.queryParams.params["beginActivityTime"] = this.daterangeActivityTime[0]; this.queryParams.params["endActivityTime"] = this.daterangeActivityTime[1]; }
        listActivity(this.queryParams).then(response => { this.activityList = response.rows; this.total = response.total; this.loading = false; });
    },
    /** 获取用户选项 */
    loadUserOptions() { /* ... 不变 ... */
        if (!this.userOptions || this.userOptions.length === 0) { listAllSimpleUser().then(response => { this.userOptions = response.data; }).catch(error => { console.error("加载用户选项失败:", error); this.$modal.msgError("加载用户选项失败！"); }); }
    },
    // ==================== 新增: 格式化状态方法 ====================
    /** 格式化活动状态 */
    formatStatus(statusValue) {
      const status = this.activityStatusOptions.find(item => item.value === statusValue);
      return status ? status.label : '未知';
    },
    // ==================== 结束 ====================
    // 取消按钮
    cancel() { this.open = false; this.reset(); },
    // 表单重置
    reset() { /* ... 不变 ... */
        this.form = { activityId: null, activityName: null, activityTime: null, location: null, content: null, organizerUserId: null, organizerName: null, status: "0", remark: null };
        this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
    /** 重置按钮操作 */
    resetQuery() { /* ... 不变 ... */
        this.daterangeActivityTime = []; this.resetForm("queryForm"); this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) { /* ... 不变 ... */
        this.ids = selection.map(item => item.activityId); this.single = selection.length!==1; this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() { /* ... 不变 ... */
        this.reset(); this.loadUserOptions(); this.open = true; this.title = "添加关爱活动";
    },
    /** 修改按钮操作 */
    handleUpdate(row) { /* ... 不变 ... */
        this.reset(); this.loadUserOptions();
        const activityId = row.activityId || this.ids[0];
        getActivity(activityId).then(response => { this.form = response.data; this.open = true; this.title = "修改关爱活动"; });
    },
    /** 提交按钮 */
    submitForm() { /* ... 不变 ... */
        this.$refs["form"].validate(valid => { if (valid) { if (this.form.activityId != null) { updateActivity(this.form).then(response => { this.$modal.msgSuccess("修改成功"); this.open = false; this.getList(); }); } else { addActivity(this.form).then(response => { this.$modal.msgSuccess("新增成功"); this.open = false; this.getList(); }); } } });
    },
    /** 删除按钮操作 */
    handleDelete(row) { /* ... 不变 ... */
        const activityIds = row.activityId || this.ids;
        this.$modal.confirm('是否确认删除关爱活动编号为"' + activityIds + '"的数据项？').then(function() { return delActivity(activityIds); }).then(() => { this.getList(); this.$modal.msgSuccess("删除成功"); }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() { /* ... 不变 ... */
        const queryParams = { ...this.queryParams }; queryParams.params = {};
        if (this.daterangeActivityTime && this.daterangeActivityTime.length == 2) { queryParams.params["beginActivityTime"] = this.daterangeActivityTime[0]; queryParams.params["endActivityTime"] = this.daterangeActivityTime[1];}
        this.download('system/activity/export', queryParams , `activity_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style scoped>
/* 样式 */
</style>