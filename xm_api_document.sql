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

 Date: 17/06/2019 13:45:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hosts
-- ----------------------------
DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主机IP',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '别名',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'hosts表, 给APIDoc提供不同的测试环境' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hosts
-- ----------------------------
INSERT INTO `hosts` VALUES (1, '127.0.0.1', 'localhost localhost.localdomain localhost4 localhost4.localdomain4', '本机localhost', NULL);
INSERT INTO `hosts` VALUES (2, '::1', 'localhost localhost.localdomain localhost6 localhost6.localdomain6', '本机localhost', NULL);
INSERT INTO `hosts` VALUES (3, '172.168.50.240', 'dev-api.trade.klagri.com.cn', '无人机2.0-API', '测试');
INSERT INTO `hosts` VALUES (4, '172.168.10.100', 'self-api.trade.klagri.com.cn', '无人机2.0-API', 'lizheng本地');
INSERT INTO `hosts` VALUES (5, '172.168.10.100', 'lz-apifacility.klagri.com.cn', '设施管理平台', 'lizheng本地开发');
INSERT INTO `hosts` VALUES (6, '172.168.10.100', 'self-apifacility.klagri.com.cn', '设施管理平台', 'lizheng本地测试');
INSERT INTO `hosts` VALUES (7, '172.168.50.40', 'dev-apifacility.klagri.com.cn', '设施管理平台', '测试线');
INSERT INTO `hosts` VALUES (8, '172.168.50.240', 'show-apifacility.klagri.com.cn', '设施管理平台', '内网演示');
INSERT INTO `hosts` VALUES (9, '172.168.10.100', 'self-apiwx.klagri.com.cn', '云气象小程序接口', 'lizheng本地');
INSERT INTO `hosts` VALUES (10, '127.0.0.1', ' bch-mantis.klagri.com.cn', '', '李昌添加');

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
  `folder_bak` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属目录(无用字段)',
  `need_login` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否需要登录',
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
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api
-- ----------------------------
INSERT INTO `xm_api` VALUES (1, 'login/login', '登录', 1, 'trade-api', 'api', 0, 1, 1, 1, 0, 50, '用户登录', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"id\": \"28\",\r\n        \"user_name\": \"lizheng\",\r\n        \"real_name\": \"李明\",\r\n        \"phone\": \"18865501833\",\r\n        \"avatar\": \"http://pic.klagri.com.cn/trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg\",\r\n        \"token\": \"d1b3f730693e4ea35457c92c5e3a842d\",\r\n        \"identify\": \"3\",\r\n        \"id_card\": \"370405199306253811\",\r\n        \"sex\": \"2\",\r\n        \"email\": \"271648245@qq.com\"\r\n    }\r\n}', '{\r\n	\"user_name\":\"admin\",\r\n	\"passwd\":\"88888888\"\r\n}', '');
INSERT INTO `xm_api` VALUES (2, 'sms/send', '验证码', 1, 'trade-api', 'api', 0, 1, 1, 1, 0, 50, '验证码发送', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"code\": \"169860\"\r\n    }\r\n}', '{\r\n	\"type\":1,\r\n	\"phone\":\"18865501833\"\r\n}', '');
INSERT INTO `xm_api` VALUES (3, 'user/register', '注册', 1, 'trade-api', 'api', 0, 1, 1, 1, 0, 50, '农户端用户注册', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"注册成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"code\":\"323263\",\r\n	\"phone\":\"18865501833\",\r\n	\"user_name\":\"lizheng\",\r\n	\"passwd\":\"88888888\",\r\n	\"passwd_r\":\"88888888\"\r\n}', '');
INSERT INTO `xm_api` VALUES (4, 'user/certification', '实名认证', 1, 'trade-api', 'api', 0, 1, 1, 1, 3, 50, '用户实名认证，上传身份证正反照、身份证号，等信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"认证成功\",\r\n    \"data\": {\r\n        \"identify\": \"3\"\r\n    }\r\n}', '{\r\n	\"token\":\"97ce952f17ea648100b728bf9dcac37f\",\r\n	\"real_name\":\"李明\",\r\n	\"id_card\":\"370405199306253811\",\r\n	\"card_img_url_y\":\"upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg\",\r\n	\"card_img_url_n\":\"upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg\"\r\n}', '');
INSERT INTO `xm_api` VALUES (5, 'login/token', 'token登录', 1, 'trade-api', 'api', 0, 1, 1, 1, 0, 50, '用于token登录', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"id\": \"28\",\r\n        \"user_name\": \"lizheng\",\r\n        \"real_name\": \"李明\",\r\n        \"phone\": \"18865501833\",\r\n        \"avatar\": \"http://pic.klagri.com.cn/trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg\",\r\n        \"token\": \"d1b3f730693e4ea35457c92c5e3a842d\",\r\n        \"identify\": \"3\",\r\n        \"id_card\": \"370405199306253811\",\r\n        \"sex\": \"2\",\r\n        \"email\": \"271648245@qq.com\"\r\n    }\r\n}', '{\r\n	\"token\":\"2a4d755d845254a983a9fce9efebca36\"\r\n}', '');
INSERT INTO `xm_api` VALUES (6, 'user/getuserinfo', '用户信息', 1, 'trade-api', 'api', 1, 1, 1, 1, 3, 50, '获取用户信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"gender\": \"\",\r\n        \"email\": \"\",\r\n        \"avatar\": \"\",\r\n        \"real_name\": \"李明\",\r\n        \"id_card\": \"370405199306253811\"\r\n    }\r\n}', 'http://dev-api.trade.klagri.com.cn/api/user/getuserinfo', '');
INSERT INTO `xm_api` VALUES (7, 'user/update', '用户-信息修改', 1, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '获取用户信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"修改成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"97ce952f17ea648100b728bf9dcac37f\",\r\n	\"sex\":\"1\",\r\n	\"email\":\"271648245@qq.com\",\r\n	\"avatar\":\"trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg\"\r\n}', '');
INSERT INTO `xm_api` VALUES (8, 'user/password', '修改密码', 1, 'trade-api', 'api', 0, 1, 1, 1, 0, 50, '用户修改密码', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"code\":\"551572\",\r\n	\"phone\":\"18865501833\",\r\n	\"passwd\":\"12345678\",\r\n	\"passwd_r\":\"12345678\"\r\n}', '');
INSERT INTO `xm_api` VALUES (9, 'block/add', '地块-添加', 2, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '用户添加地块', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"name\":\"无人机地块测试\",\r\n	\"lng\":\"116.48548\",\r\n	\"lat\":\"39.9484\",\r\n	\"address\":\"北京市朝阳区\",\r\n	\"acreage\":\"235\",\r\n	\"landform\":\"1\",\r\n	\"pic\":\"http://lz.facility-klagri.com//upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg\"\r\n}', '');
INSERT INTO `xm_api` VALUES (10, 'block/index', '地块列表', 2, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '地块-列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10009\",\r\n            \"name\": \"lizheng地块测试\",\r\n            \"address\": \"北京市朝阳区保利国际广场T2\",\r\n            \"acreage\": \"500.00\"\r\n        },\r\n        {\r\n            \"id\": \"10010\",\r\n            \"name\": \"lizheng地块测试2\",\r\n            \"address\": \"北京市朝阳区保利国际广场T2\",\r\n            \"acreage\": \"500.00\"\r\n        },\r\n        {\r\n            \"id\": \"10011\",\r\n            \"name\": \"lizheng地块测试3\",\r\n            \"address\": \"北京市朝阳区保利国际广场T2\",\r\n            \"acreage\": \"500.00\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"97ce952f17ea648100b728bf9dcac37f\"\r\n}', '');
INSERT INTO `xm_api` VALUES (11, 'block/show', '地块信息', 2, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '地块详情', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"name\": \"lizheng地块测试修改23\",\r\n        \"address\": \"北京市朝阳区保利国际广场T2\",\r\n        \"acreage\": \"500.00\",\r\n        \"landform\": \"1\",\r\n        \"pic\": \"http://pic.klagri.com/trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg\",\r\n        \"lat\": \"42.1586432180\",\r\n        \"lng\": \"108.2354545100\"\r\n    }\r\n}', '{\r\n	\"token\":\"97ce952f17ea648100b728bf9dcac37f\",\r\n	\"id\":10009\r\n}', '');
INSERT INTO `xm_api` VALUES (12, 'block/update', '地块更新', 2, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '地块更新', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"id\":\"10015\",\r\n	\"name\":\"无人机地块测试1\",\r\n	\"lng\":\"108.23545451\",\r\n	\"lat\":\"42.158643218\",\r\n	\"address\":\"北京市朝阳区保利国际广场T2\",\r\n	\"acreage\":\"500.00\",\r\n	\"landform\":\"1\",\r\n	\"pic\":\"trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg\"\r\n}', '');
INSERT INTO `xm_api` VALUES (13, 'demand/index', '需求列表', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"demand_id\": \"7\",\r\n            \"plant_id\": \"10001\",\r\n            \"plant_name\": \"玉米\",\r\n            \"task_type\": \"整地\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"assemble_address\": \"北京市朝阳区望京东保利国际广场\",\r\n            \"type_name\": \"耙地\"\r\n        },\r\n        {\r\n            \"demand_id\": \"8\",\r\n            \"plant_id\": \"10001\",\r\n            \"plant_name\": \"玉米\",\r\n            \"task_type\": \"播种\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"product_source\": \"农机队\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"籽种\"\r\n        },\r\n        {\r\n            \"demand_id\": \"18\",\r\n            \"plant_id\": \"10001\",\r\n            \"plant_name\": \"玉米\",\r\n            \"task_type\": \"播种\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"product_source\": \"农户\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"秧苗\"\r\n        },\r\n        {\r\n            \"demand_id\": \"10\",\r\n            \"plant_id\": \"10003\",\r\n            \"plant_name\": \"水稻\",\r\n            \"task_type\": \"施肥\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"product_source\": \"农机队\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"钾肥\"\r\n        },\r\n        {\r\n            \"demand_id\": \"11\",\r\n            \"plant_id\": \"10002\",\r\n            \"plant_name\": \"小麦\",\r\n            \"task_type\": \"打药\",\r\n            \"task_begintime\": \"1555862400\",\r\n            \"task_endtime\": \"1555417140\",\r\n            \"product_source\": \"农户\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"翻耕\"\r\n        },\r\n        {\r\n            \"demand_id\": \"12\",\r\n            \"plant_id\": \"10001\",\r\n            \"plant_name\": \"玉米\",\r\n            \"task_type\": \"打药\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"product_source\": \"农户\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"杀软体动物剂\"\r\n        },\r\n        {\r\n            \"demand_id\": \"20\",\r\n            \"plant_id\": \"10001\",\r\n            \"plant_name\": \"玉米\",\r\n            \"task_type\": \"整地\",\r\n            \"task_begintime\": \"1548159540\",\r\n            \"task_endtime\": \"1548418740\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"深松耕\"\r\n        },\r\n        {\r\n            \"demand_id\": \"22\",\r\n            \"plant_id\": \"10003\",\r\n            \"plant_name\": \"水稻\",\r\n            \"task_type\": \"打药\",\r\n            \"task_begintime\": \"1555862400\",\r\n            \"task_endtime\": \"1555417140\",\r\n            \"product_source\": \"农机队\",\r\n            \"assemble_address\": \"北京西城区\",\r\n            \"type_name\": \"杀螨剂\"\r\n        }\r\n    ]\r\n}', '{\r\n    “token\":“4387b3e78ef8f49fcc44c38414c1b037”\r\n}\r\n', '');
INSERT INTO `xm_api` VALUES (14, 'demand/add', '需求添加', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求添加', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"task_type\":5,\r\n	\"task_begintime\":\"2019-04-22\",\r\n	\"task_endtime\":\"2019-01-23\",\r\n	\"product_source\":2,\r\n	\"real_name\":\"guo\",\r\n	\"phone\":15711358444,\r\n	\"assemble_lng\":119.1536480000,\r\n	\"assemble_lat\":41.6226250000,\r\n	\"assemble_address\":\"北京西城区\",\r\n	\"species_id\":10003,\r\n	\"demand_type_id\":14\r\n\r\n}', '');
INSERT INTO `xm_api` VALUES (15, 'sms/validate', '验证码校验', 1, 'trade-api', 'api', 0, 1, 0, 1, 15, 50, '（内部使用）用来验证验证码是否正确', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"phone\":\"18865501833\",\r\n	\"code\":\"554191\"\r\n}', '');
INSERT INTO `xm_api` VALUES (16, 'test/test', '代码测试接口', 1, 'trade-api', 'api', 0, 1, 0, 1, 15, 50, '（内部使用）专门用来进行代码测试，和执行脚本的接口', NULL, '', '', '');
INSERT INTO `xm_api` VALUES (18, 'demand/show', '需求信息', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '根据需求id获取需求信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"species_id\": \"10004\",\r\n        \"task_type\": \"飞防\",\r\n        \"task_begintime\": \"1548159540\",\r\n        \"task_endtime\": \"1548418740\",\r\n        \"product_source\": \"农户\",\r\n        \"demand_type_id\": \"16\",\r\n        \"real_name\": \"guo\",\r\n        \"phone\": \"15711358444\",\r\n        \"assemble_lng\": \"119.1536480000\",\r\n        \"assemble_lat\": \"41.6226250000\",\r\n        \"assemble_address\": \"北京西城区\",\r\n        \"species_name\": \"马铃薯\",\r\n        \"type_name\": \"杀线虫剂\"\r\n    }\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"id\":11\r\n}', '');
INSERT INTO `xm_api` VALUES (19, 'demand/update', '修改需求', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '根据需求id修改作业需求', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"id\":11,\r\n	\"task_type\":5,\r\n	\"task_begintime\":\"2019-04-22\",\r\n	\"task_endtime\":\"2019-04-24\",\r\n	\"demand_type_id\":11,\r\n	\"real_name\":\"郭明珠\",\r\n	\"phone\":15711358441,\r\n	\"assemble_lng\":119.1536480000,\r\n	\"assemble_lat\":41.6226250000,\r\n	\"assemble_address\":\"北京西城区\",\r\n	\"species_id\":10002,\r\n	\"product_source\":1\r\n}', '');
INSERT INTO `xm_api` VALUES (20, 'demand/getplant', '获取所有作物信息', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '获取所有作物信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10001\",\r\n            \"name\": \"玉米\"\r\n        },\r\n        {\r\n            \"id\": \"10002\",\r\n            \"name\": \"小麦\"\r\n        },\r\n        {\r\n            \"id\": \"10003\",\r\n            \"name\": \"水稻\"\r\n        },\r\n        {\r\n            \"id\": \"10004\",\r\n            \"name\": \"马铃薯\"\r\n        },\r\n        {\r\n            \"id\": \"10005\",\r\n            \"name\": \"甜菜\"\r\n        },\r\n        {\r\n            \"id\": \"10006\",\r\n            \"name\": \"甘蔗\"\r\n        },\r\n        {\r\n            \"id\": \"10007\",\r\n            \"name\": \"苹果\"\r\n        },\r\n        {\r\n            \"id\": \"10008\",\r\n            \"name\": \"柑橘\"\r\n        },\r\n        {\r\n            \"id\": \"10009\",\r\n            \"name\": \"葵花\"\r\n        },\r\n        {\r\n            \"id\": \"10010\",\r\n            \"name\": \"棉花\"\r\n        },\r\n        {\r\n            \"id\": \"10011\",\r\n            \"name\": \"牧草\"\r\n        }\r\n    ]\r\n}', '', '');
INSERT INTO `xm_api` VALUES (21, 'test/test', '测试接口', 10, 'facility', 'facility', 0, 1, 1, 3, 1, 50, '代码测试专用', NULL, '', 'self-apifacility.klagri.com.cn/facility/test/test', '');
INSERT INTO `xm_api` VALUES (22, 'plan/list_by_project', '种植作物列表（按照基地查询）', 5, 'facility', 'facility', 0, 1, 1, 1, 2, 50, '种植作物列表（按照基地查询）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10000\",\r\n            \"block_id\": \"10001\",\r\n            \"pp_area\": \"100 亩\",\r\n            \"set_start_time\": \"18-10-05\",\r\n            \"set_end_time\": \"19-05-05\",\r\n            \"collect_time\": \"19-05-05\",\r\n            \"block_name\": \"一号大棚\",\r\n            \"work_cycle\": \"开花期\",\r\n            \"pp_crop_name\": \"辣椒\",\r\n            \"pp_variety_name\": \"新尖椒1号\",\r\n            \"pp_variety_pic\": \"http://lz.facility-klagri.com/upload//images//variety/14468.jpg\",\r\n            \"finish_percent\": \"88%\"\r\n        },\r\n        {\r\n            \"id\": \"10005\",\r\n            \"block_id\": \"10002\",\r\n            \"pp_area\": \"100 亩\",\r\n            \"set_start_time\": \"18-10-05\",\r\n            \"set_end_time\": \"19-05-05\",\r\n            \"collect_time\": \"19-05-05\",\r\n            \"block_name\": \"一号大田\",\r\n            \"work_cycle\": \"抽穗期\",\r\n            \"pp_crop_name\": \"辣椒\",\r\n            \"pp_variety_name\": \"新尖椒1号\",\r\n            \"pp_variety_pic\": \"http://lz.facility-klagri.com/upload//images//variety/14468.jpg\",\r\n            \"finish_percent\": \"88%\"\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/plan/list_by_project?project_id=37081&limit=10&p=1', '');
INSERT INTO `xm_api` VALUES (23, 'plan/detail_by_block', '通过地块ID获取当前种植计划', 5, 'facility', 'faciltiy', 0, 1, 1, 1, 2, 50, '通过地块ID获取当前种植计划', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"vcareaName\": \"测试基地3\",\r\n        \"vcparceldesc\": \"一号大棚\",\r\n        \"varietyName\": \"郑麦379\",\r\n        \"varietyfeatures\": \"半冬性，全生育期227天，比对照品种周麦18晚熟1天。幼苗半匍匐，苗势壮，叶片窄长，叶色浓绿，冬季抗寒性较好。分蘖力较强，成穗率较低。春季起身拔节迟，两极分化较快，耐倒春寒能力一般。耐后期高温能力中等，熟相中等。株高81.8厘米，茎秆弹性较好，抗倒性较好。株型稍松散，旗叶窄长、上冲，穗层厚。穗纺锤形，小穗较稀，长芒，白壳，白粒，籽粒角质、饱满。亩穗数40.5万穗，穗粒数31.1粒，千粒重47.2克。抗病性鉴定，慢条锈病，高感叶锈病、白粉病、赤霉病、纹枯病。品质检测，籽粒容重815克/升，蛋白质含量14.52%，湿面筋含量30.9%，沉降值29.6毫升，吸水率59.9%，稳定时间5.5分钟，最大拉伸阻力314E.U.，延伸性139毫米，拉伸面积60平方厘米。\",\r\n        \"suitablearea\": \"适宜黄淮冬麦区南片的河南驻马店及以北地区、安徽淮北地区、江苏淮北地区、陕西关中地区高中水肥地块早中茬种植。\",\r\n        \"pic\": \"http://zhny.klagri.com.cn:8080/scgl/userfiles/fileupload/201812/1071970329383763968.png\",\r\n        \"currentcycle\": \"--\",\r\n        \"cropname\": \"小麦\",\r\n        \"total_days\": 61,\r\n        \"remain_days\": -117,\r\n        \"cycledata\": [\r\n            {\r\n                \"workCycle\": \"播种期\",\r\n                \"cycledays\": 1,\r\n                \"startTime\": \"2018-10-21\",\r\n                \"endTime\": \"2018-10-22\"\r\n            },\r\n            {\r\n                \"workCycle\": \"出苗期\",\r\n                \"cycledays\": 10,\r\n                \"startTime\": \"2018-10-22\",\r\n                \"endTime\": \"2018-11-01\"\r\n            },\r\n            {\r\n                \"workCycle\": \"三叶期\",\r\n                \"cycledays\": 20,\r\n                \"startTime\": \"2018-11-01\",\r\n                \"endTime\": \"2018-11-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"分蘖期\",\r\n                \"cycledays\": 10,\r\n                \"startTime\": \"2018-11-21\",\r\n                \"endTime\": \"2018-12-01\"\r\n            },\r\n            {\r\n                \"workCycle\": \"越冬期\",\r\n                \"cycledays\": 20,\r\n                \"startTime\": \"2018-12-01\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"收获期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"开花期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"拔节期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"灌浆期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"孕穗期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"返青期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"成熟期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"抽穗期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            },\r\n            {\r\n                \"workCycle\": \"起身期\",\r\n                \"cycledays\": 0,\r\n                \"startTime\": \"2018-12-21\",\r\n                \"endTime\": \"2018-12-21\"\r\n            }\r\n        ]\r\n    }\r\n}', '{\r\n	\"block_id\":\"10041\"\r\n}', '');
INSERT INTO `xm_api` VALUES (24, 'demand/task_contents', '需求--整地-所有作业内容列表', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求--整地-所有作业需求列表（下拉框数据）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"type_name\": \"翻耕\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"type_name\": \"深松耕\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"type_name\": \"耙地\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"type_name\": \"耢地\"\r\n        },\r\n        {\r\n            \"id\": \"5\",\r\n            \"type_name\": \"镇压\"\r\n        },\r\n        {\r\n            \"id\": \"6\",\r\n            \"type_name\": \"平地\"\r\n        },\r\n        {\r\n            \"id\": \"7\",\r\n            \"type_name\": \"耖田\"\r\n        },\r\n        {\r\n            \"id\": \"8\",\r\n            \"type_name\": \"起垄\"\r\n        },\r\n        {\r\n            \"id\": \"9\",\r\n            \"type_name\": \"作畦\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\"\r\n}', '');
INSERT INTO `xm_api` VALUES (25, 'demand/getplant', '需求--作物类型---所有作物信息', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '获取所有作物信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10001\",\r\n            \"name\": \"玉米\"\r\n        },\r\n        {\r\n            \"id\": \"10002\",\r\n            \"name\": \"小麦\"\r\n        },\r\n        {\r\n            \"id\": \"10003\",\r\n            \"name\": \"水稻\"\r\n        },\r\n        {\r\n            \"id\": \"10004\",\r\n            \"name\": \"马铃薯\"\r\n        },\r\n        {\r\n            \"id\": \"10005\",\r\n            \"name\": \"甜菜\"\r\n        },\r\n        {\r\n            \"id\": \"10006\",\r\n            \"name\": \"甘蔗\"\r\n        },\r\n        {\r\n            \"id\": \"10007\",\r\n            \"name\": \"苹果\"\r\n        },\r\n        {\r\n            \"id\": \"10008\",\r\n            \"name\": \"柑橘\"\r\n        },\r\n        {\r\n            \"id\": \"10009\",\r\n            \"name\": \"葵花\"\r\n        },\r\n        {\r\n            \"id\": \"10010\",\r\n            \"name\": \"棉花\"\r\n        },\r\n        {\r\n            \"id\": \"10011\",\r\n            \"name\": \"牧草\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\"\r\n}', '');
INSERT INTO `xm_api` VALUES (26, 'demand/pesticide_types', '需求--药剂类型---药剂列表', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求--药剂类型---药剂列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10\",\r\n            \"type_name\": \"除草剂\"\r\n        },\r\n        {\r\n            \"id\": \"11\",\r\n            \"type_name\": \"杀虫剂\"\r\n        },\r\n        {\r\n            \"id\": \"12\",\r\n            \"type_name\": \"杀菌剂\"\r\n        },\r\n        {\r\n            \"id\": \"13\",\r\n            \"type_name\": \"植物生长调节剂\"\r\n        },\r\n        {\r\n            \"id\": \"14\",\r\n            \"type_name\": \"杀螨剂\"\r\n        },\r\n        {\r\n            \"id\": \"15\",\r\n            \"type_name\": \"杀软体动物剂\"\r\n        },\r\n        {\r\n            \"id\": \"16\",\r\n            \"type_name\": \"杀线虫剂\"\r\n        },\r\n        {\r\n            \"id\": \"17\",\r\n            \"type_name\": \"生物农药\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\"\r\n}', '');
INSERT INTO `xm_api` VALUES (27, 'demand/fercilizer_types', '需求--肥料类型---肥料列表', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求--肥料类型---肥料列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"18\",\r\n            \"type_name\": \"有机肥 \"\r\n        },\r\n        {\r\n            \"id\": \"19\",\r\n            \"type_name\": \"氮肥\"\r\n        },\r\n        {\r\n            \"id\": \"20\",\r\n            \"type_name\": \"磷肥 \"\r\n        },\r\n        {\r\n            \"id\": \"21\",\r\n            \"type_name\": \"钾肥\"\r\n        },\r\n        {\r\n            \"id\": \"22\",\r\n            \"type_name\": \"复合肥 \"\r\n        },\r\n        {\r\n            \"id\": \"23\",\r\n            \"type_name\": \"中微量元素肥\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\"\r\n}', '');
INSERT INTO `xm_api` VALUES (28, 'demand/sprout_types', '需求--种苗类型--所有种苗类型', 4, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '需求--种苗类型--所有种苗类型', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"24\",\r\n            \"type_name\": \"籽种\"\r\n        },\r\n        {\r\n            \"id\": \"25\",\r\n            \"type_name\": \"秧苗\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\"\r\n}', '');
INSERT INTO `xm_api` VALUES (29, 'tender/packages', '招标--根据需求获套餐列表', 6, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '招标--根据需求获套餐列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"name\": \"小麦收割套餐\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"demand_id\":\"9\"\r\n}', '');
INSERT INTO `xm_api` VALUES (30, 'tender/search_team', '招标--招标对象---搜索植保队', 6, 'trade-api', 'api', 1, 1, 1, 1, 0, 50, '招标--招标对象---搜索植保队', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"10001\",\r\n            \"name\": \"京蓝无人机植保队\"\r\n        },\r\n        {\r\n            \"id\": \"20001\",\r\n            \"name\": \"入驻植保队01\"\r\n        }\r\n    ]\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"name\":\"植保队\"\r\n}', '');
INSERT INTO `xm_api` VALUES (31, 'tender/add', '招标--发布招标信息', 6, 'trade-api', 'api', 1, 1, 0, 1, 0, 50, '招标--发布招标信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"token\":\"5bf271c4480b2d64586efc148340f0dc\",\r\n	\"block_id\":10002,\r\n	\"demand_id\":2,\r\n	\"tender_object\":3,\r\n	\"package_id\":1,\r\n	\"tender_begintime\":\"2019-04-09\",\r\n	\"tender_endtime\":\"2019-04-13\",\r\n	\"remark\":\"收割\",\r\n	\"amount\":111,\r\n	\"team_id\":10001\r\n}', '');
INSERT INTO `xm_api` VALUES (32, 'environment/monitor', '环境监控+传感器', 7, 'facility', 'facility', 0, 1, 1, 1, 2, 50, '环境监控', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"video\": [\r\n            {\r\n                \"id\": \"20190031424724993\",\r\n                \"serialno\": \"0433.0017.1820000001\",\r\n                \"dclass\": \"21\",\r\n                \"username\": \"admin\",\r\n                \"password\": \"123456AS@\",\r\n                \"loginip\": \"172.168.50.119\",\r\n                \"port\": 80\r\n            }\r\n        ],\r\n        \"weather\": {\r\n            \"t\": \"25.46 ℃\",\r\n            \"wet\": \"12.59%\",\r\n            \"co2\": \"274.00ppm\",\r\n            \"sun_hours\": \"0.96Lux\",\r\n            \"floor_t\": \"17.19℃\",\r\n            \"floor_wet\": \"21.56%\"\r\n        }\r\n    }\r\n}', '{\r\n	\"block_id\":\"10041\"\r\n}', '');
INSERT INTO `xm_api` VALUES (33, 'environment/chart_air', '环境监控-空气-charts', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '环境监控-图表，空气的温度和湿度', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datatime\": [\r\n            \"08\",\r\n            \"09\",\r\n            \"10\",\r\n            \"11\",\r\n            \"12\",\r\n            \"13\",\r\n            \"14\",\r\n            \"15\",\r\n            \"16\",\r\n            \"17\"\r\n        ],\r\n        \"air_t\": [\r\n            24,\r\n            23.5,\r\n            26.2,\r\n            20,\r\n            18,\r\n            23,\r\n            22.5,\r\n            25,\r\n            24,\r\n            22.5\r\n        ],\r\n        \"air_wet\": [\r\n            40,\r\n            43.5,\r\n            46.2,\r\n            40,\r\n            48,\r\n            43,\r\n            45,\r\n            45,\r\n            44,\r\n            42.5\r\n        ],\r\n        \"air_t_max\": 26.2,\r\n        \"air_wet_max\": 48\r\n    }\r\n}', '{\r\n	\"block_id\":\"10041\"\r\n}', '');
INSERT INTO `xm_api` VALUES (34, 'environment/chart_floor', '环境监控-土壤-chart', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '土壤温湿度 折线柱状图', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datatime\": [\r\n            \"09\",\r\n            \"11\",\r\n            \"12\",\r\n            \"13\",\r\n            \"14\",\r\n            \"15\",\r\n            \"16\",\r\n            \"18\",\r\n            \"19\",\r\n            \"20\",\r\n            \"22\",\r\n            \"23\",\r\n            \"00\",\r\n            \"01\",\r\n            \"03\",\r\n            \"04\",\r\n            \"05\",\r\n            \"06\",\r\n            \"08\"\r\n        ],\r\n        \"floor_t\": [\r\n            14.5,\r\n            15.81,\r\n            15.94,\r\n            16.13,\r\n            16.44,\r\n            17.19,\r\n            17.44,\r\n            17.56,\r\n            17.31,\r\n            17.06,\r\n            16.81,\r\n            16.56,\r\n            16.06,\r\n            15.81,\r\n            15.56,\r\n            15.31,\r\n            15.13,\r\n            14.75,\r\n            14.63\r\n        ],\r\n        \"floor_wet\": [\r\n            20.63,\r\n            21.15,\r\n            21.13,\r\n            21.14,\r\n            21.14,\r\n            21.11,\r\n            21.06,\r\n            21.03,\r\n            20.94,\r\n            20.9,\r\n            20.85,\r\n            20.8,\r\n            20.74,\r\n            20.71,\r\n            20.67,\r\n            20.65,\r\n            20.63,\r\n            20.6,\r\n            20.61\r\n        ],\r\n        \"floor_t_max\": 17.56,\r\n        \"floor_wet_max\": 21.15\r\n    }\r\n}', '{\r\n	\"block_id\":10041\r\n}', '');
INSERT INTO `xm_api` VALUES (35, 'environment/greenHousrHistory', '环境-温室历史数据', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '环境-温室历史数据', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"9\",\r\n            \"air_t\": \"9999.99\",\r\n            \"air_wet\": \"9999.99\",\r\n            \"co2\": \"9999.99\",\r\n            \"sun\": \"9999.99\",\r\n            \"createtime\": \"2019-04-19 18:25:08\",\r\n            \"block_name\": \"一号大田\",\r\n            \"floor_t\": \"9999.99/9999.99/9999.99/9999.99\",\r\n            \"floor_wet\": \"9999.99/9999.99/9999.99/9999.99\"\r\n        },\r\n        {\r\n            \"id\": \"8\",\r\n            \"air_t\": \"25.46\",\r\n            \"air_wet\": \"12.59\",\r\n            \"co2\": \"274.00\",\r\n            \"sun\": \"0.96\",\r\n            \"createtime\": \"2019-04-19 18:21:08\",\r\n            \"block_name\": \"一号大棚\",\r\n            \"floor_t\": \"16.88/16.06/16.06/15.69\",\r\n            \"floor_wet\": \"23.30/20.56/24.08/23.20\"\r\n        }\r\n    ],\r\n    \"p\": 1,\r\n    \"total\": 8,\r\n    \"pages\": 4\r\n}', '{\r\n	\"limit\":\"2\",\r\n	\"p\":\"1\"\r\n}', '');
INSERT INTO `xm_api` VALUES (36, 'environment/getAlarm', '环境-根据地块ID获取报警信息', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '环境-根据地块ID获取报警信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"air_t\": {\r\n                \"flag\": true,\r\n                \"air_t\": \"50.00\"\r\n            },\r\n            \"air_wet\": {\r\n                \"flag\": false,\r\n                \"air_wet\": \"45.00\"\r\n            },\r\n            \"co2\": {\r\n                \"flag\": false,\r\n                \"co2\": \"-\"\r\n            },\r\n            \"sun\": {\r\n                \"flag\": false,\r\n                \"sun\": \"-\"\r\n            },\r\n            \"floor_t1\": {\r\n                \"flag\": false,\r\n                \"floor_t1\": \"-\"\r\n            },\r\n            \"floor_t2\": {\r\n                \"flag\": false,\r\n                \"floor_t2\": \"-\"\r\n            },\r\n            \"floor_t3\": {\r\n                \"flag\": false,\r\n                \"floor_t3\": \"-\"\r\n            },\r\n            \"floor_t4\": {\r\n                \"flag\": false,\r\n                \"floor_t4\": \"-\"\r\n            },\r\n            \"floor_wet1\": {\r\n                \"flag\": false,\r\n                \"floor_wet1\": \"-\"\r\n            },\r\n            \"floor_wet2\": {\r\n                \"flag\": false,\r\n                \"floor_wet2\": \"-\"\r\n            },\r\n            \"floor_wet3\": {\r\n                \"flag\": false,\r\n                \"floor_wet3\": \"-\"\r\n            },\r\n            \"floor_wet4\": {\r\n                \"flag\": false,\r\n                \"floor_wet4\": \"-\"\r\n            },\r\n            \"collect_time\": \"1555669268\",\r\n            \"block_name\": \"一号大棚\"\r\n        },\r\n        {\r\n            \"id\": \"7\",\r\n            \"air_t\": {\r\n                \"flag\": false,\r\n                \"air_t\": \"25.46\"\r\n            },\r\n            \"air_wet\": {\r\n                \"flag\": false,\r\n                \"air_wet\": \"12.59\"\r\n            },\r\n            \"co2\": {\r\n                \"flag\": false,\r\n                \"co2\": \"274.00\"\r\n            },\r\n            \"sun\": {\r\n                \"flag\": false,\r\n                \"sun\": \"0.96\"\r\n            },\r\n            \"floor_t1\": {\r\n                \"flag\": false,\r\n                \"floor_t1\": \"16.88\"\r\n            },\r\n            \"floor_t2\": {\r\n                \"flag\": false,\r\n                \"floor_t2\": \"16.06\"\r\n            },\r\n            \"floor_t3\": {\r\n                \"flag\": false,\r\n                \"floor_t3\": \"16.06\"\r\n            },\r\n            \"floor_t4\": {\r\n                \"flag\": false,\r\n                \"floor_t4\": \"15.69\"\r\n            },\r\n            \"floor_wet1\": {\r\n                \"flag\": false,\r\n                \"floor_wet1\": \"23.30\"\r\n            },\r\n            \"floor_wet2\": {\r\n                \"flag\": false,\r\n                \"floor_wet2\": \"20.56\"\r\n            },\r\n            \"floor_wet3\": {\r\n                \"flag\": false,\r\n                \"floor_wet3\": \"24.08\"\r\n            },\r\n            \"floor_wet4\": {\r\n                \"flag\": false,\r\n                \"floor_wet4\": \"23.20\"\r\n            },\r\n            \"collect_time\": \"1555669268\",\r\n            \"block_name\": \"一号大棚\"\r\n        },\r\n        {\r\n            \"id\": \"8\",\r\n            \"air_t\": {\r\n                \"flag\": false,\r\n                \"air_t\": \"25.46\"\r\n            },\r\n            \"air_wet\": {\r\n                \"flag\": false,\r\n                \"air_wet\": \"12.59\"\r\n            },\r\n            \"co2\": {\r\n                \"flag\": false,\r\n                \"co2\": \"274.00\"\r\n            },\r\n            \"sun\": {\r\n                \"flag\": false,\r\n                \"sun\": \"0.96\"\r\n            },\r\n            \"floor_t1\": {\r\n                \"flag\": false,\r\n                \"floor_t1\": \"16.88\"\r\n            },\r\n            \"floor_t2\": {\r\n                \"flag\": false,\r\n                \"floor_t2\": \"16.06\"\r\n            },\r\n            \"floor_t3\": {\r\n                \"flag\": false,\r\n                \"floor_t3\": \"16.06\"\r\n            },\r\n            \"floor_t4\": {\r\n                \"flag\": false,\r\n                \"floor_t4\": \"15.69\"\r\n            },\r\n            \"floor_wet1\": {\r\n                \"flag\": false,\r\n                \"floor_wet1\": \"23.30\"\r\n            },\r\n            \"floor_wet2\": {\r\n                \"flag\": false,\r\n                \"floor_wet2\": \"20.56\"\r\n            },\r\n            \"floor_wet3\": {\r\n                \"flag\": false,\r\n                \"floor_wet3\": \"24.08\"\r\n            },\r\n            \"floor_wet4\": {\r\n                \"flag\": false,\r\n                \"floor_wet4\": \"23.20\"\r\n            },\r\n            \"collect_time\": \"1555669268\",\r\n            \"block_name\": \"一号大棚\"\r\n        }\r\n    ],\r\n    \"p\": 1,\r\n    \"total\": 3,\r\n    \"pages\": 1\r\n}', '{\r\n	\"block_id\":\"10041\",\r\n	\"limit\":10,\r\n	\"p\":1\r\n}', '');
INSERT INTO `xm_api` VALUES (37, 'environment/setting', '环境-报警设置', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '环境-添加报警设置', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"block_id\":\"10041\",\r\n	\"type_id\":\"floor_t\",\r\n	\"high\":\"30,25,20,15\",\r\n	\"high_content\":\"温度过高，请开启通风口，通风口先小后大，逐步进行\",\r\n	\"low\":\"-10,-12,-15,-20\",\r\n	\"low_content\":\"温度过低，注意保暖\"\r\n}', '');
INSERT INTO `xm_api` VALUES (38, 'environment/settingList', '环境-报警设置列表', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '根据地块ID查询报警列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"air_wet\": {\r\n            \"high\": \"20.00\",\r\n            \"high_content\": \"过于干燥，尽快进行水分补给\",\r\n            \"low\": \"-\",\r\n            \"low_content\": \"-\",\r\n            \"flag\": false\r\n        },\r\n        \"sun\": {\r\n            \"high\": \"12.00\",\r\n            \"high_content\": \"光照时间过长，请减少光照时间或者降低光照强度\",\r\n            \"low\": \"12.00\",\r\n            \"low_content\": \"光照时间过短，请增加光照时间或者光照强度\",\r\n            \"flag\": true\r\n        },\r\n        \"co2\": {\r\n            \"high\": \"350.00\",\r\n            \"high_content\": \"二氧化碳浓度过高，请注意\",\r\n            \"low\": \"350.00\",\r\n            \"low_content\": \"二氧化碳浓度过低，请增施二氧化碳\",\r\n            \"flag\": true\r\n        },\r\n        \"air_t\": {\r\n            \"high\": \"45.00\",\r\n            \"high_content\": \"温度过高，请开启通风口，通风口先小后大，逐步进行\",\r\n            \"low\": \"-10.00\",\r\n            \"low_content\": \"温度过低，注意保暖\",\r\n            \"flag\": true\r\n        },\r\n        \"floor_t\": {\r\n            \"high\": \"30.00,25.00,20.00,15.00\",\r\n            \"high_content\": \"温度过高，请开启通风口，通风口先小后大，逐步进行\",\r\n            \"low\": \"-10.00,-12.00,-15.00,-20.00\",\r\n            \"low_content\": \"温度过低，注意保暖\",\r\n            \"flag\": true\r\n        },\r\n        \"floor_wet\": {\r\n            \"high\": \"-\",\r\n            \"high_content\": \"-\",\r\n            \"low\": \"-\",\r\n            \"low_content\": \"-\",\r\n            \"flag\": false\r\n        }\r\n    }\r\n}', '{\r\n	\"block_id\":\"10041\"\r\n}', '');
INSERT INTO `xm_api` VALUES (39, 'weather/history_wet', '历史天气湿度折线图数据', 8, 'facility', NULL, 0, 1, 1, 2, 2, 50, '历史天气湿度折线图数据', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"wet\": [\r\n            77.59,\r\n            63.03,\r\n            47.53,\r\n            55.6,\r\n            39.03,\r\n            45.39,\r\n            40.33,\r\n            40.62,\r\n            32.05\r\n        ],\r\n        \"date\": [\r\n            \"2018-08\",\r\n            \"2018-09\",\r\n            \"2018-10\",\r\n            \"2018-11\",\r\n            \"2018-12\",\r\n            \"2019-01\",\r\n            \"2019-02\",\r\n            \"2019-03\",\r\n            \"2019-04\"\r\n        ],\r\n        \"max\": 77.59\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/weather/history_wet?project_id=37081&context=1', '');
INSERT INTO `xm_api` VALUES (40, 'environment/chart_soil_temp', '土壤温度-24小时折线图', 8, 'facility', NULL, 1, 1, 1, 1, 2, 50, '土壤温度-24小时折线图', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datetime\": [\r\n            \"10\",\r\n            \"11\",\r\n            \"12\",\r\n            \"13\",\r\n            \"14\",\r\n            \"16\",\r\n            \"15\",\r\n            \"17\",\r\n            \"18\",\r\n            \"20\",\r\n            \"21\",\r\n            \"22\",\r\n            \"23\",\r\n            \"00\",\r\n            \"01\",\r\n            \"02\",\r\n            \"03\",\r\n            \"04\",\r\n            \"05\",\r\n            \"06\",\r\n            \"07\",\r\n            \"08\",\r\n            \"09\"\r\n        ],\r\n        \"floor_t_10\": [\r\n            12.56,\r\n            12.81,\r\n            13.25,\r\n            15,\r\n            16.94,\r\n            18.94,\r\n            18.31,\r\n            18.63,\r\n            17.31,\r\n            16.56,\r\n            15.94,\r\n            15.5,\r\n            15.13,\r\n            14.81,\r\n            14.5,\r\n            14.25,\r\n            14,\r\n            13.75,\r\n            13.56,\r\n            13.38,\r\n            13.31,\r\n            13.19,\r\n            13.38\r\n        ],\r\n        \"floor_t_20\": [\r\n            13.25,\r\n            13.31,\r\n            13.38,\r\n            13.63,\r\n            14.13,\r\n            15.44,\r\n            14.75,\r\n            15.94,\r\n            16.31,\r\n            16.25,\r\n            16.13,\r\n            15.94,\r\n            15.75,\r\n            15.56,\r\n            15.38,\r\n            15.19,\r\n            15,\r\n            14.88,\r\n            14.69,\r\n            14.56,\r\n            14.44,\r\n            14.31,\r\n            14.25\r\n        ],\r\n        \"floor_t_30\": [\r\n            15.13,\r\n            15.06,\r\n            15,\r\n            15.06,\r\n            15.06,\r\n            15.38,\r\n            15.19,\r\n            15.56,\r\n            16,\r\n            16.13,\r\n            16.25,\r\n            16.25,\r\n            16.25,\r\n            16.25,\r\n            16.19,\r\n            16.13,\r\n            16.06,\r\n            16,\r\n            15.94,\r\n            15.81,\r\n            15.75,\r\n            15.69,\r\n            15.63\r\n        ],\r\n        \"floor_t_40\": [\r\n            15.81,\r\n            15.75,\r\n            15.69,\r\n            15.56,\r\n            15.56,\r\n            15.5,\r\n            15.56,\r\n            15.56,\r\n            15.69,\r\n            15.75,\r\n            15.88,\r\n            15.88,\r\n            15.94,\r\n            16,\r\n            16,\r\n            16,\r\n            16,\r\n            16,\r\n            15.94,\r\n            15.94,\r\n            15.88,\r\n            15.88,\r\n            15.81\r\n        ],\r\n        \"floor_t_10_max\": 18.94,\r\n        \"floor_t_20_max\": 16.31,\r\n        \"floor_t_30_max\": 16.25,\r\n        \"floor_t_40_max\": 16\r\n    }\r\n}', '{\r\n	\"block_id\":10041\r\n}', '');
INSERT INTO `xm_api` VALUES (41, 'environment/chart_soil_wet', '土壤湿度--24小时折线图', 8, 'facility', NULL, 0, 1, 1, 1, 2, 50, '土壤湿度--24小时折线图', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datetime\": [\r\n            \"10\",\r\n            \"11\",\r\n            \"12\",\r\n            \"13\",\r\n            \"14\",\r\n            \"16\",\r\n            \"15\",\r\n            \"17\",\r\n            \"18\",\r\n            \"20\",\r\n            \"21\",\r\n            \"22\",\r\n            \"23\",\r\n            \"00\",\r\n            \"01\",\r\n            \"02\",\r\n            \"03\",\r\n            \"04\",\r\n            \"05\",\r\n            \"06\",\r\n            \"07\",\r\n            \"08\",\r\n            \"09\"\r\n        ],\r\n        \"floor_wet_10\": [\r\n            28.77,\r\n            28.64,\r\n            28.6,\r\n            28.77,\r\n            28.72,\r\n            28.57,\r\n            28.59,\r\n            28.45,\r\n            28.06,\r\n            28.05,\r\n            28.03,\r\n            28.01,\r\n            28.02,\r\n            28.04,\r\n            28.13,\r\n            28.37,\r\n            28.52,\r\n            28.49,\r\n            28.5,\r\n            28.46,\r\n            28.43,\r\n            28.4,\r\n            28.41\r\n        ],\r\n        \"floor_wet_20\": [\r\n            25,\r\n            24.89,\r\n            24.78,\r\n            24.71,\r\n            24.61,\r\n            24.38,\r\n            24.49,\r\n            24.29,\r\n            24.1,\r\n            24.03,\r\n            23.96,\r\n            23.92,\r\n            23.87,\r\n            23.82,\r\n            23.82,\r\n            23.87,\r\n            23.95,\r\n            23.98,\r\n            24.02,\r\n            23.99,\r\n            23.96,\r\n            23.92,\r\n            23.89\r\n        ],\r\n        \"floor_wet_30\": [\r\n            29.29,\r\n            28.85,\r\n            28.53,\r\n            28.27,\r\n            28.02,\r\n            27.56,\r\n            27.76,\r\n            27.41,\r\n            27.2,\r\n            27.11,\r\n            27.03,\r\n            26.96,\r\n            26.9,\r\n            26.84,\r\n            26.81,\r\n            26.81,\r\n            26.87,\r\n            26.94,\r\n            26.98,\r\n            26.99,\r\n            26.97,\r\n            26.93,\r\n            26.89\r\n        ],\r\n        \"floor_wet_40\": [\r\n            27.92,\r\n            27.67,\r\n            27.43,\r\n            27.14,\r\n            26.88,\r\n            26.4,\r\n            26.64,\r\n            26.2,\r\n            25.93,\r\n            25.83,\r\n            25.73,\r\n            25.66,\r\n            25.6,\r\n            25.53,\r\n            25.48,\r\n            25.46,\r\n            25.49,\r\n            25.55,\r\n            25.6,\r\n            25.62,\r\n            25.62,\r\n            25.58,\r\n            25.56\r\n        ],\r\n        \"floor_wet_10_max\": 28.77,\r\n        \"floor_wet_20_max\": 25,\r\n        \"floor_wet_30_max\": 29.29,\r\n        \"floor_wet_40_max\": 27.92\r\n    }\r\n}', '{\r\n	\"block_id\":10041\r\n}', '');
INSERT INTO `xm_api` VALUES (42, 'plan/get_plant_info', '种植计划-作物种植信息列表', 5, 'facility', NULL, 0, 1, 1, 1, 2, 50, '种植计划-作物种植信息列表（暂不使用）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"plantId\": \"1062860174408028160\",\r\n        \"cropId\": \"19\",\r\n        \"plantarea\": \"75.34亩\",\r\n        \"planttime\": \"2018-12-10\",\r\n        \"starttime\": \"2018-10-21\",\r\n        \"endtime\": \"2019-06-05\",\r\n        \"block_name\": \"一号大棚\",\r\n        \"work_cycle\": \"三叶期\",\r\n        \"crop_name\": \"小麦\",\r\n        \"varietyname\": \"郑麦379\",\r\n        \"variety_pic\": null,\r\n        \"total_days\": \"227天\",\r\n        \"block_id\": \"10041\"\r\n    }\r\n}', '{\r\n	\"cropId\":19,\r\n	\"plan_type\":2,\r\n	\"block_id\":10042\r\n}', '');
INSERT INTO `xm_api` VALUES (43, 'project/get_project_info', '基地-点击获取基地信息', 12, 'facility', NULL, 0, 1, 1, 2, 2, 50, '基地-点击获取基地信息', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [],\r\n    \"id\": \"37081\",\r\n    \"name\": \"测试基地1\",\r\n    \"root_uid\": \"1\",\r\n    \"lon\": \"119.2719713914\",\r\n    \"lat\": \"41.8789635484\",\r\n    \"province_id\": \"150000\",\r\n    \"city_id\": \"150400\",\r\n    \"area_id\": \"150428\",\r\n    \"project_area\": \"9270.81 亩\",\r\n    \"plant_area\": \"234.00 亩\",\r\n    \"variety_num\": 2,\r\n    \"block_num\": 2,\r\n    \"weather\": {\r\n        \"wet\": \"8%\",\r\n        \"air_press\": \"947.3hPa\",\r\n        \"rain\": \"0 mm\",\r\n        \"t\": \"25.1℃\",\r\n        \"t_max\": \"25.3℃\",\r\n        \"t_min\": \"2.4℃\",\r\n        \"t_diff\": \"22.9℃\",\r\n        \"run_time\": \"15小时\"\r\n    }\r\n}', 'http://self-apifacility.klagri.com.cn/facility/project/get_project_info?id=37081', '');
INSERT INTO `xm_api` VALUES (44, 'project/detail', '基地-详情，包含地块列表', 12, 'facility', NULL, 0, 1, 1, 2, 2, 50, 'V1.7已弃用', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"id\": \"37081\",\r\n        \"name\": \"测试基地1\",\r\n        \"address\": \"中国内蒙古自治区赤峰市喀喇沁旗天平线\",\r\n        \"linkman\": \"刘德金\",\r\n        \"phone\": \"15315559658\",\r\n        \"project_area\": \"9270.81 亩\",\r\n        \"plant_area\": \"234.00 亩\",\r\n        \"img_url\": \"http://pic.klagri.com.cn/images/upload/project/3700001.jpg\",\r\n        \"blocks\": [\r\n            {\r\n                \"id\": \"10041\",\r\n                \"name\": \"一号大棚\",\r\n                \"type\": \"大棚\",\r\n                \"area\": \"35.25 亩\",\r\n                \"crop_type_num\": 1\r\n            },\r\n            {\r\n                \"id\": \"10042\",\r\n                \"name\": \"一号大田\",\r\n                \"type\": \"大田\",\r\n                \"area\": \"22.13 亩\",\r\n                \"crop_type_num\": 1\r\n            }\r\n        ],\r\n        \"p\": 1,\r\n        \"pages\": 1,\r\n        \"total\": 2\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/project/detail?project_id=37081&limit=20&p=1', '');
INSERT INTO `xm_api` VALUES (45, 'plan/list_by_block', '根据地块ID筛选种植计划', 5, 'facility', NULL, 0, 1, 1, 2, 2, 50, '根据地块ID筛选种植计划', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1062860174408028160\",\r\n            \"block_id\": \"10041\",\r\n            \"pp_area\": \"75.34亩\",\r\n            \"set_start_time\": \"2018-10-21\",\r\n            \"set_end_time\": \"2019-06-05\",\r\n            \"block_name\": \"一号大棚\",\r\n            \"pp_crop_name\": \"小麦\",\r\n            \"pp_variety_name\": \"郑麦379\",\r\n            \"pp_variety_pic\": \"http://demo-zhny.klagri.com.cn:8080/scgl/userfiles/fileupload/201812/1071970329383763968.png\",\r\n            \"work_cycle\": \"--\",\r\n            \"total_days\": \"227天\",\r\n            \"finish_days\": \"200天\",\r\n            \"finish_percent\": \"88%\",\r\n            \"remain_days\": \"28天\",\r\n            \"plant_start_time\": \"20181210\"\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/plan/list_by_block?block_id=10041', '');
INSERT INTO `xm_api` VALUES (46, 'deviceicon/index', '设备图标-列表', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '根据地块ID查询地块图标', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"name\": \"传感器001\",\r\n            \"lat\": \"41.8708766766\",\r\n            \"lon\": \"119.2721574116\",\r\n            \"block_id\": \"10041\"\r\n        }\r\n    ]\r\n}', '{\"block_id\":\"10041\"}', '');
INSERT INTO `xm_api` VALUES (47, 'deviceicon/add', '设备图标-添加', 7, 'facility', NULL, 0, 1, 1, 1, 2, 50, '添加设备图标', NULL, '{\"code\":200,\"msg\":\"\\u6210\\u529f\",\"data\":[]}', '{\r\n	\"block_id\":10041,\r\n	\"type\":1,\r\n	\"lat\":41.8708766766,\r\n	\"lon\":119.2721574116,\r\n	\"name\":\"测试001\"\r\n}', '');
INSERT INTO `xm_api` VALUES (48, 'task/record', '农事记录-添加', 5, 'facility', NULL, 0, 1, 1, 1, 2, 50, '农事记录-添加', NULL, '{\"code\":200,\"msg\":\"\\u6210\\u529f\",\"data\":\"5\"}', '{\r\n	\"block_id\":\"10041\",\r\n	\"task_type\":\"1\",\r\n	\"task_time\":\"1558509443\",\r\n	\"remark\":\"postman测试001\"\r\n}', '');
INSERT INTO `xm_api` VALUES (49, 'weather/rain', '2小时短临降水', 13, 'cloud-weather', NULL, 0, 1, 1, 2, 1, 50, '2小时短临降水', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"查询成功\",\r\n    \"data\": {\r\n        \"rainfall\": [],\r\n        \"weather_msg\": \"近2小时内不会下雨的，放心出门吧\"\r\n    }\r\n}', 'https://apiwx.klagri.com.cn/weather/v1/weather/rain?site=manager&ctl=login&act=index&longitude=108.21&latitude=40.18', '');
INSERT INTO `xm_api` VALUES (50, 'weather/today', '获取即时天气', 13, 'cloud-weather', NULL, 0, 1, 1, 2, 1, 50, '获取即时天气', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"查询成功\",\r\n    \"data\": {\r\n        \"calendar\": \"五月初三\",\r\n        \"rainfall\": \"0 mm\",\r\n        \"weather_msg\": \"近2小时内不会下雨的，放心出门吧\",\r\n        \"wind_direction\": \"东北\",\r\n        \"wind_level\": \"2级\",\r\n        \"t\": \"29.2℃\",\r\n        \"t_min\": \"12.9℃\",\r\n        \"t_max\": \"29.9℃\",\r\n        \"air_press\": \"876.7hpa\",\r\n        \"wet\": \"11%\",\r\n        \"wind_speed\": 2.1,\r\n        \"evp\": \"未监测\",\r\n        \"staCode\": \"53522\",\r\n        \"staName\": \"伊克乌素\",\r\n        \"weather\": \"晴\",\r\n        \"back_pic\": \"/images/index/sunny.png\"\r\n    }\r\n}', 'https://apiwx.klagri.com.cn/weather/v1/weather/today?longitude=108.12&latitude=40.21', '');
INSERT INTO `xm_api` VALUES (51, 'weather/future', '获取未来几天的天气情况', 13, 'cloud-weather', NULL, 0, 1, 1, 2, 1, 50, '获取未来几天的天气情况', NULL, '{\r\n    \"code\": 200,\r\n    \"data\": {\r\n        \"weather\": [\r\n            {\r\n                \"class\": \"two-day-slim1\",\r\n                \"pic_am\": \"10\",\r\n                \"pic_pm\": \"01\",\r\n                \"weather_am\": \"暴雨\",\r\n                \"weather_pm\": \"多云\",\r\n                \"t_max\": 25,\r\n                \"t_min\": 18,\r\n                \"wind_am\": \"北风\",\r\n                \"wind_pm\": \"北风\",\r\n                \"level_am\": \"4-5级\",\r\n                \"level_pm\": \"3-4级\",\r\n                \"date\": \"06/06\",\r\n                \"week\": \"明天\",\r\n                \"datatime\": \"20190606\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim2\",\r\n                \"pic_am\": \"01\",\r\n                \"pic_pm\": \"01\",\r\n                \"weather_am\": \"多云\",\r\n                \"weather_pm\": \"多云\",\r\n                \"t_max\": 28,\r\n                \"t_min\": 20,\r\n                \"wind_am\": \"静风\",\r\n                \"wind_pm\": \"静风\",\r\n                \"level_am\": \"<3级\",\r\n                \"level_pm\": \"<3级\",\r\n                \"date\": \"06/07\",\r\n                \"week\": \"星期五\",\r\n                \"datatime\": \"20190607\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim3\",\r\n                \"pic_am\": \"01\",\r\n                \"pic_pm\": \"01\",\r\n                \"weather_am\": \"多云\",\r\n                \"weather_pm\": \"多云\",\r\n                \"t_max\": 31,\r\n                \"t_min\": 20,\r\n                \"wind_am\": \"静风\",\r\n                \"wind_pm\": \"静风\",\r\n                \"level_am\": \"<3级\",\r\n                \"level_pm\": \"<3级\",\r\n                \"date\": \"06/08\",\r\n                \"week\": \"星期六\",\r\n                \"datatime\": \"20190608\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim4\",\r\n                \"pic_am\": \"00\",\r\n                \"pic_pm\": \"00\",\r\n                \"weather_am\": \"晴\",\r\n                \"weather_pm\": \"晴\",\r\n                \"t_max\": 32,\r\n                \"t_min\": 21,\r\n                \"wind_am\": \"静风\",\r\n                \"wind_pm\": \"静风\",\r\n                \"level_am\": \"<3级\",\r\n                \"level_pm\": \"<3级\",\r\n                \"date\": \"06/09\",\r\n                \"week\": \"星期日\",\r\n                \"datatime\": \"20190609\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim5\",\r\n                \"pic_am\": \"01\",\r\n                \"pic_pm\": \"02\",\r\n                \"weather_am\": \"多云\",\r\n                \"weather_pm\": \"阴\",\r\n                \"t_max\": 32,\r\n                \"t_min\": 22,\r\n                \"wind_am\": \"静风\",\r\n                \"wind_pm\": \"静风\",\r\n                \"level_am\": \"<3级\",\r\n                \"level_pm\": \"<3级\",\r\n                \"date\": \"06/10\",\r\n                \"week\": \"星期一\",\r\n                \"datatime\": \"20190610\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim6\",\r\n                \"pic_am\": \"02\",\r\n                \"pic_pm\": \"00\",\r\n                \"weather_am\": \"阴\",\r\n                \"weather_pm\": \"晴\",\r\n                \"t_max\": 31.4,\r\n                \"t_min\": 21.5,\r\n                \"wind_am\": \"静风\",\r\n                \"wind_pm\": \"静风\",\r\n                \"level_am\": \"<3级\",\r\n                \"level_pm\": \"<3级\",\r\n                \"date\": \"06/11\",\r\n                \"week\": \"星期二\",\r\n                \"datatime\": \"20190611\"\r\n            }\r\n        ],\r\n        \"high\": [\r\n            25,\r\n            28,\r\n            31,\r\n            32,\r\n            32,\r\n            31.4\r\n        ],\r\n        \"low\": [\r\n            18,\r\n            20,\r\n            20,\r\n            21,\r\n            22,\r\n            21.5\r\n        ],\r\n        \"two_day\": [\r\n            {\r\n                \"class\": \"two-day-slim0\",\r\n                \"pic_am\": \"01\",\r\n                \"pic_pm\": \"08\",\r\n                \"weather_am\": \"多云\",\r\n                \"weather_pm\": \"中雨\",\r\n                \"t_max\": 35,\r\n                \"t_min\": 20,\r\n                \"wind_am\": \"东南风\",\r\n                \"wind_pm\": \"东风\",\r\n                \"level_am\": \"3-4级\",\r\n                \"level_pm\": \"4-5级\",\r\n                \"date\": \"06/05\",\r\n                \"week\": \"今天\",\r\n                \"datatime\": \"20190605\"\r\n            },\r\n            {\r\n                \"class\": \"two-day-slim1\",\r\n                \"pic_am\": \"10\",\r\n                \"pic_pm\": \"01\",\r\n                \"weather_am\": \"暴雨\",\r\n                \"weather_pm\": \"多云\",\r\n                \"t_max\": 25,\r\n                \"t_min\": 18,\r\n                \"wind_am\": \"北风\",\r\n                \"wind_pm\": \"北风\",\r\n                \"level_am\": \"4-5级\",\r\n                \"level_pm\": \"3-4级\",\r\n                \"date\": \"06/06\",\r\n                \"week\": \"明天\",\r\n                \"datatime\": \"20190606\"\r\n            }\r\n        ]\r\n    }\r\n}', 'https://apiwx.klagri.com.cn/weather/v1/weather/future?area=%E6%9E%A3%E5%BA%84', '');
INSERT INTO `xm_api` VALUES (52, 'weather/longitude', '根据城市名获取经纬度和地区编码', 14, 'cloud-weather', NULL, 0, 1, 1, 2, 1, 50, '根据城市名获取经纬度和地区编码', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"查询成功\",\r\n    \"data\": {\r\n        \"areaCode\": \"101121404\",\r\n        \"lon\": \"117.7347\",\r\n        \"lat\": \"34.5648\"\r\n    }\r\n}', 'https://apiwx.klagri.com.cn/weather/v1/weather/longitude?cityName=%E5%8F%B0%E5%84%BF%E5%BA%84', '');
INSERT INTO `xm_api` VALUES (53, 'weather/cityName', '根据经纬度获取城市名', 14, 'cloud-weather', NULL, 0, 1, 1, 2, 1, 50, '根据经纬度获取城市名', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"查询成功\",\r\n    \"data\": {\r\n        \"cityName\": \"朱日和\",\r\n        \"staCode\": \"53276\"\r\n    }\r\n}', 'https://apiwx.klagri.com.cn/weather/v1/weather/cityName?longitude=112.45&latitude=42.12', '');
INSERT INTO `xm_api` VALUES (54, 'menu/menus', '菜单-列表', 10, 'facility', NULL, 1, 1, 1, 2, 2, 50, '根据用户所属的不同角色获取不同的菜单列表', NULL, '{\r\n  \"code\": 200,\r\n  \"msg\": \"成功\",\r\n  \"data\": [\r\n    {\r\n      \"id\": \"1\",\r\n      \"name\": \"基地管理\",\r\n      \"parent_id\": \"0\",\r\n      \"url\": \"/\",\r\n      \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_jdgl_1.png\",\r\n      \"child\": [\r\n        {\r\n          \"id\": \"102\",\r\n          \"name\": \"基地地图\",\r\n          \"parent_id\": \"1\",\r\n          \"url\": \"/map/maps\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_jddt_1.png\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"name\": \"种植管理\",\r\n      \"parent_id\": \"0\",\r\n      \"url\": \"/massif\",\r\n      \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_zzgo_1.png\",\r\n      \"child\": [\r\n        {\r\n          \"id\": \"106\",\r\n          \"name\": \"地块详情\",\r\n          \"parent_id\": \"2\",\r\n          \"url\": \"/Monitor/environment\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_hjjk_1.png\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\": \"3\",\r\n      \"name\": \"环境监控\",\r\n      \"parent_id\": \"0\",\r\n      \"url\": \"/monitor\",\r\n      \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_wlwjk_1.png\",\r\n      \"child\": [\r\n        {\r\n          \"id\": \"104\",\r\n          \"name\": \"告警设置\",\r\n          \"parent_id\": \"3\",\r\n          \"url\": \"/massif/alarm\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_ybjb_1.png\"\r\n        },\r\n        {\r\n          \"id\": \"105\",\r\n          \"name\": \"气象监控\",\r\n          \"parent_id\": \"3\",\r\n          \"url\": \"/Monitor/weather\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_qxjk_1.png\"\r\n        },\r\n        {\r\n          \"id\": \"108\",\r\n          \"name\": \"温室数据\",\r\n          \"parent_id\": \"3\",\r\n          \"url\": \"/greenhouse/greenhouse\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/greenhouse.png\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\": \"4\",\r\n      \"name\": \"基础设置\",\r\n      \"parent_id\": \"0\",\r\n      \"url\": \"/user\",\r\n      \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_jcsz_1.png\",\r\n      \"child\": [\r\n        {\r\n          \"id\": \"107\",\r\n          \"name\": \"用户管理\",\r\n          \"parent_id\": \"4\",\r\n          \"url\": \"/user/userManagement\",\r\n          \"icon\": \"http://pic.klagri.com.cn//facility/picture/2019-04-16/btn_left_yhgl_1.png\"\r\n        }\r\n      ]\r\n    }\r\n  ]\r\n}', 'http://apifacility.klagri.com.cn/facility/menu/menus?root_uid=12&uid=12', '');
INSERT INTO `xm_api` VALUES (55, 'map/init', '地图-初始化', 15, 'facility', NULL, 1, 1, 1, 2, 2, 50, '地图-初始化', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"37081\",\r\n            \"name\": \"测试基地1\",\r\n            \"lat\": \"41.8789635484\",\r\n            \"lon\": \"119.2719713914\",\r\n            \"edge_json\": \"[{\\\"lat\\\":41.8852899107765,\\\"lng\\\":119.27098433851575},{\\\"lat\\\":41.88311729128639,\\\"lng\\\":119.27098433851575},{\\\"lat\\\":41.88311729128639,\\\"lng\\\":119.2660061585841},{\\\"lat\\\":41.88452311233357,\\\"lng\\\":119.26557700514172},{\\\"lat\\\":41.87404261129594,\\\"lng\\\":119.25493399977063},{\\\"lat\\\":41.86810171476746,\\\"lng\\\":119.25587295397747},{\\\"lat\\\":41.85774637493476,\\\"lng\\\":119.25518630846966},{\\\"lat\\\":41.85729888418049,\\\"lng\\\":119.26582931384075},{\\\"lat\\\":41.85921667965257,\\\"lng\\\":119.26617263659466},{\\\"lat\\\":41.85953630663981,\\\"lng\\\":119.2861711870097},{\\\"lat\\\":41.88548468625182,\\\"lng\\\":119.28016303881634}]\",\r\n            \"child\": [\r\n                {\r\n                    \"project_id\": \"37081\",\r\n                    \"id\": \"10041\",\r\n                    \"name\": \"一号大棚\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.87256440331159,\\\"lng\\\":119.27160755876741},{\\\"lat\\\":41.872588370386815,\\\"lng\\\":119.2723800349637},{\\\"lat\\\":41.86920093463524,\\\"lng\\\":119.27268044237337},{\\\"lat\\\":41.869152997935565,\\\"lng\\\":119.27196161035738}]\",\r\n                    \"point\": [\r\n                        41.870876676567,\r\n                        119.27215741162\r\n                    ],\r\n                    \"device_point\": {\r\n                        \"sensor\": [\r\n                            {\r\n                                \"id\": \"1\",\r\n                                \"lat\": \"41.8708766766\",\r\n                                \"lon\": \"119.2721574116\"\r\n                            }\r\n                        ],\r\n                        \"sqy\": [],\r\n                        \"video\": [],\r\n                        \"qxz\": [],\r\n                        \"e_valve\": [],\r\n                        \"gateway\": []\r\n                    }\r\n                },\r\n                {\r\n                    \"project_id\": \"37081\",\r\n                    \"id\": \"10042\",\r\n                    \"name\": \"一号大田\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.87647117306495,\\\"lng\\\":119.26634948130481},{\\\"lat\\\":41.876630943630396,\\\"lng\\\":119.27089850779407},{\\\"lat\\\":41.87629542498164,\\\"lng\\\":119.27089850779407},{\\\"lat\\\":41.87610369924866,\\\"lng\\\":119.26634948130481}]\",\r\n                    \"point\": [\r\n                        41.876375310231,\r\n                        119.26862399455\r\n                    ],\r\n                    \"device_point\": {\r\n                        \"sensor\": [\r\n                            {\r\n                                \"id\": \"45\",\r\n                                \"lat\": \"41.8763758280\",\r\n                                \"lon\": \"119.2664989023\"\r\n                            }\r\n                        ],\r\n                        \"sqy\": [],\r\n                        \"video\": [],\r\n                        \"qxz\": [],\r\n                        \"e_valve\": [],\r\n                        \"gateway\": []\r\n                    }\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"id\": \"37082\",\r\n            \"name\": \"测试基地2\",\r\n            \"lat\": \"41.6431045210\",\r\n            \"lon\": \"119.3198064786\",\r\n            \"edge_json\": \"[{\\\"lat\\\":41.65182712503359,\\\"lng\\\":119.33053531460791},{\\\"lat\\\":41.64900523531854,\\\"lng\\\":119.32349719815284},{\\\"lat\\\":41.65015965968818,\\\"lng\\\":119.32263889126807},{\\\"lat\\\":41.64817147151931,\\\"lng\\\":119.3185190182212},{\\\"lat\\\":41.64496458711451,\\\"lng\\\":119.31233920865088},{\\\"lat\\\":41.64105197198337,\\\"lng\\\":119.30573024563819},{\\\"lat\\\":41.63848619374588,\\\"lng\\\":119.30761852078467},{\\\"lat\\\":41.63553542248479,\\\"lng\\\":119.30985011868506},{\\\"lat\\\":41.638293756259976,\\\"lng\\\":119.31680240445166},{\\\"lat\\\":41.63258451612654,\\\"lng\\\":119.32152309231788},{\\\"lat\\\":41.63373923470352,\\\"lng\\\":119.32590045743018},{\\\"lat\\\":41.63579201665316,\\\"lng\\\":119.32924785428077},{\\\"lat\\\":41.639255937943354,\\\"lng\\\":119.33465518765479},{\\\"lat\\\":41.643040379853865,\\\"lng\\\":119.32933368496924},{\\\"lat\\\":41.64374592918821,\\\"lng\\\":119.32924785428077},{\\\"lat\\\":41.64759424410651,\\\"lng\\\":119.33577098660498}]\",\r\n            \"child\": [\r\n                {\r\n                    \"project_id\": \"37082\",\r\n                    \"id\": \"10043\",\r\n                    \"name\": \"二号大田\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.64150097265045,\\\"lng\\\":119.3158153515858},{\\\"lat\\\":41.63906350273424,\\\"lng\\\":119.317832372765},{\\\"lat\\\":41.63951251727774,\\\"lng\\\":119.31856193361705},{\\\"lat\\\":41.64188582789365,\\\"lng\\\":119.31650199709361}]\",\r\n                    \"point\": [\r\n                        41.640490705139,\r\n                        119.31717791377\r\n                    ],\r\n                    \"device_point\": {\r\n                        \"sensor\": [\r\n                            {\r\n                                \"id\": \"33\",\r\n                                \"lat\": \"41.6412925084\",\r\n                                \"lon\": \"119.3165019971\"\r\n                            },\r\n                            {\r\n                                \"id\": \"61\",\r\n                                \"lat\": \"41.6415490797\",\r\n                                \"lon\": \"119.3164161664\"\r\n                            }\r\n                        ],\r\n                        \"sqy\": [],\r\n                        \"video\": [\r\n                            {\r\n                                \"id\": \"35\",\r\n                                \"lat\": \"41.6414528656\",\r\n                                \"lon\": \"119.3162445050\"\r\n                            },\r\n                            {\r\n                                \"id\": \"53\",\r\n                                \"lat\": \"41.6400211822\",\r\n                                \"lon\": \"119.3176417577\"\r\n                            }\r\n                        ],\r\n                        \"qxz\": [],\r\n                        \"e_valve\": [\r\n                            {\r\n                                \"id\": \"108\",\r\n                                \"lat\": \"41.6407128577\",\r\n                                \"lon\": \"119.3169851814\"\r\n                            }\r\n                        ],\r\n                        \"gateway\": []\r\n                    }\r\n                },\r\n                {\r\n                    \"project_id\": \"37082\",\r\n                    \"id\": \"10044\",\r\n                    \"name\": \"二号大棚\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.6393842277274,\\\"lng\\\":119.31946315584605},{\\\"lat\\\":41.63643349758318,\\\"lng\\\":119.32208099184459},{\\\"lat\\\":41.63691460410707,\\\"lng\\\":119.32289638338511},{\\\"lat\\\":41.63980116783228,\\\"lng\\\":119.32023563204234}]\",\r\n                    \"point\": [\r\n                        41.638133374312,\r\n                        119.32116904078\r\n                    ],\r\n                    \"device_point\": {\r\n                        \"sensor\": [],\r\n                        \"sqy\": [\r\n                            {\r\n                                \"id\": \"41\",\r\n                                \"lat\": \"41.6389152626\",\r\n                                \"lon\": \"119.3203481568\"\r\n                            },\r\n                            {\r\n                                \"id\": \"96\",\r\n                                \"lat\": \"41.6391338211\",\r\n                                \"lon\": \"119.3201692338\"\r\n                            },\r\n                            {\r\n                                \"id\": \"129\",\r\n                                \"lat\": \"41.6370837392\",\r\n                                \"lon\": \"119.3218920399\"\r\n                            }\r\n                        ],\r\n                        \"video\": [\r\n                            {\r\n                                \"id\": \"55\",\r\n                                \"lat\": \"41.6385908771\",\r\n                                \"lon\": \"119.3207294573\"\r\n                            }\r\n                        ],\r\n                        \"qxz\": [],\r\n                        \"e_valve\": [\r\n                            {\r\n                                \"id\": \"98\",\r\n                                \"lat\": \"41.6394625638\",\r\n                                \"lon\": \"119.3201477761\"\r\n                            }\r\n                        ],\r\n                        \"gateway\": []\r\n                    }\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"id\": \"37088\",\r\n            \"name\": \"科学种植示范基地\",\r\n            \"lat\": \"41.6021983933\",\r\n            \"lon\": \"119.4662267583\",\r\n            \"edge_json\": \"[{\\\"lat\\\":41.6044126287649,\\\"lng\\\":119.46091963322692},{\\\"lat\\\":41.6073969128246,\\\"lng\\\":119.47272135289245},{\\\"lat\\\":41.59998408191391,\\\"lng\\\":119.47619749577575},{\\\"lat\\\":41.59953479206447,\\\"lng\\\":119.47315050633483},{\\\"lat\\\":41.599663160912044,\\\"lng\\\":119.47121931584411},{\\\"lat\\\":41.5991175915463,\\\"lng\\\":119.46821524174743},{\\\"lat\\\":41.59857201756842,\\\"lng\\\":119.4685156491571},{\\\"lat\\\":41.598668295664346,\\\"lng\\\":119.46950270207458},{\\\"lat\\\":41.5977696945166,\\\"lng\\\":119.47001768620544},{\\\"lat\\\":41.59674270645577,\\\"lng\\\":119.46443869145446}]\",\r\n            \"child\": [\r\n                {\r\n                    \"project_id\": \"37088\",\r\n                    \"id\": \"10048\",\r\n                    \"name\": \"甜菜种植基地\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.60595293050275,\\\"lng\\\":119.46802314892466},{\\\"lat\\\":41.60718834717559,\\\"lng\\\":119.4725507177418},{\\\"lat\\\":41.604300323162256,\\\"lng\\\":119.4740098394459},{\\\"lat\\\":41.603048805944034,\\\"lng\\\":119.46982559338266}]\",\r\n                    \"point\": null,\r\n                    \"device_point\": {\r\n                        \"sensor\": [],\r\n                        \"sqy\": [],\r\n                        \"video\": [],\r\n                        \"qxz\": [],\r\n                        \"e_valve\": [],\r\n                        \"gateway\": []\r\n                    }\r\n                },\r\n                {\r\n                    \"project_id\": \"37088\",\r\n                    \"id\": \"10049\",\r\n                    \"name\": \"辣椒种植基地\",\r\n                    \"edge_json\": \"[{\\\"lat\\\":41.60412381972612,\\\"lng\\\":119.46134878664009},{\\\"lat\\\":41.605664119500474,\\\"lng\\\":119.46761442689887},{\\\"lat\\\":41.6030327518053,\\\"lng\\\":119.46937395601264},{\\\"lat\\\":41.60113938427625,\\\"lng\\\":119.46276499299995}]\",\r\n                    \"point\": null,\r\n                    \"device_point\": {\r\n                        \"sensor\": [],\r\n                        \"sqy\": [],\r\n                        \"video\": [\r\n                            {\r\n                                \"id\": \"143\",\r\n                                \"lat\": \"41.6036681520\",\r\n                                \"lon\": \"119.4631969047\"\r\n                            }\r\n                        ],\r\n                        \"qxz\": [\r\n                            {\r\n                                \"id\": \"145\",\r\n                                \"lat\": \"41.6045409879\",\r\n                                \"lon\": \"119.4661579517\"\r\n                            }\r\n                        ],\r\n                        \"e_valve\": [\r\n                            {\r\n                                \"id\": \"141\",\r\n                                \"lat\": \"41.6505845467\",\r\n                                \"lon\": \"119.3662685650\"\r\n                            }\r\n                        ],\r\n                        \"gateway\": []\r\n                    }\r\n                }\r\n            ]\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/map/init?root_uid=12', '');
INSERT INTO `xm_api` VALUES (56, 'block/block_menu', '地块-菜单', 11, 'facility', NULL, 0, 1, 1, 1, 2, 50, '地块-菜单', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"查询成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"37081\",\r\n            \"label\": \"测试基地1\",\r\n            \"children\": [\r\n                {\r\n                    \"id\": \"10041\",\r\n                    \"label\": \"一号大棚\",\r\n                    \"project_id\": \"37081\"\r\n                },\r\n                {\r\n                    \"id\": \"10042\",\r\n                    \"label\": \"一号大田\",\r\n                    \"project_id\": \"37081\"\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"id\": \"37082\",\r\n            \"label\": \"测试基地2\",\r\n            \"children\": [\r\n                {\r\n                    \"id\": \"10043\",\r\n                    \"label\": \"二号大田\",\r\n                    \"project_id\": \"37082\"\r\n                },\r\n                {\r\n                    \"id\": \"10044\",\r\n                    \"label\": \"二号大棚\",\r\n                    \"project_id\": \"37082\"\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"id\": \"37091\",\r\n            \"label\": \"大友试验田\",\r\n            \"children\": [\r\n                {\r\n                    \"id\": \"10049\",\r\n                    \"label\": \"试验田1号\",\r\n                    \"project_id\": \"37091\"\r\n                },\r\n                {\r\n                    \"id\": \"10050\",\r\n                    \"label\": \"试验田2号\",\r\n                    \"project_id\": \"37091\"\r\n                }\r\n            ]\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/block/block_menu?root_uid=12', '');
INSERT INTO `xm_api` VALUES (57, 'project/selects', '基地-下拉框', 12, 'facility', NULL, 0, 1, 1, 2, 2, 50, '基地-下拉框（用于气象监控）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"37081\",\r\n            \"name\": \"测试基地1\"\r\n        },\r\n        {\r\n            \"id\": \"37082\",\r\n            \"name\": \"测试基地2\"\r\n        },\r\n        {\r\n            \"id\": \"37091\",\r\n            \"name\": \"大友试验田\"\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/project/selects?root_uid=12', '');
INSERT INTO `xm_api` VALUES (58, 'weather/history_rain', '气象-历史降水（折线图）', 8, 'facility', NULL, 0, 1, 1, 2, 2, 50, '气象-历史降水（折线图）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datatime\": [\r\n            \"2019-05-11\",\r\n            \"2019-05-12\",\r\n            \"2019-05-13\",\r\n            \"2019-05-14\",\r\n            \"2019-05-15\",\r\n            \"2019-05-16\",\r\n            \"2019-05-17\",\r\n            \"2019-05-18\",\r\n            \"2019-05-19\",\r\n            \"2019-05-20\",\r\n            \"2019-05-21\",\r\n            \"2019-05-22\",\r\n            \"2019-05-23\",\r\n            \"2019-05-24\",\r\n            \"2019-05-25\",\r\n            \"2019-05-26\",\r\n            \"2019-05-27\",\r\n            \"2019-05-28\",\r\n            \"2019-05-29\"\r\n        ],\r\n        \"rain\": [\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            2.9,\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            1.3,\r\n            0.8,\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            1.1,\r\n            0,\r\n            0\r\n        ],\r\n        \"rain_add\": [\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            2.9,\r\n            2.9,\r\n            2.9,\r\n            2.9,\r\n            2.9,\r\n            4.2,\r\n            5,\r\n            5,\r\n            5,\r\n            5,\r\n            5,\r\n            5,\r\n            6.1,\r\n            6.1,\r\n            6.1\r\n        ],\r\n        \"rain_max\": 3,\r\n        \"rain_add_max\": 7\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/weather/history_rain?root_uid=12&project_id=37081&context=0', '');
INSERT INTO `xm_api` VALUES (59, 'weather/history_t', '气象-历史温度（折线图）', 8, 'facility', NULL, 0, 1, 1, 1, 2, 50, '气象-历史温度（折线图）', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"ranges\": [\r\n            [\r\n                0.4,\r\n                16.1\r\n            ],\r\n            [\r\n                0.4,\r\n                18.6\r\n            ],\r\n            [\r\n                4.4,\r\n                19.3\r\n            ],\r\n            [\r\n                4.4,\r\n                27.5\r\n            ],\r\n            [\r\n                0.6,\r\n                27.5\r\n            ],\r\n            [\r\n                0.6,\r\n                23.7\r\n            ],\r\n            [\r\n                -6,\r\n                24.9\r\n            ],\r\n            [\r\n                -21.3,\r\n                24.9\r\n            ],\r\n            [\r\n                -13.6,\r\n                14.4\r\n            ],\r\n            [\r\n                -12.2,\r\n                19.3\r\n            ],\r\n            [\r\n                9.5,\r\n                23.6\r\n            ],\r\n            [\r\n                7.7,\r\n                28\r\n            ],\r\n            [\r\n                -6,\r\n                36.4\r\n            ],\r\n            [\r\n                -6,\r\n                7\r\n            ],\r\n            [\r\n                -4.2,\r\n                8.1\r\n            ],\r\n            [\r\n                -4.2,\r\n                19.7\r\n            ],\r\n            [\r\n                -0.4,\r\n                20.4\r\n            ],\r\n            [\r\n                22.7,\r\n                26.4\r\n            ],\r\n            [\r\n                24.6,\r\n                29.1\r\n            ]\r\n        ],\r\n        \"averages\": [\r\n            0.57,\r\n            3.54,\r\n            0.72,\r\n            3.74,\r\n            -4.59,\r\n            -3.66,\r\n            -0.25,\r\n            -1.03,\r\n            1.08,\r\n            7.89,\r\n            16.92,\r\n            19.09,\r\n            20.51,\r\n            1.39,\r\n            0.38,\r\n            7.52,\r\n            -3.03,\r\n            24.75,\r\n            27.58\r\n        ],\r\n        \"categories\": [\r\n            \"05-11\",\r\n            \"05-12\",\r\n            \"05-13\",\r\n            \"05-14\",\r\n            \"05-15\",\r\n            \"05-16\",\r\n            \"05-17\",\r\n            \"05-18\",\r\n            \"05-19\",\r\n            \"05-20\",\r\n            \"05-21\",\r\n            \"05-22\",\r\n            \"05-23\",\r\n            \"05-24\",\r\n            \"05-25\",\r\n            \"05-26\",\r\n            \"05-27\",\r\n            \"05-28\",\r\n            \"05-29\"\r\n        ],\r\n        \"max\": 36.4\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/weather/history_t?root_uid=12&project_id=37081&context=0', '');
INSERT INTO `xm_api` VALUES (60, 'weather/history_wind', '气象-历史风力风向', 8, 'facility', NULL, 0, 1, 1, 2, 2, 50, '气象-历史风力风向', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"datatime\": [\r\n            \"2018-08\",\r\n            \"2018-09\",\r\n            \"2018-10\",\r\n            \"2018-11\",\r\n            \"2018-12\",\r\n            \"2019-01\",\r\n            \"2019-02\",\r\n            \"2019-03\",\r\n            \"2019-04\",\r\n            \"2019-05\"\r\n        ],\r\n        \"one\": [\r\n            18,\r\n            21,\r\n            27,\r\n            27,\r\n            27,\r\n            31,\r\n            25,\r\n            26,\r\n            27,\r\n            19\r\n        ],\r\n        \"two\": [\r\n            13,\r\n            9,\r\n            4,\r\n            3,\r\n            1,\r\n            0,\r\n            3,\r\n            5,\r\n            3,\r\n            10\r\n        ],\r\n        \"three\": [\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            3,\r\n            0,\r\n            0,\r\n            0,\r\n            0,\r\n            0\r\n        ]\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/weather/history_wind?root_uid=12&project_id=37081', '');
INSERT INTO `xm_api` VALUES (61, 'weather/weather', '气象-天气', 8, 'facility', NULL, 0, 1, 1, 2, 2, 50, '气象-天气', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"province\": \"内蒙古自治区\",\r\n        \"city\": \"赤峰市\",\r\n        \"today\": {\r\n            \"datatime\": \"06月10日\",\r\n            \"staCode\": \"54320\",\r\n            \"t\": \"27℃\",\r\n            \"lonlat\": [\r\n                119.3,\r\n                41.6\r\n            ],\r\n            \"week\": \"星期一\",\r\n            \"t_max\": \"27.3℃\",\r\n            \"t_min\": \"12.4℃\",\r\n            \"wet\": \"31%\",\r\n            \"rain\": \"0 mm\",\r\n            \"wind_direct\": \"东北风\",\r\n            \"wind_speed\": \"3级\",\r\n            \"weather\": \"晴\",\r\n            \"img\": \"http://pic.klagri.com.cn/images/weather/day/00.png\",\r\n            \"sunrise\": \"04:27\",\r\n            \"sunset\": \"19:40\"\r\n        },\r\n        \"future\": [\r\n            {\r\n                \"weather_code\": \"01\",\r\n                \"img\": \"http://pic.klagri.com.cn/images/weather/day/01.png\",\r\n                \"img_pm\": \"http://pic.klagri.com.cn/images/weather/day/01.png\",\r\n                \"weather\": \"多云\",\r\n                \"weather_pm\": \"多云\",\r\n                \"t_max\": \"31℃\",\r\n                \"t_min\": \"17℃\",\r\n                \"wind_direct\": \"西南风\",\r\n                \"wind_direct_pm\": \"西南风\",\r\n                \"t\": \"24℃\",\r\n                \"wind_speed\": \"0级\",\r\n                \"wind_speed_pm\": \"0级\",\r\n                \"week\": \"星期二\",\r\n                \"datatime\": \"06月11日\",\r\n                \"sunrise\": \"04:27\",\r\n                \"sunset\": \"19:40\"\r\n            },\r\n            {\r\n                \"weather_code\": \"01\",\r\n                \"img\": \"http://pic.klagri.com.cn/images/weather/day/01.png\",\r\n                \"img_pm\": \"http://pic.klagri.com.cn/images/weather/day/21.png\",\r\n                \"weather\": \"多云\",\r\n                \"weather_pm\": \"小雨\",\r\n                \"t_max\": \"30℃\",\r\n                \"t_min\": \"19℃\",\r\n                \"wind_direct\": \"西南风\",\r\n                \"wind_direct_pm\": \"西南风\",\r\n                \"t\": \"24.5℃\",\r\n                \"wind_speed\": \"1级\",\r\n                \"wind_speed_pm\": \"1级\",\r\n                \"week\": \"星期三\",\r\n                \"datatime\": \"06月12日\",\r\n                \"sunrise\": \"04:27\",\r\n                \"sunset\": \"19:41\"\r\n            }\r\n        ]\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/weather/weather?project_id=37081', '');
INSERT INTO `xm_api` VALUES (62, 'user/get_list', '用户列表', 10, 'facility', NULL, 0, 1, 1, 2, 2, 50, '用户列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"22\",\r\n            \"user_name\": \"dan0123\",\r\n            \"real_name\": \"京蓝云智\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"13906326652\"\r\n        },\r\n        {\r\n            \"id\": \"34\",\r\n            \"user_name\": \"jinglan-yz\",\r\n            \"real_name\": \"云智\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"13515559633\"\r\n        },\r\n        {\r\n            \"id\": \"35\",\r\n            \"user_name\": \"guokaixuan\",\r\n            \"real_name\": \"guo\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"13512345678\"\r\n        },\r\n        {\r\n            \"id\": \"36\",\r\n            \"user_name\": \"edge_test\",\r\n            \"real_name\": \"edge\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"15318889655\"\r\n        },\r\n        {\r\n            \"id\": \"37\",\r\n            \"user_name\": \"edge_test1\",\r\n            \"real_name\": \"edge\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"15316669855\"\r\n        },\r\n        {\r\n            \"id\": \"39\",\r\n            \"user_name\": \"胜多负少的\",\r\n            \"real_name\": \"按时\",\r\n            \"status\": \"开启\",\r\n            \"phone\": \"15625489562\"\r\n        }\r\n    ],\r\n    \"p\": 1,\r\n    \"total\": 6,\r\n    \"pages\": 1\r\n}', 'http://apifacility.klagri.com.cn/facility/user/get_list?root_uid=12&limit=10&p=1', '');
INSERT INTO `xm_api` VALUES (63, 'user/add', '用户-添加', 10, 'facility', NULL, 0, 1, 1, 1, 2, 50, '用户（二级）-添加', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"id\": 219\r\n    }\r\n}', '{\r\n	\"root_uid\" : 10000,\r\n	\"user_name\" : \"babafxzxfba\",\r\n	\"phone\": 13906325005,\r\n	\"real_name\" : \"李维民\",\r\n	\"password\" : \"12345678\",\r\n	\"password_r\" : \"12345678\",\r\n	\"role_id\" : \"1,2,3\",\r\n	\"status\" : 1\r\n}', '');
INSERT INTO `xm_api` VALUES (64, 'role/get_list', '角色-列表', 10, 'facility', NULL, 0, 1, 1, 2, 2, 50, '角色-列表', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"name\": \"管理员\",\r\n            \"descrip\": \"管理员\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"name\": \"二级管理员\",\r\n            \"descrip\": \"二级管理员\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"name\": \"基地管理\",\r\n            \"descrip\": \"基地管理\"\r\n        },\r\n        {\r\n            \"id\": \"5\",\r\n            \"name\": \"物联网监控管理\",\r\n            \"descrip\": \"物联网监控管理\"\r\n        },\r\n        {\r\n            \"id\": \"6\",\r\n            \"name\": \"地块管理\",\r\n            \"descrip\": \"地块管理\"\r\n        }\r\n    ]\r\n}', 'http://apifacility.klagri.com.cn/facility/role/get_list?root_uid=12', '');
INSERT INTO `xm_api` VALUES (65, 'user/detail', '用户-详情', 10, 'facility', NULL, 0, 1, 1, 2, 2, 50, '用户-详情', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"id\": \"39\",\r\n        \"user_name\": \"胜多负少的\",\r\n        \"phone\": \"15625489562\",\r\n        \"real_name\": \"按时2\",\r\n        \"status\": \"1\",\r\n        \"role\": [\r\n            {\r\n                \"id\": \"1\",\r\n                \"name\": \"管理员\"\r\n            },\r\n            {\r\n                \"id\": \"5\",\r\n                \"name\": \"物联网监控管理\"\r\n            }\r\n        ]\r\n    }\r\n}', 'http://apifacility.klagri.com.cn/facility/user/detail?root_uid=12&user_id=39\r\n', '');
INSERT INTO `xm_api` VALUES (66, 'user/update', '用户-修改', 10, 'facility', NULL, 0, 1, 1, 1, 2, 50, '用户-修改', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": []\r\n}', '{\r\n	\"user_id\" : 93,\r\n	\"root_uid\" : 10000,\r\n	\"phone\":\"13563215569\",\r\n	\"user_name\" : \"yunzhi\",\r\n	\"real_name\" : \"云智\",\r\n	\"password\" : \"12345678\",\r\n	\"password_r\" : \"12345678\",\r\n	\"role_id\" : \"1,2,3\",\r\n	\"status\" : 1\r\n}', '');
INSERT INTO `xm_api` VALUES (67, 'user/update', '用户-删除', 10, 'facility', NULL, 0, 1, 1, 1, 2, 50, '用户-删除', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": 1\r\n}', '{\r\n	\"id\" : 93\r\n}', '');
INSERT INTO `xm_api` VALUES (68, 'login/token', '登录-根据code获取token', 10, 'facility', NULL, 0, 1, 1, 1, 2, 50, '登录-根据code获取token', NULL, '{\r\n  \"code\": 200,\r\n  \"msg\": \"\\u6210\\u529f\",\r\n  \"data\": {\r\n    \"access_token\": \"411248fa-9f90-4842-8495-a490fc843b6f\",\r\n    \"token_type\": \"bearer\",\r\n    \"refresh_token\": \"9676be3b-9b51-4292-b5d7-1d70599a722d\",\r\n    \"expires_in\": 3599,\r\n    \"scope\": \"app\"\r\n  }\r\n}', '{url: \"http://facility.klagri.com.cn\", code: \"yfStbj\"}', '');
INSERT INTO `xm_api` VALUES (69, 'login/username', '通过token获取用户名', 10, 'facility', NULL, 0, 1, 1, 1, 2, 50, '通过token获取用户名', NULL, '{\r\n    \"code\": 200,\r\n    \"msg\": \"成功\",\r\n    \"data\": {\r\n        \"password\": null,\r\n        \"username\": \"admin\",\r\n        \"authorities\": [\r\n            {\r\n                \"authority\": \"ROLE_admin\"\r\n            }\r\n        ],\r\n        \"accountNonExpired\": true,\r\n        \"accountNonLocked\": true,\r\n        \"credentialsNonExpired\": true,\r\n        \"enabled\": true\r\n    }\r\n}', '{\r\n	\"token\" : \"8c53b802-0233-4e87-a5f6-a479cdfbb323\"\r\n}', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_client_platform
-- ----------------------------
INSERT INTO `xm_api_client_platform` VALUES (1, 'Android', 1, 'trade-api');
INSERT INTO `xm_api_client_platform` VALUES (2, 'IOS', 2, 'trade-api');
INSERT INTO `xm_api_client_platform` VALUES (3, 'Wechat', 4, 'trade-api');
INSERT INTO `xm_api_client_platform` VALUES (4, 'PC', 8, 'trade-api');
INSERT INTO `xm_api_client_platform` VALUES (5, 'Android', 1, 'facility');
INSERT INTO `xm_api_client_platform` VALUES (6, 'IOS', 2, 'decision');
INSERT INTO `xm_api_client_platform` VALUES (7, 'PC', 2, 'facility');
INSERT INTO `xm_api_client_platform` VALUES (8, 'WeChat', 1, 'cloud-weather');

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
INSERT INTO `xm_api_code` VALUES (-33, '名称不存在（根据名称进行查询时结果为空）');
INSERT INTO `xm_api_code` VALUES (-32, '非用户输入的参数错误（或者执行更新操作时，数据未发生修改）');
INSERT INTO `xm_api_code` VALUES (-31, '数据库操作失败');
INSERT INTO `xm_api_code` VALUES (-30, '服务异常(module或第三方服务中的返回值为NULL)');
INSERT INTO `xm_api_code` VALUES (-25, '操作不存在');
INSERT INTO `xm_api_code` VALUES (-24, '类不存在');
INSERT INTO `xm_api_code` VALUES (-23, '应用不存在');
INSERT INTO `xm_api_code` VALUES (-22, '接口不存在');
INSERT INTO `xm_api_code` VALUES (-21, '客户端与服务器端时间差超过最大限值');
INSERT INTO `xm_api_code` VALUES (-20, '签名错误');
INSERT INTO `xm_api_code` VALUES (-13, 'PHP警告');
INSERT INTO `xm_api_code` VALUES (-12, 'PHP异常，程序非正常停止');
INSERT INTO `xm_api_code` VALUES (-11, 'PHP致命/语法错误，程序非正常停止');
INSERT INTO `xm_api_code` VALUES (-10, 'SQL异常');
INSERT INTO `xm_api_code` VALUES (-2, '用户登录失败');
INSERT INTO `xm_api_code` VALUES (-1, '未定义的错误类型');
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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_group
-- ----------------------------
INSERT INTO `xm_api_group` VALUES (1, '用户', 'trade-api', '用户相关的接口，包括登录注册等', 50);
INSERT INTO `xm_api_group` VALUES (2, '地块', 'trade-api', '地块相关的接口', 45);
INSERT INTO `xm_api_group` VALUES (3, '订单', 'trade-api', '订单相关接口，包括需求', 50);
INSERT INTO `xm_api_group` VALUES (4, '需求', 'trade-api', '用户需求相关接口', 1);
INSERT INTO `xm_api_group` VALUES (5, '作物种植', 'facility', '作物种植', 1);
INSERT INTO `xm_api_group` VALUES (6, '招标', 'trade-api', '发布招标的相关接口', 1);
INSERT INTO `xm_api_group` VALUES (7, '设备相关', 'facility', '设备相关接口', 1);
INSERT INTO `xm_api_group` VALUES (8, '气象相关接口', 'facility', '有关天气气象相关接口', 1);
INSERT INTO `xm_api_group` VALUES (9, '温室监控', 'facility', '温室环境相关', 1);
INSERT INTO `xm_api_group` VALUES (10, '用户', 'facility', '用户相关', 1);
INSERT INTO `xm_api_group` VALUES (11, '地块', 'facility', '地块相关', 1);
INSERT INTO `xm_api_group` VALUES (12, '基地', 'facility', '基地相关', 1);
INSERT INTO `xm_api_group` VALUES (13, '天气', 'cloud-weather', '天气相关接口', 1);
INSERT INTO `xm_api_group` VALUES (14, '地区', 'cloud-weather', '地区相关接口', 1);
INSERT INTO `xm_api_group` VALUES (15, '地图', 'facility', '地图相关接口', 1);

-- ----------------------------
-- Table structure for xm_api_module
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_module`;
CREATE TABLE `xm_api_module`  (
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口模块名称module_id',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述标签',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '正式线接口地址',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_module
-- ----------------------------
INSERT INTO `xm_api_module` VALUES ('cloud-weather', '云气象小程序API', 'apiwx.klagri.com.cn/weather/v1');
INSERT INTO `xm_api_module` VALUES ('decision', '云决策', 'decision.klagri.com.cn/ap');
INSERT INTO `xm_api_module` VALUES ('facility', '设施管理平台', 'apifacility.klagri.com.cn/facility');
INSERT INTO `xm_api_module` VALUES ('trade-api', '无人机2.0-农户端', 'api.trade.klagri.com.cn/api');

-- ----------------------------
-- Table structure for xm_api_param_type
-- ----------------------------
DROP TABLE IF EXISTS `xm_api_param_type`;
CREATE TABLE `xm_api_param_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_param_type
-- ----------------------------
INSERT INTO `xm_api_param_type` VALUES (4, 'array');
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
  `val` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '测试用的默认值',
  `param_cont` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台具体参数key和value(存json)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_id`(`api_id`) USING BTREE,
  INDEX `pt_id`(`pt_id`) USING BTREE,
  CONSTRAINT `xm_api_params_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `xm_api` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xm_api_params_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `xm_api_param_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1452 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xm_api_params
-- ----------------------------
INSERT INTO `xm_api_params` VALUES (59, 4, 'token', 'token令牌', 1, 1, 0, '身份令牌', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (60, 4, 'real_name', '真实姓名', 1, 1, 0, '用户真实姓名', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (61, 4, 'id_card', '身份证号', 1, 1, 0, '身份证号', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (62, 4, 'card_img_url_y', '身份证正面照', 1, 1, 0, '身份证正面照', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (63, 4, 'card_img_url_n', '身份证反面照', 1, 1, 0, '身份证反面照', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (64, 4, 'identify', '认证标识', 1, 1, 1, '实名认证：1未提交申请，2申请中，3通过，4未通过', 5, 0, NULL, '');
INSERT INTO `xm_api_params` VALUES (172, 15, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (173, 15, 'code', '验证码', 1, 1, 0, '验证码', 5, 1, NULL, '0');
INSERT INTO `xm_api_params` VALUES (275, 11, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, 'f751db4cf7f564039bd7d2aaf6eb08df', '0');
INSERT INTO `xm_api_params` VALUES (276, 11, 'id', '地块ID', 2, 1, 0, '地块ID', 5, 1, '10012', '0');
INSERT INTO `xm_api_params` VALUES (277, 11, 'name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (278, 11, 'address', '地址', 1, 1, 1, '地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (279, 11, 'acreage', '面积', 1, 1, 1, '面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (280, 11, 'landform', '地形', 1, 1, 1, '地形状况，1.平地，2.山地，3.坡地，4.有障碍物', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (281, 11, 'pic', '图片', 1, 1, 1, '图片路径URL', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (282, 11, 'lng', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (283, 11, 'lat', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (384, 5, 'token', '用户token', 1, 1, 0, '身份令牌', 5, 1, '', '0');
INSERT INTO `xm_api_params` VALUES (398, 3, 'code', '验证码', 1, 1, 0, '验证码', 5, 1, '323263', '0');
INSERT INTO `xm_api_params` VALUES (399, 3, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '18865501833', '0');
INSERT INTO `xm_api_params` VALUES (400, 3, 'user_name', '用户名', 1, 1, 0, '用户名（唯一）', 5, 1, 'lizheng', '0');
INSERT INTO `xm_api_params` VALUES (401, 3, 'passwd', '密码', 1, 1, 0, '密码（是否加密）', 5, 1, '88888888', '0');
INSERT INTO `xm_api_params` VALUES (402, 3, 'passwd_r', '密码', 1, 1, 0, '密码（是否加密）', 5, 1, '88888888', '0');
INSERT INTO `xm_api_params` VALUES (403, 8, 'code', '验证码', 1, 1, 0, '验证码', 5, 1, '551572', '0');
INSERT INTO `xm_api_params` VALUES (404, 8, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '18865501833', '0');
INSERT INTO `xm_api_params` VALUES (405, 8, 'passwd', '密码', 1, 1, 0, '密码', 5, 1, '12345678', '0');
INSERT INTO `xm_api_params` VALUES (406, 8, 'passwd_r', '确认密码', 1, 1, 0, '确认密码', 5, 1, '12345678', '0');
INSERT INTO `xm_api_params` VALUES (429, 10, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '55779dc704b2e2432f8beb8a69967afe', '0');
INSERT INTO `xm_api_params` VALUES (430, 10, 'id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (431, 10, 'name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (432, 10, 'address', '地址', 1, 1, 1, '地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (433, 10, 'acreage', '面积', 1, 1, 1, '面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (434, 2, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '', '0');
INSERT INTO `xm_api_params` VALUES (435, 2, 'type', '业务类型', 1, 0, 0, '业务类型，1注册，0默认', 5, 1, '', '0');
INSERT INTO `xm_api_params` VALUES (436, 7, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '97ce952f17ea648100b728bf9dcac37f', '0');
INSERT INTO `xm_api_params` VALUES (437, 7, 'sex', '性别', 1, 1, 0, '1男，2女', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (438, 7, 'email', '邮箱', 1, 1, 0, '邮箱', 5, 1, '271648245@qq.com', '0');
INSERT INTO `xm_api_params` VALUES (439, 7, 'avatar', '头像', 1, 1, 0, '头像URL', 5, 1, 'trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg', '0');
INSERT INTO `xm_api_params` VALUES (440, 9, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (441, 9, 'name', '地块名称', 1, 1, 0, '地块名称', 5, 1, '无人机地块测试', '0');
INSERT INTO `xm_api_params` VALUES (442, 9, 'lng', '经度', 1, 1, 0, '经度', 5, 1, '116.48548', '0');
INSERT INTO `xm_api_params` VALUES (443, 9, 'lat', '纬度', 1, 1, 0, '纬度', 5, 1, '39.9484', '0');
INSERT INTO `xm_api_params` VALUES (444, 9, 'address', '地址', 1, 1, 0, '地址', 5, 1, '北京市朝阳区', '0');
INSERT INTO `xm_api_params` VALUES (445, 9, 'acreage', '面积', 1, 1, 0, '面积', 5, 1, '235', '0');
INSERT INTO `xm_api_params` VALUES (446, 9, 'landform', '地形', 1, 1, 0, '地形状况，1.平地，2.山地，3.坡地，4.有障碍物（不会改动，可以直接写死值，展示下拉框）', 5, 1, '1（下拉内容确定这几种，可以再前台固定）', '0');
INSERT INTO `xm_api_params` VALUES (447, 9, 'pic', '图片', 1, 1, 0, '图片URL', 5, 1, 'http://lz.facility-klagri.com//upload//images//idcard_y//2019-02-21//ff89accc30a6e933b930702f93b832be.jpg', '0');
INSERT INTO `xm_api_params` VALUES (448, 12, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (449, 12, 'id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10015', '0');
INSERT INTO `xm_api_params` VALUES (450, 12, 'name', '地块名称', 1, 1, 0, '地块名称', 5, 1, '无人机地块测试1', '0');
INSERT INTO `xm_api_params` VALUES (451, 12, 'lng', '经度', 1, 1, 0, '经度', 5, 1, '108.23545451', '0');
INSERT INTO `xm_api_params` VALUES (452, 12, 'lat', '纬度', 1, 1, 0, '纬度', 5, 1, '42.158643218', '0');
INSERT INTO `xm_api_params` VALUES (453, 12, 'address', '地址', 1, 1, 0, '地址', 5, 1, '北京市朝阳区保利国际广场T2', '0');
INSERT INTO `xm_api_params` VALUES (454, 12, 'acreage', '面积', 1, 1, 0, '面积', 5, 1, '500.00', '0');
INSERT INTO `xm_api_params` VALUES (455, 12, 'landform', '地形', 1, 1, 0, '地形状况，1.平地，2.山地，3.坡地，4.有障碍物', 5, 1, '1（下拉内容确定这几种，可以再前台固定）', '0');
INSERT INTO `xm_api_params` VALUES (456, 12, 'pic', '图片', 1, 1, 0, '图片URL', 5, 1, 'trade/picture/2019-03-19/9dc37346a6d80699c38e4174b9cf45a4.jpg', '0');
INSERT INTO `xm_api_params` VALUES (471, 14, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (472, 14, 'species_id', '作物类型', 1, 1, 0, '作物类型', 5, 1, '10003', '0');
INSERT INTO `xm_api_params` VALUES (473, 14, 'task_type', '作业类型', 1, 1, 0, '作业类型，1.整地，2播种, 3收割，4.飞防，5.打药，6.施肥', 5, 1, '5', '0');
INSERT INTO `xm_api_params` VALUES (474, 14, 'task_begintime', '作业开始时间', 1, 1, 0, '作业开始时间', 5, 1, '2019-04-22', '0');
INSERT INTO `xm_api_params` VALUES (475, 14, 'task_endtime', '作业结束时间', 1, 1, 0, '作业结束时间', 5, 1, '2019-04-23', '0');
INSERT INTO `xm_api_params` VALUES (476, 14, 'real_name', '联系人', 1, 1, 0, '联系人', 5, 1, 'guo', '0');
INSERT INTO `xm_api_params` VALUES (477, 14, 'phone', '联系电话', 1, 1, 0, '联系电话', 5, 1, '15711358441', '0');
INSERT INTO `xm_api_params` VALUES (478, 14, 'assemble_lng', '经度（集合点）', 1, 1, 0, '经度（集合点）', 5, 1, '119.1536480000', '0');
INSERT INTO `xm_api_params` VALUES (479, 14, 'assemble_lat', '纬度（集合点）', 1, 1, 0, '纬度（集合点）', 5, 1, '41.6226250000', '0');
INSERT INTO `xm_api_params` VALUES (480, 14, 'assemble_address', '集合地点', 1, 1, 0, '集合地点', 5, 1, '北京西城区', '0');
INSERT INTO `xm_api_params` VALUES (481, 14, 'product_source', '产品使用来源', 1, 1, 0, '产品使用来源0不需要，1农户，2农机队', 5, 1, '2', '0');
INSERT INTO `xm_api_params` VALUES (482, 13, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, 'd1b3f730693e4ea35457c92c5e3a842d', '0');
INSERT INTO `xm_api_params` VALUES (483, 13, 'demand_id', '需求id', 1, 1, 1, '需求id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (484, 13, 'plant_name', '作物名称', 1, 1, 1, '作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (485, 13, 'task_type', '作业类型', 1, 1, 1, '作业类型 1整地，2播种，3收割，4飞防，5打药，6施肥', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (486, 13, 'task_begintime', '作业开始时间', 1, 1, 1, '作业开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (487, 13, 'task_endtime', '作业结束时间', 1, 1, 1, '作业结束时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (488, 13, 'product_source', '使用产品来源', 1, 1, 1, '产品来源 默认0 ，1农户，2农机队', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (489, 13, 'assemble_address', '集合地址', 1, 1, 1, '集合地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (490, 13, 'demand_type_id', '作业需求类型id', 1, 1, 1, '作业需求类型id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (491, 18, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (492, 18, 'id', '需求id', 2, 1, 0, '需求id', 5, 1, '11', '0');
INSERT INTO `xm_api_params` VALUES (493, 18, 'plant_name', '作物名称', 1, 1, 1, '作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (494, 18, 'task_type', '作业类型', 1, 1, 1, '作业类型 1整地，2播种，3收割，4飞防，5打药，6施肥', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (495, 18, 'task_begintime', '作业开始时间', 1, 1, 1, '作业开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (496, 18, 'task_endtime', '作业结束时间', 1, 1, 1, '作业结束时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (497, 18, 'real_name', '真实姓名', 1, 1, 1, '真实姓名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (498, 18, 'phone', '手机号', 1, 1, 1, '手机号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (499, 18, 'assemble_address', '集合地址', 1, 1, 1, '集合地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (500, 18, 'demand_type_id', '作业需求类型id', 1, 0, 1, '作业需求类型id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (501, 19, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '4387b3e78ef8f49fcc44c38414c1b037', '0');
INSERT INTO `xm_api_params` VALUES (502, 19, 'id', '需求id', 2, 1, 0, '需求id', 5, 1, '11', '0');
INSERT INTO `xm_api_params` VALUES (503, 19, 'species_id', '作物类型', 2, 1, 0, '作物类型', 5, 1, '10002', '0');
INSERT INTO `xm_api_params` VALUES (504, 19, 'assemble_lng', '集合地址经度', 3, 1, 0, '集合地址经度', 5, 1, '119.1536480000', '0');
INSERT INTO `xm_api_params` VALUES (505, 19, 'assemble_lat', '集合地址纬度', 3, 1, 0, '集合地址纬度', 5, 1, '41.6226250000', '0');
INSERT INTO `xm_api_params` VALUES (506, 19, 'assemble_address', '集合地址', 3, 1, 0, '集合地址', 5, 1, '北京西城区', '0');
INSERT INTO `xm_api_params` VALUES (507, 19, 'real_name', '真实姓名', 1, 1, 0, '真实姓名', 5, 1, '郭明珠', '0');
INSERT INTO `xm_api_params` VALUES (508, 19, 'phone', '电话号', 1, 1, 0, '电话号', 5, 1, '15711358441', '0');
INSERT INTO `xm_api_params` VALUES (509, 19, 'task_type', '作业类型', 2, 0, 0, '作业类型 1整地，2播种，3收割，4飞防，5打药，6施肥', 5, 1, '5', '0');
INSERT INTO `xm_api_params` VALUES (510, 19, 'task_begintime', '作业开始时间', 1, 1, 0, '作业开始时间', 5, 1, '2019-04-22', '0');
INSERT INTO `xm_api_params` VALUES (511, 19, 'task_endtime', '作业结束时间', 1, 1, 0, '作业结束时间', 5, 1, '2019-04-24', '0');
INSERT INTO `xm_api_params` VALUES (512, 19, 'product_source', '产品使用来源', 1, 1, 0, '产品使用来源0不需要，1农户，2农机队', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (513, 19, 'demand_type_id', '作业需求类型id', 1, 1, 0, '作业需求类型id', 5, 1, '11', '0');
INSERT INTO `xm_api_params` VALUES (520, 24, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (521, 24, 'id', '作业内容id', 1, 1, 1, '作业内容id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (522, 24, 'type_name', '作业类型名称', 1, 1, 1, '作业类型名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (523, 25, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (524, 25, 'id', '作物id', 1, 1, 1, '作物id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (525, 25, 'name', '作物名称', 1, 1, 1, '作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (526, 26, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (527, 26, 'id', '药剂类型id', 1, 1, 1, '药剂类型id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (528, 26, 'type_name', '药剂类型名称', 1, 1, 1, '药剂类型名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (529, 20, 'id', '作物id', 1, 1, 1, '作物id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (530, 20, 'name', '作物名称', 1, 1, 1, '作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (531, 27, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (532, 27, 'id', '肥料类型id', 1, 1, 1, '肥料类型id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (533, 27, 'type_name', '肥料类型名称', 1, 1, 1, '肥料类型名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (534, 28, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (535, 28, 'id', '种苗类型id', 1, 1, 1, '种苗类型id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (536, 28, 'type_name', '种苗类型名称', 1, 1, 1, '种苗类型名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (537, 29, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (538, 29, 'demand_id', '需求id', 1, 1, 0, '需求id', 5, 1, '9', '0');
INSERT INTO `xm_api_params` VALUES (539, 29, 'id', '套餐id', 1, 1, 1, '套餐id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (540, 29, 'name', '套餐名称', 1, 1, 1, '套餐名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (541, 30, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (542, 30, 'name', '农机队名称', 1, 1, 0, '输入农机队名称中的某一个或几个字', 5, 1, '植保队', '0');
INSERT INTO `xm_api_params` VALUES (543, 30, 'id', '农机队id', 1, 1, 1, '农机队id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (544, 30, 'name', '农机队名称', 1, 1, 1, '农机队名称列表', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (561, 31, 'token', '用户token', 1, 1, 0, '用户token', 5, 1, '5bf271c4480b2d64586efc148340f0dc', '0');
INSERT INTO `xm_api_params` VALUES (562, 31, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10002', '0');
INSERT INTO `xm_api_params` VALUES (563, 31, 'demand_id', '需求id', 1, 1, 0, '需求id', 5, 1, '2', '0');
INSERT INTO `xm_api_params` VALUES (564, 31, 'tender_objeect', '招标对象', 1, 1, 0, '招标对象', 5, 1, '3', '0');
INSERT INTO `xm_api_params` VALUES (565, 31, 'package_id', '套餐id', 1, 1, 0, '套餐id', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (566, 31, 'tender_begintime', '招标开始时间', 1, 1, 0, '招标开始时间', 5, 1, '2019-04-09', '0');
INSERT INTO `xm_api_params` VALUES (567, 31, 'tender_endtime', '招标结束时间', 1, 1, 0, '招标结束时间', 5, 1, '2019-04-13', '0');
INSERT INTO `xm_api_params` VALUES (568, 31, 'remark', '备注', 1, 1, 0, '备注', 5, 1, '收割', '0');
INSERT INTO `xm_api_params` VALUES (569, 31, 'amount', '招标价格', 1, 1, 0, '招标价格', 5, 1, '111', '0');
INSERT INTO `xm_api_params` VALUES (570, 31, 'team_id', '农机队id', 1, 1, 0, '农机队id', 5, 1, '10001', '0');
INSERT INTO `xm_api_params` VALUES (625, 32, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (626, 32, 'id', '摄像头设备ID', 1, 1, 1, '摄像头设备ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (627, 32, 'serialno', '摄像头设备编号', 1, 1, 1, '摄像头唯一的设备编号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (628, 32, 'username', '摄像头用户名', 1, 1, 1, '摄像头用户名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (629, 32, 'password', '摄像头密码', 1, 1, 1, '摄像头密码', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (630, 32, 'loginip', '摄像头登录IP', 1, 1, 1, '摄像头登录IP', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (631, 32, 'port', '摄像头端口', 1, 1, 1, '摄像头端口', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (632, 32, 't', '空气温度（传感器）', 1, 1, 1, '空气温度（传感器）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (633, 32, 'wet', '空气湿度（传感器）', 1, 1, 1, '空气湿度（传感器）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (634, 32, 'co2', '二氧化碳（传感器）', 1, 1, 1, '二氧化碳（传感器）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (635, 32, 'sun_hours', '光照强度（传感器）', 1, 1, 1, '光照强度  （传感器）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (636, 32, 'floor_t', '土壤温度（墒情仪）', 1, 1, 1, '土壤温度（墒情仪）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (637, 32, 'floor_wet', '土壤湿度（墒情仪）', 1, 1, 1, '土壤湿度（墒情仪）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (638, 33, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (639, 33, 'datatime', 'X轴的时间', 1, 1, 1, 'X轴的时间点', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (640, 33, 'air_t', '空气温度', 1, 1, 1, '空气温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (641, 33, 'air_wet', '空气湿度', 1, 1, 1, '空气湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (642, 33, 'air_t_max', '空气温度最大值', 1, 1, 1, '空气温度最大值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (643, 33, 'air_wet_max', '空气湿度最大值', 1, 1, 1, '空气湿度最大值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (644, 34, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (645, 34, 'datatime', '数据时间', 1, 1, 1, 'X轴的时间点', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (646, 34, 'floor_t', '土壤温度', 1, 1, 1, '土壤20CM层温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (647, 34, 'floor_wet', '土壤湿度', 1, 1, 1, '土壤20CM层湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (648, 34, 'floor_t_max', '温度最大值', 1, 1, 1, '温度最大值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (649, 34, 'floor_wet_max', '湿度最大值', 1, 1, 1, '湿度最大值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (663, 35, 'p', '第几页', 1, 1, 0, '第几页', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (664, 35, 'limit', '每页几条', 1, 1, 0, '每页几条', 5, 1, '3', '0');
INSERT INTO `xm_api_params` VALUES (665, 35, 'id', '数据ID', 1, 1, 1, '数据ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (666, 35, 'block_name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (667, 35, 'air_t', '空气温度', 1, 1, 1, '空气温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (668, 35, 'air_wet', '空气湿度', 1, 1, 1, '空气湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (669, 35, 'co2', '二氧化碳', 1, 1, 1, '二氧化碳', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (670, 35, 'sun', '光照', 1, 1, 1, '光照', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (671, 35, 'floor_t', '土壤温度', 1, 1, 1, '土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (672, 35, 'floor_wet', '土壤湿度', 1, 1, 1, '土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (673, 35, 'createtime', '采集时间', 1, 1, 1, '采集时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (674, 36, 'block_id', '地块ID', 1, 1, 0, '地块Id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (675, 36, 'limit', '每页多少条', 1, 1, 0, '每页多少条', 5, 1, '3', '0');
INSERT INTO `xm_api_params` VALUES (676, 36, 'p', '第几页', 1, 1, 0, '第几页', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (677, 36, 'id', '警报记录ID', 1, 1, 1, '记录ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (678, 36, 'flag', '是否报警', 1, 1, 1, 'true报警，false正常', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (679, 36, 'air_t', '空气温度', 1, 1, 1, '空气温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (680, 36, 'air_wet', '空气湿度', 1, 1, 1, '空气湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (681, 36, 'sun', '光照', 1, 1, 1, '光照', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (682, 36, 'co2', '二氧化碳', 1, 1, 1, '二氧化碳', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (683, 36, 'floor_t1', '土壤温度10CM', 1, 1, 1, '土壤温度10CM', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (684, 36, 'floor_t2', '土壤温度20CM', 1, 1, 1, '土壤温度20CM', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (685, 36, 'floor_t3', '土壤温度30CM', 1, 1, 1, '土壤温度30CM', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (686, 36, 'floor_t4', '土壤温度40CM', 1, 1, 1, '土壤温度40CM', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (687, 36, 'collect_time', '采集时间', 1, 1, 1, '采集时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (688, 36, 'block_name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (695, 38, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (696, 38, 'air_t', '空气温度', 1, 1, 1, '空气温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (697, 38, 'air_wet', '空气湿度', 1, 1, 1, '空气湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (698, 38, 'co2', '二氧化碳', 1, 1, 1, '二氧化碳', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (699, 38, 'sun', '光照', 1, 1, 1, '光照', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (700, 38, 'floor_t', '土壤温度', 1, 1, 1, '土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (701, 38, 'floor_wet', '土壤湿度', 1, 1, 1, '土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (702, 38, 'high', '最高临界值', 1, 1, 1, '最高临界值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (703, 38, 'high_content', '超过最高值时报警内容', 1, 1, 1, '超过最高值时报警内容', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (704, 38, 'low', '最低临界值', 1, 1, 1, '最低临界值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (705, 38, 'low_content', '低于最低值时报警内容', 1, 1, 1, '低于最低值时报警内容', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (756, 40, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (757, 40, 'datetime', '时间', 1, 1, 1, '钟表时间 24小时制', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (758, 40, 'floor_t_10', '地表以下10cm的土壤温度', 1, 1, 1, '地表以下10cm的土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (759, 40, 'floor_t_20', '地表以下20cm的土壤温度', 1, 1, 1, '地表以下20cm的土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (760, 40, 'floor_t_30', '地表以下30cm的土壤温度', 1, 1, 1, '地表以下30cm的土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (761, 40, 'floor_t_40', '地表以下40cm的土壤温度', 1, 1, 1, '地表以下40cm的土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (762, 40, 'floor_t_10_max', '地表以下10cm一天内最高土壤温度', 1, 1, 1, '地表以下10cm一天内最高土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (763, 40, 'floor_t_20_max', '地表以下20cm一天内最高土壤温度', 1, 1, 1, '地表以下20cm一天内最高土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (764, 40, 'floor_t_30_max', '地表以下30cm一天内最高土壤温度', 1, 1, 1, '地表以下30cm一天内最高土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (765, 40, 'floor_t_40_max', '地表以下40cm一天内最高土壤温度', 1, 1, 1, '地表以下40cm一天内最高土壤温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (776, 37, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (777, 37, 'type_id', '警报类型', 1, 1, 0, '可填（air_t:空气温度，ait_wet:空气湿度，co2：二氧化碳，sun：光照，floor_t：土壤温度，floor_wet：土壤湿度）', 5, 1, 'air_t', '0');
INSERT INTO `xm_api_params` VALUES (778, 37, 'high', '最高临界值', 1, 1, 0, '超过此值即报警', 5, 1, '45', '0');
INSERT INTO `xm_api_params` VALUES (779, 37, 'high_content', '报警内容', 1, 1, 0, '报警内容', 5, 1, '温度过高，请开启通风口，通风口先小后大，逐步进行sandbox', '0');
INSERT INTO `xm_api_params` VALUES (780, 37, 'low', '最低临界值', 1, 1, 0, '低于此值即报警', 5, 1, '-10', '0');
INSERT INTO `xm_api_params` VALUES (781, 37, 'low_content', '报警内容', 1, 1, 0, '报警内容', 5, 1, '温度过低，注意保暖sandbox', '0');
INSERT INTO `xm_api_params` VALUES (782, 37, 'flag', '更新标识', 2, 1, 0, '为true，代表更新，否则添加', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (783, 41, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (784, 41, 'datetime', '时间', 1, 1, 1, '钟表时间 24小时制', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (785, 41, 'floor_wet_10', '地表以下10cm的土壤湿度', 1, 1, 1, '地表以下10cm的土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (786, 41, 'floor_wet_20', '地表以下20cm的土壤湿度', 1, 1, 1, '地表以下20cm的土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (787, 41, 'floor_wet_30', '地表以下30cm的土壤湿度', 1, 1, 1, '地表以下30cm的土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (788, 41, 'floor_wet_40', '地表以下40cm的土壤湿度', 1, 1, 1, '地表以下40cm的土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (789, 41, 'floor_wet_10_max', '地表以下10cm一天内最高土壤湿度', 1, 1, 1, '地表以下10cm一天内最高土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (790, 41, 'floor_wet_20_max', '地表以下20cm一天内最高土壤湿度', 1, 1, 1, '地表以下20cm一天内最高土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (791, 41, 'floor_wet_30_max', '地表以下30cm一天内最高土壤湿度', 1, 1, 1, '地表以下30cm一天内最高土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (792, 41, 'floor_wet_40_max', '地表以下40cm一天内最高土壤湿度', 1, 1, 1, '地表以下40cm一天内最高土壤湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (961, 1, 'user_name', '用户名', 1, 1, 0, '用户名', 5, 1, 'lizheng', '0');
INSERT INTO `xm_api_params` VALUES (962, 1, 'passwd', '密码', 1, 1, 0, '密码', 5, 1, '88888888', '0');
INSERT INTO `xm_api_params` VALUES (963, 1, 'id', '用户id', 1, 1, 1, '用户id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (964, 1, 'token', '用户token', 1, 1, 1, '用户token', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (965, 1, 'user_name', '用户名', 1, 1, 1, '用户名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (966, 1, 'identify', '认证状态', 1, 1, 1, '实名认证：1未提交申请，2申请中，3通过，4未通过', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (967, 1, 'avatar', '头像图片', 1, 1, 1, '头像图片', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (968, 1, 'real_name', '真实姓名', 1, 1, 1, '真实姓名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (969, 1, 'sex', '性别', 1, 1, 1, '性别 0未填写，1男，2 女', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (970, 1, 'email', '邮箱', 1, 1, 1, '邮箱', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (971, 1, 'id_card', '身份证号', 1, 1, 1, '身份证号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (972, 46, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (988, 48, 'block_id', '地块ID', 2, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (989, 48, 'task_type', '作业类型', 2, 1, 0, '1：施肥2、打药3、灌溉4、收获', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (990, 48, 'task_time', '作业时间', 2, 1, 0, '时间戳', 5, 1, '1558509443', '0');
INSERT INTO `xm_api_params` VALUES (991, 48, 'remark', '备注', 1, 0, 0, '备注', 5, 1, '这是一条测试数据', '0');
INSERT INTO `xm_api_params` VALUES (992, 49, 'longitude', '经度', 1, 1, 0, '经度', 5, 1, '108.21', '0');
INSERT INTO `xm_api_params` VALUES (993, 49, 'latitude', '纬度', 1, 1, 0, '创建接口.html', 5, 1, '40.18', '0');
INSERT INTO `xm_api_params` VALUES (994, 49, 'code', '接口状态返回码', 1, 1, 1, '200成功，其他失败', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (995, 49, 'msg', '接口状态信息', 1, 1, 1, '接口状态信息', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (996, 49, 'data', '接口返回数据', 1, 1, 1, '接口返回数据', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (997, 49, 'rainfall', '两小时降水数组', 1, 1, 1, '无降水为空数组', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (998, 49, 'weather_msg', '短临降水描述', 1, 1, 1, '短临降水描述', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (999, 50, 'longitude', '经度', 1, 1, 0, '经度', 5, 1, '108.12', '0');
INSERT INTO `xm_api_params` VALUES (1000, 50, 'latitude', '纬度', 1, 1, 0, '纬度', 5, 1, '40.21', '0');
INSERT INTO `xm_api_params` VALUES (1001, 50, 'calendar', '农历日期', 1, 1, 1, '农历日期', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1002, 50, 'rainfall', '降雨量（未来两小时）', 1, 1, 1, '降雨量（未来两小时）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1003, 50, 'weather_msg', '短临降水预报说明', 1, 1, 1, '短临降水预报说明', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1004, 50, 'wind_direction', '风向', 1, 1, 1, '风向', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1005, 50, 'wind_level', '风力等级', 1, 1, 1, '风力等级', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1006, 50, 't', '当前温度', 1, 1, 1, '当前温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1007, 50, 't_min', '最低温', 1, 1, 1, '最低温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1008, 50, 't_max', '最高温', 1, 1, 1, '最高温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1009, 50, 'air_press', '气压', 1, 1, 1, '气压', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1010, 50, 'wind_speed', '风速', 1, 1, 1, '风速', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1011, 50, 'evp', '蒸发量', 1, 1, 1, '蒸发量', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1012, 50, 'staCode', '气象站编号', 1, 1, 1, '气象站编号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1013, 50, 'staName', '气象站名称', 1, 1, 1, '气象站名称（与地区名称一样）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1014, 50, 'weather', '天气现象', 1, 1, 1, '天气现象', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1015, 50, 'back_pic', '天气图标地址', 1, 1, 1, '天气图标地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1016, 51, 'area', '地区名称', 1, 1, 0, '地区名称', 5, 1, '枣庄', '0');
INSERT INTO `xm_api_params` VALUES (1017, 51, 'weather', '未来N天降水', 1, 1, 1, '未来N天降水', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1018, 51, 'high', '折线图-最高温', 1, 1, 1, '折线图-最高温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1019, 51, 'low', '折线图-最低温', 1, 1, 1, '折线图-最低温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1020, 51, 'two_day', '今明两天的天气', 1, 1, 1, '今明两天的天气', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1021, 51, 'pic_am', '天气图片-上午', 1, 1, 1, '天气图片-上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1022, 51, 'pic_pm', '天气图片-下午', 1, 1, 1, '天气图片-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1023, 51, 'weather_am', '天气-上午', 1, 1, 1, '天气-上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1024, 51, 'weather_pm', '天气-下午', 1, 1, 1, '天气-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1025, 51, 't_max', '最高温', 1, 1, 1, '最高温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1026, 51, 't_min', '最低温', 1, 1, 1, '最低温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1027, 51, 'wind_am', '风向-上午', 1, 1, 1, '风向-上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1028, 51, 'wind_pm', '风向-下午', 1, 1, 1, '风向-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1029, 51, 'level_am', '风力等级-上午', 1, 1, 1, '风力等级-上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1030, 51, 'level_pm', '风力等级-下午', 1, 1, 1, '风力等级-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1031, 51, 'date', '日期（格式化）', 1, 1, 1, '日期（格式化）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1032, 51, 'week', '周几', 1, 1, 1, '周几', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1033, 51, 'datatime', '日期', 1, 1, 1, '日期', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1034, 52, 'cityName', '地区名称', 1, 1, 0, '省市县行政区名称', 5, 1, '台儿庄', '0');
INSERT INTO `xm_api_params` VALUES (1035, 52, 'areaCode', '地区编码', 1, 1, 1, '用于查询天气预报', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1036, 52, 'lon', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1037, 52, 'lat', '纬度', 1, 1, 1, '纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1038, 53, 'longitude', '经度', 1, 1, 0, '经度', 5, 1, '112.45', '0');
INSERT INTO `xm_api_params` VALUES (1039, 53, 'latitude', '纬度', 1, 1, 0, '纬度', 5, 1, '42.12', '0');
INSERT INTO `xm_api_params` VALUES (1040, 53, 'cityName', '城市名（气象站名）', 1, 1, 1, '城市名（气象站名）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1041, 53, 'staCode', '气象站编码', 1, 1, 1, '气象站编码', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1076, 21, 'user_name', '用户名', 1, 1, 0, '用户名', 5, 1, 'admin', '0');
INSERT INTO `xm_api_params` VALUES (1077, 21, 'passwd', '密码', 1, 1, 0, '密码', 5, 1, '123', '0');
INSERT INTO `xm_api_params` VALUES (1106, 23, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (1107, 23, 'vcareaName', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1108, 23, 'vcparceldesc', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1109, 23, 'varietyName', '品种名称', 1, 1, 1, '品种名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1110, 23, 'varietyfeatures', '品种特点', 1, 1, 1, '品种特点', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1111, 23, 'suitablearea', '适种区域', 1, 1, 1, '适种区域', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1112, 23, 'currentcycle', '当前生育周期', 1, 1, 1, '当前生育周期', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1113, 23, 'cropname', '作物名称', 1, 1, 1, '作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1114, 23, 'total_days', '生育周期总天数', 1, 1, 1, '生育周期总天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1115, 23, 'remain_days', '生育周期剩余天数', 1, 1, 1, '生育周期剩余天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1116, 23, 'cycledata', '生育周期数据', 1, 1, 1, '生育周期数据', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1117, 23, 'workCycle', '该生育期名称', 1, 1, 1, '该生育期名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1118, 23, 'cycledays', '该生育期天数', 1, 1, 1, '该生育期天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1119, 23, 'startTime', '该生育开始时间', 1, 1, 1, '该生育开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1120, 23, 'endTime', '该生育期结束时间', 1, 1, 1, '该生育期结束时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1121, 23, 'pic', '作物图片', 1, 1, 1, '作物图片', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1122, 39, 'project_id', '项目ID', 1, 1, 0, '项目ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1123, 39, 'context', '时间格式', 1, 1, 0, '时间格式 0:过去30天，1：过去12个月', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1124, 39, 'wet', '相对湿度', 1, 1, 1, '相对湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1125, 39, 'date', '日期时间', 1, 1, 1, '日期时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1126, 39, 'max', '最大湿度', 1, 1, 1, '最大湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1175, 42, 'cropId', '作物id', 1, 1, 0, '作物id', 5, 1, '19', '0');
INSERT INTO `xm_api_params` VALUES (1176, 42, 'plan_type', '作物种植状态', 1, 1, 0, '作物种植状态  0 全部，1 计划， 2 种植中， 3， 历史种植', 5, 1, '2', '0');
INSERT INTO `xm_api_params` VALUES (1177, 42, 'block_id', '地块id', 1, 1, 0, '地块id', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (1178, 42, 'plantId', '计划id', 1, 1, 1, '计划id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1179, 42, 'cropId', '作物id', 1, 1, 1, '作物id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1180, 42, 'plantarea', '作物种植面积', 1, 1, 1, '作物种植面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1181, 42, 'planttime', '计划生成时间', 1, 1, 1, '计划生成时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1182, 42, 'starttime', '作物种植时间', 1, 1, 1, '作物种植时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1183, 42, 'endtime', '作物收获时间', 1, 1, 1, '作物收获时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1184, 42, 'block_name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1185, 42, 'crop_name', '作物种类名称', 1, 1, 1, '作物种类名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1186, 42, 'varietyname', '作物品种名称', 1, 1, 1, '作物品种名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1187, 42, 'variety_pic', '作物图片地址', 1, 1, 1, '作物图片地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1188, 42, 'work_cycle', '生育期阶段', 1, 1, 1, '生育期阶段', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1189, 42, 'block_id', '地块id', 1, 1, 1, '地块id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1190, 42, 'total_days', '种植计划总天数', 1, 1, 1, '种植计划总天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1191, 43, 'id', '基地id', 1, 1, 0, '基地id', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1192, 43, 'id', '基地id', 1, 1, 1, '基地id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1193, 43, 'name', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1194, 43, 'root_uid', '用户id', 1, 1, 1, '用户id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1195, 43, 'lon', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1196, 43, 'lat', '纬度', 1, 1, 1, '纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1197, 43, 'province_id', '省id', 1, 1, 1, '省id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1198, 43, 'city_id', '市id', 1, 1, 1, '市id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1199, 43, 'area_id', '区id', 1, 1, 1, '区id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1200, 43, 'project_area', '基地面积', 1, 1, 1, '基地面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1201, 43, 'plant_area', '种植面积', 1, 1, 1, '种植面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1202, 43, 'variety_num', '种植作物种类数量', 1, 1, 1, '种植作物种类数量', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1203, 43, 'block_num', '地块数量', 1, 1, 1, '地块数量', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1204, 43, 'wet', '湿度', 1, 1, 1, '湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1205, 43, 'air_press', '气压', 1, 1, 1, '气压', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1206, 43, 'rain', '降雨量', 1, 1, 1, '降雨量', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1207, 43, 't', '温度', 1, 1, 1, '温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1208, 43, 't_max', '最高温', 1, 1, 1, '最高温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1209, 43, 't_min', '最低温', 1, 1, 1, '最低温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1210, 43, 't_diff', '昼夜温差', 1, 1, 1, '昼夜温差', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1211, 43, 'run_time', '日照时间', 1, 1, 1, '日照时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1212, 44, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1213, 44, 'limit', '每页多少条', 1, 1, 0, '每页多少条', 5, 1, '20', '0');
INSERT INTO `xm_api_params` VALUES (1214, 44, 'p', '第几页', 1, 1, 0, '第几页', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1215, 44, 'id', '基地ID', 1, 1, 1, '基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1216, 44, 'name', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1217, 44, 'address', '地址', 1, 1, 1, '地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1218, 44, 'linkman', '联系人', 1, 1, 1, '联系人', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1219, 44, 'phone', '电话', 1, 1, 1, '电话', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1220, 44, 'project_area', '基地面积', 1, 1, 1, '基地面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1221, 44, 'plant_area', '种植面积', 1, 1, 1, '种植面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1222, 44, 'img_url', '图片地址', 1, 1, 1, '图片地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1223, 44, 'blocks', '地块信息', 1, 1, 1, '地块信息', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1224, 44, 'id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1225, 44, 'name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1226, 44, 'type', '地块类型', 1, 1, 1, '地块类型', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1227, 44, 'area', '面积', 1, 1, 1, '面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1228, 44, 'crop_type_num', '作物种类', 1, 1, 1, '作物种类', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1229, 44, 'p', '第几页', 1, 1, 1, '第几页', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1230, 44, 'pages', '一共多少页', 1, 1, 1, '一共多少页', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1231, 44, 'total', '一共多少条记录', 1, 1, 1, '一共多少条记录', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1232, 45, 'block_id', '地块ID', 1, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (1233, 45, 'id', '种植计划ID', 1, 1, 1, '种植计划ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1234, 45, 'block_id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1235, 45, 'pp_area', '排产面积', 1, 1, 1, '排产面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1236, 45, 'set_start_time', '开始时间', 1, 1, 1, '开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1237, 45, 'set_end_time', '结束时间', 1, 1, 1, '结束时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1238, 45, 'block_name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1239, 45, 'pp_crop_name', '排产作物名称', 1, 1, 1, '排产作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1240, 45, 'pp_variety_name', '排产种类名称', 1, 1, 1, '排产种类名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1241, 45, 'pp_variety_pic', '作物种类图片', 1, 1, 1, '作物种类图片', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1242, 45, 'work_cycle', '生育周期', 1, 1, 1, '生育周期', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1243, 45, 'total_days', '总天数', 1, 1, 1, '总天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1244, 45, 'finish_days', '完成天数', 1, 1, 1, '完成天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1245, 45, 'finish_percent', '完成百分比', 1, 1, 1, '完成百分比', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1246, 45, 'remain_days', '剩余天数', 1, 1, 1, '剩余天数', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1247, 45, 'plant_start_time', '种植开始时间', 1, 1, 1, '种植开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1248, 47, 'block_id', '地块ID', 2, 1, 0, '地块ID', 5, 1, '10041', '0');
INSERT INTO `xm_api_params` VALUES (1249, 47, 'name', '名称', 1, 0, 0, '名称', 5, 1, '设备图标测试', '0');
INSERT INTO `xm_api_params` VALUES (1250, 47, 'lat', '纬度', 3, 1, 0, '纬度', 5, 1, '41.870876676567', '0');
INSERT INTO `xm_api_params` VALUES (1251, 47, 'lon', '经度', 3, 1, 0, '经度', 5, 1, '119.27215741162', '0');
INSERT INTO `xm_api_params` VALUES (1252, 47, 'type', '设备类型', 2, 1, 0, '1传感器，2墒情仪，3摄像头', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1286, 22, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1287, 22, 'limit', '每页多少条', 1, 1, 0, '每页多少条', 5, 1, '20', '0');
INSERT INTO `xm_api_params` VALUES (1288, 22, 'p', '第几页', 1, 1, 0, '第几页', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1289, 22, 'id', '种植计划ID', 1, 1, 1, '种植计划ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1290, 22, 'block_id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1291, 22, 'pp_area', '排产面积', 1, 1, 1, '排产面积', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1292, 22, 'set_start_time', '排产开始时间', 1, 1, 1, '排产开始时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1293, 22, 'set_end_time', '排产结束时间', 1, 1, 1, '排产结束时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1294, 22, 'collect_time', '预计收获时间', 1, 1, 1, '预计收获时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1295, 22, 'block_name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1296, 22, 'pp_crop_name', '排产作物名称', 1, 1, 1, '排产作物名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1297, 22, 'pp_variety_name', '排产作物品种名称', 1, 1, 1, '排产作物品种名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1298, 22, 'pp_variety_pic', '图片', 1, 1, 1, '图片', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1299, 22, 'finish_percent', '完成百分比', 1, 1, 1, '完成百分比', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1300, 54, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1301, 54, 'uid', '用户ID', 1, 1, 0, '登录用户ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1302, 54, 'code', '接口返回状态码', 1, 1, 1, '200成功，其它失败', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1303, 54, 'msg', '接口返回状态消息', 1, 1, 1, '接口返回状态消息', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1304, 54, 'data', '接口返回数据', 1, 1, 1, '接口返回数据', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1305, 54, 'id', '菜单ID', 1, 1, 1, '菜单ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1306, 54, 'name', '菜单名称', 1, 1, 1, '菜单名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1307, 54, 'parent_id', '父类ID', 1, 1, 1, '如果为0，则是一级菜单', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1308, 54, 'url', '菜单url', 1, 1, 1, '跳转到指定url', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1309, 54, 'icon', '菜单图标地址', 1, 1, 1, '菜单图标地址', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1310, 54, 'child', '子菜单', 1, 1, 1, '子菜单', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1311, 55, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1312, 55, 'id', '基地ID', 1, 1, 1, '基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1313, 55, 'name', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1314, 55, 'lat', '纬度', 1, 1, 1, '纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1315, 55, 'lon', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1316, 55, 'edge_json', '边界', 1, 1, 1, '边界', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1317, 55, 'child', '子类-地块', 1, 1, 1, '子类-地块', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1318, 55, 'project_id', '父类-基地ID', 1, 1, 1, '父类-基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1319, 55, 'id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1320, 55, 'name', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1321, 55, 'edge_json', '边界', 1, 1, 1, '边界', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1322, 55, 'point', '中间点', 1, 1, 1, '包含经纬度，第一个值为纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1323, 55, 'device_point', '设备图标点json对象', 1, 1, 1, '设备点json对象（包含传感器，墒情仪、摄像头、气象站、电磁阀、网关）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1324, 55, 'sensor', '传感器', 1, 1, 1, '传感器', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1325, 55, 'sqy', '墒情仪', 1, 1, 1, '墒情仪', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1326, 55, 'video', '摄像头', 1, 1, 1, '摄像头', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1327, 55, 'qxz', '气象站', 1, 1, 1, '摄像头', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1328, 55, 'e_valve', '电磁阀', 1, 1, 1, '电磁阀', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1329, 55, 'gateway', '网关', 1, 1, 1, '网关', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1330, 55, 'id', '设备图标ID', 1, 1, 1, '设备图标ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1331, 55, 'lat', '纬度', 1, 1, 1, '纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1332, 55, 'lon', '经度', 1, 1, 1, '经度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1333, 56, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1334, 56, 'id', '基地ID', 1, 1, 1, '基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1335, 56, 'label', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1336, 56, 'children', '子类-地块', 1, 1, 1, '子类-地块', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1337, 56, 'id', '地块ID', 1, 1, 1, '地块ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1338, 56, 'label', '地块名称', 1, 1, 1, '地块名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1339, 56, 'project_id', '基地ID', 1, 1, 1, '基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1340, 57, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1341, 57, 'id', '基地ID', 1, 1, 1, '基地ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1342, 57, 'name', '基地名称', 1, 1, 1, '基地名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1343, 58, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1344, 58, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1345, 58, 'context', '上下文ID', 1, 1, 0, '0 过去30天，1 过去一年', 5, 1, '0', '0');
INSERT INTO `xm_api_params` VALUES (1346, 58, 'datatime', '时间', 1, 1, 1, '时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1347, 58, 'rain', '降水', 1, 1, 1, '降水', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1348, 58, 'rain_add', '累计降水', 1, 1, 1, '累计降水', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1349, 58, 'rain_max', '降水最大值', 1, 1, 1, '降水最大值(画图使用)', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1350, 58, 'rain_add_max', '累计降水最大值', 1, 1, 1, '累计降水最大值(画图使用)', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1351, 59, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1352, 59, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1353, 59, 'context', '上线文ID', 1, 1, 0, '0 过去30天， 1 过去一年', 5, 1, '0 过去30天， 1 过去一年', '0');
INSERT INTO `xm_api_params` VALUES (1354, 59, 'ranges', '温度范围', 1, 1, 1, '温度范围', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1355, 59, 'averages', '平均温度', 1, 1, 1, '平均温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1356, 59, 'categories', '日期', 1, 1, 1, '日期', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1357, 59, 'max', '最大值', 1, 1, 1, '最大值', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1358, 60, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1359, 60, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1360, 60, 'datatime', '数据时间', 1, 1, 1, '数据时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1361, 60, 'one', '第一阶梯（1-3级风）', 1, 1, 1, '第一阶梯（1-3级风）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1362, 60, 'two', '第二阶梯（4-6级风）', 1, 1, 1, '第二阶梯（4-6级风）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1363, 60, 'three', '第三阶梯（6级以上）', 1, 1, 1, '第三阶梯（6级以上）', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1364, 61, 'project_id', '基地ID', 1, 1, 0, '基地ID', 5, 1, '37081', '0');
INSERT INTO `xm_api_params` VALUES (1365, 61, 'province', '省', 1, 1, 1, '省', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1366, 61, 'city', '市', 1, 1, 1, '市', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1367, 61, 'today', '实时天气', 1, 1, 1, '实时天气', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1368, 61, 'datatime', '时间', 1, 1, 1, '时间', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1369, 61, 't', '温度', 1, 1, 1, '温度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1370, 61, 'lonlat', '经纬度', 1, 1, 1, '经度和纬度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1371, 61, 'week', '周几', 1, 1, 1, '周几', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1372, 61, 't_max', '最高温', 1, 1, 1, '最高温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1373, 61, 't_min', '最低温', 1, 1, 1, '最低温', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1374, 61, 'wet', '湿度', 1, 1, 1, '湿度', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1375, 61, 'rain', '降水', 1, 1, 1, '降水', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1376, 61, 'wind_direct', '风向', 1, 1, 1, '风向', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1377, 61, 'wind_speed', '风速', 1, 1, 1, '风速', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1378, 61, 'weather', '天气情况', 1, 1, 1, '天气情况', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1379, 61, 'img', '天气情况-图片', 1, 1, 1, '天气情况-图片', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1380, 61, 'sunrise', '日出', 1, 1, 1, '日出', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1381, 61, 'sunset', '日落', 1, 1, 1, '日落', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1382, 61, 'future', '预报', 1, 1, 1, '预报', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1383, 61, 'weather_code', '天气编码', 1, 1, 1, '天气编码', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1384, 61, 'img', '天气图片-上午', 1, 1, 1, '天气图片-上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1385, 61, 'img_pm', '天气图片-下午', 1, 1, 1, '天气图片-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1386, 61, 'weather', '天气上午', 1, 1, 1, '天气上午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1387, 61, 'weather_pm', '天气下午', 1, 1, 1, '天气下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1388, 61, 'wind_speed_pm', '风力等级-下午', 1, 1, 1, '风力等级-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1389, 61, 'wind_direct_pm', '风向-下午', 1, 1, 1, '风向-下午', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1390, 62, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1391, 62, 'limit', '每页几条', 1, 1, 0, '每页几条', 5, 1, '10', '0');
INSERT INTO `xm_api_params` VALUES (1392, 62, 'p', '第几页', 1, 1, 0, '第几页', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1393, 62, 'code', '状态码', 1, 1, 1, '状态码', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1394, 62, 'msg', '状态信息', 1, 1, 1, '状态信息', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1395, 62, 'data', '数据', 1, 1, 1, '数据', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1396, 62, 'id', '用户id', 1, 1, 1, '用户id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1397, 62, 'user_name', '用户名', 1, 1, 1, '用户名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1398, 62, 'real_name', '真实名称', 1, 1, 1, '真实名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1399, 62, 'status', '状态', 1, 1, 1, '状态  0：删除 1：启用 2：禁用', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1400, 62, 'phone', '手机号', 1, 1, 1, '手机号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1401, 62, 'p', '第几页', 1, 1, 1, '第几页', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1402, 62, 'total', '一共多少条', 1, 1, 1, '一共多少条', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1403, 62, 'pages', '一共多少页', 1, 1, 1, '一共多少页', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1404, 63, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1405, 63, 'user_name', '用户名', 1, 1, 0, '用户名', 5, 1, 'liweimin', '0');
INSERT INTO `xm_api_params` VALUES (1406, 63, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '13906325005', '0');
INSERT INTO `xm_api_params` VALUES (1407, 63, 'real_name', '真实姓名', 1, 1, 0, '真实姓名', 5, 1, '李维民', '0');
INSERT INTO `xm_api_params` VALUES (1408, 63, 'password', '密码', 1, 1, 0, '密码', 5, 1, '88888888', '0');
INSERT INTO `xm_api_params` VALUES (1409, 63, 'password_r', '密码', 1, 1, 0, '密码', 5, 1, '88888888', '0');
INSERT INTO `xm_api_params` VALUES (1410, 63, 'status', '角色', 1, 1, 0, '角色', 5, 1, '1,2,3', '0');
INSERT INTO `xm_api_params` VALUES (1411, 63, 'role_id', '状态', 1, 1, 0, '状态', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1412, 63, 'id', '用户ID', 1, 1, 1, '用户ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1413, 64, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1414, 64, 'id', '角色id', 1, 1, 1, '角色id', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1415, 64, 'name', '角色名称', 1, 1, 1, '角色名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1416, 64, 'descrip', '描述', 1, 1, 1, '描述', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1417, 65, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '12', '0');
INSERT INTO `xm_api_params` VALUES (1418, 65, 'user_id', '用户ID', 1, 1, 0, '用户ID', 5, 1, '39', '0');
INSERT INTO `xm_api_params` VALUES (1419, 65, 'id', '用户ID', 1, 1, 1, '用户ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1420, 65, 'user_name', '用户名', 1, 1, 1, '用户名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1421, 65, 'phone', '手机号', 1, 1, 1, '手机号', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1422, 65, 'real_name', '真实名称', 1, 1, 1, '真实名称', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1423, 65, 'status', '状态', 1, 1, 1, '状态', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1424, 65, 'role', '角色', 1, 1, 1, '角色', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1425, 65, 'id', '角色ID', 1, 1, 1, '角色ID', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1426, 65, 'name', '角色名称', 1, 1, 1, '', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1427, 66, 'user_id', '用户ID', 1, 1, 0, '用户ID', 5, 1, '93', '0');
INSERT INTO `xm_api_params` VALUES (1428, 66, 'root_uid', '根用户ID', 1, 1, 0, '登录用户的父级ID', 5, 1, '10000', '0');
INSERT INTO `xm_api_params` VALUES (1429, 66, 'phone', '手机号', 1, 1, 0, '手机号', 5, 1, '13563215569', '0');
INSERT INTO `xm_api_params` VALUES (1430, 66, 'user_name', '用户名', 1, 1, 0, '用户名', 5, 1, 'yunzhi', '0');
INSERT INTO `xm_api_params` VALUES (1431, 66, 'real_name', '真实姓名', 1, 1, 0, '真实姓名', 5, 1, '智智', '0');
INSERT INTO `xm_api_params` VALUES (1432, 66, 'password', '密码', 1, 1, 0, '密码', 5, 1, '12345678', '0');
INSERT INTO `xm_api_params` VALUES (1433, 66, 'password_r', '密码', 1, 1, 0, '密码', 5, 1, '12345678', '0');
INSERT INTO `xm_api_params` VALUES (1434, 66, 'role_id', '角色ID', 1, 1, 0, '角色ID', 5, 1, '1,2,3', '0');
INSERT INTO `xm_api_params` VALUES (1435, 66, 'status', '状态', 1, 1, 0, '状态', 5, 1, '1', '0');
INSERT INTO `xm_api_params` VALUES (1436, 67, 'id', '用户ID', 1, 1, 0, '用户ID', 5, 1, '93', '0');
INSERT INTO `xm_api_params` VALUES (1437, 68, 'url', '回调地址', 1, 1, 0, '回调地址', 5, 1, 'http://facility.klagri.com.cn', '0');
INSERT INTO `xm_api_params` VALUES (1438, 68, 'code', '中台授权码', 1, 1, 0, '中台授权码', 5, 1, 'yfStbj', '0');
INSERT INTO `xm_api_params` VALUES (1439, 68, 'access_token', 'access_token', 1, 1, 1, 'access_token', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1440, 68, 'token_type', 'token_type', 1, 1, 1, 'token_type', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1441, 68, 'refresh_token', 'refresh_token', 1, 1, 1, 'refresh_token', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1442, 68, 'expires_in', 'expires_in', 1, 1, 1, 'expires_in', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1443, 68, 'scope', 'scope', 1, 1, 1, 'scope', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1444, 69, 'token', 'access_token', 1, 1, 0, 'access_token', 5, 1, '8c53b802-0233-4e87-a5f6-a479cdfbb323', '0');
INSERT INTO `xm_api_params` VALUES (1445, 69, 'password', '密码', 1, 1, 1, '密码', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1446, 69, 'username', '用户名', 1, 1, 1, '用户名', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1447, 69, 'authorities', '权限', 1, 1, 1, '权限', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1448, 69, 'accountNonExpired', 'accountNonExpired', 1, 1, 1, 'accountNonExpired', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1449, 69, 'accountNonLocked', 'accountNonLocked', 1, 1, 1, 'accountNonLocked', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1450, 69, 'credentialsNonExpired', 'credentialsNonExpired', 1, 1, 1, 'credentialsNonExpired', 5, 0, '', '');
INSERT INTO `xm_api_params` VALUES (1451, 69, 'enabled', 'enabled', 1, 1, 1, 'enabled', 5, 0, '', '');

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
INSERT INTO `xm_api_public` VALUES ('api', '否', 'string', '接口名称.  格式为 login/login ');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `xm_menus` VALUES (22, 1, 'hosts管理', '/manage/hosts/index', 0, 500, 'fa fa-outdent', 0);

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
