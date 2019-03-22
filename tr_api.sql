/*
 Navicat Premium Data Transfer

 Source Server         : 172.168.50.40
 Source Server Type    : MySQL
 Source Server Version : 50548
 Source Host           : 172.168.50.40:3306
 Source Schema         : trade_klagri_com_cn

 Target Server Type    : MySQL
 Target Server Version : 50548
 File Encoding         : 65001

 Date: 22/03/2019 13:12:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tr_api
-- ----------------------------
DROP TABLE IF EXISTS `tr_api`;
CREATE TABLE `tr_api`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口名称',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述标签',
  `folder` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属目录',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '对应分组ID',
  `module_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块ID',
  `need_login` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否需要登录，才能调用此接口',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '版本号',
  `publish` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '此接口是否已公开，没有公开的接口前台不会显示',
  `method` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '请求方式,1表示POST 2表示GET',
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排列显示优先级，越高越靠前',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `example` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事例代码',
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成功返回事例,JSON串',
  `request_sample` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求示例',
  `not_sign_params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '不参加签名的参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xm_api_ibfk_2`(`group_id`) USING BTREE,
  UNIQUE INDEX `module_folder_name`(`name`, `module_id`, `folder`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tr_api
-- ----------------------------
INSERT INTO `tr_api` VALUES (1, 'user/register', '注册', 'api', 1, 'trade', 0, 1, 1, 1, 50, '用户注册', NULL, '', '', '');
INSERT INTO `tr_api` VALUES (2, 'sms/send', '验证码', 'api', 1, 'trade', 0, 1, 1, 1, 50, '发送验证码', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (3, 'login/login', '登录', 'api', 1, 'trade', 0, 1, 1, 1, 50, '用户登录', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (4, 'user/certification', '实名认证', 'api', 1, 'trade', 1, 1, 1, 1, 50, '实名认证', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (5, 'user/getuserinfo', '用户信息', 'api', 1, 'trade', 1, 1, 1, 1, 50, '获取用户信息', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (6, 'user/update', '修改用户信息', 'api', 1, 'trade', 1, 1, 1, 1, 50, '修改用户信息', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (7, 'user/password', '修改密码', 'api', 1, 'trade', 0, 1, 1, 1, 50, '修改密码', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (8, 'block/add', '添加地块', 'api', 1, 'trade', 1, 1, 1, 1, 50, '添加地块', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (9, 'block/index', '地块列表', 'api', 1, 'trade', 1, 1, 1, 1, 50, '根据用户id获取地块列表', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (10, 'block/show', '地块信息', 'api', 1, 'trade', 1, 1, 1, 1, 50, '根据地块id获取地块信息', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (11, 'block/update', '修改地块信息', 'api', 1, 'trade', 1, 1, 1, 1, 50, '修改地块信息', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (12, 'login/token', 'token登录', 'api', 1, 'trade', 0, 1, 1, 1, 50, '通过token登录', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (13, 'test/exception_test', '代码测试', 'api', 1, 'trade', 0, 1, 1, 1, 50, '用来测试，与业务无关', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (14, 'demand/add', '添加需求', 'api', 1, 'trade', 1, 1, 1, 1, 50, '添加需求', NULL, NULL, NULL, '');
INSERT INTO `tr_api` VALUES (15, 'demand/index', '需求列表', 'api', 1, 'trade', 1, 1, 1, 1, 50, '需求列表', NULL, NULL, NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
