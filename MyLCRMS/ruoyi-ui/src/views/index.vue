<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>留守儿童关爱管理系统</h2>
        <p>
          欢迎使用留守儿童关爱管理系统，本系统旨在为留守儿童提供全方位的关爱和管理服务。通过系统化的信息管理，帮助相关部门和工作人员更好地了解留守儿童的基本情况、监护人信息、家访记录以及关爱活动参与情况，从而提供更有针对性的帮扶措施，确保留守儿童得到社会的关爱与支持。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-tag type="success">专业管理</el-tag>
          <el-tag type="warning" style="margin-left: 10px">爱心关怀</el-tag>
          <el-tag type="danger" style="margin-left: 10px">精准帮扶</el-tag>
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>系统功能</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <h4>核心模块</h4>
            <ul>
              <li>留守儿童信息管理</li>
              <li>监护人信息管理</li>
              <li>家访记录管理</li>
              <li>关爱活动管理</li>
              <li>活动参与记录</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>系统简介</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-flag"></i> <strong>留守儿童信息管理：</strong>记录留守儿童的基本信息、健康状况、学习情况等。
            </p>
            <p>
              <i class="el-icon-user"></i> <strong>监护人信息管理：</strong>记录监护人的基本信息、联系方式、与儿童的关系等。
            </p>
            <p>
              <i class="el-icon-document"></i> <strong>家访记录管理：</strong>记录家访时间、家访人员、家访内容等信息。
            </p>
            <p>
              <i class="el-icon-date"></i> <strong>关爱活动管理：</strong>管理各类关爱活动的计划、执行和评估。
            </p>
            <p>
              <i class="el-icon-s-data"></i> <strong>活动参与记录：</strong>记录留守儿童参与各类关爱活动的情况。
            </p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>系统特点</span>
          </div>
          <div class="body">
            <ol>
              <li>信息全面：全方位记录留守儿童相关信息</li>
              <li>操作简便：界面友好，易于上手使用</li>
              <li>数据安全：严格的权限管理和数据保护</li>
              <li>统计分析：提供多维度的数据统计和分析</li>
              <li>精准帮扶：根据儿童具体情况提供针对性帮助</li>
              <li>活动管理：便捷组织和记录各类关爱活动</li>
              <li>家访跟踪：规范记录家访过程和结果</li>
            </ol>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>使用指南</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-custom"></i> <strong>用户管理：</strong>在系统管理中可以添加和管理系统用户。
            </p>
            <p>
              <i class="el-icon-s-order"></i> <strong>数据录入：</strong>通过各功能模块的表单进行数据录入和管理。
            </p>
            <p>
              <i class="el-icon-s-data"></i> <strong>数据查询：</strong>使用搜索功能快速查找所需信息。
            </p>
            <p>
              <i class="el-icon-s-marketing"></i> <strong>统计分析：</strong>利用系统提供的统计功能进行数据分析。
            </p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Index',
  data() {
    return {
      // 版本号
      version: '1.0.0'
    }
  },
  methods: {
    goTarget(href) {
      window.open(href, '_blank')
    }
  }
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

