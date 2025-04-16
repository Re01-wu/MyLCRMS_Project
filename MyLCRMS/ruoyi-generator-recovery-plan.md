# 若依框架代码生成功能恢复方案

## 问题分析

经过对项目的分析，发现当前项目中缺少代码生成器模块（ruoyi-generator）。从以下几点可以确认：

1. 项目的主pom.xml文件中没有包含ruoyi-generator模块的依赖
2. 项目目录结构中不存在ruoyi-generator目录
3. 数据库日志中有com.ruoyi.generator.controller.GenController的调用记录，说明之前是存在并使用过的
4. 前端代码中的代码生成相关页面和API仍然存在
5. 前端路由配置中仍然保留了代码生成功能的路由

## 恢复方案

要恢复若依框架的代码生成功能，需要执行以下步骤：

### 1. 添加ruoyi-generator模块

从若依框架的官方仓库获取ruoyi-generator模块的代码，并添加到项目中。

```
项目根目录
├── ruoyi-admin         // 后台服务模块
├── ruoyi-common        // 通用模块
├── ruoyi-framework     // 核心框架
├── ruoyi-generator     // 【需要添加】代码生成模块
├── ruoyi-system        // 系统模块
└── ruoyi-ui            // 前端UI
```

### 2. 修改主pom.xml文件

在主pom.xml文件中添加ruoyi-generator模块的依赖：

```xml
<modules>
    <module>ruoyi-admin</module>
    <module>ruoyi-framework</module>
    <module>ruoyi-system</module>
    <module>ruoyi-common</module>
    <module>ruoyi-generator</module>
</modules>
```

### 3. 修改ruoyi-admin的pom.xml文件

在ruoyi-admin的pom.xml文件中添加对ruoyi-generator的依赖：

```xml
<dependency>
    <groupId>com.lcrms</groupId>
    <artifactId>ruoyi-generator</artifactId>
</dependency>
```

### 4. 确保数据库中存在代码生成相关的表

检查数据库中是否存在以下表：
- gen_table
- gen_table_column

如果不存在，需要从若依框架的官方SQL脚本中获取创建这些表的语句并执行。从项目中的SQL文件可以看出，这些表已经存在于数据库中。

### 5. 确保前端菜单权限正确

检查数据库中的sys_menu表，确保代码生成菜单项存在且状态正常。根据SQL文件分析，菜单项已存在：

```sql
insert into sys_menu values('116',  '代码生成', '3',   '2', 'gen',  'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', sysdate(), '', null, '代码生成菜单');
```

## 实施步骤

1. 从若依框架的官方仓库（https://gitee.com/y_project/RuoYi-Vue）下载最新版本
2. 提取其中的ruoyi-generator模块
3. 将提取的模块与当前项目版本进行适配：
   - 修改包名为com.lcrms.generator（如果需要）
   - 确保依赖版本与当前项目一致
4. 按照上述步骤集成到当前项目中
5. 重新编译并启动项目

## 注意事项

1. 确保添加的ruoyi-generator模块版本与当前项目其他模块版本兼容
2. 如果前端页面有定制修改，需要确保与恢复的后端代码生成功能兼容
3. 恢复后需要进行全面测试，确保代码生成功能正常工作

完成以上步骤后，代码生成功能应该可以正常使用。