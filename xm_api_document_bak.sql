/*
Navicat MySQL Data Transfer

Source Server         : xunmall本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xm_api_document

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-17 20:52:23
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
-- Records of xm_api
-- ----------------------------
INSERT INTO `xm_api` VALUES ('443', 'user/historysign', '查询签到历史记录', '18', 'official', '1', '1', '1', '1', '0', '60', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('444', 'orders/getGoodsInfo', '获取商品信息', '18', 'official', '1', '1', '1', '1', '0', '60', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('446', 'businessrecord/userRecordNew', '查询员工业务记录（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('447', 'businessrecord/businessGroupRecordNew', '业务分组记录查询（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('448', 'dataStatistics/staffOrdersStatistics', '个人订单数据统计接口（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('449', 'dataStatistics/staffBusinessStatistics', '个人业务数据统计接口（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('450', 'dataStatistics/groupOrdersStatistics', '分组订单数据统计接口（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('451', 'dataStatistics/groupBusinessStatistics', '分组业务数据统计接口（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', '', '', '', null, null);
INSERT INTO `xm_api` VALUES ('452', 'businessrecord/userBusinessGroup', '业务分组查询（H5）', '17', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('453', 'area/getSelectMessage', '获取省市部门', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('455', 'progress/getTodayProgress', '查询今日进展', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('456', 'submen/getSubmenu', '根据id,查询管理员账号显示问题列表', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('457', 'submen/getBusinessProblem', '业务问题统计', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('458', 'locationList/getCountLocation', '业务定位统计', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('459', 'staffList/getDepartmentStaff', '获取部门人员列表', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('460', 'barcode/search', '根据条形码查询商品信息', '1', 'standard', '0', '1', '1', '1', '0', '50', '', null, '1', '1', null);
INSERT INTO `xm_api` VALUES ('461', 'business/getBusinessData', '业务数据统计（H5）', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('462', 'plan/getQueryInfo', '管理员获取业务问题列表', '3', 'official', '1', '1', '1', '1', '0', '60', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('483', 'user/usergroup', '获取分组信息列表（新）', '3', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('484', 'business/getPerBusinessRank', '获取个人业务排名（2.0）', '3', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('487', 'note/addReasonable', '添加商家资料（2.1版本）', '3', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('488', 'user/updateUserCid', '登录2.1（更改Cid）', '4', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('489', 'barcode/prompt', '标准库商品没有条形码的提示信息', '1', 'standard', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('490', 'historyRecord/HistoryRecordNewData', '获取店铺历史记录(2.1)', '3', 'official', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('491', 'push/Jpush', '极光推送', '1', 'inner', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('494', 'message/agentProvince', '通过省获取运营商', '1', 'datamap', '0', '1', '1', '1', '0', '50', '', null, '', '', null);
INSERT INTO `xm_api` VALUES ('495', 'message/agentAllProvinces', '获取全国运营商', '1', 'datamap', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('496', 'message/datamapUpdateTime', '实时查询系统更新时间', '1', 'datamap', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('497', 'message/provincesCity', '通过省市获取便利店/云仓储信息', '1', 'datamap', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('502', 'user/openWms', '开通WMS', '1', 'supplier', '1', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('503', 'goods/goodsExamined', '商品上传监控接口', '1', 'standard', '0', '1', '1', '1', '0', '50', '', null, '', 'we', null);
INSERT INTO `xm_api` VALUES ('504', 'goods/goodsCategory', '商品分类', '1', 'standard', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('505', 'goods/goodsBrand', '商品品牌', '1', 'standard', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('506', 'user/openErp', '开通ERP_CS账号', '1', 'purchaser', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('507', 'user/openErpBS', '开通ERP_BS账号', '1', 'purchaser', '0', '1', '1', '1', '0', '50', null, null, null, null, null);
INSERT INTO `xm_api` VALUES ('509', 'user/login', '后台登录', '1', 'officialweb', '0', '1', '1', '1', '0', '555', '', null, '{\r\n  \"ret\": 0,\r\n  \"data\": {\r\n    \"username\": \"root\",\r\n    \"staffNum\": 1,\r\n    \"iSMorning\": \"早上好!\",\r\n    \"qrCode\": \"http://api.xunmall.com/qr/make?text=http://m.xunmall.com/site/register?staff=root\",\r\n    \"Text\": \"问候语\",\r\n    \"token\": \"0257fc611224a5e942e98239ccd232bc\"\r\n  }\r\n}', 'http://self.official-api.xunmall.com:88?api=user%2Flogin&appid=1510001&password=1234&t=1504491770&token=&uid=&username=root&s=qzD8%2BG5HOU6wubCS1BtzZkgtrDA%3D', null);
INSERT INTO `xm_api` VALUES ('510', '支付宝支付111', '支付宝支付', '13', 'purchaser', '1', '1', '1', '1', '1', '12', '支付宝支付', null, '说的是大多数', '3333', null);

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
INSERT INTO `xm_api_client` VALUES ('1510001', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'purchaser', 'Android');
INSERT INTO `xm_api_client` VALUES ('1510005', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'purchaser', 'HTML5');
INSERT INTO `xm_api_client` VALUES ('1510008', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'purchaser', 'ERP');
INSERT INTO `xm_api_client` VALUES ('1510009', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'purchaser', null);
INSERT INTO `xm_api_client` VALUES ('1520001', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'purchaser', 'IOS');
INSERT INTO `xm_api_client` VALUES ('1610001', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'official', 'Android');
INSERT INTO `xm_api_client` VALUES ('1620001', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'official', 'IOS');
INSERT INTO `xm_api_client` VALUES ('2100001', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'standard', 'supplier');
INSERT INTO `xm_api_client` VALUES ('2100002', 'hh8bf094169a40a3bd188ba37ebe872v', '1', 'datamap', '');

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
-- Records of xm_api_client_platform
-- ----------------------------
INSERT INTO `xm_api_client_platform` VALUES ('1', 'Android', '1', 'purchaser');
INSERT INTO `xm_api_client_platform` VALUES ('2', 'IOS', '2', 'purchaser');
INSERT INTO `xm_api_client_platform` VALUES ('3', 'ERP', '4', 'purchaser');
INSERT INTO `xm_api_client_platform` VALUES ('4', 'PC', '8', 'purchaser');
INSERT INTO `xm_api_client_platform` VALUES ('5', 'HTML5', '16', 'purchaser');
INSERT INTO `xm_api_client_platform` VALUES ('6', 'SUPPLIER', '32', 'inner');
INSERT INTO `xm_api_client_platform` VALUES ('7', 'WMS', '64', 'supplier');
INSERT INTO `xm_api_client_platform` VALUES ('8', 'RJTPay', '128', 'supplier');

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
INSERT INTO `xm_api_code` VALUES ('-27', '验证营业执照号重复');
INSERT INTO `xm_api_code` VALUES ('-26', '手机号重复');
INSERT INTO `xm_api_code` VALUES ('-25', '用户不存在');
INSERT INTO `xm_api_code` VALUES ('-24', '用户登录失败');
INSERT INTO `xm_api_code` VALUES ('-23', '应用不存在');
INSERT INTO `xm_api_code` VALUES ('-22', '接口不存在');
INSERT INTO `xm_api_code` VALUES ('-21', '客户端与服务器端时间差超过最大限值');
INSERT INTO `xm_api_code` VALUES ('-20', '签名错误');
INSERT INTO `xm_api_code` VALUES ('101', '预存款不足');

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
-- Records of xm_api_group
-- ----------------------------
INSERT INTO `xm_api_group` VALUES ('1', '帐户', 'purchaser', null, '5000');
INSERT INTO `xm_api_group` VALUES ('2', '集采', 'purchaser', null, '4200');
INSERT INTO `xm_api_group` VALUES ('3', '商品', 'purchaser', null, '4800');
INSERT INTO `xm_api_group` VALUES ('4', '购物车', 'purchaser', null, '4700');
INSERT INTO `xm_api_group` VALUES ('5', '订单', 'purchaser', null, '4600');
INSERT INTO `xm_api_group` VALUES ('6', '预付款', 'purchaser', null, '100');
INSERT INTO `xm_api_group` VALUES ('7', '版本', 'purchaser', null, '110');
INSERT INTO `xm_api_group` VALUES ('8', '店铺', 'purchaser', null, '120');
INSERT INTO `xm_api_group` VALUES ('9', '猫币', 'purchaser', null, '130');
INSERT INTO `xm_api_group` VALUES ('10', '红包', 'purchaser', null, '140');
INSERT INTO `xm_api_group` VALUES ('11', '收货', 'purchaser', null, '150');
INSERT INTO `xm_api_group` VALUES ('12', '评论', 'purchaser', null, '160');
INSERT INTO `xm_api_group` VALUES ('13', '购买', 'purchaser', null, '170');
INSERT INTO `xm_api_group` VALUES ('14', '文件', 'purchaser', null, '180');
INSERT INTO `xm_api_group` VALUES ('15', '移动办公1.0', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('16', '系统内部接口', 'inner', '', '50');
INSERT INTO `xm_api_group` VALUES ('17', '移动办公1.1', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('18', '店铺修改定位', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('19', '人员查询', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('20', '指定日期内的到访店铺集合', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('21', '资料提交', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('22', '店铺详情', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('23', '空一个', 'officialweb', null, '50');
INSERT INTO `xm_api_group` VALUES ('24', '店铺地图', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('25', '店铺历史记录', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('26', '订单同步相关', 'supplier', null, '50');
INSERT INTO `xm_api_group` VALUES ('27', '文件上传', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('28', '员工定位', 'official', null, '50');
INSERT INTO `xm_api_group` VALUES ('30', '官网', 'officialweb', null, '50');

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
INSERT INTO `xm_api_module` VALUES ('datamap', '实时查询系统');
INSERT INTO `xm_api_module` VALUES ('inner', '内部接口');
INSERT INTO `xm_api_module` VALUES ('landscape', '园林灌溉');
INSERT INTO `xm_api_module` VALUES ('official', '移动办公');
INSERT INTO `xm_api_module` VALUES ('officialweb', '京蓝官网');
INSERT INTO `xm_api_module` VALUES ('purchaser', '农业集采');
INSERT INTO `xm_api_module` VALUES ('standard', '标准库');
INSERT INTO `xm_api_module` VALUES ('supplier', '供应商');

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
-- Records of xm_api_params
-- ----------------------------
INSERT INTO `xm_api_params` VALUES ('84', '510', 'payment', '支付方式', '1', '1', '0', '支付方式', '5', '0', null);
INSERT INTO `xm_api_params` VALUES ('307', '460', 'barcode', '条形码', '1', '1', '0', '条形码', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('371', '503', 'barcode', '条形码', '1', '1', '0', '条形码', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('372', '503', 'goodsname', '商品名称', '1', '1', '0', '商品名称', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('373', '503', 'origin', '商品来源 1：供货商 2：便利店', '1', '1', '0', '商品来源 1：供货商 2：便利店', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('374', '503', 'cid', '商品分类id', '1', '1', '0', '商品分类id', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('375', '503', 'bid', '商品品牌id', '1', '1', '0', '商品品牌id', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('376', '503', 'goods_catid', '商品（新）分类id', '1', '1', '0', '商品（新）分类id', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('377', '503', 'goods_brandid', '商品（新）品牌id', '1', '1', '0', '商品（新）品牌id', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('378', '503', 'keyword', '商品关键词', '1', '1', '0', '商品关键词', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('379', '503', 'price', '商品参考价格', '1', '1', '0', '商品参考价格', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('380', '503', 'source', '商品原图', '1', '1', '0', '商品原图', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('381', '503', 'thumbnail_pic', '商品缩略图', '1', '1', '0', '商品缩略图', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('382', '503', 'small_pic', '商品小图', '1', '1', '0', '商品小图', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('383', '503', 'big_pic', '商品大图', '1', '1', '0', '商品大图', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('384', '503', 'intro', '商品详情', '1', '1', '0', '商品详情', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('385', '503', 'appid', 'appid', '2', '1', '0', 'appid', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('386', '503', 'createtime', '创建时间', '2', '1', '0', '创建时间', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('394', '494', 'province', '省', '1', '1', '0', '', '5', '1', '0');
INSERT INTO `xm_api_params` VALUES ('395', '494', 'city', '城市', '1', '1', '0', '', '5', '1', '0');

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
INSERT INTO `xm_auth_assignment` VALUES ('api/index', '5', '1481530999');
INSERT INTO `xm_auth_assignment` VALUES ('hah', '3', '1481268907');
INSERT INTO `xm_auth_assignment` VALUES ('manage/api/list?module_id=inner', '3', '1481164890');
INSERT INTO `xm_auth_assignment` VALUES ('permission/index', '3', '1481163852');
INSERT INTO `xm_auth_assignment` VALUES ('rbac-admin/permission', '3', '1481164849');

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
INSERT INTO `xm_auth_item` VALUES ('/manage#', '2', null, null, null, '1481162231', '1481162231');
INSERT INTO `xm_auth_item` VALUES ('/rbac-admin', '2', null, null, null, '1481163682', '1481163682');
INSERT INTO `xm_auth_item` VALUES ('api/index', '2', 'asdfasdf', null, null, '1479197575', '1479261876');
INSERT INTO `xm_auth_item` VALUES ('api/list', '2', null, null, null, '1481164048', '1481165029');
INSERT INTO `xm_auth_item` VALUES ('comment/index', '2', null, null, null, '1479267318', '1479267318');
INSERT INTO `xm_auth_item` VALUES ('hah', '1', null, null, null, '1479262423', '1479262423');
INSERT INTO `xm_auth_item` VALUES ('manage/api/list?module_id=inner', '2', null, null, null, '1481164884', '1481165111');
INSERT INTO `xm_auth_item` VALUES ('member/index', '2', null, null, null, '1481160550', '1481160550');
INSERT INTO `xm_auth_item` VALUES ('permission/index', '2', null, null, null, '1481163847', '1481165266');
INSERT INTO `xm_auth_item` VALUES ('rbac-admin', '2', null, null, null, '1481163707', '1481163707');
INSERT INTO `xm_auth_item` VALUES ('rbac-admin/permission', '2', null, null, null, '1481164841', '1481164841');

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
INSERT INTO `xm_auth_item_child` VALUES ('hah', 'api/index');
INSERT INTO `xm_auth_item_child` VALUES ('hah', 'manage/api/list?module_id=inner');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm_member
-- ----------------------------
INSERT INTO `xm_member` VALUES ('49', '15628958629@163.com', 'b7fa772fa83bf48ebeb29f5544b89f1a', '1480405598', '', 'dfg', '1481001037');

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
-- Records of xm_menus
-- ----------------------------
INSERT INTO `xm_menus` VALUES ('1', '1', '用户权限', '/rbac-admin', '0', '500', 'fa fa-suitcase', '0');
INSERT INTO `xm_menus` VALUES ('2', '1', '接口管理', '/manage/api/list', '3', '500', 'fa fa-list', '0');
INSERT INTO `xm_menus` VALUES ('3', '1', '接口模块', '/manage/api/list', '0', '500', 'fa fa-file-text', '0');
INSERT INTO `xm_menus` VALUES ('4', '1', '模块管理', '/manage/api-module/index', '3', '500', 'fa fa-file', '0');
INSERT INTO `xm_menus` VALUES ('5', '1', '分组管理', '/manage/api-group/index', '3', '500', 'fa fa-file-o', '0');
INSERT INTO `xm_menus` VALUES ('6', '1', '供应商', '/manage/api/list?module_id=supplier', '3', '500', 'fa fa-file-text-o', '0');
INSERT INTO `xm_menus` VALUES ('7', '1', '角色列表', '/rbac-admin/role', '1', '500', 'fa fa-file-text', '0');
INSERT INTO `xm_menus` VALUES ('8', '1', '分配权限', '/rbac-admin/assignment', '1', '500', 'fa fa-list-alt', '0');
INSERT INTO `xm_menus` VALUES ('9', '1', '权限列表', '/rbac-admin/permission', '1', '500', 'fa fa-list-ul', '0');
INSERT INTO `xm_menus` VALUES ('10', '1', '规则列表', '/rbac-admin/rule', '1', '500', 'fa fa-outdent', '0');
INSERT INTO `xm_menus` VALUES ('13', '1', '用户管理', '/manage/member/index', '0', '500', 'fa fa-github-alt', '0');
INSERT INTO `xm_menus` VALUES ('14', '1', '标准库', '/manage/api/list?module_id=standard', '3', '500', 'fa fa-github-alt', '0');
INSERT INTO `xm_menus` VALUES ('15', '1', '京蓝官网', '/manage/api/list?module_id=officialweb', '3', '500', 'fa fa-suitcase', '0');
INSERT INTO `xm_menus` VALUES ('16', '1', '测试', '#', '3', '500', null, '0');

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

-- ----------------------------
-- Records of xm_users
-- ----------------------------
INSERT INTO `xm_users` VALUES ('1', 'admin', '1234', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '55', '10', '1473213423', '1473213423', '/static/portrait/admin@1473323616.jpg', '', '', '0');
INSERT INTO `xm_users` VALUES ('3', 'root', '1233', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '123', '10', '1473213423', '1473213423', '/static/portrait/admin@1473323616.jpg', '', '', '0');
INSERT INTO `xm_users` VALUES ('5', 'liudejin', '13456', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '589', '10', '1481247329', null, '/static/portrait/admin@1473323616.jpg', '1255537654@qq.com', '', '0');
INSERT INTO `xm_users` VALUES ('7', 'wbb', '1255816179', '$2y$13$eNRRZBeHd0I2tTEjoUNu6OaFcg0uJyrAtvpZikr.Sjsh8x6kROpx6', null, '10', '1484706806', '1484706806', '/static/portrait/admin@1473323616.jpg', '2311230118@qq.com', '', '0');
INSERT INTO `xm_users` VALUES ('8', 'caiguoqing', '23124', '$2y$13$juMpjBHP1LdifP5IwPd.uOidGUw1Ff/oXCe6WE7BBBUSNGNgHUTlK', '23', '10', '1484706806', '1484706806', '/static/portrait/admin@1473323616.jpg', '23112301182@qq.com', '', '0');
