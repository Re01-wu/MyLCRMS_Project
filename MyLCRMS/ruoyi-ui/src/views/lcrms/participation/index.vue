<template>
  <div class='app-container'>
    <!-- 搜索结果表单 -->
    <el-form :model='queryParams' ref='queryForm' size='small' :inline='true' v-show='showSearch' label-width='80px'>
       <!-- 按活动名称查询 -->
       <el-form-item label='关联活动' prop='activityName'>
         <el-input v-model='queryParams.activityName' placeholder='请输入活动名称' clearable style='width: 150px' @keyup.enter.native='handleQuery'></el-input>
       </el-form-item>
       <!-- 按儿童姓名查询 -->
       <el-form-item label='关联儿童' prop='childName'>
         <el-input v-model='queryParams.childName' placeholder='请输入儿童姓名' clearable style='width: 150px' @keyup.enter.native='handleQuery'></el-input>
       </el-form-item>
      <el-form-item>
        <el-button type='primary' icon='el-icon-search' size='mini' @click='handleQuery'>搜索</el-button>
        <el-button icon='el-icon-refresh' size='mini' @click='resetQuery'>重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行 -->
    <el-row :gutter='10' class='mb8'>
       <el-col :span='1.5'><el-button type='primary' plain icon='el-icon-plus' size='mini' @click='handleAdd' v-hasPermi="['system:participation:add']">新增</el-button></el-col>
       <el-col :span='1.5'><el-button type='success' plain icon='el-icon-edit' size='mini' :disabled='single' @click='handleUpdate' v-hasPermi="['system:participation:edit']">修改</el-button></el-col>
       <el-col :span='1.5'><el-button type='danger' plain icon='el-icon-delete' size='mini' :disabled='multiple' @click='handleDelete' v-hasPermi="['system:participation:remove']">删除</el-button></el-col>
       <el-col :span='1.5'><el-button type='warning' plain icon='el-icon-download' size='mini' @click='handleExport' v-hasPermi="['system:participation:export']">导出</el-button></el-col>
      <right-toolbar :showSearch.sync='showSearch' @queryTable='getList'></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading='loading' :data='participationList' @selection-change='handleSelectionChange'>
       <el-table-column type='selection' width='55' align='center'></el-table-column>
       <el-table-column label='关联活动名称' align='center' prop='activityName'></el-table-column>
       <el-table-column label='关联儿童姓名' align='center' prop='childName'></el-table-column>
       <el-table-column label='参与时间' align='center' prop='participationTime' width='160'>
         <template slot-scope='scope'><span>{{ parseTime(scope.row.participationTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span></template>
       </el-table-column>
       <el-table-column label='活动表现' align='center' prop='performance' :show-overflow-tooltip='true'></el-table-column>
       <el-table-column label='备注' align='center' prop='remark' :show-overflow-tooltip='true'></el-table-column>
       <el-table-column label='操作' align='center' class-name='small-padding fixed-width' width='120'>
         <template slot-scope='scope'>
           <el-button size='mini' type='text' icon='el-icon-edit' @click='handleUpdate(scope.row)' v-hasPermi="['system:participation:edit']">修改</el-button>
           <el-button size='mini' type='text' icon='el-icon-delete' @click='handleDelete(scope.row)' v-hasPermi="['system:participation:remove']">删除</el-button>
         </template>
       </el-table-column>
    </el-table>

    <pagination v-show='total>0' :total='total' :page.sync='queryParams.pageNum' :limit.sync='queryParams.pageSize' @pagination='getList'></pagination>

    <!-- 添加或修改活动参与记录对话框 -->
    <el-dialog :title='title' :visible.sync='open' width='650px' append-to-body>
      <el-form ref='form' :model='form' :rules='rules' label-width='100px'>
        <el-form-item label='关联活动' prop='activityId'>
          <el-select v-model='form.activityId' placeholder='请选择关联活动' filterable clearable style='width: 100%'>
            <el-option
              v-for='item in activityOptions'
              :key='item.value'
              :label='item.label'
              :value='item.value'>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label='关联儿童' prop='childId'>
          <el-input v-model='form.childName' placeholder='请选择关联儿童' readonly>
            <el-button slot='append' icon='el-icon-search' @click='openSelectChildDialog'>选择</el-button>
          </el-input>
        </el-form-item>
        <el-form-item label='参与时间' prop='participationTime'>
          <el-date-picker clearable style='width: 100%'
            v-model='form.participationTime'
            type='datetime'
            value-format='yyyy-MM-dd HH:mm:ss'
            placeholder='请选择参与/签到时间'>
          </el-date-picker>
        </el-form-item>
        <el-form-item label='活动表现' prop='performance'>
          <el-input v-model='form.performance' type='textarea' :rows='3' placeholder='请记录活动表现或反馈'></el-input>
        </el-form-item>
        <el-form-item label='备注' prop='remark'>
          <el-input v-model='form.remark' type='textarea' :rows='2' placeholder='请输入备注'></el-input>
        </el-form-item>
      </el-form>
      <div slot='footer' class='dialog-footer'>
        <el-button type='primary' @click='submitForm'>确 定</el-button>
        <el-button @click='cancel'>取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择儿童对话框 (复用 visit/index.vue 的) -->
     <el-dialog title='选择儿童' :visible.sync='childSelectOpen' width='800px' append-to-body>
       <el-form :model='childSelectQueryParams' ref='childSelectQueryForm' size='small' :inline='true' label-width='68px'>
         <el-form-item label='姓名' prop='name'><el-input v-model='childSelectQueryParams.name' placeholder='请输入姓名' clearable @keyup.enter.native='handleChildSelectQuery'></el-input></el-form-item>
         <el-form-item label='学校' prop='school'><el-input v-model='childSelectQueryParams.school' placeholder='请输入学校' clearable @keyup.enter.native='handleChildSelectQuery'></el-input></el-form-item>
         <el-form-item><el-button type='primary' icon='el-icon-search' size='mini' @click='handleChildSelectQuery'>搜索</el-button><el-button icon='el-icon-refresh' size='mini' @click='resetChildSelectQuery'>重置</el-button></el-form-item>
       </el-form>
       <el-table v-loading='childSelectLoading' :data='childSelectList' @row-click='handleChildSelect'>
         <el-table-column label='姓名' align='center' prop='name'></el-table-column>
         <el-table-column label='性别' align='center' prop='gender'><template slot-scope='scope'> <dict-tag :options='dict.type.sys_user_sex' :value='scope.row.gender'/></template></el-table-column>
         <el-table-column label='学校' align='center' prop='school' :show-overflow-tooltip='true'></el-table-column>
         <el-table-column label='年级' align='center' prop='grade'></el-table-column>
         <el-table-column label='监护人' align='center' prop='primaryGuardianName'></el-table-column>
       </el-table>
       <pagination v-show='childSelectTotal>0' :total='childSelectTotal' :page.sync='childSelectQueryParams.pageNum' :limit.sync='childSelectQueryParams.pageSize' @pagination='getChildSelectList'></pagination>
       <div slot='footer' class='dialog-footer'><el-button type='primary' @click='confirmChildSelect'>确 定</el-button><el-button @click='closeChildSelectDialog'>取 消</el-button></div>
    </el-dialog>
  </div>
</template>

<script>
// 导入参与记录 API
import { listParticipation, getParticipation, delParticipation, addParticipation, updateParticipation } from '@/api/lcrms/participation'
// ==================== 新增/修改: 导入所需 API 和 Mixin ====================
import { listAllActivities } from '@/api/lcrms/activity' // 导入活动 API
import { listChild, getChild } from '@/api/lcrms/child' // 导入儿童 API
import DictMixin from '@/mixins/DictMixin' // 导入字典 Mixin
// ==================== 结束 ====================

export default {
  name: 'Participation',
  // ==================== 新增/修改: 使用 Mixin 和声明字典 ====================
  mixins: [DictMixin],
  dicts: ['sys_user_sex'], // 儿童选择弹窗需要性别字典
  // ==================== 结束 ====================
  data() {
    return {
      // ... (loading, ids, single, multiple, showSearch, total, participationList, title, open 不变) ...
      loading: true, ids: [], single: true, multiple: true, showSearch: true,
      total: 0, participationList: [], title: '', open: false,
      // ==================== 新增/修改: 添加选项和弹窗控制数据 ====================
      activityOptions: [], // 活动下拉选项
      childSelectOpen: false, childSelectLoading: false, childSelectList: [], childSelectTotal: 0,
      childSelectQueryParams: { pageNum: 1, pageSize: 10, name: null, school: null },
      tempSelectedChild: null,
      // ==================== 结束 ====================
      // 查询参数
      queryParams: {
        pageNum: 1, pageSize: 10, activityId: null, childId: null
      },
      // 表单参数
      form: {}, // reset 中初始化
      // 表单校验
      rules: {
        activityId: [{ required: true, message: '请选择关联活动', trigger: 'change' }], // 修改提示和触发器
        childId: [{ required: true, message: '请选择关联儿童', trigger: 'change' }] // 修改提示和触发器
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询活动参与记录列表 */
    getList() {
      this.loading = true
      // **注意:** 这里后端返回的数据需要包含 activityName 和 childName 才能在列表直接显示
      // 需要修改 LcActivityParticipationMapper.xml 的 select...List 查询进行 JOIN
      listParticipation(this.queryParams).then(response => {
        this.participationList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // ==================== 新增/修改: 添加加载活动选项方法 ====================
    /** 获取活动选项 */
    loadActivityOptions() {
      if (!this.activityOptions || this.activityOptions.length === 0) {
        listAllActivities().then(response => { this.activityOptions = response.data })
          .catch(error => { console.error('加载活动选项失败:', error); this.$modal.msgError('加载活动选项失败！') })
      }
    },
    // ==================== 结束 ====================

    // ==================== 新增/修改: 复制选择儿童相关方法 ====================
    /** 打开选择儿童对话框 */
    openSelectChildDialog() { this.childSelectOpen = true; this.resetChildSelectQuery() },
    /** 查询儿童列表（用于选择对话框） */
    getChildSelectList() { this.childSelectLoading = true; listChild(this.childSelectQueryParams).then(response => { this.childSelectList = response.rows; this.childSelectTotal = response.total; this.childSelectLoading = false }) },
    /** 儿童选择对话框 - 搜索结果按钮操作 */
    handleChildSelectQuery() { this.childSelectQueryParams.pageNum = 1; this.getChildSelectList() },
    /** 儿童选择对话框 - 重置按钮操作 */
    resetChildSelectQuery() { this.resetForm('childSelectQueryForm'); this.handleChildSelectQuery() },
    /** 儿童选择对话框 - 点击行进行选择 */
    handleChildSelect(row) { if (row) { this.tempSelectedChild = { childId: row.childId, name: row.name }; this.$modal.msgSuccess(`已选择儿童: ${row.name}`) } },
    /** 儿童选择对话框 - 确定按钮 */
    confirmChildSelect() { if (this.tempSelectedChild) { this.form.childId = this.tempSelectedChild.childId; this.form.childName = this.tempSelectedChild.name; this.childSelectOpen = false; this.tempSelectedChild = null; this.$refs.form.validateField('childId') } else { this.$modal.msgWarning('请先选择一个儿童') } },
    /** 儿童选择对话框 - 关闭按钮 */
    closeChildSelectDialog() { this.childSelectOpen = false; this.tempSelectedChild = null },
    // ==================== 结束 ====================

    // 取消按钮
    cancel() { this.open = false; this.reset() },
    // 表单重置
    reset() {
      this.form = {
        participationId: null, activityId: null, childId: null, childName: null, // 添加 childName
        participationTime: null, performance: null, remark: null
        // createBy 等忽略
      }
      this.resetForm('form')
      this.tempSelectedChild = null // 重置临时选中儿童
    },
    /** 搜索结果按钮操作 */
    handleQuery() { this.queryParams.pageNum = 1; this.getList() },
    /** 重置按钮操作 */
    resetQuery() { this.resetForm('queryForm'); this.handleQuery() },
    // 多选框选中数据
    handleSelectionChange(selection) { this.ids = selection.map(item => item.participationId); this.single = selection.length !== 1; this.multiple = !selection.length },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.loadActivityOptions() // 加载活动选项
      // 不需要预加载用户选项
      this.open = true
      this.title = '添加活动参与记录'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      this.loadActivityOptions() // 加载活动选项
      const participationId = row.participationId || this.ids[0]
      getParticipation(participationId).then(response => {
        this.form = response.data
        // **重要:** 需要让后端 getParticipation 接口返回 activityName 和 childName
        // 否则需要在这里根据 ID 额外查询填充 form.childName (如果 activityId 也要显示名字，同理)
        if (this.form.childId && !this.form.childName) {
          getChild(this.form.childId).then(childRes => { this.$set(this.form, 'childName', childRes.data ? childRes.data.name : '未知儿童') })
            .catch(() => { this.$set(this.form, 'childName', '查询儿童姓名失败') })
        }
        this.open = true
        this.title = '修改活动参与记录'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          const formData = { ...this.form }
          delete formData.childName // 删除临时的 childName

          if (formData.participationId != null) {
            updateParticipation(formData).then(response => { this.$modal.msgSuccess('修改成功'); this.open = false; this.getList() })
          } else {
            addParticipation(formData).then(response => { this.$modal.msgSuccess('新增成功'); this.open = false; this.getList() })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) { const participationIds = row.participationId || this.ids; this.$modal.confirm('是否确认删除活动参与记录编号为"' + participationIds + '"的数据项？').then(function() { return delParticipation(participationIds) }).then(() => { this.getList(); this.$modal.msgSuccess('删除成功') }).catch(() => {}) },
    /** 导出按钮操作 */
    handleExport() { this.download('system/participation/export', { ...this.queryParams }, `participation_${new Date().getTime()}.xlsx`) }
  }
}
</script>

<style scoped>
/* 样式 */
</style>
