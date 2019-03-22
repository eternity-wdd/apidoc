/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : xm_api_document

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/03/2019 13:12:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xm_api
-- ----------------------------
DROP TABLE IF EXISTS `xm_api`;
CREATE TABLE `xm_api`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口名称',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述标签',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '对应分组ID',
  `module_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属模块（应用）',
  `need_login` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否需要登录，才能调用此接口',
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '版本号',
  `publish` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '此接口是否已公开，没有公开的接口前台不会显示',
  `method` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '请求方式,1表示POST 2表示GET',
  `platforms` int(8) NOT NULL DEFAULT 0 COMMENT '支持的平台的二进制或操作后的结果',
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排列显示优先级，越高越靠前',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口描述',
  `example` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事例代码',
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成功返回事例,JSON串',
  `request_sample` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求示例',
  `not_sign_params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '不参加签名参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module_id`) USING BTREE,
  INDEX `xm_api_ibfk_2`(`group_id`) USING BTREE,
  CONSTRAINT `xm_api_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_api_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `xm_api_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api
-- ----------------------------
INSERT INTO `xm_api` VALUES (6, 'login/login', '登录', 1, 'trade', 0, 1, 1, 1, 3, 50, '用户登录', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"登录成功\",\r\n    \"data\": {\r\n        \"id\": \"1\",\r\n        \"user_name\": \"admin\",\r\n        \"token\": \"e21dc5393777b6248a75fac5d1effb01\",\r\n        \"refresh_time\": \"1553079450\",\r\n        \"identify\": \"2\"\r\n    }\r\n}', '{\r\n	\"user_name\":\"admin\",\r\n	\"passwd\":\"88888888\"\r\n}', '');
INSERT INTO `xm_api` VALUES (9, 'sms/send', '验证码', 1, 'trade', 0, 1, 1, 1, 15, 50, '验证码发送', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": \"323263\"\r\n}', '{\r\n	\"type\":1,\r\n	\"phone\":\"18865501833\"\r\n}', '');
INSERT INTO `xm_api` VALUES (14, 'user/register', '注册', 1, 'trade', 0, 1, 1, 1, 3, 50, '农户端用户注册', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"注册成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"code\":\"323263\",\r\n	\"phone\":\"18865501833\",\r\n	\"user_name\":\"lizheng\",\r\n	\"passwd\":\"88888888\",\r\n	\"passwd_r\":\"88888888\"\r\n}', '');
INSERT INTO `xm_api` VALUES (15, 'user/certification', '实名认证', 1, 'trade', 0, 1, 1, 1, 3, 50, '用户实名认证，上传身份证正反照、身份证号，等信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"认证成功\",\r\n    \"data\": {\r\n        \"identify\": \"3\"\r\n    }\r\n}', '{\r\n	\"token\":\"97ce952f17ea648100b728bf9dcac37f\",\r\n	\"real_name\":\"李明\",\r\n	\"id_card\":\"370405199306253811\",\r\n	\"card_img_url_y\":\"upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg\",\r\n	\"card_img_url_n\":\"upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg\"\r\n}', '');
INSERT INTO `xm_api` VALUES (16, 'login/token', 'token登录', 1, 'trade', 0, 1, 1, 1, 15, 50, '用于token登录', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"认证成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"2a4d755d845254a983a9fce9efebca36\"\r\n}', '');

-- ----------------------------
-- Table structure for xm_api_client
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_client`;
CREATE TABLE `xm_api_client`  (
  `appid` int(10) UNSIGNED NOT NULL COMMENT '客户应用ID',
  `appkey` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用密钥',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1表示可用，其它不可用',
  `module_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属平台',
  `client` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端标识',
  PRIMARY KEY (`appid`) USING BTREE,
  INDEX `platform`(`module_id`) USING BTREE,
  CONSTRAINT `xm_api_client_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xm_api_client_platform
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_client_platform`;
CREATE TABLE `xm_api_client_platform`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台名称描述',
  `bit` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二进制信号位，用户xm_api表中的platforms',
  `module_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_client_platform
-- ----------------------------
INSERT INTO `xm_api_client_platform` VALUES (1, 'Android', 1, 'trade');
INSERT INTO `xm_api_client_platform` VALUES (2, 'IOS', 2, 'trade');
INSERT INTO `xm_api_client_platform` VALUES (3, 'Wechat', 4, 'trade');
INSERT INTO `xm_api_client_platform` VALUES (4, 'PC', 8, 'trade');
INSERT INTO `xm_api_client_platform` VALUES (5, 'Android', 1, 'facility');
INSERT INTO `xm_api_client_platform` VALUES (6, 'IOS', 2, 'decision');

-- ----------------------------
-- Table structure for xm_api_code
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_code`;
CREATE TABLE `xm_api_code`  (
  `code` int(10) NOT NULL COMMENT '返回码ID',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '返回码说明',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_code
-- ----------------------------
INSERT INTO `xm_api_code` VALUES (-101, '调用外部接口出错');
INSERT INTO `xm_api_code` VALUES (-100, '一般性逻辑错误，可以抛出给用户的msg');
INSERT INTO `xm_api_code` VALUES (-30, '非用户输入参数错误或者为空');
INSERT INTO `xm_api_code` VALUES (-25, '操作不存在');
INSERT INTO `xm_api_code` VALUES (-24, '类不存在');
INSERT INTO `xm_api_code` VALUES (-23, '应用不存在');
INSERT INTO `xm_api_code` VALUES (-22, '接口不存在');
INSERT INTO `xm_api_code` VALUES (-21, '客户端与服务器端时间差超过最大限值');
INSERT INTO `xm_api_code` VALUES (-20, '签名错误');
INSERT INTO `xm_api_code` VALUES (-13, 'PHP异常，程序非正常停止');
INSERT INTO `xm_api_code` VALUES (-12, 'PHP致命/语法错误，程序非正常停止');
INSERT INTO `xm_api_code` VALUES (-11, '服务异常(module或第三方服务中的返回值为NULL)');
INSERT INTO `xm_api_code` VALUES (-10, 'SQL异常');
INSERT INTO `xm_api_code` VALUES (-2, '用户登录失败');
INSERT INTO `xm_api_code` VALUES (200, '成功');

-- ----------------------------
-- Table structure for xm_api_group
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_group`;
CREATE TABLE `xm_api_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `module_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属模块',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排列显示优先级，越高越靠前',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module_id`(`module_id`) USING BTREE,
  CONSTRAINT `xm_api_group_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_group
-- ----------------------------
INSERT INTO `xm_api_group` VALUES (1, '用户', 'trade', '用户相关的接口，包括登录注册等', 50);
INSERT INTO `xm_api_group` VALUES (2, '地块', 'trade', '地块相关的接口', 45);
INSERT INTO `xm_api_group` VALUES (3, '订单', 'trade', '订单相关接口，包括需求', 50);

-- ----------------------------
-- Table structure for xm_api_module
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_module`;
CREATE TABLE `xm_api_module`  (
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口模块名称',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述标签',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_module
-- ----------------------------
INSERT INTO `xm_api_module` VALUES ('decision', '云决策');
INSERT INTO `xm_api_module` VALUES ('facility', '设施管理平台');
INSERT INTO `xm_api_module` VALUES ('trade', '无人机2.0');

-- ----------------------------
-- Table structure for xm_api_param_type
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_param_type`;
CREATE TABLE `xm_api_param_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_param_type
-- ----------------------------
INSERT INTO `xm_api_param_type` VALUES (3, 'float');
INSERT INTO `xm_api_param_type` VALUES (2, 'int');
INSERT INTO `xm_api_param_type` VALUES (1, 'string');

-- ----------------------------
-- Table structure for xm_api_params
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_params`;
CREATE TABLE `xm_api_params`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pt_id` int(11) UNSIGNED NOT NULL COMMENT '参数类型ID',
  `request` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否为必填项',
  `out` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '输入或输出参数标识，1表示输出，0表示输入',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 5 COMMENT '排序，越大越往前',
  `showtype` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前台参数展示类型（1.input,2.text,3.checkbox,4.radio,5.select）',
  `param_cont` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台具体参数key和value(存json)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_id`(`api_id`) USING BTREE,
  INDEX `pt_id`(`pt_id`) USING BTREE,
  CONSTRAINT `xm_api_params_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `xm_api` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_api_params_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `xm_api_param_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_params
-- ----------------------------
INSERT INTO `xm_api_params` VALUES (39, 6, 'user_name', '用户名', 1, 1, 0, '用户名', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (40, 6, 'passwd', '密码', 1, 1, 0, '密码', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (41, 6, 'id', '用户id', 1, 1, 1, '用户id', 5, 0, '');
INSERT INTO `xm_api_params` VALUES (42, 6, 'token', '用户token', 1, 1, 1, '用户token', 5, 0, '');
INSERT INTO `xm_api_params` VALUES (43, 6, 'user_name', '用户名', 1, 1, 1, '用户名', 5, 0, '');
INSERT INTO `xm_api_params` VALUES (44, 6, 'identify', '认证状态', 1, 1, 1, '实名认证：1未提交申请，2申请中，3通过，4未通过', 5, 0, '');
INSERT INTO `xm_api_params` VALUES (47, 9, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (48, 9, 'type', '业务类型', 1, 0, 0, '业务类型，1注册，0默认', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (54, 14, 'code', '验证码', 1, 1, 0, '验证码', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (55, 14, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (56, 14, 'user_name', '用户名', 1, 1, 0, '用户名（唯一）', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (57, 14, 'passwd', '密码', 1, 1, 0, '密码（是否加密）', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (58, 14, 'passwd_r', '密码', 1, 1, 0, '密码（是否加密）', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (59, 15, 'token', 'token令牌', 1, 1, 0, '身份令牌', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (60, 15, 'real_name', '真实姓名', 1, 1, 0, '用户真实姓名', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (61, 15, 'id_card', '身份证号', 1, 1, 0, '身份证号', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (62, 15, 'card_img_url_y', '身份证正面照', 1, 1, 0, '身份证正面照', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (63, 15, 'card_img_url_n', '身份证反面照', 1, 1, 0, '身份证反面照', 5, 1, '0');
INSERT INTO `xm_api_params` VALUES (64, 15, 'identify', '认证标识', 1, 1, 1, '实名认证：1未提交申请，2申请中，3通过，4未通过', 5, 0, '');
INSERT INTO `xm_api_params` VALUES (65, 16, 'token', '用户token', 1, 1, 0, '身份令牌', 5, 1, '0');

-- ----------------------------
-- Table structure for xm_api_public
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_public`;
CREATE TABLE `xm_api_public`  (
  `paramname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `require` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_public
-- ----------------------------
INSERT INTO `xm_api_public` VALUES ('appid', '必须', 'unsigned int', '应用的唯一ID。');
INSERT INTO `xm_api_public` VALUES ('s', '否', 'string', '请求串的签名。（暂不签名）');
INSERT INTO `xm_api_public` VALUES ('t', '必须', 'unsigned int', '请求时间戳(秒)，平台会验证此时间戳与服务器时间的差值，如果超过10秒，就会返回-21错误码。');
INSERT INTO `xm_api_public` VALUES ('f', '必须', 'unsigned int', '1：Android\r\n2：IOS\r\n，3：Web，4：小程序');
INSERT INTO `xm_api_public` VALUES ('v', '必须', 'string', '版本号（主要针对移动端）');
INSERT INTO `xm_api_public` VALUES ('uid', '否', 'unsigned int', '用户ID。使用token验证的接口无需传入用户ID');
INSERT INTO `xm_api_public` VALUES ('token', '必须（除登录接口）', 'unsigned int', '用户登录验证令牌。');
INSERT INTO `xm_api_public` VALUES ('api', '必须', 'string', '接口名称.  格式为 login/login');

-- ----------------------------
-- Table structure for xm_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_assignment`;
CREATE TABLE `xm_auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  CONSTRAINT `xm_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xm_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_item`;
CREATE TABLE `xm_auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  CONSTRAINT `xm_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `xm_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xm_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_item_child`;
CREATE TABLE `xm_auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `xm_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_rule`;
CREATE TABLE `xm_auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xm_member
-- ----------------------------
DROP TABLE IF EXISTS `xm_member`;
CREATE TABLE `xm_member`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员账号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` int(100) UNSIGNED NOT NULL,
  `email_code` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_logintime` int(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xm_menus
-- ----------------------------
DROP TABLE IF EXISTS `xm_menus`;
CREATE TABLE `xm_menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group` tinyint(1) UNSIGNED NOT NULL COMMENT '菜单组 1：供应商菜单列表，2：代理商，3：平台',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 500,
  `icon_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标class样式',
  `status` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_menus
-- ----------------------------
INSERT INTO `xm_menus` VALUES (1, 1, '用户权限', '/rbac-admin', 0, 500, 'fa fa-suitcase', 0);
INSERT INTO `xm_menus` VALUES (2, 1, '接口管理', '/manage/api/list', 3, 500, 'fa fa-list', 0);
INSERT INTO `xm_menus` VALUES (3, 1, '接口模块', '/manage/api/list', 0, 500, 'fa fa-file-text', 0);
INSERT INTO `xm_menus` VALUES (4, 1, '模块管理', '/manage/api-module/index', 3, 500, 'fa fa-file', 0);
INSERT INTO `xm_menus` VALUES (5, 1, '分组管理', '/manage/api-group/index', 3, 500, 'fa fa-file-o', 0);
INSERT INTO `xm_menus` VALUES (17, 1, '角色列表', '/rbac-admin/role', 1, 500, 'fa fa-file-text', 0);
INSERT INTO `xm_menus` VALUES (18, 1, '分配权限', '/rbac-admin/assignment', 1, 500, 'fa fa-list-alt', 0);
INSERT INTO `xm_menus` VALUES (19, 1, '权限列表', '/rbac-admin/permission', 1, 500, 'fa fa-list-ul', 0);
INSERT INTO `xm_menus` VALUES (20, 1, '规则列表', '/rbac-admin/rule', 1, 500, 'fa fa-outdent', 0);
INSERT INTO `xm_menus` VALUES (21, 1, '用户管理', '/manage/member/index', 0, 500, 'fa fa-github-alt', 0);

-- ----------------------------
-- Table structure for xm_users
-- ----------------------------
DROP TABLE IF EXISTS `xm_users`;
CREATE TABLE `xm_users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证邮箱',
  `email_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱标识码',
  `is_stage` int(10) NOT NULL DEFAULT 0 COMMENT '1：前台用户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '普通的平台管理用户,主要是维护平台信息的用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_users
-- ----------------------------
INSERT INTO `xm_users` VALUES (1, 'admin', '1234', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '55', 10, 1473213423, 1473213423, '/static/portrait/admin@1473323616.jpg', '', '', 0);

SET FOREIGN_KEY_CHECKS = 1;
