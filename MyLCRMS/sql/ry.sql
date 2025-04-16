/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 07/04/2025 08:43:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'lc_guardian_info', '监护人信息表', NULL, NULL, 'LcGuardianInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'guardian', '监护人信息', 'PoChi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08', NULL);
INSERT INTO `gen_table` VALUES (2, 'lc_child_info', '留守儿童信息', NULL, NULL, 'LcChildInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'child', '留守儿童信息', 'PoChi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35', NULL);
INSERT INTO `gen_table` VALUES (3, 'lc_visit_record', '家访记录', NULL, NULL, 'LcVisitRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'visit', '家访记录', 'PoChi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50', NULL);
INSERT INTO `gen_table` VALUES (4, 'lc_support_activity', '关爱活动', NULL, NULL, 'LcSupportActivity', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'activity', '关爱活动', 'PoChi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49', NULL);
INSERT INTO `gen_table` VALUES (5, 'lc_activity_participation', '活动参与记录', NULL, NULL, 'LcActivityParticipation', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'participation', '活动参与记录', 'PoChi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'guardian_id', '监护人ID (主键)', 'bigint', 'Long', 'guardianId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (3, 1, 'relationship', '与儿童关系 (如 祖父, 外婆, 叔叔)', 'varchar(50)', 'String', 'relationship', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (4, 1, 'phone', '联系电话', 'varchar(20)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (5, 1, 'address', '当前住址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (6, 1, 'work_info', '工作情况/外出务工父母信息简述 (可选)', 'varchar(255)', 'String', 'workInfo', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (9, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (11, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 11, 'admin', '2025-04-06 06:49:40', '', '2025-04-06 06:56:08');
INSERT INTO `gen_table_column` VALUES (12, 2, 'child_id', '儿童ID (主键)', 'bigint', 'Long', 'childId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (13, 2, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (14, 2, 'gender', '性别 (0男 1女 2未知 - 对应 sys_user_sex 字典)', 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', 'sys_user_sex', 3, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (15, 2, 'birth_date', '出生日期', 'date', 'Date', 'birthDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (16, 2, 'id_card', '身份证号 (可选, 最好有)', 'varchar(18)', 'String', 'idCard', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (17, 2, 'school', '所在学校', 'varchar(100)', 'String', 'school', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 6, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (18, 2, 'grade', '年级', 'varchar(50)', 'String', 'grade', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (19, 2, 'home_address', '家庭住址', 'varchar(255)', 'String', 'homeAddress', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (20, 2, 'health_status', '健康状况简述', 'varchar(255)', 'String', 'healthStatus', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 9, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (21, 2, 'primary_guardian_id', '主要监护人ID', 'bigint', 'Long', 'primaryGuardianId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (22, 2, 'status', '状态 ', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', 'sys_normal_disable', 11, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (23, 2, 'create_by', '创建者 ', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (24, 2, 'create_time', '创建时间 (RuoYi自动填充)', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (25, 2, 'update_by', '更新者 ', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (26, 2, 'update_time', '更新时间 (RuoYi自动填充)', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (27, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 16, 'admin', '2025-04-06 07:34:58', '', '2025-04-06 07:42:35');
INSERT INTO `gen_table_column` VALUES (28, 3, 'visit_id', '记录ID (主键)', 'bigint', 'Long', 'visitId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (29, 3, 'child_id', '关联儿童ID', 'bigint', 'Long', 'childId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (30, 3, 'visit_time', '家访/联系时间', 'datetime', 'Date', 'visitTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (31, 3, 'visitor_user_id', '家访人/用户ID', 'bigint', 'Long', 'visitorUserId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (32, 3, 'visitor_name', '家访人姓名', 'varchar(50)', 'String', 'visitorName', '0', '0', '0', '0', '0', '1', '0', 'LIKE', 'input', '', 5, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (33, 3, 'visit_method', '联系方式', 'varchar(50)', 'String', 'visitMethod', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (34, 3, 'content', '沟通内容摘要', 'text', 'String', 'content', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 7, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (35, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (36, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (37, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (38, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (39, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 12, 'admin', '2025-04-06 08:08:23', '', '2025-04-06 08:14:50');
INSERT INTO `gen_table_column` VALUES (40, 4, 'activity_id', '活动ID', 'bigint', 'Long', 'activityId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (41, 4, 'activity_name', '活动名称', 'varchar(200)', 'String', 'activityName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (42, 4, 'activity_time', '活动时间', 'datetime', 'Date', 'activityTime', '0', '0', '1', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 3, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (43, 4, 'location', '活动地点', 'varchar(255)', 'String', 'location', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (44, 4, 'content', '活动内容描述', 'text', 'String', 'content', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (45, 4, 'organizer_user_id', '负责人用户ID', 'bigint', 'Long', 'organizerUserId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (46, 4, 'organizer_name', '负责人姓名', 'varchar(50)', 'String', 'organizerName', '0', '0', '0', '0', '0', '1', '0', 'LIKE', 'input', '', 7, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (47, 4, 'status', '活动状态(0未开始 1进行中 2已结束)', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', 'lc_activity_status', 8, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (48, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (49, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (50, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (51, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (52, 4, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 13, 'admin', '2025-04-06 09:35:44', '', '2025-04-06 09:40:49');
INSERT INTO `gen_table_column` VALUES (53, 5, 'participation_id', '参与记录ID', 'bigint', 'Long', 'participationId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (54, 5, 'activity_id', '关联活动ID', 'bigint', 'Long', 'activityId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (55, 5, 'child_id', '关联儿童ID', 'bigint', 'Long', 'childId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (56, 5, 'participation_time', '参与时间', 'datetime', 'Date', 'participationTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (57, 5, 'performance', '活动表现', 'text', 'String', 'performance', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (58, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (60, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');
INSERT INTO `gen_table_column` VALUES (62, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-04-06 14:27:43', '', '2025-04-06 14:32:18');

-- ----------------------------
-- Table structure for lc_activity_participation
-- ----------------------------
DROP TABLE IF EXISTS `lc_activity_participation`;
CREATE TABLE `lc_activity_participation`  (
  `participation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参与记录ID (主键)',
  `activity_id` bigint NOT NULL COMMENT '关联活动ID (外键)',
  `child_id` bigint NOT NULL COMMENT '关联儿童ID (外键)',
  `participation_time` datetime NULL DEFAULT NULL COMMENT '参与/签到时间 (可选)',
  `performance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动表现/反馈 (可选)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`participation_id`) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_child_id`(`child_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动参与记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_activity_participation
-- ----------------------------
INSERT INTO `lc_activity_participation` VALUES (100, 103, 100, '2025-04-08 00:00:00', '是S是S', '', '2025-04-06 14:40:32', '', NULL, '是S是');
INSERT INTO `lc_activity_participation` VALUES (101, 102, 103, '2025-04-09 00:00:00', '大大大大大', '', '2025-04-06 14:41:08', '', NULL, '大大大大大');

-- ----------------------------
-- Table structure for lc_child_info
-- ----------------------------
DROP TABLE IF EXISTS `lc_child_info`;
CREATE TABLE `lc_child_info`  (
  `child_id` bigint NOT NULL AUTO_INCREMENT COMMENT '儿童ID (主键)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别 (0男 1女 2未知 - 对应 sys_user_sex 字典)',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生日期',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号 (可选, 最好有)',
  `school` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在学校',
  `grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `home_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `health_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康状况简述',
  `primary_guardian_id` bigint NULL DEFAULT NULL COMMENT '主要监护人ID (关联 lc_guardian_info 表)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态 (0正常 1停用/转出 - 对应 sys_normal_disable 字典)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者 (RuoYi自动填充)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间 (RuoYi自动填充)',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者 (RuoYi自动填充)',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间 (RuoYi自动填充)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`child_id`) USING BTREE,
  UNIQUE INDEX `idx_id_card`(`id_card` ASC) USING BTREE COMMENT '身份证号唯一索引 (如果需要强制唯一)'
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '留守儿童信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lc_child_info
-- ----------------------------
INSERT INTO `lc_child_info` VALUES (100, 'tom', '0', '2025-04-09', NULL, NULL, NULL, NULL, NULL, 102, '0', '', '2025-04-06 08:22:23', '', '2025-04-06 18:36:19', NULL);
INSERT INTO `lc_child_info` VALUES (101, '艾莉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, '0', '', '2025-04-06 08:27:01', '', '2025-04-06 10:08:30', NULL);
INSERT INTO `lc_child_info` VALUES (102, 'cc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', '2025-04-06 08:27:10', '', NULL, NULL);
INSERT INTO `lc_child_info` VALUES (103, '31 ', '0', '2025-04-01', '31313123', '313131', '313131', '3131313', '3131313', 102, '0', '', '2025-04-06 11:26:32', '', NULL, '313131');
INSERT INTO `lc_child_info` VALUES (104, '李白', '0', '2023-04-05', '130726202304058771', '第一小学', '二年级', '蔡家村', '健康', 107, '0', '', '2025-04-07 07:19:01', '', NULL, NULL);

-- ----------------------------
-- Table structure for lc_guardian_info
-- ----------------------------
DROP TABLE IF EXISTS `lc_guardian_info`;
CREATE TABLE `lc_guardian_info`  (
  `guardian_id` bigint NOT NULL AUTO_INCREMENT COMMENT '监护人ID (主键)',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `relationship` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '与儿童关系 (如 祖父, 外婆, 叔叔)',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前住址',
  `work_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作情况/外出务工父母信息简述 (可选)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`guardian_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监护人信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lc_guardian_info
-- ----------------------------
INSERT INTO `lc_guardian_info` VALUES (102, 'jack', NULL, '123456', NULL, NULL, '', '2025-04-06 08:23:10', '', NULL, NULL);
INSERT INTO `lc_guardian_info` VALUES (103, '中一', NULL, '13465543345', NULL, NULL, '', '2025-04-06 08:27:23', '', '2025-04-06 18:09:43', NULL);
INSERT INTO `lc_guardian_info` VALUES (104, '亲切', '欸额', '132131312', '恶气恶气', '额企鹅企鹅', '', '2025-04-06 11:26:09', '', NULL, '恶气恶气');
INSERT INTO `lc_guardian_info` VALUES (105, '额企鹅企鹅q', '额企鹅企鹅', '额企鹅企鹅', '恶气恶气', '恶气恶气', '', '2025-04-06 11:27:53', '', NULL, 'q恶气恶气去');
INSERT INTO `lc_guardian_info` VALUES (106, '我我我瓦达', '打打', '13074737839', '打打阿达 ', '打打啊啊啊', '', '2025-04-06 18:09:24', '', NULL, '出租车在');
INSERT INTO `lc_guardian_info` VALUES (107, '李四', '祖父', '13473365180', '蔡家村', '务农', '', '2025-04-07 07:17:41', '', NULL, NULL);

-- ----------------------------
-- Table structure for lc_support_activity
-- ----------------------------
DROP TABLE IF EXISTS `lc_support_activity`;
CREATE TABLE `lc_support_activity`  (
  `activity_id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动名称',
  `activity_time` datetime NOT NULL COMMENT '活动时间',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动内容描述',
  `organizer_user_id` bigint NULL DEFAULT NULL COMMENT '负责人用户ID',
  `organizer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '活动状态(0未开始 1进行中 2已结束)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮扶关爱活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_support_activity
-- ----------------------------
INSERT INTO `lc_support_activity` VALUES (101, '水水水水', '2025-04-07 00:00:00', '打打', NULL, 1, '若依', '0', '', '2025-04-06 09:48:25', '', '2025-04-06 12:39:25', NULL);
INSERT INTO `lc_support_activity` VALUES (102, '顶顶顶顶', '2025-04-07 00:00:00', NULL, NULL, NULL, NULL, '0', '', '2025-04-06 09:48:40', '', NULL, NULL);
INSERT INTO `lc_support_activity` VALUES (103, '信息选项', '2025-04-06 00:00:00', '阿达', '打打啊', 1, '若依', '0', '', '2025-04-06 11:02:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for lc_visit_record
-- ----------------------------
DROP TABLE IF EXISTS `lc_visit_record`;
CREATE TABLE `lc_visit_record`  (
  `visit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID (主键)',
  `child_id` bigint NOT NULL COMMENT '关联儿童ID (指向 lc_child_info 表)',
  `visit_time` datetime NOT NULL COMMENT '家访/联系时间',
  `visitor_user_id` bigint NULL DEFAULT NULL COMMENT '家访人/记录人用户ID (关联 sys_user 表)',
  `visitor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家访人姓名 (冗余显示)',
  `visit_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式 (如 家访, 电话, 微信)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '沟通内容摘要',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`visit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家访记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lc_visit_record
-- ----------------------------
INSERT INTO `lc_visit_record` VALUES (100, 100, '2025-04-07 00:00:00', 102, NULL, NULL, NULL, '', '2025-04-06 08:23:58', '', '2025-04-06 08:57:56', NULL);
INSERT INTO `lc_visit_record` VALUES (102, 101, '2025-04-01 00:02:00', 2, '小天才', NULL, NULL, '', '2025-04-06 10:48:25', '', '2025-04-07 07:53:28', NULL);
INSERT INTO `lc_visit_record` VALUES (103, 102, '2025-04-06 11:26:47', 1, '若依', '313313123', '31313131', '', '2025-04-06 11:26:54', '', NULL, '31313131');
INSERT INTO `lc_visit_record` VALUES (104, 103, '2025-04-06 12:59:53', 2, '若依', '31332', '313131', '', '2025-04-06 13:00:02', '', NULL, '313131');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-05 22:12:50', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '留守儿童管理中心', 0, '管理员', '15888888888', 'admin@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '信访部门', 1, '管理员', '15888888888', 'visit@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '活动管理部门', 2, '管理员', '15888888888', 'activity@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '家访管理组', 1, '管理员', '15888888888', 'homevisit@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '信息登记组', 2, '管理员', '15888888888', 'register@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 102, '0,100,102', '活动策划组', 1, '管理员', '15888888888', 'planning@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 102, '0,100,102', '活动执行组', 2, '管理员', '15888888888', 'execution@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 100, '0,100', '数据分析部门', 3, '管理员', '15888888888', 'analysis@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 107, '0,100,107', '统计分析组', 1, '管理员', '15888888888', 'stats@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 107, '0,100,107', '报表管理组', 2, '管理员', '15888888888', 'reports@lcrms.com', '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '未开始', '0', 'lc_activity_status', NULL, 'default', 'N', '0', 'admin', '2025-04-06 09:33:35', 'admin', '2025-04-06 11:52:09', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '进行中', '1', 'lc_activity_status', NULL, 'default', 'N', '0', 'admin', '2025-04-06 09:33:52', 'admin', '2025-04-06 11:52:13', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '已结束', '2', 'lc_activity_status', NULL, 'default', 'N', '0', 'admin', '2025-04-06 09:34:05', 'admin', '2025-04-06 11:52:15', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-05 22:12:50', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '活动状态', 'lc_activity_status', '0', 'admin', '2025-04-06 09:08:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-05 22:12:51', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-05 22:12:51', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-05 22:12:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 06:38:34');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 06:38:44');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 06:38:51');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 09:21:08');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 09:21:17');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 09:22:01');
INSERT INTO `sys_logininfor` VALUES (106, '3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-06 09:22:18');
INSERT INTO `sys_logininfor` VALUES (107, '3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 09:22:24');
INSERT INTO `sys_logininfor` VALUES (108, '3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-06 09:22:31');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 09:23:38');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 09:30:19');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 09:30:23');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 12:13:49');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 14:27:32');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 16:40:18');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 17:17:08');
INSERT INTO `sys_logininfor` VALUES (116, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 17:17:22');
INSERT INTO `sys_logininfor` VALUES (117, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 17:17:27');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 17:21:43');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 17:21:49');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 18:08:23');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 18:52:05');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 18:52:11');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 18:52:52');
INSERT INTO `sys_logininfor` VALUES (124, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 18:53:04');
INSERT INTO `sys_logininfor` VALUES (125, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 18:53:13');
INSERT INTO `sys_logininfor` VALUES (126, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 18:57:09');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 18:57:17');
INSERT INTO `sys_logininfor` VALUES (128, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 18:58:19');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 18:58:25');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-06 19:14:20');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 19:14:32');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-07 07:09:26');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 07:09:31');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-07 07:16:17');
INSERT INTO `sys_logininfor` VALUES (135, 'visiter', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 07:16:36');
INSERT INTO `sys_logininfor` VALUES (136, 'visiter', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-07 07:21:46');
INSERT INTO `sys_logininfor` VALUES (137, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 07:21:57');
INSERT INTO `sys_logininfor` VALUES (138, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-07 07:22:15');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 07:22:21');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 08:23:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2036 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-05 22:12:49', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-04-05 22:12:49', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-05 22:12:49', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-05 22:12:49', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-05 22:12:49', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-05 22:12:49', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-05 22:12:49', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-05 22:12:49', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-05 22:12:49', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-05 22:12:49', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-05 22:12:49', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-05 22:12:49', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-05 22:12:49', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-05 22:12:49', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-05 22:12:49', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-05 22:12:49', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-05 22:12:49', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-05 22:12:49', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-05 22:12:49', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-05 22:12:49', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-05 22:12:49', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-05 22:12:49', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-05 22:12:49', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-05 22:12:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '监护人信息', 1, 1, 'guardian', 'lcrms/guardian/index', NULL, '', 1, 0, 'C', '0', '0', 'system:guardian:list', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '监护人信息菜单');
INSERT INTO `sys_menu` VALUES (2001, '监护人信息查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:guardian:query', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '监护人信息新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:guardian:add', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '监护人信息修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:guardian:edit', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '监护人信息删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:guardian:remove', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '监护人信息导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:guardian:export', '#', 'admin', '2025-04-06 07:12:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '留守儿童信息', 1, 1, 'child', 'lcrms/child/index', NULL, '', 1, 0, 'C', '0', '0', 'system:child:list', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '留守儿童信息菜单');
INSERT INTO `sys_menu` VALUES (2013, '留守儿童信息查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:child:query', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '留守儿童信息新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:child:add', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '留守儿童信息修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:child:edit', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '留守儿童信息删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:child:remove', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '留守儿童信息导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:child:export', '#', 'admin', '2025-04-06 07:52:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '家访记录', 1, 1, 'visit', 'lcrms/visit/index', NULL, '', 1, 0, 'C', '0', '0', 'system:visit:list', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '家访记录菜单');
INSERT INTO `sys_menu` VALUES (2019, '家访记录查询', 2018, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:visit:query', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '家访记录新增', 2018, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:visit:add', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '家访记录修改', 2018, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:visit:edit', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '家访记录删除', 2018, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:visit:remove', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '家访记录导出', 2018, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:visit:export', '#', 'admin', '2025-04-06 08:19:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '关爱活动', 1, 1, 'activity', 'lcrms/activity/index', NULL, '', 1, 0, 'C', '0', '0', 'system:activity:list', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '关爱活动菜单');
INSERT INTO `sys_menu` VALUES (2025, '关爱活动查询', 2024, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:activity:query', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '关爱活动新增', 2024, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:activity:add', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '关爱活动修改', 2024, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:activity:edit', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '关爱活动删除', 2024, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:activity:remove', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '关爱活动导出', 2024, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:activity:export', '#', 'admin', '2025-04-06 09:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '活动参与记录', 1, 1, 'participation', 'lcrms/participation/index', NULL, '', 1, 0, 'C', '0', '0', 'system:participation:list', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '活动参与记录菜单');
INSERT INTO `sys_menu` VALUES (2031, '活动参与记录查询', 2030, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:participation:query', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '活动参与记录新增', 2030, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:participation:add', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '活动参与记录修改', 2030, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:participation:edit', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '活动参与记录删除', 2030, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:participation:remove', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '活动参与记录导出', 2030, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:participation:export', '#', 'admin', '2025-04-06 14:37:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '欢迎使用：留守儿童关爱管理系统正式上线', '2', 0xE6AC8AE8BF9EE4BDBFE794A8E79599E5AE88E584BFE7ABA5E585B3E788B1E7AEA1E79086E7B3BBE7BB9FE38082E69CACE7B3BBE7BB9FE697A8E59CA8E4B8BAE79599E5AE88E584BFE7ABA5E68F90E4BE9BE69BB4E5A5BDE79A84E585B3E788B1E69C8DE58AA1EFBC8CE5B8AEE58AA9E7AEA1E79086E4BABAE59198E69BB4E5A5BDE59CB0E7AEA1E79086E79599E5AE88E584BFE7ABA5E4BFA1E681AFE38081E5AEB6E8AEBFE8AEB0E5BD95E5928CE585B3E788B1E6B4BBE58AA8E7AD89E38082, '0', 'admin', '2025-04-05 22:12:51', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '系统通知：定期更新留守儿童信息', '1', 0xE8AFB7E5ADA6E6A0A1E5928CE7A4BEE58CBAE79A84E5B7A5E4BD9CE4BABAE59198E5AE9AE69C9FE69BB4E696B0E79599E5AE88E584BFE7ABA5E4BFA1E681AFEFBC8CE7A1AEE4BF9DE7B3BBE7BB9FE4B8ADE79A84E4BFA1E681AFE4B88EE5AE9EE99985E68385E586B5E4B880E887B4EFBC8CE4BBA5E4BEBFE69BB4E5A5BDE59CB0E5BC80E5B195E585B3E788B1E5B7A5E4BD9CE38082, '0', 'admin', '2025-04-05 22:12:51', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '活动通知：2025年暑期"关爱留守儿童"系列活动即将开始', '1', 0x32303235E5B9B4E69A91E69C9FE5B086E5BC80E5B195E4B880E7B3BBE58897E585B3E788B1E79599E5AE88E584BFE7ABA5E79A84E6B4BBE58AA8EFBC8CE58C85E68BACE69687E58C96E8AF95E8A786E38081E5BF83E79086E8AEBEE5AFBCE38081E5AEB6E8AEBFE8B083E69FA5E7AD89EFBC8CE8AFB7E59084E983A8E997A8E5819AE5A5BDE58886E5B7A5E58D8FE4BD9CE38082, '0', 'admin', '2025-04-05 22:12:51', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lc_guardian_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 06:49:40', 93);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"guardian\",\"className\":\"LcGuardianInfo\",\"columns\":[{\"capJavaField\":\"GuardianId\",\"columnComment\":\"监护人ID (主键)\",\"columnId\":1,\"columnName\":\"guardian_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 06:49:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"guardianId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 06:49:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Relationship\",\"columnComment\":\"与儿童关系 (如 祖父, 外婆, 叔叔)\",\"columnId\":3,\"columnName\":\"relationship\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 06:49:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"relationship\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"联系电话\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 06:49:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 06:56:08', 49);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lc_guardian_info\"}', NULL, 0, NULL, '2025-04-06 06:56:28', 202);
INSERT INTO `sys_oper_log` VALUES (103, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-06 07:32:15\",\"guardianId\":100,\"name\":\"jack\",\"params\":{},\"phone\":\"123456\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:32:15', 99);
INSERT INTO `sys_oper_log` VALUES (104, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-06 07:32:54\",\"guardianId\":101,\"name\":\"tom\",\"params\":{},\"phone\":\"321312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:32:54', 10);
INSERT INTO `sys_oper_log` VALUES (105, '监护人信息', 2, 'com.ruoyi.system.controller.LcGuardianInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-04-06 07:32:15\",\"guardianId\":100,\"name\":\"cc\",\"params\":{},\"phone\":\"123456\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 07:33:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:33:24', 15);
INSERT INTO `sys_oper_log` VALUES (106, '监护人信息', 3, 'com.ruoyi.system.controller.LcGuardianInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/guardian/100,101', '127.0.0.1', '内网IP', '[100,101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:33:40', 11);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lc_child_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:34:58', 119);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"child\",\"className\":\"LcChildInfo\",\"columns\":[{\"capJavaField\":\"ChildId\",\"columnComment\":\"儿童ID (主键)\",\"columnId\":12,\"columnName\":\"child_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 07:34:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"childId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":13,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 07:34:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gender\",\"columnComment\":\"性别 (0男 1女 2未知 - 对应 sys_user_sex 字典)\",\"columnId\":14,\"columnName\":\"gender\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 07:34:58\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"gender\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BirthDate\",\"columnComment\":\"出生日期\",\"columnId\":15,\"columnName\":\"birth_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 07:34:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 07:42:35', 85);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lc_child_info\"}', NULL, 0, NULL, '2025-04-06 07:43:03', 182);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lc_visit_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:08:23', 202);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"visit\",\"className\":\"LcVisitRecord\",\"columns\":[{\"capJavaField\":\"VisitId\",\"columnComment\":\"记录ID (主键)\",\"columnId\":28,\"columnName\":\"visit_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 08:08:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"visitId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChildId\",\"columnComment\":\"关联儿童ID\",\"columnId\":29,\"columnName\":\"child_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 08:08:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"childId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VisitTime\",\"columnComment\":\"家访/联系时间\",\"columnId\":30,\"columnName\":\"visit_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 08:08:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"visitTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VisitorUserId\",\"columnComment\":\"家访人/用户ID\",\"columnId\":31,\"columnName\":\"visitor_user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 08:08:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:14:50', 61);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lc_visit_record\"}', NULL, 0, NULL, '2025-04-06 08:15:09', 199);
INSERT INTO `sys_oper_log` VALUES (113, '留守儿童信息', 1, 'com.ruoyi.system.controller.LcChildInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"childId\":100,\"createTime\":\"2025-04-06 08:22:23\",\"name\":\"tom\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:22:23', 121);
INSERT INTO `sys_oper_log` VALUES (114, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-06 08:23:10\",\"guardianId\":102,\"name\":\"jack\",\"params\":{},\"phone\":\"123456\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:23:10', 8);
INSERT INTO `sys_oper_log` VALUES (115, '家访记录', 1, 'com.ruoyi.system.controller.LcVisitRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":100,\"createTime\":\"2025-04-06 08:23:58\",\"params\":{},\"visitId\":100,\"visitTime\":\"2025-04-07\",\"visitorUserId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:23:58', 8);
INSERT INTO `sys_oper_log` VALUES (116, '留守儿童信息', 1, 'com.ruoyi.system.controller.LcChildInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"childId\":101,\"createTime\":\"2025-04-06 08:27:01\",\"name\":\"艾莉\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:27:01', 7);
INSERT INTO `sys_oper_log` VALUES (117, '留守儿童信息', 1, 'com.ruoyi.system.controller.LcChildInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"childId\":102,\"createTime\":\"2025-04-06 08:27:09\",\"name\":\"cc\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:27:10', 8);
INSERT INTO `sys_oper_log` VALUES (118, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-06 08:27:22\",\"guardianId\":103,\"name\":\"中一\",\"params\":{},\"phone\":\"847437\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:27:23', 5);
INSERT INTO `sys_oper_log` VALUES (119, '留守儿童信息', 2, 'com.ruoyi.system.controller.LcChildInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"childId\":100,\"createBy\":\"\",\"createTime\":\"2025-04-06 08:22:23\",\"name\":\"tom\",\"params\":{},\"primaryGuardianId\":102,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 08:40:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:40:04', 22);
INSERT INTO `sys_oper_log` VALUES (120, '家访记录', 2, 'com.ruoyi.system.controller.LcVisitRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":100,\"createBy\":\"\",\"createTime\":\"2025-04-06 08:23:58\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2025-04-06 08:57:56\",\"visitId\":100,\"visitTime\":\"2025-04-07\",\"visitorUserId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 08:57:56', 23);
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"活动状态\",\"dictType\":\"lc_activity_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:08:22', 17);
INSERT INTO `sys_oper_log` VALUES (122, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:09:34', 97);
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":true,\"createTime\":\"2025-04-05 22:12:49\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"超级管理员\",\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员角色', '2025-04-06 09:14:52', 3);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:20:06', 39);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 09:20:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:20:56', 35);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 09:20:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,105,1025,1026,1027,1028,1029],\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:30:02', 30);
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未开始\",\"dictSort\":1,\"dictType\":\"lc_activity_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:33:35', 13);
INSERT INTO `sys_oper_log` VALUES (128, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"lc_activity_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:33:52', 10);
INSERT INTO `sys_oper_log` VALUES (129, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已结束\",\"dictSort\":3,\"dictType\":\"lc_activity_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:34:05', 9);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lc_support_activity\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:35:44', 57);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"LcSupportActivity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"活动ID\",\"columnId\":40,\"columnName\":\"activity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:35:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"活动名称\",\"columnId\":41,\"columnName\":\"activity_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:35:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityTime\",\"columnComment\":\"活动时间\",\"columnId\":42,\"columnName\":\"activity_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:35:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnComment\":\"活动地点\",\"columnId\":43,\"columnName\":\"location\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:35:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:40:49', 50);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lc_support_activity\"}', NULL, 0, NULL, '2025-04-06 09:40:54', 212);
INSERT INTO `sys_oper_log` VALUES (133, '关爱活动', 1, 'com.ruoyi.system.controller.LcSupportActivityController.add()', 'POST', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":100,\"activityName\":\"啊啊啊\",\"activityTime\":\"2025-04-07\",\"createTime\":\"2025-04-06 09:48:07\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:48:07', 140);
INSERT INTO `sys_oper_log` VALUES (134, '关爱活动', 1, 'com.ruoyi.system.controller.LcSupportActivityController.add()', 'POST', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createTime\":\"2025-04-06 09:48:25\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:48:25', 7);
INSERT INTO `sys_oper_log` VALUES (135, '关爱活动', 1, 'com.ruoyi.system.controller.LcSupportActivityController.add()', 'POST', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":102,\"activityName\":\"顶顶顶顶\",\"activityTime\":\"2025-04-07\",\"createTime\":\"2025-04-06 09:48:40\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:48:40', 5);
INSERT INTO `sys_oper_log` VALUES (136, '关爱活动', 3, 'com.ruoyi.system.controller.LcSupportActivityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/activity/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:49:17', 7);
INSERT INTO `sys_oper_log` VALUES (137, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 09:49:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:49:28', 8);
INSERT INTO `sys_oper_log` VALUES (138, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 09:49:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:49:54', 6);
INSERT INTO `sys_oper_log` VALUES (139, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 09:50:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 09:50:20', 6);
INSERT INTO `sys_oper_log` VALUES (140, '留守儿童信息', 2, 'com.ruoyi.system.controller.LcChildInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"childId\":101,\"createBy\":\"\",\"createTime\":\"2025-04-06 08:27:01\",\"name\":\"艾莉\",\"params\":{},\"primaryGuardianId\":103,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 10:08:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:08:30', 25);
INSERT INTO `sys_oper_log` VALUES (141, '家访记录', 1, 'com.ruoyi.system.controller.LcVisitRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":0,\"createTime\":\"2025-04-06 10:26:30\",\"params\":{},\"visitId\":101,\"visitTime\":\"2025-04-08 00:00:00\",\"visitorName\":\"若依\",\"visitorUserId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:26:30', 113);
INSERT INTO `sys_oper_log` VALUES (142, '家访记录', 2, 'com.ruoyi.system.controller.LcVisitRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":103,\"createBy\":\"\",\"createTime\":\"2025-04-06 10:26:31\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2025-04-06 10:26:54\",\"visitId\":101,\"visitTime\":\"2025-04-08 00:00:00\",\"visitorName\":\"若依\",\"visitorUserId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:26:54', 10);
INSERT INTO `sys_oper_log` VALUES (143, '家访记录', 2, 'com.ruoyi.system.controller.LcVisitRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":1,\"createBy\":\"\",\"createTime\":\"2025-04-06 10:26:31\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2025-04-06 10:27:03\",\"visitId\":101,\"visitTime\":\"2025-04-08 00:00:00\",\"visitorName\":\"若依\",\"visitorUserId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:27:03', 2);
INSERT INTO `sys_oper_log` VALUES (144, '家访记录', 1, 'com.ruoyi.system.controller.LcVisitRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":101,\"createTime\":\"2025-04-06 10:48:24\",\"params\":{},\"visitId\":102,\"visitTime\":\"2025-04-01 00:02:00\",\"visitorName\":\"若依\",\"visitorUserId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:48:25', 7);
INSERT INTO `sys_oper_log` VALUES (145, '家访记录', 3, 'com.ruoyi.system.controller.LcVisitRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/visit/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 10:48:30', 8);
INSERT INTO `sys_oper_log` VALUES (146, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"organizerName\":\"若依\",\"organizerUserId\":1,\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 11:01:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:01:01', 34);
INSERT INTO `sys_oper_log` VALUES (147, '关爱活动', 1, 'com.ruoyi.system.controller.LcSupportActivityController.add()', 'POST', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":103,\"activityName\":\"信息选项\",\"activityTime\":\"2025-04-06\",\"content\":\"打打啊\",\"createTime\":\"2025-04-06 11:02:08\",\"location\":\"阿达\",\"organizerName\":\"若依\",\"organizerUserId\":1,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:02:08', 14);
INSERT INTO `sys_oper_log` VALUES (148, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"address\":\"恶气恶气\",\"createTime\":\"2025-04-06 11:26:09\",\"guardianId\":104,\"name\":\"亲切\",\"params\":{},\"phone\":\"132131312\",\"relationship\":\"欸额\",\"remark\":\"恶气恶气\",\"workInfo\":\"额企鹅企鹅\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:26:09', 14);
INSERT INTO `sys_oper_log` VALUES (149, '留守儿童信息', 1, 'com.ruoyi.system.controller.LcChildInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"birthDate\":\"2025-04-01\",\"childId\":103,\"createTime\":\"2025-04-06 11:26:32\",\"gender\":\"0\",\"grade\":\"313131\",\"healthStatus\":\"3131313\",\"homeAddress\":\"3131313\",\"idCard\":\"31313123\",\"name\":\"31 \",\"params\":{},\"primaryGuardianId\":102,\"remark\":\"313131\",\"school\":\"313131\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:26:32', 15);
INSERT INTO `sys_oper_log` VALUES (150, '家访记录', 1, 'com.ruoyi.system.controller.LcVisitRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":102,\"content\":\"31313131\",\"createTime\":\"2025-04-06 11:26:54\",\"params\":{},\"remark\":\"31313131\",\"visitId\":103,\"visitMethod\":\"313313123\",\"visitTime\":\"2025-04-06 11:26:47\",\"visitorName\":\"若依\",\"visitorUserId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:26:54', 7);
INSERT INTO `sys_oper_log` VALUES (151, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"address\":\"恶气恶气\",\"createTime\":\"2025-04-06 11:27:52\",\"guardianId\":105,\"name\":\"额企鹅企鹅q\",\"params\":{},\"phone\":\"额企鹅企鹅\",\"relationship\":\"额企鹅企鹅\",\"remark\":\"q恶气恶气去\",\"workInfo\":\"恶气恶气\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:27:52', 6);
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:33:35\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"未开始\",\"dictSort\":1,\"dictType\":\"lc_activity_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:52:09', 11);
INSERT INTO `sys_oper_log` VALUES (153, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:33:52\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"lc_activity_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:52:13', 7);
INSERT INTO `sys_oper_log` VALUES (154, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-06 09:34:05\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"已结束\",\"dictSort\":3,\"dictType\":\"lc_activity_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 11:52:15', 8);
INSERT INTO `sys_oper_log` VALUES (155, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"organizerName\":\"若依\",\"organizerUserId\":1,\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 12:14:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 12:14:01', 21);
INSERT INTO `sys_oper_log` VALUES (156, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"organizerName\":\"若依\",\"organizerUserId\":1,\"params\":{},\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 12:28:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 12:28:11', 11);
INSERT INTO `sys_oper_log` VALUES (157, '关爱活动', 2, 'com.ruoyi.system.controller.LcSupportActivityController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/activity', '127.0.0.1', '内网IP', '{\"activityId\":101,\"activityName\":\"水水水水\",\"activityTime\":\"2025-04-07\",\"createBy\":\"\",\"createTime\":\"2025-04-06 09:48:25\",\"location\":\"打打\",\"organizerName\":\"若依\",\"organizerUserId\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 12:39:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 12:39:25', 14);
INSERT INTO `sys_oper_log` VALUES (158, '家访记录', 1, 'com.ruoyi.system.controller.LcVisitRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":103,\"content\":\"313131\",\"createTime\":\"2025-04-06 13:00:02\",\"params\":{},\"remark\":\"313131\",\"visitId\":104,\"visitMethod\":\"31332\",\"visitTime\":\"2025-04-06 12:59:53\",\"visitorName\":\"若依\",\"visitorUserId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 13:00:02', 108);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"lc_activity_participation\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 14:27:43', 74);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"participation\",\"className\":\"LcActivityParticipation\",\"columns\":[{\"capJavaField\":\"ParticipationId\",\"columnComment\":\"参与记录ID\",\"columnId\":53,\"columnName\":\"participation_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 14:27:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"participationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnComment\":\"关联活动ID\",\"columnId\":54,\"columnName\":\"activity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 14:27:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChildId\",\"columnComment\":\"关联儿童ID\",\"columnId\":55,\"columnName\":\"child_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 14:27:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"childId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParticipationTime\",\"columnComment\":\"参与时间\",\"columnId\":56,\"columnName\":\"participation_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-06 14:27:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 14:32:18', 51);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"lc_activity_participation\"}', NULL, 0, NULL, '2025-04-06 14:32:30', 195);
INSERT INTO `sys_oper_log` VALUES (162, '活动参与记录', 1, 'com.ruoyi.system.controller.LcActivityParticipationController.add()', 'POST', 1, 'admin', '研发部门', '/system/participation', '127.0.0.1', '内网IP', '{\"activityId\":103,\"childId\":100,\"createTime\":\"2025-04-06 14:40:31\",\"params\":{},\"participationId\":100,\"participationTime\":\"2025-04-08\",\"performance\":\"是S是S\",\"remark\":\"是S是\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 14:40:32', 109);
INSERT INTO `sys_oper_log` VALUES (163, '活动参与记录', 1, 'com.ruoyi.system.controller.LcActivityParticipationController.add()', 'POST', 1, 'admin', '研发部门', '/system/participation', '127.0.0.1', '内网IP', '{\"activityId\":102,\"childId\":103,\"createTime\":\"2025-04-06 14:41:07\",\"params\":{},\"participationId\":101,\"participationTime\":\"2025-04-09\",\"performance\":\"大大大大大\",\"remark\":\"大大大大大\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 14:41:07', 7);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 17:07:26', 14);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 17:07:35', 4);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 17:07:59', 7);
INSERT INTO `sys_oper_log` VALUES (167, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-05 22:12:49\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:10:03', 38);
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 09:20:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:10:10', 19);
INSERT INTO `sys_oper_log` VALUES (169, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-05 22:12:49\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:10:42', 31);
INSERT INTO `sys_oper_log` VALUES (170, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 09:20:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:10:46', 23);
INSERT INTO `sys_oper_log` VALUES (171, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:11:58', 18);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-05 22:12:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-05 22:12:49\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2,101,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:13:12', 24);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:13:39', 20);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 17:13:42', 7);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 17:13:54', 4);
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2025-04-06 17:14:13', 2);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2025-04-06 17:14:20', 0);
INSERT INTO `sys_oper_log` VALUES (178, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 17:11:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 17:16:17', 29);
INSERT INTO `sys_oper_log` VALUES (179, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"address\":\"打打阿达 \",\"createTime\":\"2025-04-06 18:09:23\",\"guardianId\":106,\"name\":\"我我我瓦达\",\"params\":{},\"phone\":\"13074737839\",\"relationship\":\"打打\",\"remark\":\"出租车在\",\"workInfo\":\"打打啊啊啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:09:23', 20);
INSERT INTO `sys_oper_log` VALUES (180, '监护人信息', 2, 'com.ruoyi.system.controller.LcGuardianInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/guardian', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-04-06 08:27:23\",\"guardianId\":103,\"name\":\"中一\",\"params\":{},\"phone\":\"13465543345\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 18:09:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:09:43', 8);
INSERT INTO `sys_oper_log` VALUES (181, '留守儿童信息', 2, 'com.ruoyi.system.controller.LcChildInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/child', '127.0.0.1', '内网IP', '{\"birthDate\":\"2025-04-09\",\"childId\":100,\"createBy\":\"\",\"createTime\":\"2025-04-06 08:22:23\",\"gender\":\"0\",\"name\":\"tom\",\"params\":{},\"primaryGuardianId\":102,\"primaryGuardianName\":\"jack\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-04-06 18:36:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:36:19', 31);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 18:52:47', 3);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'ry', '测试部门', '/system/menu/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 18:53:50', 3);
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'ry', '测试部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 17:11:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2012,2013,2014,2015,2016,2017,2000,2001,2002,2003,2004,2005,2030,2031,2032,2033,2034,2035,2024,2025,2026,2027,2028,2029,2018,2019,2020,2021,2022,2023],\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:55:16', 60);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'ry', '测试部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-05 22:12:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-06 18:53:13\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"3\",\"roleName\":\"系统维护员\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"ry\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:55:38', 28);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'ry', '测试部门', '/system/menu/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 18:55:49', 3);
INSERT INTO `sys_oper_log` VALUES (187, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'ry', '测试部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-06 17:11:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035],\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 18:56:04', 35);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-05 22:12:49\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-06 18:57:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"小天才\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"projadmin\",\"roleName\":\"项目管理员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 19:20:08', 49);
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/101', '127.0.0.1', '内网IP', '[101]', NULL, 1, '项目管理员已分配,不能删除', '2025-04-07 07:11:32', 40);
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:11:39', 32);
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:11:41', 19);
INSERT INTO `sys_oper_log` VALUES (192, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023],\"params\":{},\"roleId\":102,\"roleKey\":\"visit\",\"roleName\":\"信访管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:12:50', 25);
INSERT INTO `sys_oper_log` VALUES (193, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035],\"params\":{},\"roleId\":103,\"roleKey\":\"3\",\"roleName\":\"活动策划\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:13:21', 16);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"3393291581@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13385839931\",\"postIds\":[4],\"roleIds\":[102],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"visiter\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:15:52', 100);
INSERT INTO `sys_oper_log` VALUES (195, '监护人信息', 1, 'com.ruoyi.system.controller.LcGuardianInfoController.add()', 'POST', 1, 'visiter', NULL, '/system/guardian', '127.0.0.1', '内网IP', '{\"address\":\"蔡家村\",\"createTime\":\"2025-04-07 07:17:40\",\"guardianId\":107,\"name\":\"李四\",\"params\":{},\"phone\":\"13473365180\",\"relationship\":\"祖父\",\"workInfo\":\"务农\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:17:40', 13);
INSERT INTO `sys_oper_log` VALUES (196, '留守儿童信息', 1, 'com.ruoyi.system.controller.LcChildInfoController.add()', 'POST', 1, 'visiter', NULL, '/system/child', '127.0.0.1', '内网IP', '{\"birthDate\":\"2023-04-05\",\"childId\":104,\"createTime\":\"2025-04-07 07:19:00\",\"gender\":\"0\",\"grade\":\"二年级\",\"healthStatus\":\"健康\",\"homeAddress\":\"蔡家村\",\"idCard\":\"130726202304058771\",\"name\":\"李白\",\"params\":{},\"primaryGuardianId\":107,\"school\":\"第一小学\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:19:00', 10);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 07:15:52\",\"delFlag\":\"0\",\"deptId\":102,\"email\":\"3393291581@qq.com\",\"loginDate\":\"2025-04-07 07:16:36\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13385839931\",\"postIds\":[4],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"visit\",\"roleName\":\"信访管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"visiter\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:52:59', 174);
INSERT INTO `sys_oper_log` VALUES (198, '家访记录', 2, 'com.ruoyi.system.controller.LcVisitRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/visit', '127.0.0.1', '内网IP', '{\"childId\":101,\"createBy\":\"\",\"createTime\":\"2025-04-06 10:48:25\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2025-04-07 07:53:27\",\"visitId\":102,\"visitTime\":\"2025-04-01 00:02:00\",\"visitorName\":\"小天才\",\"visitorUserId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 07:53:27', 9);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-05 22:12:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-05 22:12:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-05 22:12:49', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2025-04-05 22:12:49', 'admin', '2025-04-06 17:10:42', '普通角色');
INSERT INTO `sys_role` VALUES (100, '系统维护员', '3', 2, '1', 1, 1, '0', '2', 'admin', '2025-04-06 09:20:06', 'admin', '2025-04-06 17:10:46', NULL);
INSERT INTO `sys_role` VALUES (101, '项目管理员', 'projadmin', 0, '1', 1, 1, '0', '0', 'admin', '2025-04-06 17:11:58', 'ry', '2025-04-06 18:56:04', NULL);
INSERT INTO `sys_role` VALUES (102, '信访管理员', 'visit', 2, '1', 1, 1, '0', '0', 'admin', '2025-04-07 07:12:50', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (103, '活动策划', '3', 3, '1', 1, 1, '0', '0', 'admin', '2025-04-07 07:13:21', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2025);
INSERT INTO `sys_role_menu` VALUES (101, 2026);
INSERT INTO `sys_role_menu` VALUES (101, 2027);
INSERT INTO `sys_role_menu` VALUES (101, 2028);
INSERT INTO `sys_role_menu` VALUES (101, 2029);
INSERT INTO `sys_role_menu` VALUES (101, 2030);
INSERT INTO `sys_role_menu` VALUES (101, 2031);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
INSERT INTO `sys_role_menu` VALUES (102, 2019);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 2024);
INSERT INTO `sys_role_menu` VALUES (103, 2025);
INSERT INTO `sys_role_menu` VALUES (103, 2026);
INSERT INTO `sys_role_menu` VALUES (103, 2027);
INSERT INTO `sys_role_menu` VALUES (103, 2028);
INSERT INTO `sys_role_menu` VALUES (103, 2029);
INSERT INTO `sys_role_menu` VALUES (103, 2030);
INSERT INTO `sys_role_menu` VALUES (103, 2031);
INSERT INTO `sys_role_menu` VALUES (103, 2032);
INSERT INTO `sys_role_menu` VALUES (103, 2033);
INSERT INTO `sys_role_menu` VALUES (103, 2034);
INSERT INTO `sys_role_menu` VALUES (103, 2035);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-07 08:23:13', 'admin', '2025-04-05 22:12:49', '', '2025-04-07 08:23:12', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '小天才', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-07 07:21:57', 'admin', '2025-04-05 22:12:49', 'admin', '2025-04-07 07:21:57', '测试员');
INSERT INTO `sys_user` VALUES (100, 102, 'visiter', '张三', '00', '3393291581@qq.com', '13385839931', '0', '', '$2a$10$JMIzpVVlXX1OZVpbx7hQkul3a5c.8GAKjz9yRIFv7h/pE9M7Bt8v.', '0', '0', '127.0.0.1', '2025-04-07 07:16:36', 'admin', '2025-04-07 07:15:52', 'admin', '2025-04-07 07:52:59', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 101);
INSERT INTO `sys_user_role` VALUES (100, 102);

SET FOREIGN_KEY_CHECKS = 1;
