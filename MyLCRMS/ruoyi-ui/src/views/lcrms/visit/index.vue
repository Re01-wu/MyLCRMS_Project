<template>
  <div class='app-container'>
    <!-- 搜索结果表单 -->
    <el-form :model='queryParams' ref='queryForm' size='small' :inline='true' v-show='showSearch' label-width='100px'>
      <!-- 按儿童姓名查询 -->
      <el-form-item label='关联儿童' prop='childName'>
        <el-input v-model='queryParams.childName' placeholder='请输入儿童姓名' clearable style='width: 150px' @keyup.enter.native='handleQuery'/>
      </el-form-item>
      <!-- 按家访时间范围查询 -->
      <el-form-item label='家访时间'>
          <el-date-picker v-model='dateRange' style='width: 240px' value-format='yyyy-MM-dd' type='daterange' range-separator='-' start-placeholder='开始日期' end-placeholder='结束日期'></el-date-picker>
      </el-form-item>
      <!-- 按家访人姓名查询 -->
      <el-form-item label='家访人姓名' prop='visitorName'>
        <el-input v-model='queryParams.visitorName' placeholder='请输入家访人姓名' clearable style='width: 150px' @keyup.enter.native='handleQuery'/>
      </el-form-item>
      <el-form-item>
        <el-button type='primary' icon='el-icon-search' size='mini' @click='handleQuery'>搜索</el-button>
        <el-button icon='el-icon-refresh' size='mini' @click='resetQuery'>重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮行 -->
    <el-row :gutter='10' class='mb8'>
      <el-col :span="1.5"><el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:visit:add']">新增</el-button></el-col>
      <el-col :span="1.5"><el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:visit:edit']">修改</el-button></el-col>
      <el-col :span="1.5"><el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:visit:remove']">删除</el-button></el-col>
      <el-col :span="1.5"><el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:visit:export']">导出</el-button></el-col>
      <right-toolbar :showSearch.sync='showSearch' @queryTable='getList'></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading='loading' :data='visitList' @selection-change='handleSelectionChange'>
      <el-table-column type='selection' width='55' align='center' />

      <!-- ==================== 修改开始: 显示儿童姓名，隐藏ID ==================== -->
      <el-table-column label='关联儿童姓名' align='center' prop='childName' />
      <!-- <el-table-column label='关联儿童ID' align='center' prop='childId' /> -->
      <!-- ==================== 修改结束 ==================== -->

      <el-table-column label='家访/联系时间' align='center' prop='visitTime' width='160'>
        <template slot-scope='scope'><span>{{ parseTime(scope.row.visitTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span></template>
      </el-table-column>
      <el-table-column label='家访人姓名' align='center' prop='visitorName' />
      <el-table-column label='联系方式' align='center' prop='visitMethod' />
      <el-table-column label='沟通内容' align='center' prop='content' :show-overflow-tooltip='true'/>
      <el-table-column label='操作' align='center' class-name='small-padding fixed-width' width='120'>
        <template slot-scope='scope'>
          <el-button size='mini' type='text' icon='el-icon-edit' @click='handleUpdate(scope.row)' v-hasPermi="['system:visit:edit']">修改</el-button>
          <el-button size='mini' type='text' icon='el-icon-delete' @click='handleDelete(scope.row)' v-hasPermi="['system:visit:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <pagination v-show='total>0' :total='total' :page.sync='queryParams.pageNum' :limit.sync='queryParams.pageSize' @pagination='getList'/>

    <!-- 添加或修改家访记录对话框 -->
    <el-dialog :title='title' :visible.sync='open' width='600px' append-to-body>
      <el-form ref='form' :model='form' :rules='rules' label-width='110px'>
        <!-- 表单内容保持不变，仍然使用弹出选择框选择儿童 -->
        <el-form-item label='关联儿童' prop='childId'>
          <el-input v-model='form.childName' placeholder='请选择关联儿童' readonly>
            <el-button slot='append' icon='el-icon-search' @click='openSelectChildDialog'>选择</el-button>
          </el-input>
        </el-form-item>
        <el-form-item label='家访/联系时间' prop='visitTime'>
          <el-date-picker clearable style='width: 100%' v-model='form.visitTime' type='datetime' value-format='yyyy-MM-dd HH:mm:ss' placeholder='请选择家访/联系时间'></el-date-picker>
        </el-form-item>
        <el-form-item label='家访人' prop='visitorUserId'>
          <el-select v-model='form.visitorUserId' placeholder='请选择家访人' filterable clearable style='width: 100%'>
            <el-option v-for='item in userOptions' :key='item.value' :label='item.label' :value='item.value'></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label='联系方式' prop='visitMethod'>
          <el-input v-model='form.visitMethod' placeholder='请输入联系方式 (如:家访/电话)'></el-input>
        </el-form-item>
        <el-form-item label='沟通内容摘要' prop='content'>
          <el-input v-model='form.content' type='textarea' :rows='3' placeholder='请简要记录沟通内容'></el-input>
        </el-form-item>
        <el-form-item label='备注' prop='remark'>
          <el-input v-model='form.remark' type='textarea' :rows='2' placeholder='请输入备注信息'></el-input>
        </el-form-item>
      </el-form>
      <div slot='footer' class='dialog-footer'>
        <el-button type='primary' @click='submitForm'>确 定</el-button>
        <el-button @click='cancel'>取 消</el-button>
      </div>
    </el-dialog>

    <!-- 选择儿童对话框 -->
    <el-dialog title='选择儿童' :visible.sync='childSelectOpen' width='800px' append-to-body>
      <!-- ... 选择儿童对话框内容保持不变 ... -->
      <el-form :model='childSelectQueryParams' ref='childSelectQueryForm' size='small' :inline='true' label-width='68px'>
        <el-form-item label='姓名' prop='name'><el-input v-model='childSelectQueryParams.name' placeholder='请输入姓名' clearable @keyup.enter.native='handleChildSelectQuery'></el-input></el-form-item>
        <el-form-item label='学校' prop='school'><el-input v-model='childSelectQueryParams.school' placeholder='请输入学校' clearable @keyup.enter.native='handleChildSelectQuery'></el-input></el-form-item>
        <el-form-item><el-button type='primary' icon='el-icon-search' size='mini' @click='handleChildSelectQuery'>搜索</el-button><el-button icon='el-icon-refresh' size='mini' @click='resetChildSelectQuery'>重置</el-button></el-form-item>
      </el-form>
      <el-table v-loading='childSelectLoading' :data='childSelectList' @row-click='handleChildSelect'>
        <el-table-column label='姓名' align='center' prop='name'></el-table-column>
        <el-table-column label='性别' align='center' prop='gender'><template slot-scope='scope'><dict-tag :options='dict.type.sys_user_sex' :value='scope.row.gender'/></template></el-table-column>
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
// 导入 API
import { listVisit, getVisit, delVisit, addVisit, updateVisit } from '@/api/lcrms/visit'
import { listAllSimpleUser } from '@/api/system/user'
import { listChild, getChild } from '@/api/lcrms/child'
import DictMixin from '@/mixins/DictMixin'

export default {
  name: 'Visit',
  mixins: [DictMixin],
  dicts: ['sys_user_sex', 'sys_normal_disable'], // 包含了选择儿童弹窗需要的字典
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      visitList: [],
      title: '',
      open: false,
      userOptions: [],
      dateRange: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        childId: null,
        childName: null,
        visitorName: null,
        params: {}
      },
      form: {},
      childSelectOpen: false,
      childSelectLoading: false,
      childSelectList: [],
      childSelectTotal: 0,
      childSelectQueryParams: { pageNum: 1, pageSize: 10, name: null, school: null },
      tempSelectedChild: null,
      rules: {
        childId: [{ required: true, message: '请选择关联儿童', trigger: 'change' }],
        visitTime: [{ required: true, message: '家访/联系时间不能为空', trigger: 'change' }],
        visitorUserId: [{ required: true, message: '家访人不能为空', trigger: 'change' }]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询家访记录列表 */
    getList() {
      this.loading = true
      this.queryParams.params = {}
      if (this.dateRange && this.dateRange.length === 2) {
        this.queryParams.params['beginVisitTime'] = this.dateRange[0]
        this.queryParams.params['endVisitTime'] = this.dateRange[1]
      }
      listVisit(this.queryParams).then(response => {
        this.visitList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 获取用户选项 */
    loadUserOptions() {
      if (!this.userOptions || this.userOptions.length === 0) {
        listAllSimpleUser().then(response => {
          this.userOptions = response.data
        }).catch(error => {
          console.error('加载用户选项失败:', error)
          this.$modal.msgError('加载用户选项失败！')
        })
      }
    },
    /** 打开选择儿童对话框 */
    openSelectChildDialog() {
      this.childSelectOpen = true
      this.resetChildSelectQuery()
    },
    /** 查询儿童列表（用于选择对话框） */
    getChildSelectList() {
      this.childSelectLoading = true
      listChild(this.childSelectQueryParams).then(response => {
        this.childSelectList = response.rows
        this.childSelectTotal = response.total
        this.childSelectLoading = false
      })
    },
    /** 儿童选择对话框 - 搜索结果按钮操作 */
    handleChildSelectQuery() {
      this.childSelectQueryParams.pageNum = 1
      this.getChildSelectList()
    },
    /** 儿童选择对话框 - 重置按钮操作 */
    resetChildSelectQuery() {
      this.resetForm('childSelectQueryForm')
      this.handleChildSelectQuery()
    },
    /** 儿童选择对话框 - 点击行进行选择 */
    handleChildSelect(row) {
      if (row) {
        this.tempSelectedChild = { childId: row.childId, name: row.name }
        this.$modal.msgSuccess(`已选择儿童: ${row.name}`)
      }
    },
    /** 儿童选择对话框 - 确定按钮 */
    confirmChildSelect() {
      if (this.tempSelectedChild) {
        this.form.childId = this.tempSelectedChild.childId
        this.form.childName = this.tempSelectedChild.name
        this.childSelectOpen = false
        this.tempSelectedChild = null
        this.$refs.form.validateField('childId')
      } else {
        this.$modal.msgWarning('请先选择一个儿童')
      }
    },
    /** 儿童选择对话框 - 关闭按钮 */
    closeChildSelectDialog() {
      this.childSelectOpen = false
      this.tempSelectedChild = null
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        visitId: null,
        childId: null,
        childName: null,
        visitTime: null,
        visitorUserId: null,
        visitorName: null,
        visitMethod: null,
        content: null,
        remark: null
      }
      this.resetForm('form')
      this.tempSelectedChild = null
    },
    /** 搜索结果按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.visitId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.loadUserOptions()
      this.open = true
      this.title = '添加家访记录'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      this.loadUserOptions()
      const visitId = row.visitId || this.ids[0]
      getVisit(visitId).then(response => {
        this.form = response.data
        // 最好让后端 getVisit 接口直接返回 childName
        if (this.form.childId && !this.form.childName) {
          getChild(this.form.childId).then(childRes => { this.$set(this.form, 'childName', childRes.data ? childRes.data.name : '未知儿童') })
            .catch(() => { this.$set(this.form, 'childName', '查询儿童姓名失败') })
        }
        this.open = true
        this.title = '修改家访记录'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          const selectedUser = this.userOptions.find(opt => opt.value === this.form.visitorUserId)
          if (selectedUser) {
            this.form.visitorName = selectedUser.label
          } else {
            this.form.visitorName = null
          }
          const formData = { ...this.form }
          delete formData.childName
          if (formData.visitId != null) {
            updateVisit(formData).then(response => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addVisit(formData).then(response => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const visitIds = row.visitId || this.ids
      this.$modal.confirm('是否确认删除家访记录编号为"' + visitIds + '"的数据项？').then(function() {
        return delVisit(visitIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = { ...this.queryParams }
      queryParams.params = {}
      if (this.dateRange && this.dateRange.length === 2) {
        queryParams.params['beginVisitTime'] = this.dateRange[0]
        queryParams.params['endVisitTime'] = this.dateRange[1]
      }
      this.download('system/visit/export', queryParams, `visit_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>

<style scoped>
/* 样式 */
</style>
