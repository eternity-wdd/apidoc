/*
Navicat MySQL Data Transfer

Source Server         : xunmall本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xm_api_document

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-17 20:50:31
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
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8;

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
-- Table structure for xm_api_client_platform
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_client_platform`;
CREATE TABLE `xm_api_client_platform` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '平台名称描述',
  `bit` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '二进制信号位，用户xm_api表中的platforms',
  `module_id` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='普通的平台管理用户,主要是维护平台信息的用户';
