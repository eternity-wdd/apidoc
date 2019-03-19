/*
Navicat MySQL Data Transfer

Source Server         : xunmall本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xm_api_document

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-17 23:35:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xm_api
-- ----------------------------
DROP TABLE IF EXISTS `xm_api`;
CREATE TABLE `xm_api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL COMMENT '接口名称',
  `label` varchar(100) NOT NULL COMMENT '描述标签',
  `group_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '对应分组ID',
  `module_id` char(50) NOT NULL,
  `need_login` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否需要登录，才能调用此接口',
  `version` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '版本号',
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '此接口是否已公开，没有公开的接口前台不会显示',
  `method` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '请求方式,1表示POST 2表示GET',
  `platforms` int(8) NOT NULL DEFAULT '0' COMMENT '支持的平台的二进制或操作后的结果',
  `priority` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排列显示优先级，越高越靠前',
  `description` varchar(255) DEFAULT NULL,
  `example` text COMMENT '事例代码',
  `response` text COMMENT '成功返回事例,JSON串',
  `request_sample` text,
  `not_sign_params` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `module` (`module_id`),
  KEY `xm_api_ibfk_2` (`group_id`),
  CONSTRAINT `xm_api_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_api_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `xm_api_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api
-- ----------------------------
INSERT INTO `xm_api` VALUES ('3', 'user/login', '登录接口', '1', 'garden', '0', '2', '1', '1', '8', '50', 'SSO统一登录接口，用于所有登录', null, '{\r\n  \"ret\": 0,\r\n  \"data\": {\r\n    \"username\": \"root\",\r\n    \"staffNum\": 1,\r\n    \"iSMorning\": \"早上好!\",\r\n    \"qrCode\": \"http://api.xunmall.com/qr/make?text=http://m.xunmall.com/site/register?staff=root\",\r\n    \"Text\": \"问候语\",\r\n    \"token\": \"0257fc611224a5e942e98239ccd232bc\"\r\n  }\r\n}', 'http://self.official-api.xunmall.com:88?api=user%2Flogin&appid=1510001&password=1234&t=1504491770&token=&uid=&username=root&s=qzD8%2BG5HOU6wubCS1BtzZkgtrDA%3D', '');

-- ----------------------------
-- Table structure for xm_api_client
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_client`;
CREATE TABLE `xm_api_client` (
  `appid` int(10) unsigned NOT NULL COMMENT '客户应用ID',
  `appkey` char(32) NOT NULL COMMENT '应用密钥',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1表示可用，其它不可用',
  `module_id` char(50) NOT NULL COMMENT '所属平台',
  `client` varchar(20) DEFAULT NULL COMMENT '客户端标识',
  PRIMARY KEY (`appid`),
  KEY `platform` (`module_id`),
  CONSTRAINT `xm_api_client_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of xm_api_client
-- ----------------------------

-- ----------------------------
-- Table structure for xm_api_client_platform
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_client_platform`;
CREATE TABLE `xm_api_client_platform` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '平台名称描述',
  `bit` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '二进制信号位，用户xm_api表中的platforms',
  `module_id` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_client_platform
-- ----------------------------
INSERT INTO `xm_api_client_platform` VALUES ('1', 'Android', '1', 'garden');
INSERT INTO `xm_api_client_platform` VALUES ('2', 'IOS', '2', 'garden');
INSERT INTO `xm_api_client_platform` VALUES ('3', 'Wechat', '4', 'garden');
INSERT INTO `xm_api_client_platform` VALUES ('4', 'PC', '8', 'garden');
INSERT INTO `xm_api_client_platform` VALUES ('5', 'PC', '16', 'farming');
INSERT INTO `xm_api_client_platform` VALUES ('6', 'Wechat', '32', 'farming');

-- ----------------------------
-- Table structure for xm_api_code
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_code`;
CREATE TABLE `xm_api_code` (
  `code` int(10) NOT NULL COMMENT '返回码ID',
  `msg` varchar(255) NOT NULL COMMENT '返回码说明',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_code
-- ----------------------------

-- ----------------------------
-- Table structure for xm_api_group
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_group`;
CREATE TABLE `xm_api_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '组名',
  `module_id` char(50) NOT NULL COMMENT '所属模块',
  `desc` varchar(255) DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排列显示优先级，越高越靠前',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `xm_api_group_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `xm_api_module` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_group
-- ----------------------------
INSERT INTO `xm_api_group` VALUES ('1', '账户', 'garden', '', '50');
INSERT INTO `xm_api_group` VALUES ('2', '设备', 'farming', '', '45');

-- ----------------------------
-- Table structure for xm_api_module
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_module`;
CREATE TABLE `xm_api_module` (
  `name` char(50) NOT NULL COMMENT '接口模块名称',
  `label` varchar(50) NOT NULL COMMENT '描述标签',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_module
-- ----------------------------
INSERT INTO `xm_api_module` VALUES ('farming', '农业灌溉');
INSERT INTO `xm_api_module` VALUES ('garden', '园林灌溉');

-- ----------------------------
-- Table structure for xm_api_params
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_params`;
CREATE TABLE `xm_api_params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `pt_id` int(11) unsigned NOT NULL COMMENT '参数类型ID',
  `request` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为必填项',
  `out` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '输入或输出参数标识，1表示输出，0表示输入',
  `desc` text,
  `priority` int(11) unsigned NOT NULL DEFAULT '5' COMMENT '排序，越大越往前',
  `showtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '前台参数展示类型（1.input,2.text,3.checkbox,4.radio,5.select）',
  `param_cont` varchar(255) DEFAULT NULL COMMENT '前台具体参数key和value(存json)',
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`),
  KEY `pt_id` (`pt_id`),
  CONSTRAINT `xm_api_params_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `xm_api` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_api_params_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `xm_api_param_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_params
-- ----------------------------
INSERT INTO `xm_api_params` VALUES ('8', '3', 'username', '用户名', '1', '1', '0', '用户名，6-12位', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('9', '3', 'password', '密码', '1', '1', '0', '用户密码', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('10', '3', 'ret', '接口状态', '1', '1', '1', '0成功，其他则说明接口错误', '5', '0', '');
INSERT INTO `xm_api_params` VALUES ('11', '3', 'data', '返回数据', '1', '1', '1', '详情加成功返回示例', '5', '0', '');

-- ----------------------------
-- Table structure for xm_api_param_type
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_param_type`;
CREATE TABLE `xm_api_param_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_param_type
-- ----------------------------
INSERT INTO `xm_api_param_type` VALUES ('3', 'float');
INSERT INTO `xm_api_param_type` VALUES ('2', 'int');
INSERT INTO `xm_api_param_type` VALUES ('1', 'string');

-- ----------------------------
-- Table structure for xm_api_public
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_public`;
CREATE TABLE `xm_api_public` (
  `paramname` varchar(50) NOT NULL,
  `require` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `des` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_api_public
-- ----------------------------
INSERT INTO `xm_api_public` VALUES ('appid', '必须', 'unsigned int', '应用的唯一ID。');
INSERT INTO `xm_api_public` VALUES ('s', '必须', 'string', '请求串的签名。');
INSERT INTO `xm_api_public` VALUES ('t', '必须', 'unsigned int', '请求时间戳(秒)，平台会验证此时间戳与服务器时间的差值，如果超过10秒，就会返回-20错误码。');
INSERT INTO `xm_api_public` VALUES ('f', '必须（此API版本后必填，之前发布的版本可不填）', 'unsigned int', '1：Android\r\n2：IOS\r\n');
INSERT INTO `xm_api_public` VALUES ('v', '必须', 'string', '接口版本号');
INSERT INTO `xm_api_public` VALUES ('uid', '必须（除登录接口）', 'unsigned int', '用户ID。');
INSERT INTO `xm_api_public` VALUES ('token', '必须（除登录接口）', 'unsigned int', '用户登录验证令牌。');
INSERT INTO `xm_api_public` VALUES ('api', '必须', 'string', '接口名称.');

-- ----------------------------
-- Table structure for xm_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_assignment`;
CREATE TABLE `xm_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `xm_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_auth_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for xm_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_item`;
CREATE TABLE `xm_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `xm_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `xm_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_auth_item
-- ----------------------------

-- ----------------------------
-- Table structure for xm_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_item_child`;
CREATE TABLE `xm_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `xm_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `xm_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for xm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xm_auth_rule`;
CREATE TABLE `xm_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for xm_member
-- ----------------------------
DROP TABLE IF EXISTS `xm_member`;
CREATE TABLE `xm_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL COMMENT '会员账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `addtime` int(100) unsigned NOT NULL,
  `email_code` char(32) DEFAULT NULL,
  `nickname` varchar(60) NOT NULL,
  `last_logintime` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_member
-- ----------------------------

-- ----------------------------
-- Table structure for xm_menus
-- ----------------------------
DROP TABLE IF EXISTS `xm_menus`;
CREATE TABLE `xm_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` tinyint(1) unsigned NOT NULL COMMENT '菜单组 1：供应商菜单列表，2：代理商，3：平台',
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '500',
  `icon_class` varchar(100) DEFAULT NULL COMMENT '图标class样式',
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_menus
-- ----------------------------
INSERT INTO `xm_menus` VALUES ('1', '1', '用户权限', '/rbac-admin', '0', '500', 'fa fa-suitcase', '0');
INSERT INTO `xm_menus` VALUES ('2', '1', '接口管理', '/manage/api/list', '3', '500', 'fa fa-list', '0');
INSERT INTO `xm_menus` VALUES ('3', '1', '接口模块', '/manage/api/list', '0', '500', 'fa fa-file-text', '0');
INSERT INTO `xm_menus` VALUES ('4', '1', '模块管理', '/manage/api-module/index', '3', '500', 'fa fa-file', '0');
INSERT INTO `xm_menus` VALUES ('5', '1', '分组管理', '/manage/api-group/index', '3', '500', 'fa fa-file-o', '0');
INSERT INTO `xm_menus` VALUES ('17', '1', '角色列表', '/rbac-admin/role', '1', '500', 'fa fa-file-text', '0');
INSERT INTO `xm_menus` VALUES ('18', '1', '分配权限', '/rbac-admin/assignment', '1', '500', 'fa fa-list-alt', '0');
INSERT INTO `xm_menus` VALUES ('19', '1', '权限列表', '/rbac-admin/permission', '1', '500', 'fa fa-list-ul', '0');
INSERT INTO `xm_menus` VALUES ('20', '1', '规则列表', '/rbac-admin/rule', '1', '500', 'fa fa-outdent', '0');
INSERT INTO `xm_menus` VALUES ('21', '1', '用户管理', '/manage/member/index', '0', '500', 'fa fa-github-alt', '0');

-- ----------------------------
-- Table structure for xm_users
-- ----------------------------
DROP TABLE IF EXISTS `xm_users`;
CREATE TABLE `xm_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `portrait` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL COMMENT '验证邮箱',
  `email_code` varchar(100) NOT NULL COMMENT '邮箱标识码',
  `is_stage` int(10) NOT NULL DEFAULT '0' COMMENT '1：前台用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='普通的平台管理用户,主要是维护平台信息的用户';

-- ----------------------------
-- Records of xm_users
-- ----------------------------
INSERT INTO `xm_users` VALUES ('1', 'admin', '1234', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '55', '10', '1473213423', '1473213423', '/static/portrait/admin@1473323616.jpg', '', '', '0');
