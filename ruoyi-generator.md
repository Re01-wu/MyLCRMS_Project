# 若依框架代码生成功能恢复方案

## 问题分析

经过对项目的分析，发现当前项目中缺少代码生成器模块（ruoyi-generator）。从以下几点可以确认：

1. 项目的主pom.xml文件中没有包含ruoyi-generator模块的依赖
2. 项目目录结构中不存在ruoyi-generator目录
3. 数据库日志中有com.ruoyi.generator.controller.GenController的调用记录，说明之前是存在并使用过的
4. 前端代码中的代码生成相关页面和API仍然存在

## 恢复方案

要恢复若依框架的代码生成功能，需要执行以下步骤：

### 1. 添加ruoyi-generator模块

从若依框架的官方仓库获取ruoyi-generator模块的代码，并添加到项目中。

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
    <groupId>com.ruoyi</groupId>
    <artifactId>ruoyi-generator</artifactId>
</dependency>
```

### 4. 确保数据库中存在代码生成相关的表

检查数据库中是否存在以下表：
- gen_table
- gen_table_column

如果不存在，需要从若依框架的官方SQL脚本中获取创建这些表的语句并执行。

### 5. 确保前端菜单权限正确

检查数据库中的sys_menu表，确保代码生成菜单项存在且状态正常。

## 实施建议

1. 从若依框架的官方仓库（https://gitee.com/y_project/RuoYi-Vue）下载最新版本
2. 提取其中的ruoyi-generator模块
3. 将提取的模块与当前项目版本进行适配
4. 按照上述步骤集成到当前项目中

完成以上步骤后，代码生成功能应该可以正常使用。