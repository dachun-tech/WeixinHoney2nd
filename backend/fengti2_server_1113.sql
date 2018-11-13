/*
Navicat MySQL Data Transfer

Source Server         : fengti
Source Server Version : 50173
Source Host           : 39.107.226.107:3306
Source Database       : fengti2

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-11-13 20:42:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accept_address
-- ----------------------------
DROP TABLE IF EXISTS `accept_address`;
CREATE TABLE `accept_address` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'id of user who set this address as receive address',
  `name` varchar(20) DEFAULT NULL COMMENT 'receiver name',
  `phone` varchar(20) DEFAULT NULL COMMENT 'reciever phone number',
  `province` varchar(20) DEFAULT NULL COMMENT 'province of receiver''s address',
  `city` varchar(20) DEFAULT NULL COMMENT 'city of receiver''s address',
  `area` varchar(20) DEFAULT NULL COMMENT 'area of receiver''s address',
  `detail_address` varchar(255) DEFAULT NULL COMMENT 'detail address of address except province,city and area',
  `email` varchar(50) DEFAULT NULL COMMENT 'email of receiver',
  `state` tinyint(1) DEFAULT '0' COMMENT 'state of main address',
  `is_deleted` smallint(6) DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accept_address
-- ----------------------------
INSERT INTO `accept_address` VALUES ('193', '962', '刘延龙', '18846140810', '8', '62', '644', '哈尔滨工程大学(南岗区南通大街145号)', '150000', '1', '0');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `userId` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL COMMENT 'nickname or email of administrator',
  `name` varchar(30) DEFAULT NULL COMMENT 'name of administrator',
  `roleId` smallint(6) DEFAULT NULL COMMENT 'role of administrator',
  `password` varchar(50) DEFAULT NULL COMMENT 'password into backend',
  `isDeleted` smallint(6) DEFAULT '0' COMMENT 'state of delete',
  `createdDtm` datetime DEFAULT NULL COMMENT 'creation time',
  `createdBy` bigint(20) DEFAULT NULL COMMENT 'user id of creator',
  `updatedBy` bigint(20) DEFAULT NULL COMMENT 'user id of update',
  `updatedDtm` datetime DEFAULT NULL COMMENT 'update time',
  `dsf` binary(1) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'pik', 'pik', '1', 'c31b32364ce19ca8fcd150a417ecce58', '0', '2018-03-13 12:30:51', null, '1', '2018-03-26 03:56:32', null);
INSERT INTO `admin` VALUES ('3', 'maochengxuan', 'mcx', '4', '1a20dad5bc1cb57b6aa6bf1d4a36d3f1', '0', '2018-05-20 12:07:17', '1', null, null, null);

-- ----------------------------
-- Table structure for alarm_admin
-- ----------------------------
DROP TABLE IF EXISTS `alarm_admin`;
CREATE TABLE `alarm_admin` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL COMMENT 'type of alarm(<3)',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'id of user create alarm',
  `good_id` int(11) DEFAULT NULL COMMENT 'id of goods(optional based on type)',
  `submit_time` datetime DEFAULT NULL COMMENT 'time of alarm created',
  `is_read` tinyint(4) DEFAULT '0' COMMENT 'state of admin read alarm',
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_admin
-- ----------------------------
INSERT INTO `alarm_admin` VALUES ('1030', '0', '961', null, '2018-11-01 22:07:10', '0');
INSERT INTO `alarm_admin` VALUES ('1031', '0', '962', null, '2018-11-01 22:21:28', '0');
INSERT INTO `alarm_admin` VALUES ('1032', '0', '965', null, '2018-11-02 07:48:33', '0');
INSERT INTO `alarm_admin` VALUES ('1033', '0', '956', null, '2018-11-02 11:50:22', '0');
INSERT INTO `alarm_admin` VALUES ('1034', '0', '970', null, '2018-11-02 14:26:02', '0');
INSERT INTO `alarm_admin` VALUES ('1035', '0', '964', null, '2018-11-02 17:55:26', '0');
INSERT INTO `alarm_admin` VALUES ('1036', '0', '967', null, '2018-11-02 17:59:10', '0');
INSERT INTO `alarm_admin` VALUES ('1037', '0', '968', null, '2018-11-02 18:03:41', '0');
INSERT INTO `alarm_admin` VALUES ('1038', '0', '963', null, '2018-11-02 21:50:06', '0');
INSERT INTO `alarm_admin` VALUES ('1039', '0', '962', null, '2018-11-06 07:29:00', '0');
INSERT INTO `alarm_admin` VALUES ('1040', '0', '1012', null, '2018-11-11 08:43:43', '0');
INSERT INTO `alarm_admin` VALUES ('1041', '2', '962', '67', '2018-11-12 13:24:27', '0');

-- ----------------------------
-- Table structure for alarm_user
-- ----------------------------
DROP TABLE IF EXISTS `alarm_user`;
CREATE TABLE `alarm_user` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'id of user that receive this alarm',
  `type` int(11) DEFAULT NULL COMMENT 'type of alarm(<10)',
  `event_type` varchar(100) DEFAULT NULL,
  `alarm_org_id` bigint(20) DEFAULT NULL COMMENT 'id of user that create alarm',
  `submit_time` datetime DEFAULT NULL COMMENT 'time of alarm created',
  `is_read` smallint(6) DEFAULT '0',
  `is_sent` tinyint(4) DEFAULT '0' COMMENT 'state of sent for booking type=3',
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=4530 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_user
-- ----------------------------
INSERT INTO `alarm_user` VALUES ('4301', '961', '6', null, null, '2018-11-01 22:08:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4302', '961', '3', '你手机', '961', '2018-11-01 22:11:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4303', '961', '9', '你手机', '961', '2018-11-01 22:11:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4304', '961', '14', '是你说场馆1号,2号场地', '961', '2018-11-01 22:12:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4305', '961', '16', '是你说场馆1号,2号场地', '961', '2018-11-01 22:12:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4306', '962', '6', null, null, '2018-11-01 22:26:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4307', '962', '3', '运动锦鲤报名', '962', '2018-11-01 22:34:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4308', '962', '9', '运动锦鲤报名', '962', '2018-11-01 22:34:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4309', '962', '3', '运动锦鲤报名', '963', '2018-11-01 23:31:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4310', '963', '9', '运动锦鲤报名', '962', '2018-11-01 23:31:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4311', '962', '3', '运动锦鲤报名', '964', '2018-11-02 03:05:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4312', '964', '9', '运动锦鲤报名', '962', '2018-11-02 03:05:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4313', '962', '3', '运动锦鲤报名', '965', '2018-11-02 07:54:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4314', '965', '9', '运动锦鲤报名', '962', '2018-11-02 07:54:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4315', '962', '3', '哈尔滨大学生创业大赛决赛报名', '964', '2018-11-02 09:50:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4316', '964', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 09:50:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4317', '962', '3', '哈尔滨大学生创业大赛决赛报名', '967', '2018-11-02 09:51:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4318', '967', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 09:51:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4319', '962', '3', '哈尔滨大学生创业大赛决赛报名', '963', '2018-11-02 09:53:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4320', '963', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 09:53:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4321', '962', '3', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 09:55:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4322', '962', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 09:55:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4323', '962', '3', '哈尔滨大学生创业大赛决赛报名', '965', '2018-11-02 10:25:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4324', '965', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 10:25:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4325', '962', '3', '哈尔滨大学生创业大赛决赛报名', '968', '2018-11-02 10:58:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4326', '968', '9', '哈尔滨大学生创业大赛决赛报名', '962', '2018-11-02 10:58:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4327', '956', '6', null, null, '2018-11-02 11:50:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4328', '964', '6', null, null, '2018-11-02 17:56:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4329', '967', '6', null, null, '2018-11-02 18:00:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4330', '968', '6', null, null, '2018-11-02 18:07:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4331', '968', '20', null, '962', '2018-11-02 20:11:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4332', '964', '20', null, '962', '2018-11-02 20:11:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4333', '967', '20', null, '962', '2018-11-02 20:11:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4334', '963', '20', null, '962', '2018-11-02 20:11:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4335', '965', '20', null, '962', '2018-11-02 20:11:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4336', '963', '6', null, null, '2018-11-02 21:51:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4337', '961', '4', '你手机', '961', '2018-11-02 23:55:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4338', '961', '8', '你手机', null, '2018-11-02 23:55:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4339', '964', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4340', '967', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4341', '963', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4342', '962', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4343', '965', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4344', '968', '9', '哈尔滨大学生创业大赛决赛报名', null, '2018-11-03 06:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4345', '967', '3', '锐羽青年培训体验班', '963', '2018-11-03 08:16:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4346', '963', '9', '锐羽青年培训体验班', '967', '2018-11-03 08:16:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4347', '963', '9', '锐羽青年培训体验班', null, '2018-11-03 13:30:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4348', '964', '5', null, null, '2018-11-03 19:11:07', '0', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4349', '967', '5', null, null, '2018-11-03 19:11:07', '1', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4350', '963', '5', null, null, '2018-11-03 19:11:07', '1', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4351', '962', '5', null, null, '2018-11-03 19:11:07', '1', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4352', '965', '5', null, null, '2018-11-03 19:11:07', '1', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4353', '968', '5', null, null, '2018-11-03 19:11:07', '1', '0', '1266');
INSERT INTO `alarm_user` VALUES ('4354', '963', '5', null, null, '2018-11-03 22:24:15', '1', '0', '1274');
INSERT INTO `alarm_user` VALUES ('4355', '968', '3', '热身教学', '962', '2018-11-03 23:07:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4356', '962', '9', '热身教学', '968', '2018-11-03 23:07:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4357', '968', '3', '热身教学', '965', '2018-11-03 23:11:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4358', '965', '9', '热身教学', '968', '2018-11-03 23:11:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4359', '968', '3', '热身教学', '983', '2018-11-03 23:22:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4360', '983', '9', '热身教学', '968', '2018-11-03 23:22:32', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4361', '968', '3', '热身教学', '967', '2018-11-03 23:34:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4362', '967', '9', '热身教学', '968', '2018-11-03 23:34:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4363', '968', '3', '热身教学', '963', '2018-11-03 23:46:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4364', '963', '9', '热身教学', '968', '2018-11-03 23:46:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4365', '968', '3', '热身教学', '984', '2018-11-03 23:54:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4366', '984', '9', '热身教学', '968', '2018-11-03 23:54:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4367', '964', '3', '青少年篮球培训', '967', '2018-11-04 14:35:39', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4368', '967', '9', '青少年篮球培训', '964', '2018-11-04 14:35:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4369', '962', '3', '运动锦鲤报名', '967', '2018-11-04 14:35:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4370', '967', '9', '运动锦鲤报名', '962', '2018-11-04 14:35:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4371', '962', '3', '活动7', '967', '2018-11-04 15:01:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4372', '967', '9', '活动7', '962', '2018-11-04 15:01:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4373', '962', '3', '活动7', '985', '2018-11-04 15:07:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4374', '985', '9', '活动7', '962', '2018-11-04 15:07:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4375', '962', '3', '活动7', '984', '2018-11-04 20:42:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4376', '984', '9', '活动7', '962', '2018-11-04 20:42:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4377', '967', '5', null, null, '2018-11-05 09:50:44', '1', '0', '1279');
INSERT INTO `alarm_user` VALUES ('4378', '967', '9', '活动7', null, '2018-11-05 10:11:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4379', '985', '9', '活动7', null, '2018-11-05 10:11:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4380', '984', '9', '活动7', null, '2018-11-05 10:11:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4381', '962', '3', '活动8', '964', '2018-11-05 10:14:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4382', '964', '9', '活动8', '962', '2018-11-05 10:14:10', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4383', '962', '3', '活动8', '968', '2018-11-05 10:14:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4384', '968', '9', '活动8', '962', '2018-11-05 10:14:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4385', '985', '20', null, '962', '2018-11-05 10:55:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4386', '984', '20', null, '962', '2018-11-05 10:55:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4387', '962', '3', '活动8', '984', '2018-11-05 11:03:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4388', '984', '9', '活动8', '962', '2018-11-05 11:03:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4389', '962', '3', '活动8', '983', '2018-11-05 11:51:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4390', '983', '9', '活动8', '962', '2018-11-05 11:51:18', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4391', '967', '5', null, null, '2018-11-05 15:32:16', '1', '0', '1280');
INSERT INTO `alarm_user` VALUES ('4392', '985', '5', null, null, '2018-11-05 15:32:16', '1', '0', '1280');
INSERT INTO `alarm_user` VALUES ('4393', '984', '5', null, null, '2018-11-05 15:32:16', '1', '0', '1280');
INSERT INTO `alarm_user` VALUES ('4394', '964', '9', '活动8', null, '2018-11-06 07:27:17', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4395', '968', '9', '活动8', null, '2018-11-06 07:27:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4396', '984', '9', '活动8', null, '2018-11-06 07:27:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4397', '983', '9', '活动8', null, '2018-11-06 07:27:17', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4398', '962', '6', null, null, '2018-11-06 07:36:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4399', '962', '14', '哈尔滨工程大学军工足球场地场馆中间场地场地', '962', '2018-11-06 10:20:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4400', '962', '16', '哈尔滨工程大学军工足球场地场馆中间场地场地', '962', '2018-11-06 10:20:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4401', '964', '3', '一起打篮球', '967', '2018-11-06 10:27:14', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4402', '967', '9', '一起打篮球', '964', '2018-11-06 10:27:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4403', '964', '3', '一起打篮球', '968', '2018-11-06 10:27:14', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4404', '968', '9', '一起打篮球', '964', '2018-11-06 10:27:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4405', '964', '3', '一起打篮球', '962', '2018-11-06 10:27:24', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4406', '962', '9', '一起打篮球', '964', '2018-11-06 10:27:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4407', '964', '3', '一起打篮球', '963', '2018-11-06 10:31:33', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4408', '963', '9', '一起打篮球', '964', '2018-11-06 10:31:33', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4409', '964', '3', '一起打篮球', '984', '2018-11-06 10:47:17', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4410', '984', '9', '一起打篮球', '964', '2018-11-06 10:47:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4411', '956', '14', '我的体育场馆1号场,2号场,3号场场地', '956', '2018-11-06 13:10:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4412', '956', '16', '我的体育场馆1号场,2号场,3号场场地', '956', '2018-11-06 13:10:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4413', '967', '3', '打球送U盘', '962', '2018-11-07 07:37:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4414', '962', '9', '打球送U盘', '967', '2018-11-07 07:37:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4415', '967', '3', '打球送U盘', '968', '2018-11-07 07:51:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4416', '968', '9', '打球送U盘', '967', '2018-11-07 07:51:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4417', '967', '3', '打球送U盘', '984', '2018-11-07 07:54:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4418', '984', '9', '打球送U盘', '967', '2018-11-07 07:54:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4419', '967', '3', '打球送U盘', '964', '2018-11-07 07:59:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4420', '964', '9', '打球送U盘', '967', '2018-11-07 07:59:15', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4421', '967', '3', '打球送U盘', '963', '2018-11-07 09:52:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4422', '963', '9', '打球送U盘', '967', '2018-11-07 09:52:56', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4423', '967', '3', '打球送U盘', '985', '2018-11-07 10:56:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4424', '985', '9', '打球送U盘', '967', '2018-11-07 10:56:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4425', '963', '3', '学累了？来一起撸铁吧！', '967', '2018-11-07 12:23:30', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4426', '967', '9', '学累了？来一起撸铁吧！', '963', '2018-11-07 12:23:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4427', '963', '3', '学累了？来一起撸铁吧！', '962', '2018-11-07 12:27:07', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4428', '962', '9', '学累了？来一起撸铁吧！', '963', '2018-11-07 12:27:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4429', '963', '3', '学累了？来一起撸铁吧！', '983', '2018-11-07 18:44:26', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4430', '983', '9', '学累了？来一起撸铁吧！', '963', '2018-11-07 18:44:26', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4431', '967', '9', '学累了？来一起撸铁吧！', null, '2018-11-08 07:44:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4432', '962', '9', '学累了？来一起撸铁吧！', null, '2018-11-08 07:44:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4433', '983', '9', '学累了？来一起撸铁吧！', null, '2018-11-08 07:44:46', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4434', '962', '3', '本周六中午聚餐，有时间吗？', '984', '2018-11-08 07:57:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4435', '984', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 07:57:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4436', '962', '3', '本周六中午聚餐，有时间吗？', '964', '2018-11-08 08:10:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4437', '964', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 08:10:24', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4438', '962', '3', '本周六中午聚餐，有时间吗？', '968', '2018-11-08 08:13:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4439', '968', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 08:13:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4440', '962', '3', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 10:02:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4441', '962', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 10:02:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4442', '962', '3', '本周六中午聚餐，有时间吗？', '983', '2018-11-08 10:03:08', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4443', '983', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 10:03:08', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4444', '962', '3', '本周六中午聚餐，有时间吗？', '985', '2018-11-08 10:04:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4445', '985', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 10:04:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4446', '962', '3', '本周六中午聚餐，有时间吗？', '967', '2018-11-08 10:07:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4447', '967', '9', '本周六中午聚餐，有时间吗？', '962', '2018-11-08 10:07:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4448', '962', '5', null, null, '2018-11-08 10:55:16', '1', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4449', '968', '5', null, null, '2018-11-08 10:55:16', '1', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4450', '984', '5', null, null, '2018-11-08 10:55:16', '1', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4451', '964', '5', null, null, '2018-11-08 10:55:16', '0', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4452', '963', '5', null, null, '2018-11-08 10:55:16', '0', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4453', '985', '5', null, null, '2018-11-08 10:55:16', '1', '0', '1283');
INSERT INTO `alarm_user` VALUES ('4454', '956', '13', '赛事测试', '956', '2018-11-09 02:24:25', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4455', '956', '14', '我的体育场馆1号场,2号场场地', '956', '2018-11-09 02:48:09', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4456', '956', '16', '我的体育场馆1号场,2号场场地', '956', '2018-11-09 02:48:09', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4457', '961', '3', '世界上', '961', '2018-11-09 09:21:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4458', '961', '9', '世界上', '961', '2018-11-09 09:21:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4459', '956', '13', '赛事测试', '956', '2018-11-09 09:51:09', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4460', '961', '13', '赛事测试', '961', '2018-11-09 10:17:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4461', '956', '13', '赛事测试', '956', '2018-11-09 10:25:08', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4462', '956', '3', '测试活动测试活动测试活动测试活动', '956', '2018-11-09 11:21:46', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4463', '956', '9', '测试活动测试活动测试活动测试活动', '956', '2018-11-09 11:21:46', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4464', '1059', '13', '2018-2019“蜂体杯”冬季室内足球联赛竞赛规程', '1059', '2018-11-09 14:40:35', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4465', '961', '14', '是你说场馆1号,2号场地', '961', '2018-11-09 16:12:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4466', '961', '16', '是你说场馆1号,2号场地', '961', '2018-11-09 16:12:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4467', '962', '14', '哈尔滨工程大学军工足球场地场馆3号场地场地', '962', '2018-11-09 16:21:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4468', '962', '16', '哈尔滨工程大学军工足球场地场馆3号场地场地', '962', '2018-11-09 16:21:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4469', '962', '18', '哈尔滨工程大学军工足球场地场馆3号场地场地', '962', '2018-11-09 16:23:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4470', '962', '17', '哈尔滨工程大学军工足球场地场馆3号场地场地', '962', '2018-11-09 16:23:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4471', '965', '3', 'OK', '962', '2018-11-09 18:56:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4472', '962', '9', 'OK', '965', '2018-11-09 18:56:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4473', '965', '3', 'OK', '965', '2018-11-09 18:57:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4474', '965', '9', 'OK', '965', '2018-11-09 18:57:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4475', '961', '13', '赛事赛事', '961', '2018-11-09 19:14:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4476', '984', '15', '测试测试', '984', '2018-11-09 21:17:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4477', '963', '15', '测试测试', '963', '2018-11-09 21:21:27', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4478', '962', '15', '测试测试', '962', '2018-11-09 21:23:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4479', '961', '4', '世界上', '961', '2018-11-09 23:09:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4480', '961', '8', '世界上', null, '2018-11-09 23:09:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4481', '961', '3', '世界上', '961', '2018-11-09 23:09:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4482', '961', '9', '世界上', '961', '2018-11-09 23:09:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4483', '1059', '5', null, null, '2018-11-10 00:59:32', '0', '0', '1290');
INSERT INTO `alarm_user` VALUES ('4484', '961', '4', '世界上', '961', '2018-11-10 01:01:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4485', '961', '8', '世界上', null, '2018-11-10 01:01:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4486', '984', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4487', '964', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4488', '968', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4489', '962', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4490', '983', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4491', '985', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4492', '967', '9', '本周六中午聚餐，有时间吗？', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4493', '956', '9', '测试活动测试活动测试活动测试活动', null, '2018-11-10 09:11:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4494', '967', '5', null, null, '2018-11-10 11:33:07', '0', '0', '1284');
INSERT INTO `alarm_user` VALUES ('4495', '962', '5', null, null, '2018-11-10 11:33:07', '1', '0', '1284');
INSERT INTO `alarm_user` VALUES ('4496', '983', '5', null, null, '2018-11-10 11:33:07', '0', '0', '1284');
INSERT INTO `alarm_user` VALUES ('4497', '984', '5', null, null, '2018-11-10 15:03:15', '1', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4498', '964', '5', null, null, '2018-11-10 15:03:15', '0', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4499', '968', '5', null, null, '2018-11-10 15:03:15', '0', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4500', '962', '5', null, null, '2018-11-10 15:03:15', '1', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4501', '983', '5', null, null, '2018-11-10 15:03:15', '0', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4502', '985', '5', null, null, '2018-11-10 15:03:15', '0', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4503', '967', '5', null, null, '2018-11-10 15:03:15', '0', '0', '1285');
INSERT INTO `alarm_user` VALUES ('4504', '962', '9', 'OK', null, '2018-11-10 15:03:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4505', '965', '9', 'OK', null, '2018-11-10 15:03:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4506', '961', '3', '世界上', '961', '2018-11-10 15:40:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4507', '961', '9', '世界上', '961', '2018-11-10 15:40:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4508', '961', '4', '世界上', '961', '2018-11-10 15:47:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4509', '961', '8', '世界上', null, '2018-11-10 15:47:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4510', '961', '3', '世界上', '961', '2018-11-10 15:47:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4511', '961', '9', '世界上', '961', '2018-11-10 15:47:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4512', '962', '5', null, null, '2018-11-11 01:42:40', '1', '0', '1303');
INSERT INTO `alarm_user` VALUES ('4513', '965', '5', null, null, '2018-11-11 01:42:40', '1', '0', '1303');
INSERT INTO `alarm_user` VALUES ('4514', '961', '4', '世界上', '961', '2018-11-11 02:59:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4515', '961', '8', '世界上', null, '2018-11-11 02:59:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4516', '961', '3', '世界上', '961', '2018-11-11 03:00:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4517', '961', '9', '世界上', '961', '2018-11-11 03:00:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4518', '965', '3', '喝茶练字桌游', '962', '2018-11-11 08:14:37', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4519', '962', '9', '喝茶练字桌游', '965', '2018-11-11 08:14:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4520', '965', '3', '喝茶练字桌游', '965', '2018-11-11 08:14:49', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4521', '965', '9', '喝茶练字桌游', '965', '2018-11-11 08:14:49', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4522', '1012', '6', null, null, '2018-11-11 08:45:45', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4523', '961', '20', null, '961', '2018-11-11 15:25:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4524', '961', '9', '赛事测试赛事测试赛事测试赛事测试赛事测试赛事测试', null, '2018-11-12 09:51:50', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4525', '961', '9', '世界上', null, '2018-11-13 10:10:14', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4526', '962', '9', '喝茶练字桌游', null, '2018-11-13 10:10:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('4527', '965', '9', '喝茶练字桌游', null, '2018-11-13 10:10:14', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('4528', '962', '5', null, null, '2018-11-13 18:48:45', '0', '0', '1308');
INSERT INTO `alarm_user` VALUES ('4529', '965', '5', null, null, '2018-11-13 18:48:45', '0', '0', '1308');

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(50) DEFAULT NULL,
  `AREA` varchar(60) DEFAULT NULL,
  `cityid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `areas` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `areas` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `areas` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `areas` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `areas` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `areas` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `areas` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `areas` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `areas` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `areas` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `areas` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `areas` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `areas` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `areas` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `areas` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `areas` VALUES ('17', '110228', '密云县', '110200');
INSERT INTO `areas` VALUES ('18', '110229', '延庆县', '110200');
INSERT INTO `areas` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `areas` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `areas` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `areas` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `areas` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `areas` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `areas` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `areas` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `areas` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `areas` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `areas` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `areas` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `areas` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `areas` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `areas` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `areas` VALUES ('34', '120221', '宁河县', '120200');
INSERT INTO `areas` VALUES ('35', '120223', '静海县', '120200');
INSERT INTO `areas` VALUES ('36', '120225', '蓟　县', '120200');
INSERT INTO `areas` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `areas` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `areas` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `areas` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `areas` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `areas` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `areas` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `areas` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `areas` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `areas` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `areas` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `areas` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `areas` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `areas` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `areas` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `areas` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `areas` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `areas` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `areas` VALUES ('55', '130133', '赵　县', '130100');
INSERT INTO `areas` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `areas` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `areas` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `areas` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `areas` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `areas` VALUES ('61', '130201', '市辖区', '130200');
INSERT INTO `areas` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `areas` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `areas` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `areas` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `areas` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `areas` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `areas` VALUES ('68', '130223', '滦　县', '130200');
INSERT INTO `areas` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `areas` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `areas` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `areas` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `areas` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `areas` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `areas` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `areas` VALUES ('76', '130301', '市辖区', '130300');
INSERT INTO `areas` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `areas` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `areas` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `areas` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `areas` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `areas` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `areas` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `areas` VALUES ('84', '130401', '市辖区', '130400');
INSERT INTO `areas` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `areas` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `areas` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `areas` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `areas` VALUES ('89', '130421', '邯郸县', '130400');
INSERT INTO `areas` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `areas` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `areas` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `areas` VALUES ('93', '130426', '涉　县', '130400');
INSERT INTO `areas` VALUES ('94', '130427', '磁　县', '130400');
INSERT INTO `areas` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `areas` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `areas` VALUES ('97', '130430', '邱　县', '130400');
INSERT INTO `areas` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `areas` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `areas` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `areas` VALUES ('101', '130434', '魏　县', '130400');
INSERT INTO `areas` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `areas` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `areas` VALUES ('104', '130501', '市辖区', '130500');
INSERT INTO `areas` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `areas` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `areas` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `areas` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `areas` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `areas` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `areas` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `areas` VALUES ('112', '130526', '任　县', '130500');
INSERT INTO `areas` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `areas` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `areas` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `areas` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `areas` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `areas` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `areas` VALUES ('119', '130533', '威　县', '130500');
INSERT INTO `areas` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `areas` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `areas` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `areas` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `areas` VALUES ('124', '130601', '市辖区', '130600');
INSERT INTO `areas` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `areas` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `areas` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `areas` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `areas` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `areas` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `areas` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `areas` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `areas` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `areas` VALUES ('134', '130627', '唐　县', '130600');
INSERT INTO `areas` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `areas` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `areas` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `areas` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `areas` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `areas` VALUES ('140', '130633', '易　县', '130600');
INSERT INTO `areas` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `areas` VALUES ('142', '130635', '蠡　县', '130600');
INSERT INTO `areas` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `areas` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `areas` VALUES ('145', '130638', '雄　县', '130600');
INSERT INTO `areas` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `areas` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `areas` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `areas` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `areas` VALUES ('150', '130701', '市辖区', '130700');
INSERT INTO `areas` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `areas` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `areas` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `areas` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `areas` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `areas` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `areas` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `areas` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `areas` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `areas` VALUES ('160', '130726', '蔚　县', '130700');
INSERT INTO `areas` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `areas` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `areas` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `areas` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `areas` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `areas` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `areas` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `areas` VALUES ('168', '130801', '市辖区', '130800');
INSERT INTO `areas` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `areas` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `areas` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `areas` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `areas` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `areas` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `areas` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `areas` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `areas` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `areas` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `areas` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `areas` VALUES ('180', '130901', '市辖区', '130900');
INSERT INTO `areas` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `areas` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `areas` VALUES ('183', '130921', '沧　县', '130900');
INSERT INTO `areas` VALUES ('184', '130922', '青　县', '130900');
INSERT INTO `areas` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `areas` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `areas` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `areas` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `areas` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `areas` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `areas` VALUES ('191', '130929', '献　县', '130900');
INSERT INTO `areas` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `areas` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `areas` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `areas` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `areas` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `areas` VALUES ('197', '131001', '市辖区', '131000');
INSERT INTO `areas` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `areas` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `areas` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `areas` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `areas` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `areas` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `areas` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `areas` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `areas` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `areas` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `areas` VALUES ('208', '131101', '市辖区', '131100');
INSERT INTO `areas` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `areas` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `areas` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `areas` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `areas` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `areas` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `areas` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `areas` VALUES ('216', '131127', '景　县', '131100');
INSERT INTO `areas` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `areas` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `areas` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `areas` VALUES ('220', '140101', '市辖区', '140100');
INSERT INTO `areas` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `areas` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `areas` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `areas` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `areas` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `areas` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `areas` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `areas` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `areas` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `areas` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `areas` VALUES ('231', '140201', '市辖区', '140200');
INSERT INTO `areas` VALUES ('232', '140202', '城　区', '140200');
INSERT INTO `areas` VALUES ('233', '140203', '矿　区', '140200');
INSERT INTO `areas` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `areas` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `areas` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `areas` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `areas` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `areas` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `areas` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `areas` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `areas` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `areas` VALUES ('243', '140301', '市辖区', '140300');
INSERT INTO `areas` VALUES ('244', '140302', '城　区', '140300');
INSERT INTO `areas` VALUES ('245', '140303', '矿　区', '140300');
INSERT INTO `areas` VALUES ('246', '140311', '郊　区', '140300');
INSERT INTO `areas` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `areas` VALUES ('248', '140322', '盂　县', '140300');
INSERT INTO `areas` VALUES ('249', '140401', '市辖区', '140400');
INSERT INTO `areas` VALUES ('250', '140402', '城　区', '140400');
INSERT INTO `areas` VALUES ('251', '140411', '郊　区', '140400');
INSERT INTO `areas` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `areas` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `areas` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `areas` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `areas` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `areas` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `areas` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `areas` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `areas` VALUES ('260', '140430', '沁　县', '140400');
INSERT INTO `areas` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `areas` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `areas` VALUES ('263', '140501', '市辖区', '140500');
INSERT INTO `areas` VALUES ('264', '140502', '城　区', '140500');
INSERT INTO `areas` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `areas` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `areas` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `areas` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `areas` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `areas` VALUES ('270', '140601', '市辖区', '140600');
INSERT INTO `areas` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `areas` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `areas` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `areas` VALUES ('274', '140622', '应　县', '140600');
INSERT INTO `areas` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `areas` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `areas` VALUES ('277', '140701', '市辖区', '140700');
INSERT INTO `areas` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `areas` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `areas` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `areas` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `areas` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `areas` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `areas` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `areas` VALUES ('285', '140727', '祁　县', '140700');
INSERT INTO `areas` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `areas` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `areas` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `areas` VALUES ('289', '140801', '市辖区', '140800');
INSERT INTO `areas` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `areas` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `areas` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `areas` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `areas` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `areas` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `areas` VALUES ('296', '140826', '绛　县', '140800');
INSERT INTO `areas` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `areas` VALUES ('298', '140828', '夏　县', '140800');
INSERT INTO `areas` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `areas` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `areas` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `areas` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `areas` VALUES ('303', '140901', '市辖区', '140900');
INSERT INTO `areas` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `areas` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `areas` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `areas` VALUES ('307', '140923', '代　县', '140900');
INSERT INTO `areas` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `areas` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `areas` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `areas` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `areas` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `areas` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `areas` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `areas` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `areas` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `areas` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `areas` VALUES ('318', '141001', '市辖区', '141000');
INSERT INTO `areas` VALUES ('319', '141002', '尧都区', '141000');
INSERT INTO `areas` VALUES ('320', '141021', '曲沃县', '141000');
INSERT INTO `areas` VALUES ('321', '141022', '翼城县', '141000');
INSERT INTO `areas` VALUES ('322', '141023', '襄汾县', '141000');
INSERT INTO `areas` VALUES ('323', '141024', '洪洞县', '141000');
INSERT INTO `areas` VALUES ('324', '141025', '古　县', '141000');
INSERT INTO `areas` VALUES ('325', '141026', '安泽县', '141000');
INSERT INTO `areas` VALUES ('326', '141027', '浮山县', '141000');
INSERT INTO `areas` VALUES ('327', '141028', '吉　县', '141000');
INSERT INTO `areas` VALUES ('328', '141029', '乡宁县', '141000');
INSERT INTO `areas` VALUES ('329', '141030', '大宁县', '141000');
INSERT INTO `areas` VALUES ('330', '141031', '隰　县', '141000');
INSERT INTO `areas` VALUES ('331', '141032', '永和县', '141000');
INSERT INTO `areas` VALUES ('332', '141033', '蒲　县', '141000');
INSERT INTO `areas` VALUES ('333', '141034', '汾西县', '141000');
INSERT INTO `areas` VALUES ('334', '141081', '侯马市', '141000');
INSERT INTO `areas` VALUES ('335', '141082', '霍州市', '141000');
INSERT INTO `areas` VALUES ('336', '141101', '市辖区', '141100');
INSERT INTO `areas` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `areas` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `areas` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `areas` VALUES ('340', '141123', '兴　县', '141100');
INSERT INTO `areas` VALUES ('341', '141124', '临　县', '141100');
INSERT INTO `areas` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `areas` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `areas` VALUES ('344', '141127', '岚　县', '141100');
INSERT INTO `areas` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `areas` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `areas` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `areas` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `areas` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `areas` VALUES ('350', '150101', '市辖区', '150100');
INSERT INTO `areas` VALUES ('351', '150102', '新城区', '150100');
INSERT INTO `areas` VALUES ('352', '150103', '回民区', '150100');
INSERT INTO `areas` VALUES ('353', '150104', '玉泉区', '150100');
INSERT INTO `areas` VALUES ('354', '150105', '赛罕区', '150100');
INSERT INTO `areas` VALUES ('355', '150121', '土默特左旗', '150100');
INSERT INTO `areas` VALUES ('356', '150122', '托克托县', '150100');
INSERT INTO `areas` VALUES ('357', '150123', '和林格尔县', '150100');
INSERT INTO `areas` VALUES ('358', '150124', '清水河县', '150100');
INSERT INTO `areas` VALUES ('359', '150125', '武川县', '150100');
INSERT INTO `areas` VALUES ('360', '150201', '市辖区', '150200');
INSERT INTO `areas` VALUES ('361', '150202', '东河区', '150200');
INSERT INTO `areas` VALUES ('362', '150203', '昆都仑区', '150200');
INSERT INTO `areas` VALUES ('363', '150204', '青山区', '150200');
INSERT INTO `areas` VALUES ('364', '150205', '石拐区', '150200');
INSERT INTO `areas` VALUES ('365', '150206', '白云矿区', '150200');
INSERT INTO `areas` VALUES ('366', '150207', '九原区', '150200');
INSERT INTO `areas` VALUES ('367', '150221', '土默特右旗', '150200');
INSERT INTO `areas` VALUES ('368', '150222', '固阳县', '150200');
INSERT INTO `areas` VALUES ('369', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `areas` VALUES ('370', '150301', '市辖区', '150300');
INSERT INTO `areas` VALUES ('371', '150302', '海勃湾区', '150300');
INSERT INTO `areas` VALUES ('372', '150303', '海南区', '150300');
INSERT INTO `areas` VALUES ('373', '150304', '乌达区', '150300');
INSERT INTO `areas` VALUES ('374', '150401', '市辖区', '150400');
INSERT INTO `areas` VALUES ('375', '150402', '红山区', '150400');
INSERT INTO `areas` VALUES ('376', '150403', '元宝山区', '150400');
INSERT INTO `areas` VALUES ('377', '150404', '松山区', '150400');
INSERT INTO `areas` VALUES ('378', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `areas` VALUES ('379', '150422', '巴林左旗', '150400');
INSERT INTO `areas` VALUES ('380', '150423', '巴林右旗', '150400');
INSERT INTO `areas` VALUES ('381', '150424', '林西县', '150400');
INSERT INTO `areas` VALUES ('382', '150425', '克什克腾旗', '150400');
INSERT INTO `areas` VALUES ('383', '150426', '翁牛特旗', '150400');
INSERT INTO `areas` VALUES ('384', '150428', '喀喇沁旗', '150400');
INSERT INTO `areas` VALUES ('385', '150429', '宁城县', '150400');
INSERT INTO `areas` VALUES ('386', '150430', '敖汉旗', '150400');
INSERT INTO `areas` VALUES ('387', '150501', '市辖区', '150500');
INSERT INTO `areas` VALUES ('388', '150502', '科尔沁区', '150500');
INSERT INTO `areas` VALUES ('389', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `areas` VALUES ('390', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `areas` VALUES ('391', '150523', '开鲁县', '150500');
INSERT INTO `areas` VALUES ('392', '150524', '库伦旗', '150500');
INSERT INTO `areas` VALUES ('393', '150525', '奈曼旗', '150500');
INSERT INTO `areas` VALUES ('394', '150526', '扎鲁特旗', '150500');
INSERT INTO `areas` VALUES ('395', '150581', '霍林郭勒市', '150500');
INSERT INTO `areas` VALUES ('396', '150602', '东胜区', '150600');
INSERT INTO `areas` VALUES ('397', '150621', '达拉特旗', '150600');
INSERT INTO `areas` VALUES ('398', '150622', '准格尔旗', '150600');
INSERT INTO `areas` VALUES ('399', '150623', '鄂托克前旗', '150600');
INSERT INTO `areas` VALUES ('400', '150624', '鄂托克旗', '150600');
INSERT INTO `areas` VALUES ('401', '150625', '杭锦旗', '150600');
INSERT INTO `areas` VALUES ('402', '150626', '乌审旗', '150600');
INSERT INTO `areas` VALUES ('403', '150627', '伊金霍洛旗', '150600');
INSERT INTO `areas` VALUES ('404', '150701', '市辖区', '150700');
INSERT INTO `areas` VALUES ('405', '150702', '海拉尔区', '150700');
INSERT INTO `areas` VALUES ('406', '150721', '阿荣旗', '150700');
INSERT INTO `areas` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `areas` VALUES ('408', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `areas` VALUES ('409', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `areas` VALUES ('410', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `areas` VALUES ('411', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `areas` VALUES ('412', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `areas` VALUES ('413', '150781', '满洲里市', '150700');
INSERT INTO `areas` VALUES ('414', '150782', '牙克石市', '150700');
INSERT INTO `areas` VALUES ('415', '150783', '扎兰屯市', '150700');
INSERT INTO `areas` VALUES ('416', '150784', '额尔古纳市', '150700');
INSERT INTO `areas` VALUES ('417', '150785', '根河市', '150700');
INSERT INTO `areas` VALUES ('418', '150801', '市辖区', '150800');
INSERT INTO `areas` VALUES ('419', '150802', '临河区', '150800');
INSERT INTO `areas` VALUES ('420', '150821', '五原县', '150800');
INSERT INTO `areas` VALUES ('421', '150822', '磴口县', '150800');
INSERT INTO `areas` VALUES ('422', '150823', '乌拉特前旗', '150800');
INSERT INTO `areas` VALUES ('423', '150824', '乌拉特中旗', '150800');
INSERT INTO `areas` VALUES ('424', '150825', '乌拉特后旗', '150800');
INSERT INTO `areas` VALUES ('425', '150826', '杭锦后旗', '150800');
INSERT INTO `areas` VALUES ('426', '150901', '市辖区', '150900');
INSERT INTO `areas` VALUES ('427', '150902', '集宁区', '150900');
INSERT INTO `areas` VALUES ('428', '150921', '卓资县', '150900');
INSERT INTO `areas` VALUES ('429', '150922', '化德县', '150900');
INSERT INTO `areas` VALUES ('430', '150923', '商都县', '150900');
INSERT INTO `areas` VALUES ('431', '150924', '兴和县', '150900');
INSERT INTO `areas` VALUES ('432', '150925', '凉城县', '150900');
INSERT INTO `areas` VALUES ('433', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `areas` VALUES ('434', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `areas` VALUES ('435', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `areas` VALUES ('436', '150929', '四子王旗', '150900');
INSERT INTO `areas` VALUES ('437', '150981', '丰镇市', '150900');
INSERT INTO `areas` VALUES ('438', '152201', '乌兰浩特市', '152200');
INSERT INTO `areas` VALUES ('439', '152202', '阿尔山市', '152200');
INSERT INTO `areas` VALUES ('440', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `areas` VALUES ('441', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `areas` VALUES ('442', '152223', '扎赉特旗', '152200');
INSERT INTO `areas` VALUES ('443', '152224', '突泉县', '152200');
INSERT INTO `areas` VALUES ('444', '152501', '二连浩特市', '152500');
INSERT INTO `areas` VALUES ('445', '152502', '锡林浩特市', '152500');
INSERT INTO `areas` VALUES ('446', '152522', '阿巴嘎旗', '152500');
INSERT INTO `areas` VALUES ('447', '152523', '苏尼特左旗', '152500');
INSERT INTO `areas` VALUES ('448', '152524', '苏尼特右旗', '152500');
INSERT INTO `areas` VALUES ('449', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `areas` VALUES ('450', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `areas` VALUES ('451', '152527', '太仆寺旗', '152500');
INSERT INTO `areas` VALUES ('452', '152528', '镶黄旗', '152500');
INSERT INTO `areas` VALUES ('453', '152529', '正镶白旗', '152500');
INSERT INTO `areas` VALUES ('454', '152530', '正蓝旗', '152500');
INSERT INTO `areas` VALUES ('455', '152531', '多伦县', '152500');
INSERT INTO `areas` VALUES ('456', '152921', '阿拉善左旗', '152900');
INSERT INTO `areas` VALUES ('457', '152922', '阿拉善右旗', '152900');
INSERT INTO `areas` VALUES ('458', '152923', '额济纳旗', '152900');
INSERT INTO `areas` VALUES ('459', '210101', '市辖区', '210100');
INSERT INTO `areas` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `areas` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `areas` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `areas` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `areas` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `areas` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `areas` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `areas` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `areas` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `areas` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `areas` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `areas` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `areas` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `areas` VALUES ('473', '210201', '市辖区', '210200');
INSERT INTO `areas` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `areas` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `areas` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `areas` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `areas` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `areas` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `areas` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `areas` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `areas` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `areas` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `areas` VALUES ('484', '210301', '市辖区', '210300');
INSERT INTO `areas` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `areas` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `areas` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `areas` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `areas` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `areas` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `areas` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `areas` VALUES ('492', '210401', '市辖区', '210400');
INSERT INTO `areas` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `areas` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `areas` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `areas` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `areas` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `areas` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `areas` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `areas` VALUES ('500', '210501', '市辖区', '210500');
INSERT INTO `areas` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `areas` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `areas` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `areas` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `areas` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `areas` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `areas` VALUES ('507', '210601', '市辖区', '210600');
INSERT INTO `areas` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `areas` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `areas` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `areas` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `areas` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `areas` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `areas` VALUES ('514', '210701', '市辖区', '210700');
INSERT INTO `areas` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `areas` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `areas` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `areas` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `areas` VALUES ('519', '210727', '义　县', '210700');
INSERT INTO `areas` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `areas` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `areas` VALUES ('522', '210801', '市辖区', '210800');
INSERT INTO `areas` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `areas` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `areas` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `areas` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `areas` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `areas` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `areas` VALUES ('529', '210901', '市辖区', '210900');
INSERT INTO `areas` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `areas` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `areas` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `areas` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `areas` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `areas` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `areas` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `areas` VALUES ('537', '211001', '市辖区', '211000');
INSERT INTO `areas` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `areas` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `areas` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `areas` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `areas` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `areas` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `areas` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `areas` VALUES ('545', '211101', '市辖区', '211100');
INSERT INTO `areas` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `areas` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `areas` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `areas` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `areas` VALUES ('550', '211201', '市辖区', '211200');
INSERT INTO `areas` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `areas` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `areas` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `areas` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `areas` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `areas` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `areas` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `areas` VALUES ('558', '211301', '市辖区', '211300');
INSERT INTO `areas` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `areas` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `areas` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `areas` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `areas` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `areas` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `areas` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `areas` VALUES ('566', '211401', '市辖区', '211400');
INSERT INTO `areas` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `areas` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `areas` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `areas` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `areas` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `areas` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `areas` VALUES ('573', '220101', '市辖区', '220100');
INSERT INTO `areas` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `areas` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `areas` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `areas` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `areas` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `areas` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `areas` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `areas` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `areas` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `areas` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `areas` VALUES ('584', '220201', '市辖区', '220200');
INSERT INTO `areas` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `areas` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `areas` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `areas` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `areas` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `areas` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `areas` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `areas` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `areas` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `areas` VALUES ('594', '220301', '市辖区', '220300');
INSERT INTO `areas` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `areas` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `areas` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `areas` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `areas` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `areas` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `areas` VALUES ('601', '220401', '市辖区', '220400');
INSERT INTO `areas` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `areas` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `areas` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `areas` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `areas` VALUES ('606', '220501', '市辖区', '220500');
INSERT INTO `areas` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `areas` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `areas` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `areas` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `areas` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `areas` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `areas` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `areas` VALUES ('614', '220601', '市辖区', '220600');
INSERT INTO `areas` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `areas` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `areas` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `areas` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `areas` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `areas` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `areas` VALUES ('621', '220701', '市辖区', '220700');
INSERT INTO `areas` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `areas` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `areas` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `areas` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `areas` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `areas` VALUES ('627', '220801', '市辖区', '220800');
INSERT INTO `areas` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `areas` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `areas` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `areas` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `areas` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `areas` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `areas` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `areas` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `areas` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `areas` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `areas` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `areas` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `areas` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `areas` VALUES ('641', '230101', '市辖区', '230100');
INSERT INTO `areas` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `areas` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `areas` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `areas` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `areas` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `areas` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `areas` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `areas` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `areas` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `areas` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `areas` VALUES ('652', '230125', '宾　县', '230100');
INSERT INTO `areas` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `areas` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `areas` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `areas` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `areas` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `areas` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `areas` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `areas` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `areas` VALUES ('661', '230201', '市辖区', '230200');
INSERT INTO `areas` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `areas` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `areas` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `areas` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `areas` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `areas` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `areas` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `areas` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `areas` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `areas` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `areas` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `areas` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `areas` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `areas` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `areas` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `areas` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `areas` VALUES ('678', '230301', '市辖区', '230300');
INSERT INTO `areas` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `areas` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `areas` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `areas` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `areas` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `areas` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `areas` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `areas` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `areas` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `areas` VALUES ('688', '230401', '市辖区', '230400');
INSERT INTO `areas` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `areas` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `areas` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `areas` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `areas` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `areas` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `areas` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `areas` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `areas` VALUES ('697', '230501', '市辖区', '230500');
INSERT INTO `areas` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `areas` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `areas` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `areas` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `areas` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `areas` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `areas` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `areas` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `areas` VALUES ('706', '230601', '市辖区', '230600');
INSERT INTO `areas` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `areas` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `areas` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `areas` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `areas` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `areas` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `areas` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `areas` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `areas` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `areas` VALUES ('716', '230701', '市辖区', '230700');
INSERT INTO `areas` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `areas` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `areas` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `areas` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `areas` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `areas` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `areas` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `areas` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `areas` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `areas` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `areas` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `areas` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `areas` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `areas` VALUES ('730', '230715', '红星区', '230700');
INSERT INTO `areas` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `areas` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `areas` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `areas` VALUES ('734', '230801', '市辖区', '230800');
INSERT INTO `areas` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `areas` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `areas` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `areas` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `areas` VALUES ('739', '230811', '郊　区', '230800');
INSERT INTO `areas` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `areas` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `areas` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `areas` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `areas` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `areas` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `areas` VALUES ('746', '230901', '市辖区', '230900');
INSERT INTO `areas` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `areas` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `areas` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `areas` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `areas` VALUES ('751', '231001', '市辖区', '231000');
INSERT INTO `areas` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `areas` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `areas` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `areas` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `areas` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `areas` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `areas` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `areas` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `areas` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `areas` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `areas` VALUES ('762', '231101', '市辖区', '231100');
INSERT INTO `areas` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `areas` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `areas` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `areas` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `areas` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `areas` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `areas` VALUES ('769', '231201', '市辖区', '231200');
INSERT INTO `areas` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `areas` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `areas` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `areas` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `areas` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `areas` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `areas` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `areas` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `areas` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `areas` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `areas` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `areas` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `areas` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `areas` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `areas` VALUES ('784', '310103', '卢湾区', '310100');
INSERT INTO `areas` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `areas` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `areas` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `areas` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `areas` VALUES ('789', '310108', '闸北区', '310100');
INSERT INTO `areas` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `areas` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `areas` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `areas` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `areas` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `areas` VALUES ('795', '310115', '浦东新区', '310100');
INSERT INTO `areas` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `areas` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `areas` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `areas` VALUES ('799', '310119', '南汇区', '310100');
INSERT INTO `areas` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `areas` VALUES ('801', '310230', '崇明县', '310200');
INSERT INTO `areas` VALUES ('802', '320101', '市辖区', '320100');
INSERT INTO `areas` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `areas` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `areas` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `areas` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `areas` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `areas` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `areas` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `areas` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `areas` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `areas` VALUES ('812', '320115', '江宁区', '320100');
INSERT INTO `areas` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `areas` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `areas` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `areas` VALUES ('816', '320201', '市辖区', '320200');
INSERT INTO `areas` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `areas` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `areas` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `areas` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `areas` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `areas` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `areas` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `areas` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `areas` VALUES ('825', '320301', '市辖区', '320300');
INSERT INTO `areas` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `areas` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `areas` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `areas` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `areas` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `areas` VALUES ('831', '320321', '丰　县', '320300');
INSERT INTO `areas` VALUES ('832', '320322', '沛　县', '320300');
INSERT INTO `areas` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `areas` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `areas` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `areas` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `areas` VALUES ('837', '320401', '市辖区', '320400');
INSERT INTO `areas` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `areas` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `areas` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `areas` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `areas` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `areas` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `areas` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `areas` VALUES ('845', '320501', '市辖区', '320500');
INSERT INTO `areas` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `areas` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `areas` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `areas` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `areas` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `areas` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `areas` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `areas` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `areas` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `areas` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `areas` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `areas` VALUES ('857', '320601', '市辖区', '320600');
INSERT INTO `areas` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `areas` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `areas` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `areas` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `areas` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `areas` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `areas` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `areas` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `areas` VALUES ('866', '320701', '市辖区', '320700');
INSERT INTO `areas` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `areas` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `areas` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `areas` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `areas` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `areas` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `areas` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `areas` VALUES ('874', '320801', '市辖区', '320800');
INSERT INTO `areas` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `areas` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `areas` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `areas` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `areas` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `areas` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `areas` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `areas` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `areas` VALUES ('883', '320901', '市辖区', '320900');
INSERT INTO `areas` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `areas` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `areas` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `areas` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `areas` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `areas` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `areas` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `areas` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `areas` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `areas` VALUES ('893', '321001', '市辖区', '321000');
INSERT INTO `areas` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `areas` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `areas` VALUES ('896', '321011', '郊　区', '321000');
INSERT INTO `areas` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `areas` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `areas` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `areas` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `areas` VALUES ('901', '321101', '市辖区', '321100');
INSERT INTO `areas` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `areas` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `areas` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `areas` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `areas` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `areas` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `areas` VALUES ('908', '321201', '市辖区', '321200');
INSERT INTO `areas` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `areas` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `areas` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `areas` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `areas` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `areas` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `areas` VALUES ('915', '321301', '市辖区', '321300');
INSERT INTO `areas` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `areas` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `areas` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `areas` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `areas` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `areas` VALUES ('921', '330101', '市辖区', '330100');
INSERT INTO `areas` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `areas` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `areas` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `areas` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `areas` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `areas` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `areas` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `areas` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `areas` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `areas` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `areas` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `areas` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `areas` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `areas` VALUES ('935', '330201', '市辖区', '330200');
INSERT INTO `areas` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `areas` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `areas` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `areas` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `areas` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `areas` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `areas` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `areas` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `areas` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `areas` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `areas` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `areas` VALUES ('947', '330301', '市辖区', '330300');
INSERT INTO `areas` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `areas` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `areas` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `areas` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `areas` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `areas` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `areas` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `areas` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `areas` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `areas` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `areas` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `areas` VALUES ('959', '330401', '市辖区', '330400');
INSERT INTO `areas` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `areas` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `areas` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `areas` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `areas` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `areas` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `areas` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `areas` VALUES ('967', '330501', '市辖区', '330500');
INSERT INTO `areas` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `areas` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `areas` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `areas` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `areas` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `areas` VALUES ('973', '330601', '市辖区', '330600');
INSERT INTO `areas` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `areas` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `areas` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `areas` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `areas` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `areas` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `areas` VALUES ('980', '330701', '市辖区', '330700');
INSERT INTO `areas` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `areas` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `areas` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `areas` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `areas` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `areas` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `areas` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `areas` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `areas` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `areas` VALUES ('990', '330801', '市辖区', '330800');
INSERT INTO `areas` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `areas` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `areas` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `areas` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `areas` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `areas` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `areas` VALUES ('997', '330901', '市辖区', '330900');
INSERT INTO `areas` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `areas` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `areas` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `areas` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `areas` VALUES ('1002', '331001', '市辖区', '331000');
INSERT INTO `areas` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `areas` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `areas` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `areas` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `areas` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `areas` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `areas` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `areas` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `areas` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `areas` VALUES ('1012', '331101', '市辖区', '331100');
INSERT INTO `areas` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `areas` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `areas` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `areas` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `areas` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `areas` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `areas` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `areas` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `areas` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `areas` VALUES ('1022', '340101', '市辖区', '340100');
INSERT INTO `areas` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `areas` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `areas` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `areas` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `areas` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `areas` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `areas` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `areas` VALUES ('1030', '340201', '市辖区', '340200');
INSERT INTO `areas` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `areas` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `areas` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `areas` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `areas` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `areas` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `areas` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `areas` VALUES ('1038', '340301', '市辖区', '340300');
INSERT INTO `areas` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `areas` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `areas` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `areas` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `areas` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `areas` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `areas` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `areas` VALUES ('1046', '340401', '市辖区', '340400');
INSERT INTO `areas` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `areas` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `areas` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `areas` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `areas` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `areas` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `areas` VALUES ('1053', '340501', '市辖区', '340500');
INSERT INTO `areas` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `areas` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `areas` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `areas` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `areas` VALUES ('1058', '340601', '市辖区', '340600');
INSERT INTO `areas` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `areas` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `areas` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `areas` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `areas` VALUES ('1063', '340701', '市辖区', '340700');
INSERT INTO `areas` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `areas` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `areas` VALUES ('1066', '340711', '郊　区', '340700');
INSERT INTO `areas` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `areas` VALUES ('1068', '340801', '市辖区', '340800');
INSERT INTO `areas` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `areas` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `areas` VALUES ('1071', '340811', '郊　区', '340800');
INSERT INTO `areas` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `areas` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `areas` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `areas` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `areas` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `areas` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `areas` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `areas` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `areas` VALUES ('1080', '341001', '市辖区', '341000');
INSERT INTO `areas` VALUES ('1081', '341002', '屯溪区', '341000');
INSERT INTO `areas` VALUES ('1082', '341003', '黄山区', '341000');
INSERT INTO `areas` VALUES ('1083', '341004', '徽州区', '341000');
INSERT INTO `areas` VALUES ('1084', '341021', '歙　县', '341000');
INSERT INTO `areas` VALUES ('1085', '341022', '休宁县', '341000');
INSERT INTO `areas` VALUES ('1086', '341023', '黟　县', '341000');
INSERT INTO `areas` VALUES ('1087', '341024', '祁门县', '341000');
INSERT INTO `areas` VALUES ('1088', '341101', '市辖区', '341100');
INSERT INTO `areas` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `areas` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `areas` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `areas` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `areas` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `areas` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `areas` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `areas` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `areas` VALUES ('1097', '341201', '市辖区', '341200');
INSERT INTO `areas` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `areas` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `areas` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `areas` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `areas` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `areas` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `areas` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `areas` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `areas` VALUES ('1106', '341301', '市辖区', '341300');
INSERT INTO `areas` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `areas` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `areas` VALUES ('1109', '341322', '萧　县', '341300');
INSERT INTO `areas` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `areas` VALUES ('1111', '341324', '泗　县', '341300');
INSERT INTO `areas` VALUES ('1112', '341401', '市辖区', '341400');
INSERT INTO `areas` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `areas` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `areas` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `areas` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `areas` VALUES ('1117', '341424', '和　县', '341400');
INSERT INTO `areas` VALUES ('1118', '341501', '市辖区', '341500');
INSERT INTO `areas` VALUES ('1119', '341502', '金安区', '341500');
INSERT INTO `areas` VALUES ('1120', '341503', '裕安区', '341500');
INSERT INTO `areas` VALUES ('1121', '341521', '寿　县', '341500');
INSERT INTO `areas` VALUES ('1122', '341522', '霍邱县', '341500');
INSERT INTO `areas` VALUES ('1123', '341523', '舒城县', '341500');
INSERT INTO `areas` VALUES ('1124', '341524', '金寨县', '341500');
INSERT INTO `areas` VALUES ('1125', '341525', '霍山县', '341500');
INSERT INTO `areas` VALUES ('1126', '341601', '市辖区', '341600');
INSERT INTO `areas` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `areas` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `areas` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `areas` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `areas` VALUES ('1131', '341701', '市辖区', '341700');
INSERT INTO `areas` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `areas` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `areas` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `areas` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `areas` VALUES ('1136', '341801', '市辖区', '341800');
INSERT INTO `areas` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `areas` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `areas` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `areas` VALUES ('1140', '341823', '泾　县', '341800');
INSERT INTO `areas` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `areas` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `areas` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `areas` VALUES ('1144', '350101', '市辖区', '350100');
INSERT INTO `areas` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `areas` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `areas` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `areas` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `areas` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `areas` VALUES ('1150', '350121', '闽侯县', '350100');
INSERT INTO `areas` VALUES ('1151', '350122', '连江县', '350100');
INSERT INTO `areas` VALUES ('1152', '350123', '罗源县', '350100');
INSERT INTO `areas` VALUES ('1153', '350124', '闽清县', '350100');
INSERT INTO `areas` VALUES ('1154', '350125', '永泰县', '350100');
INSERT INTO `areas` VALUES ('1155', '350128', '平潭县', '350100');
INSERT INTO `areas` VALUES ('1156', '350181', '福清市', '350100');
INSERT INTO `areas` VALUES ('1157', '350182', '长乐市', '350100');
INSERT INTO `areas` VALUES ('1158', '350201', '市辖区', '350200');
INSERT INTO `areas` VALUES ('1159', '350203', '思明区', '350200');
INSERT INTO `areas` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `areas` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `areas` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `areas` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `areas` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `areas` VALUES ('1165', '350301', '市辖区', '350300');
INSERT INTO `areas` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `areas` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `areas` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `areas` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `areas` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `areas` VALUES ('1171', '350401', '市辖区', '350400');
INSERT INTO `areas` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `areas` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `areas` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `areas` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `areas` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `areas` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `areas` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `areas` VALUES ('1179', '350427', '沙　县', '350400');
INSERT INTO `areas` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `areas` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `areas` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `areas` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `areas` VALUES ('1184', '350501', '市辖区', '350500');
INSERT INTO `areas` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `areas` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `areas` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `areas` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `areas` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `areas` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `areas` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `areas` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `areas` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `areas` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `areas` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `areas` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `areas` VALUES ('1197', '350601', '市辖区', '350600');
INSERT INTO `areas` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `areas` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `areas` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `areas` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `areas` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `areas` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `areas` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `areas` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `areas` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `areas` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `areas` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `areas` VALUES ('1209', '350701', '市辖区', '350700');
INSERT INTO `areas` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `areas` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `areas` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `areas` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `areas` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `areas` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `areas` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `areas` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `areas` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `areas` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `areas` VALUES ('1220', '350801', '市辖区', '350800');
INSERT INTO `areas` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `areas` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `areas` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `areas` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `areas` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `areas` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `areas` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `areas` VALUES ('1228', '350901', '市辖区', '350900');
INSERT INTO `areas` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `areas` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `areas` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `areas` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `areas` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `areas` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `areas` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `areas` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `areas` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `areas` VALUES ('1238', '360101', '市辖区', '360100');
INSERT INTO `areas` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `areas` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `areas` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `areas` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `areas` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `areas` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `areas` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `areas` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `areas` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `areas` VALUES ('1248', '360201', '市辖区', '360200');
INSERT INTO `areas` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `areas` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `areas` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `areas` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `areas` VALUES ('1253', '360301', '市辖区', '360300');
INSERT INTO `areas` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `areas` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `areas` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `areas` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `areas` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `areas` VALUES ('1259', '360401', '市辖区', '360400');
INSERT INTO `areas` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `areas` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `areas` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `areas` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `areas` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `areas` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `areas` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `areas` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `areas` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `areas` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `areas` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `areas` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `areas` VALUES ('1272', '360501', '市辖区', '360500');
INSERT INTO `areas` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `areas` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `areas` VALUES ('1275', '360601', '市辖区', '360600');
INSERT INTO `areas` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `areas` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `areas` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `areas` VALUES ('1279', '360701', '市辖区', '360700');
INSERT INTO `areas` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `areas` VALUES ('1281', '360721', '赣　县', '360700');
INSERT INTO `areas` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `areas` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `areas` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `areas` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `areas` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `areas` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `areas` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `areas` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `areas` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `areas` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `areas` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `areas` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `areas` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `areas` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `areas` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `areas` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `areas` VALUES ('1298', '360801', '市辖区', '360800');
INSERT INTO `areas` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `areas` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `areas` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `areas` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `areas` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `areas` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `areas` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `areas` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `areas` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `areas` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `areas` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `areas` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `areas` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `areas` VALUES ('1312', '360901', '市辖区', '360900');
INSERT INTO `areas` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `areas` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `areas` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `areas` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `areas` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `areas` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `areas` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `areas` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `areas` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `areas` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `areas` VALUES ('1323', '361001', '市辖区', '361000');
INSERT INTO `areas` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `areas` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `areas` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `areas` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `areas` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `areas` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `areas` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `areas` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `areas` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `areas` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `areas` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `areas` VALUES ('1335', '361101', '市辖区', '361100');
INSERT INTO `areas` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `areas` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `areas` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `areas` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `areas` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `areas` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `areas` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `areas` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `areas` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `areas` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `areas` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `areas` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `areas` VALUES ('1348', '370101', '市辖区', '370100');
INSERT INTO `areas` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `areas` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `areas` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `areas` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `areas` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `areas` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `areas` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `areas` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `areas` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `areas` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `areas` VALUES ('1359', '370201', '市辖区', '370200');
INSERT INTO `areas` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `areas` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `areas` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `areas` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `areas` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `areas` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `areas` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `areas` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `areas` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `areas` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `areas` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `areas` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `areas` VALUES ('1372', '370301', '市辖区', '370300');
INSERT INTO `areas` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `areas` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `areas` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `areas` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `areas` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `areas` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `areas` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `areas` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `areas` VALUES ('1381', '370401', '市辖区', '370400');
INSERT INTO `areas` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `areas` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `areas` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `areas` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `areas` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `areas` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `areas` VALUES ('1388', '370501', '市辖区', '370500');
INSERT INTO `areas` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `areas` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `areas` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `areas` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `areas` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `areas` VALUES ('1394', '370601', '市辖区', '370600');
INSERT INTO `areas` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `areas` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `areas` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `areas` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `areas` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `areas` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `areas` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `areas` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `areas` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `areas` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `areas` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `areas` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `areas` VALUES ('1407', '370701', '市辖区', '370700');
INSERT INTO `areas` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `areas` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `areas` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `areas` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `areas` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `areas` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `areas` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `areas` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `areas` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `areas` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `areas` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `areas` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `areas` VALUES ('1420', '370801', '市辖区', '370800');
INSERT INTO `areas` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `areas` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `areas` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `areas` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `areas` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `areas` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `areas` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `areas` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `areas` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `areas` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `areas` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `areas` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `areas` VALUES ('1433', '370901', '市辖区', '370900');
INSERT INTO `areas` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `areas` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `areas` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `areas` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `areas` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `areas` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `areas` VALUES ('1440', '371001', '市辖区', '371000');
INSERT INTO `areas` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `areas` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `areas` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `areas` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `areas` VALUES ('1445', '371101', '市辖区', '371100');
INSERT INTO `areas` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `areas` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `areas` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `areas` VALUES ('1449', '371122', '莒　县', '371100');
INSERT INTO `areas` VALUES ('1450', '371201', '市辖区', '371200');
INSERT INTO `areas` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `areas` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `areas` VALUES ('1453', '371301', '市辖区', '371300');
INSERT INTO `areas` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `areas` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `areas` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `areas` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `areas` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `areas` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `areas` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `areas` VALUES ('1461', '371325', '费　县', '371300');
INSERT INTO `areas` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `areas` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `areas` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `areas` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `areas` VALUES ('1466', '371401', '市辖区', '371400');
INSERT INTO `areas` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `areas` VALUES ('1468', '371421', '陵　县', '371400');
INSERT INTO `areas` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `areas` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `areas` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `areas` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `areas` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `areas` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `areas` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `areas` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `areas` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `areas` VALUES ('1478', '371501', '市辖区', '371500');
INSERT INTO `areas` VALUES ('1479', '371502', '东昌府区', '371500');
INSERT INTO `areas` VALUES ('1480', '371521', '阳谷县', '371500');
INSERT INTO `areas` VALUES ('1481', '371522', '莘　县', '371500');
INSERT INTO `areas` VALUES ('1482', '371523', '茌平县', '371500');
INSERT INTO `areas` VALUES ('1483', '371524', '东阿县', '371500');
INSERT INTO `areas` VALUES ('1484', '371525', '冠　县', '371500');
INSERT INTO `areas` VALUES ('1485', '371526', '高唐县', '371500');
INSERT INTO `areas` VALUES ('1486', '371581', '临清市', '371500');
INSERT INTO `areas` VALUES ('1487', '371601', '市辖区', '371600');
INSERT INTO `areas` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `areas` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `areas` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `areas` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `areas` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `areas` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `areas` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `areas` VALUES ('1495', '371701', '市辖区', '371700');
INSERT INTO `areas` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `areas` VALUES ('1497', '371721', '曹　县', '371700');
INSERT INTO `areas` VALUES ('1498', '371722', '单　县', '371700');
INSERT INTO `areas` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `areas` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `areas` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `areas` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `areas` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `areas` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `areas` VALUES ('1505', '410101', '市辖区', '410100');
INSERT INTO `areas` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `areas` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `areas` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `areas` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `areas` VALUES ('1510', '410106', '上街区', '410100');
INSERT INTO `areas` VALUES ('1511', '410108', '邙山区', '410100');
INSERT INTO `areas` VALUES ('1512', '410122', '中牟县', '410100');
INSERT INTO `areas` VALUES ('1513', '410181', '巩义市', '410100');
INSERT INTO `areas` VALUES ('1514', '410182', '荥阳市', '410100');
INSERT INTO `areas` VALUES ('1515', '410183', '新密市', '410100');
INSERT INTO `areas` VALUES ('1516', '410184', '新郑市', '410100');
INSERT INTO `areas` VALUES ('1517', '410185', '登封市', '410100');
INSERT INTO `areas` VALUES ('1518', '410201', '市辖区', '410200');
INSERT INTO `areas` VALUES ('1519', '410202', '龙亭区', '410200');
INSERT INTO `areas` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `areas` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `areas` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `areas` VALUES ('1523', '410211', '郊　区', '410200');
INSERT INTO `areas` VALUES ('1524', '410221', '杞　县', '410200');
INSERT INTO `areas` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `areas` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `areas` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `areas` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `areas` VALUES ('1529', '410301', '市辖区', '410300');
INSERT INTO `areas` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `areas` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `areas` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `areas` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `areas` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `areas` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `areas` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `areas` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `areas` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `areas` VALUES ('1539', '410325', '嵩　县', '410300');
INSERT INTO `areas` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `areas` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `areas` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `areas` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `areas` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `areas` VALUES ('1545', '410401', '市辖区', '410400');
INSERT INTO `areas` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `areas` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `areas` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `areas` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `areas` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `areas` VALUES ('1551', '410422', '叶　县', '410400');
INSERT INTO `areas` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `areas` VALUES ('1553', '410425', '郏　县', '410400');
INSERT INTO `areas` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `areas` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `areas` VALUES ('1556', '410501', '市辖区', '410500');
INSERT INTO `areas` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `areas` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `areas` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `areas` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `areas` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `areas` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `areas` VALUES ('1563', '410526', '滑　县', '410500');
INSERT INTO `areas` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `areas` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `areas` VALUES ('1566', '410601', '市辖区', '410600');
INSERT INTO `areas` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `areas` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `areas` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `areas` VALUES ('1570', '410621', '浚　县', '410600');
INSERT INTO `areas` VALUES ('1571', '410622', '淇　县', '410600');
INSERT INTO `areas` VALUES ('1572', '410701', '市辖区', '410700');
INSERT INTO `areas` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `areas` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `areas` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `areas` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `areas` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `areas` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `areas` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `areas` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `areas` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `areas` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `areas` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `areas` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `areas` VALUES ('1585', '410801', '市辖区', '410800');
INSERT INTO `areas` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `areas` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `areas` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `areas` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `areas` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `areas` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `areas` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `areas` VALUES ('1593', '410825', '温　县', '410800');
INSERT INTO `areas` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `areas` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `areas` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `areas` VALUES ('1597', '410901', '市辖区', '410900');
INSERT INTO `areas` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `areas` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `areas` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `areas` VALUES ('1601', '410926', '范　县', '410900');
INSERT INTO `areas` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `areas` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `areas` VALUES ('1604', '411001', '市辖区', '411000');
INSERT INTO `areas` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `areas` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `areas` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `areas` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `areas` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `areas` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `areas` VALUES ('1611', '411101', '市辖区', '411100');
INSERT INTO `areas` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `areas` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `areas` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `areas` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `areas` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `areas` VALUES ('1617', '411201', '市辖区', '411200');
INSERT INTO `areas` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `areas` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `areas` VALUES ('1620', '411222', '陕　县', '411200');
INSERT INTO `areas` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `areas` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `areas` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `areas` VALUES ('1624', '411301', '市辖区', '411300');
INSERT INTO `areas` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `areas` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `areas` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `areas` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `areas` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `areas` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `areas` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `areas` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `areas` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `areas` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `areas` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `areas` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `areas` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `areas` VALUES ('1638', '411401', '市辖区', '411400');
INSERT INTO `areas` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `areas` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `areas` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `areas` VALUES ('1642', '411422', '睢　县', '411400');
INSERT INTO `areas` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `areas` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `areas` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `areas` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `areas` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `areas` VALUES ('1648', '411501', '市辖区', '411500');
INSERT INTO `areas` VALUES ('1649', '411502', '师河区', '411500');
INSERT INTO `areas` VALUES ('1650', '411503', '平桥区', '411500');
INSERT INTO `areas` VALUES ('1651', '411521', '罗山县', '411500');
INSERT INTO `areas` VALUES ('1652', '411522', '光山县', '411500');
INSERT INTO `areas` VALUES ('1653', '411523', '新　县', '411500');
INSERT INTO `areas` VALUES ('1654', '411524', '商城县', '411500');
INSERT INTO `areas` VALUES ('1655', '411525', '固始县', '411500');
INSERT INTO `areas` VALUES ('1656', '411526', '潢川县', '411500');
INSERT INTO `areas` VALUES ('1657', '411527', '淮滨县', '411500');
INSERT INTO `areas` VALUES ('1658', '411528', '息　县', '411500');
INSERT INTO `areas` VALUES ('1659', '411601', '市辖区', '411600');
INSERT INTO `areas` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `areas` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `areas` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `areas` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `areas` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `areas` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `areas` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `areas` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `areas` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `areas` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `areas` VALUES ('1670', '411701', '市辖区', '411700');
INSERT INTO `areas` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `areas` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `areas` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `areas` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `areas` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `areas` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `areas` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `areas` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `areas` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `areas` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `areas` VALUES ('1681', '420101', '市辖区', '420100');
INSERT INTO `areas` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `areas` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `areas` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `areas` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `areas` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `areas` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `areas` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `areas` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `areas` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `areas` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `areas` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `areas` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `areas` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `areas` VALUES ('1695', '420201', '市辖区', '420200');
INSERT INTO `areas` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `areas` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `areas` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `areas` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `areas` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `areas` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `areas` VALUES ('1702', '420301', '市辖区', '420300');
INSERT INTO `areas` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `areas` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `areas` VALUES ('1705', '420321', '郧　县', '420300');
INSERT INTO `areas` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `areas` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `areas` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `areas` VALUES ('1709', '420325', '房　县', '420300');
INSERT INTO `areas` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `areas` VALUES ('1711', '420501', '市辖区', '420500');
INSERT INTO `areas` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `areas` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `areas` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `areas` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `areas` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `areas` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `areas` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `areas` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `areas` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `areas` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `areas` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `areas` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `areas` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `areas` VALUES ('1725', '420601', '市辖区', '420600');
INSERT INTO `areas` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `areas` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `areas` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `areas` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `areas` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `areas` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `areas` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `areas` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `areas` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `areas` VALUES ('1735', '420701', '市辖区', '420700');
INSERT INTO `areas` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `areas` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `areas` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `areas` VALUES ('1739', '420801', '市辖区', '420800');
INSERT INTO `areas` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `areas` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `areas` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `areas` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `areas` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `areas` VALUES ('1745', '420901', '市辖区', '420900');
INSERT INTO `areas` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `areas` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `areas` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `areas` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `areas` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `areas` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `areas` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `areas` VALUES ('1753', '421001', '市辖区', '421000');
INSERT INTO `areas` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `areas` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `areas` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `areas` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `areas` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `areas` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `areas` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `areas` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `areas` VALUES ('1762', '421101', '市辖区', '421100');
INSERT INTO `areas` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `areas` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `areas` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `areas` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `areas` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `areas` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `areas` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `areas` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `areas` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `areas` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `areas` VALUES ('1773', '421201', '市辖区', '421200');
INSERT INTO `areas` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `areas` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `areas` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `areas` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `areas` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `areas` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `areas` VALUES ('1780', '421301', '市辖区', '421300');
INSERT INTO `areas` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `areas` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `areas` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `areas` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `areas` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `areas` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `areas` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `areas` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `areas` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `areas` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `areas` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `areas` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `areas` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `areas` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `areas` VALUES ('1795', '430101', '市辖区', '430100');
INSERT INTO `areas` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `areas` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `areas` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `areas` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `areas` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `areas` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `areas` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `areas` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `areas` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `areas` VALUES ('1805', '430201', '市辖区', '430200');
INSERT INTO `areas` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `areas` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `areas` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `areas` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `areas` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `areas` VALUES ('1811', '430223', '攸　县', '430200');
INSERT INTO `areas` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `areas` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `areas` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `areas` VALUES ('1815', '430301', '市辖区', '430300');
INSERT INTO `areas` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `areas` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `areas` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `areas` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `areas` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `areas` VALUES ('1821', '430401', '市辖区', '430400');
INSERT INTO `areas` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `areas` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `areas` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `areas` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `areas` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `areas` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `areas` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `areas` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `areas` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `areas` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `areas` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `areas` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `areas` VALUES ('1834', '430501', '市辖区', '430500');
INSERT INTO `areas` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `areas` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `areas` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `areas` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `areas` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `areas` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `areas` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `areas` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `areas` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `areas` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `areas` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `areas` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `areas` VALUES ('1847', '430601', '市辖区', '430600');
INSERT INTO `areas` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `areas` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `areas` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `areas` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `areas` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `areas` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `areas` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `areas` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `areas` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `areas` VALUES ('1857', '430701', '市辖区', '430700');
INSERT INTO `areas` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `areas` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `areas` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `areas` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `areas` VALUES ('1862', '430723', '澧　县', '430700');
INSERT INTO `areas` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `areas` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `areas` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `areas` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `areas` VALUES ('1867', '430801', '市辖区', '430800');
INSERT INTO `areas` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `areas` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `areas` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `areas` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `areas` VALUES ('1872', '430901', '市辖区', '430900');
INSERT INTO `areas` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `areas` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `areas` VALUES ('1875', '430921', '南　县', '430900');
INSERT INTO `areas` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `areas` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `areas` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `areas` VALUES ('1879', '431001', '市辖区', '431000');
INSERT INTO `areas` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `areas` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `areas` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `areas` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `areas` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `areas` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `areas` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `areas` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `areas` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `areas` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `areas` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `areas` VALUES ('1891', '431101', '市辖区', '431100');
INSERT INTO `areas` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `areas` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `areas` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `areas` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `areas` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `areas` VALUES ('1897', '431124', '道　县', '431100');
INSERT INTO `areas` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `areas` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `areas` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `areas` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `areas` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `areas` VALUES ('1903', '431201', '市辖区', '431200');
INSERT INTO `areas` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `areas` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `areas` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `areas` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `areas` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `areas` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `areas` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `areas` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `areas` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `areas` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `areas` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `areas` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `areas` VALUES ('1916', '431301', '市辖区', '431300');
INSERT INTO `areas` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `areas` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `areas` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `areas` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `areas` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `areas` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `areas` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `areas` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `areas` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `areas` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `areas` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `areas` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `areas` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `areas` VALUES ('1930', '440101', '市辖区', '440100');
INSERT INTO `areas` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `areas` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `areas` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `areas` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `areas` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `areas` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `areas` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `areas` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `areas` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `areas` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `areas` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `areas` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `areas` VALUES ('1943', '440201', '市辖区', '440200');
INSERT INTO `areas` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `areas` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `areas` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `areas` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `areas` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `areas` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `areas` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `areas` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `areas` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `areas` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `areas` VALUES ('1954', '440301', '市辖区', '440300');
INSERT INTO `areas` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `areas` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `areas` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `areas` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `areas` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `areas` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `areas` VALUES ('1961', '440401', '市辖区', '440400');
INSERT INTO `areas` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `areas` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `areas` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `areas` VALUES ('1965', '440501', '市辖区', '440500');
INSERT INTO `areas` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `areas` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `areas` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `areas` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `areas` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `areas` VALUES ('1971', '440515', '澄海区', '440500');
INSERT INTO `areas` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `areas` VALUES ('1973', '440601', '市辖区', '440600');
INSERT INTO `areas` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `areas` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `areas` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `areas` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `areas` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `areas` VALUES ('1979', '440701', '市辖区', '440700');
INSERT INTO `areas` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `areas` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `areas` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `areas` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `areas` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `areas` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `areas` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `areas` VALUES ('1987', '440801', '市辖区', '440800');
INSERT INTO `areas` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `areas` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `areas` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `areas` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `areas` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `areas` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `areas` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `areas` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `areas` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `areas` VALUES ('1997', '440901', '市辖区', '440900');
INSERT INTO `areas` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `areas` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `areas` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `areas` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `areas` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `areas` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `areas` VALUES ('2004', '441201', '市辖区', '441200');
INSERT INTO `areas` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `areas` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `areas` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `areas` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `areas` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `areas` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `areas` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `areas` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `areas` VALUES ('2013', '441301', '市辖区', '441300');
INSERT INTO `areas` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `areas` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `areas` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `areas` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `areas` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `areas` VALUES ('2019', '441401', '市辖区', '441400');
INSERT INTO `areas` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `areas` VALUES ('2021', '441421', '梅　县', '441400');
INSERT INTO `areas` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `areas` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `areas` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `areas` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `areas` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `areas` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `areas` VALUES ('2028', '441501', '市辖区', '441500');
INSERT INTO `areas` VALUES ('2029', '441502', '城　区', '441500');
INSERT INTO `areas` VALUES ('2030', '441521', '海丰县', '441500');
INSERT INTO `areas` VALUES ('2031', '441523', '陆河县', '441500');
INSERT INTO `areas` VALUES ('2032', '441581', '陆丰市', '441500');
INSERT INTO `areas` VALUES ('2033', '441601', '市辖区', '441600');
INSERT INTO `areas` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `areas` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `areas` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `areas` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `areas` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `areas` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `areas` VALUES ('2040', '441701', '市辖区', '441700');
INSERT INTO `areas` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `areas` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `areas` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `areas` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `areas` VALUES ('2045', '441801', '市辖区', '441800');
INSERT INTO `areas` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `areas` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `areas` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `areas` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `areas` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `areas` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `areas` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `areas` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `areas` VALUES ('2054', '445101', '市辖区', '445100');
INSERT INTO `areas` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `areas` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `areas` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `areas` VALUES ('2058', '445201', '市辖区', '445200');
INSERT INTO `areas` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `areas` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `areas` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `areas` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `areas` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `areas` VALUES ('2064', '445301', '市辖区', '445300');
INSERT INTO `areas` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `areas` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `areas` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `areas` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `areas` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `areas` VALUES ('2070', '450101', '市辖区', '450100');
INSERT INTO `areas` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `areas` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `areas` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `areas` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `areas` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `areas` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `areas` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `areas` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `areas` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `areas` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `areas` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `areas` VALUES ('2082', '450127', '横　县', '450100');
INSERT INTO `areas` VALUES ('2083', '450201', '市辖区', '450200');
INSERT INTO `areas` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `areas` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `areas` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `areas` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `areas` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `areas` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `areas` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `areas` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `areas` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `areas` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `areas` VALUES ('2094', '450301', '市辖区', '450300');
INSERT INTO `areas` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `areas` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `areas` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `areas` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `areas` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `areas` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `areas` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `areas` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `areas` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `areas` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `areas` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `areas` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `areas` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `areas` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `areas` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `areas` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `areas` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `areas` VALUES ('2112', '450401', '市辖区', '450400');
INSERT INTO `areas` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `areas` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `areas` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `areas` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `areas` VALUES ('2117', '450422', '藤　县', '450400');
INSERT INTO `areas` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `areas` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `areas` VALUES ('2120', '450501', '市辖区', '450500');
INSERT INTO `areas` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `areas` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `areas` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `areas` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `areas` VALUES ('2125', '450601', '市辖区', '450600');
INSERT INTO `areas` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `areas` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `areas` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `areas` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `areas` VALUES ('2130', '450701', '市辖区', '450700');
INSERT INTO `areas` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `areas` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `areas` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `areas` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `areas` VALUES ('2135', '450801', '市辖区', '450800');
INSERT INTO `areas` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `areas` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `areas` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `areas` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `areas` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `areas` VALUES ('2141', '450901', '市辖区', '450900');
INSERT INTO `areas` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `areas` VALUES ('2143', '450921', '容　县', '450900');
INSERT INTO `areas` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `areas` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `areas` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `areas` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `areas` VALUES ('2148', '451001', '市辖区', '451000');
INSERT INTO `areas` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `areas` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `areas` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `areas` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `areas` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `areas` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `areas` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `areas` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `areas` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `areas` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `areas` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `areas` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `areas` VALUES ('2161', '451101', '市辖区', '451100');
INSERT INTO `areas` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `areas` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `areas` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `areas` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `areas` VALUES ('2166', '451201', '市辖区', '451200');
INSERT INTO `areas` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `areas` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `areas` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `areas` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `areas` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `areas` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `areas` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `areas` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `areas` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `areas` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `areas` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `areas` VALUES ('2178', '451301', '市辖区', '451300');
INSERT INTO `areas` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `areas` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `areas` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `areas` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `areas` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `areas` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `areas` VALUES ('2185', '451401', '市辖区', '451400');
INSERT INTO `areas` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `areas` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `areas` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `areas` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `areas` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `areas` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `areas` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `areas` VALUES ('2193', '460101', '市辖区', '460100');
INSERT INTO `areas` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `areas` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `areas` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `areas` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `areas` VALUES ('2198', '460201', '市辖区', '460200');
INSERT INTO `areas` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `areas` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `areas` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `areas` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `areas` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `areas` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `areas` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `areas` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `areas` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `areas` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `areas` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `areas` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `areas` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `areas` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `areas` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `areas` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `areas` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `areas` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `areas` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `areas` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `areas` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `areas` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `areas` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `areas` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `areas` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `areas` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `areas` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `areas` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `areas` VALUES ('2227', '500110', '万盛区', '500100');
INSERT INTO `areas` VALUES ('2228', '500111', '双桥区', '500100');
INSERT INTO `areas` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `areas` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `areas` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `areas` VALUES ('2232', '500115', '长寿区', '500100');
INSERT INTO `areas` VALUES ('2233', '500222', '綦江县', '500200');
INSERT INTO `areas` VALUES ('2234', '500223', '潼南县', '500200');
INSERT INTO `areas` VALUES ('2235', '500224', '铜梁县', '500200');
INSERT INTO `areas` VALUES ('2236', '500225', '大足县', '500200');
INSERT INTO `areas` VALUES ('2237', '500226', '荣昌县', '500200');
INSERT INTO `areas` VALUES ('2238', '500227', '璧山县', '500200');
INSERT INTO `areas` VALUES ('2239', '500228', '梁平县', '500200');
INSERT INTO `areas` VALUES ('2240', '500229', '城口县', '500200');
INSERT INTO `areas` VALUES ('2241', '500230', '丰都县', '500200');
INSERT INTO `areas` VALUES ('2242', '500231', '垫江县', '500200');
INSERT INTO `areas` VALUES ('2243', '500232', '武隆县', '500200');
INSERT INTO `areas` VALUES ('2244', '500233', '忠　县', '500200');
INSERT INTO `areas` VALUES ('2245', '500234', '开　县', '500200');
INSERT INTO `areas` VALUES ('2246', '500235', '云阳县', '500200');
INSERT INTO `areas` VALUES ('2247', '500236', '奉节县', '500200');
INSERT INTO `areas` VALUES ('2248', '500237', '巫山县', '500200');
INSERT INTO `areas` VALUES ('2249', '500238', '巫溪县', '500200');
INSERT INTO `areas` VALUES ('2250', '500240', '石柱土家族自治县', '500200');
INSERT INTO `areas` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `areas` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `areas` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `areas` VALUES ('2254', '500381', '江津市', '500300');
INSERT INTO `areas` VALUES ('2255', '500382', '合川市', '500300');
INSERT INTO `areas` VALUES ('2256', '500383', '永川市', '500300');
INSERT INTO `areas` VALUES ('2257', '500384', '南川市', '500300');
INSERT INTO `areas` VALUES ('2258', '510101', '市辖区', '510100');
INSERT INTO `areas` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `areas` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `areas` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `areas` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `areas` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `areas` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `areas` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `areas` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `areas` VALUES ('2267', '510115', '温江区', '510100');
INSERT INTO `areas` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `areas` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `areas` VALUES ('2270', '510124', '郫　县', '510100');
INSERT INTO `areas` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `areas` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `areas` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `areas` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `areas` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `areas` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `areas` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `areas` VALUES ('2278', '510301', '市辖区', '510300');
INSERT INTO `areas` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `areas` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `areas` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `areas` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `areas` VALUES ('2283', '510321', '荣　县', '510300');
INSERT INTO `areas` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `areas` VALUES ('2285', '510401', '市辖区', '510400');
INSERT INTO `areas` VALUES ('2286', '510402', '东　区', '510400');
INSERT INTO `areas` VALUES ('2287', '510403', '西　区', '510400');
INSERT INTO `areas` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `areas` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `areas` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `areas` VALUES ('2291', '510501', '市辖区', '510500');
INSERT INTO `areas` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `areas` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `areas` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `areas` VALUES ('2295', '510521', '泸　县', '510500');
INSERT INTO `areas` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `areas` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `areas` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `areas` VALUES ('2299', '510601', '市辖区', '510600');
INSERT INTO `areas` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `areas` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `areas` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `areas` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `areas` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `areas` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `areas` VALUES ('2306', '510701', '市辖区', '510700');
INSERT INTO `areas` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `areas` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `areas` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `areas` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `areas` VALUES ('2311', '510724', '安　县', '510700');
INSERT INTO `areas` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `areas` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `areas` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `areas` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `areas` VALUES ('2316', '510801', '市辖区', '510800');
INSERT INTO `areas` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `areas` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `areas` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `areas` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `areas` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `areas` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `areas` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `areas` VALUES ('2324', '510901', '市辖区', '510900');
INSERT INTO `areas` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `areas` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `areas` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `areas` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `areas` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `areas` VALUES ('2330', '511001', '市辖区', '511000');
INSERT INTO `areas` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `areas` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `areas` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `areas` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `areas` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `areas` VALUES ('2336', '511101', '市辖区', '511100');
INSERT INTO `areas` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `areas` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `areas` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `areas` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `areas` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `areas` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `areas` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `areas` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `areas` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `areas` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `areas` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `areas` VALUES ('2348', '511301', '市辖区', '511300');
INSERT INTO `areas` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `areas` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `areas` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `areas` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `areas` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `areas` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `areas` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `areas` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `areas` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `areas` VALUES ('2358', '511401', '市辖区', '511400');
INSERT INTO `areas` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `areas` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `areas` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `areas` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `areas` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `areas` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `areas` VALUES ('2365', '511501', '市辖区', '511500');
INSERT INTO `areas` VALUES ('2366', '511502', '翠屏区', '511500');
INSERT INTO `areas` VALUES ('2367', '511521', '宜宾县', '511500');
INSERT INTO `areas` VALUES ('2368', '511522', '南溪县', '511500');
INSERT INTO `areas` VALUES ('2369', '511523', '江安县', '511500');
INSERT INTO `areas` VALUES ('2370', '511524', '长宁县', '511500');
INSERT INTO `areas` VALUES ('2371', '511525', '高　县', '511500');
INSERT INTO `areas` VALUES ('2372', '511526', '珙　县', '511500');
INSERT INTO `areas` VALUES ('2373', '511527', '筠连县', '511500');
INSERT INTO `areas` VALUES ('2374', '511528', '兴文县', '511500');
INSERT INTO `areas` VALUES ('2375', '511529', '屏山县', '511500');
INSERT INTO `areas` VALUES ('2376', '511601', '市辖区', '511600');
INSERT INTO `areas` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `areas` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `areas` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `areas` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `areas` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `areas` VALUES ('2382', '511701', '市辖区', '511700');
INSERT INTO `areas` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `areas` VALUES ('2384', '511721', '达　县', '511700');
INSERT INTO `areas` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `areas` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `areas` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `areas` VALUES ('2388', '511725', '渠　县', '511700');
INSERT INTO `areas` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `areas` VALUES ('2390', '511801', '市辖区', '511800');
INSERT INTO `areas` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `areas` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `areas` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `areas` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `areas` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `areas` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `areas` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `areas` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `areas` VALUES ('2399', '511901', '市辖区', '511900');
INSERT INTO `areas` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `areas` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `areas` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `areas` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `areas` VALUES ('2404', '512001', '市辖区', '512000');
INSERT INTO `areas` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `areas` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `areas` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `areas` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `areas` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `areas` VALUES ('2410', '513222', '理　县', '513200');
INSERT INTO `areas` VALUES ('2411', '513223', '茂　县', '513200');
INSERT INTO `areas` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `areas` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `areas` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `areas` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `areas` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `areas` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `areas` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `areas` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `areas` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `areas` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `areas` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `areas` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `areas` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `areas` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `areas` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `areas` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `areas` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `areas` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `areas` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `areas` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `areas` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `areas` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `areas` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `areas` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `areas` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `areas` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `areas` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `areas` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `areas` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `areas` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `areas` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `areas` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `areas` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `areas` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `areas` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `areas` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `areas` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `areas` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `areas` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `areas` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `areas` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `areas` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `areas` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `areas` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `areas` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `areas` VALUES ('2457', '520101', '市辖区', '520100');
INSERT INTO `areas` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `areas` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `areas` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `areas` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `areas` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `areas` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `areas` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `areas` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `areas` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `areas` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `areas` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `areas` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `areas` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `areas` VALUES ('2471', '520222', '盘　县', '520200');
INSERT INTO `areas` VALUES ('2472', '520301', '市辖区', '520300');
INSERT INTO `areas` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `areas` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `areas` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `areas` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `areas` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `areas` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `areas` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `areas` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `areas` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `areas` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `areas` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `areas` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `areas` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `areas` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `areas` VALUES ('2487', '520401', '市辖区', '520400');
INSERT INTO `areas` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `areas` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `areas` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `areas` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `areas` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `areas` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `areas` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `areas` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `areas` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `areas` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `areas` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `areas` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `areas` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `areas` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `areas` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `areas` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `areas` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `areas` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `areas` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `areas` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `areas` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `areas` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `areas` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `areas` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `areas` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `areas` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `areas` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `areas` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `areas` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `areas` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `areas` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `areas` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `areas` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `areas` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `areas` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `areas` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `areas` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `areas` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `areas` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `areas` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `areas` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `areas` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `areas` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `areas` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `areas` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `areas` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `areas` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `areas` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `areas` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `areas` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `areas` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `areas` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `areas` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `areas` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `areas` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `areas` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `areas` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `areas` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `areas` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `areas` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `areas` VALUES ('2548', '530101', '市辖区', '530100');
INSERT INTO `areas` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `areas` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `areas` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `areas` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `areas` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `areas` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `areas` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `areas` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `areas` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `areas` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `areas` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `areas` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `areas` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `areas` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `areas` VALUES ('2563', '530301', '市辖区', '530300');
INSERT INTO `areas` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `areas` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `areas` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `areas` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `areas` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `areas` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `areas` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `areas` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `areas` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `areas` VALUES ('2573', '530401', '市辖区', '530400');
INSERT INTO `areas` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `areas` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `areas` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `areas` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `areas` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `areas` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `areas` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `areas` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `areas` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `areas` VALUES ('2583', '530501', '市辖区', '530500');
INSERT INTO `areas` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `areas` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `areas` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `areas` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `areas` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `areas` VALUES ('2589', '530601', '市辖区', '530600');
INSERT INTO `areas` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `areas` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `areas` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `areas` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `areas` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `areas` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `areas` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `areas` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `areas` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `areas` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `areas` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `areas` VALUES ('2601', '530701', '市辖区', '530700');
INSERT INTO `areas` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `areas` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `areas` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `areas` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `areas` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `areas` VALUES ('2607', '530801', '市辖区', '530800');
INSERT INTO `areas` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `areas` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `areas` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `areas` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `areas` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `areas` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `areas` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `areas` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `areas` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `areas` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `areas` VALUES ('2618', '530901', '市辖区', '530900');
INSERT INTO `areas` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `areas` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `areas` VALUES ('2621', '530922', '云　县', '530900');
INSERT INTO `areas` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `areas` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `areas` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `areas` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `areas` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `areas` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `areas` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `areas` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `areas` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `areas` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `areas` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `areas` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `areas` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `areas` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `areas` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `areas` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `areas` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `areas` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `areas` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `areas` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `areas` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `areas` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `areas` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `areas` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `areas` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `areas` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `areas` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `areas` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `areas` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `areas` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `areas` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `areas` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `areas` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `areas` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `areas` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `areas` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `areas` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `areas` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `areas` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `areas` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `areas` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `areas` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `areas` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `areas` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `areas` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `areas` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `areas` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `areas` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `areas` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `areas` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `areas` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `areas` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `areas` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `areas` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `areas` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `areas` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `areas` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `areas` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `areas` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `areas` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `areas` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `areas` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `areas` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `areas` VALUES ('2685', '540101', '市辖区', '540100');
INSERT INTO `areas` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `areas` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `areas` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `areas` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `areas` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `areas` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `areas` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `areas` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `areas` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `areas` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `areas` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `areas` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `areas` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `areas` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `areas` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `areas` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `areas` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `areas` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `areas` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `areas` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `areas` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `areas` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `areas` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `areas` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `areas` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `areas` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `areas` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `areas` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `areas` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `areas` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `areas` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `areas` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `areas` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `areas` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `areas` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `areas` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `areas` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `areas` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `areas` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `areas` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `areas` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `areas` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `areas` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `areas` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `areas` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `areas` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `areas` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `areas` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `areas` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `areas` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `areas` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `areas` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `areas` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `areas` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `areas` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `areas` VALUES ('2741', '542427', '索　县', '542400');
INSERT INTO `areas` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `areas` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `areas` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `areas` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `areas` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `areas` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `areas` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `areas` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `areas` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `areas` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `areas` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `areas` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `areas` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `areas` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `areas` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `areas` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `areas` VALUES ('2758', '542627', '朗　县', '542600');
INSERT INTO `areas` VALUES ('2759', '610101', '市辖区', '610100');
INSERT INTO `areas` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `areas` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `areas` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `areas` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `areas` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `areas` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `areas` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `areas` VALUES ('2767', '610115', '临潼区', '610100');
INSERT INTO `areas` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `areas` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `areas` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `areas` VALUES ('2771', '610125', '户　县', '610100');
INSERT INTO `areas` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `areas` VALUES ('2773', '610201', '市辖区', '610200');
INSERT INTO `areas` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `areas` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `areas` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `areas` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `areas` VALUES ('2778', '610301', '市辖区', '610300');
INSERT INTO `areas` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `areas` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `areas` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `areas` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `areas` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `areas` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `areas` VALUES ('2785', '610326', '眉　县', '610300');
INSERT INTO `areas` VALUES ('2786', '610327', '陇　县', '610300');
INSERT INTO `areas` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `areas` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `areas` VALUES ('2789', '610330', '凤　县', '610300');
INSERT INTO `areas` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `areas` VALUES ('2791', '610401', '市辖区', '610400');
INSERT INTO `areas` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `areas` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `areas` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `areas` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `areas` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `areas` VALUES ('2797', '610424', '乾　县', '610400');
INSERT INTO `areas` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `areas` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `areas` VALUES ('2800', '610427', '彬　县', '610400');
INSERT INTO `areas` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `areas` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `areas` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `areas` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `areas` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `areas` VALUES ('2806', '610501', '市辖区', '610500');
INSERT INTO `areas` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `areas` VALUES ('2808', '610521', '华　县', '610500');
INSERT INTO `areas` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `areas` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `areas` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `areas` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `areas` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `areas` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `areas` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `areas` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `areas` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `areas` VALUES ('2818', '610601', '市辖区', '610600');
INSERT INTO `areas` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `areas` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `areas` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `areas` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `areas` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `areas` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `areas` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `areas` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `areas` VALUES ('2827', '610628', '富　县', '610600');
INSERT INTO `areas` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `areas` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `areas` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `areas` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `areas` VALUES ('2832', '610701', '市辖区', '610700');
INSERT INTO `areas` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `areas` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `areas` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `areas` VALUES ('2836', '610723', '洋　县', '610700');
INSERT INTO `areas` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `areas` VALUES ('2838', '610725', '勉　县', '610700');
INSERT INTO `areas` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `areas` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `areas` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `areas` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `areas` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `areas` VALUES ('2844', '610801', '市辖区', '610800');
INSERT INTO `areas` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `areas` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `areas` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `areas` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `areas` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `areas` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `areas` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `areas` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `areas` VALUES ('2853', '610828', '佳　县', '610800');
INSERT INTO `areas` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `areas` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `areas` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `areas` VALUES ('2857', '610901', '市辖区', '610900');
INSERT INTO `areas` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `areas` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `areas` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `areas` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `areas` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `areas` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `areas` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `areas` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `areas` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `areas` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `areas` VALUES ('2868', '611001', '市辖区', '611000');
INSERT INTO `areas` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `areas` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `areas` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `areas` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `areas` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `areas` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `areas` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `areas` VALUES ('2876', '620101', '市辖区', '620100');
INSERT INTO `areas` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `areas` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `areas` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `areas` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `areas` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `areas` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `areas` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `areas` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `areas` VALUES ('2885', '620201', '市辖区', '620200');
INSERT INTO `areas` VALUES ('2886', '620301', '市辖区', '620300');
INSERT INTO `areas` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `areas` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `areas` VALUES ('2889', '620401', '市辖区', '620400');
INSERT INTO `areas` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `areas` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `areas` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `areas` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `areas` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `areas` VALUES ('2895', '620501', '市辖区', '620500');
INSERT INTO `areas` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `areas` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `areas` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `areas` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `areas` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `areas` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `areas` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `areas` VALUES ('2903', '620601', '市辖区', '620600');
INSERT INTO `areas` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `areas` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `areas` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `areas` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `areas` VALUES ('2908', '620701', '市辖区', '620700');
INSERT INTO `areas` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `areas` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `areas` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `areas` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `areas` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `areas` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `areas` VALUES ('2915', '620801', '市辖区', '620800');
INSERT INTO `areas` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `areas` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `areas` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `areas` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `areas` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `areas` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `areas` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `areas` VALUES ('2923', '620901', '市辖区', '620900');
INSERT INTO `areas` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `areas` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `areas` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `areas` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `areas` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `areas` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `areas` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `areas` VALUES ('2931', '621001', '市辖区', '621000');
INSERT INTO `areas` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `areas` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `areas` VALUES ('2934', '621022', '环　县', '621000');
INSERT INTO `areas` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `areas` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `areas` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `areas` VALUES ('2938', '621026', '宁　县', '621000');
INSERT INTO `areas` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `areas` VALUES ('2940', '621101', '市辖区', '621100');
INSERT INTO `areas` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `areas` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `areas` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `areas` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `areas` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `areas` VALUES ('2946', '621125', '漳　县', '621100');
INSERT INTO `areas` VALUES ('2947', '621126', '岷　县', '621100');
INSERT INTO `areas` VALUES ('2948', '621201', '市辖区', '621200');
INSERT INTO `areas` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `areas` VALUES ('2950', '621221', '成　县', '621200');
INSERT INTO `areas` VALUES ('2951', '621222', '文　县', '621200');
INSERT INTO `areas` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `areas` VALUES ('2953', '621224', '康　县', '621200');
INSERT INTO `areas` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `areas` VALUES ('2955', '621226', '礼　县', '621200');
INSERT INTO `areas` VALUES ('2956', '621227', '徽　县', '621200');
INSERT INTO `areas` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `areas` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `areas` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `areas` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `areas` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `areas` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `areas` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `areas` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `areas` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `areas` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `areas` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `areas` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `areas` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `areas` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `areas` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `areas` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `areas` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `areas` VALUES ('2974', '630101', '市辖区', '630100');
INSERT INTO `areas` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `areas` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `areas` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `areas` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `areas` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `areas` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `areas` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `areas` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `areas` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `areas` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `areas` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `areas` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `areas` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `areas` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `areas` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `areas` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `areas` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `areas` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `areas` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `areas` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `areas` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `areas` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `areas` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `areas` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `areas` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `areas` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `areas` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `areas` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `areas` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `areas` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `areas` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `areas` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `areas` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `areas` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `areas` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `areas` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `areas` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `areas` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `areas` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `areas` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `areas` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `areas` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `areas` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `areas` VALUES ('3018', '640101', '市辖区', '640100');
INSERT INTO `areas` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `areas` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `areas` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `areas` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `areas` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `areas` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `areas` VALUES ('3025', '640201', '市辖区', '640200');
INSERT INTO `areas` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `areas` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `areas` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `areas` VALUES ('3029', '640301', '市辖区', '640300');
INSERT INTO `areas` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `areas` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `areas` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `areas` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `areas` VALUES ('3034', '640401', '市辖区', '640400');
INSERT INTO `areas` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `areas` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `areas` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `areas` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `areas` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `areas` VALUES ('3040', '640501', '市辖区', '640500');
INSERT INTO `areas` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `areas` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `areas` VALUES ('3043', '640522', '海原县', '640500');
INSERT INTO `areas` VALUES ('3044', '650101', '市辖区', '650100');
INSERT INTO `areas` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `areas` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `areas` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `areas` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `areas` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `areas` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `areas` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `areas` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `areas` VALUES ('3053', '650201', '市辖区', '650200');
INSERT INTO `areas` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `areas` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `areas` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `areas` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `areas` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `areas` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `areas` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `areas` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `areas` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `areas` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `areas` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `areas` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `areas` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `areas` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `areas` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `areas` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `areas` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `areas` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `areas` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `areas` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `areas` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `areas` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `areas` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `areas` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `areas` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `areas` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `areas` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `areas` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `areas` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `areas` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `areas` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `areas` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `areas` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `areas` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `areas` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `areas` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `areas` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `areas` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `areas` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `areas` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `areas` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `areas` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `areas` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `areas` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `areas` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `areas` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `areas` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `areas` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `areas` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `areas` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `areas` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `areas` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `areas` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `areas` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `areas` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `areas` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `areas` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `areas` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `areas` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `areas` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `areas` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `areas` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `areas` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `areas` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `areas` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `areas` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `areas` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `areas` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `areas` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `areas` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `areas` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `areas` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `areas` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `areas` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `areas` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `areas` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `areas` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `areas` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `areas` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `areas` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `areas` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `areas` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `areas` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `areas` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `areas` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `areas` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `areas` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `areas` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `areas` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `areas` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `areas` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for binding
-- ----------------------------
DROP TABLE IF EXISTS `binding`;
CREATE TABLE `binding` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user id of binding information',
  `receiver` varchar(20) DEFAULT NULL COMMENT 'name of credit card owner',
  `credit_no` varchar(40) DEFAULT NULL COMMENT 'number of credit card',
  `id_no` varchar(20) DEFAULT NULL COMMENT 'number of ID card of receiver',
  `bank_phone` varchar(20) DEFAULT NULL COMMENT 'phone number of bank of credit card',
  `bank` varchar(50) DEFAULT NULL COMMENT 'name of bank of credit',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT 'amount of money the user have on this program',
  PRIMARY KEY (`no`),
  KEY `binding_ibfk_1` (`user_id`),
  CONSTRAINT `binding_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binding
-- ----------------------------
INSERT INTO `binding` VALUES ('0', '0', null, null, null, null, null, '60.40');
INSERT INTO `binding` VALUES ('1233', '959', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1234', '960', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1235', '961', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1236', '962', null, null, null, null, null, '7.70');
INSERT INTO `binding` VALUES ('1237', '963', null, null, null, null, null, '3.00');
INSERT INTO `binding` VALUES ('1238', '964', null, null, null, null, null, '3.40');
INSERT INTO `binding` VALUES ('1239', '965', null, null, null, null, null, '2.00');
INSERT INTO `binding` VALUES ('1240', '956', null, null, null, null, null, '85.85');
INSERT INTO `binding` VALUES ('1241', '966', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1242', '967', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1243', '968', null, null, null, null, null, '1.40');
INSERT INTO `binding` VALUES ('1244', '969', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1245', '970', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1246', '971', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1247', '972', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1248', '973', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1249', '974', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1250', '975', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1251', '976', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1252', '977', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1253', '978', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1254', '979', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1255', '980', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1256', '981', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1257', '982', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1258', '983', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1259', '984', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1260', '985', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1261', '986', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1262', '987', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1263', '988', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1264', '989', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1265', '990', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1266', '991', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1267', '992', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1268', '993', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1269', '994', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1270', '995', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1271', '996', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1272', '997', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1273', '998', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1274', '999', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1275', '1000', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1276', '1001', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1277', '1002', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1278', '1003', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1279', '1004', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1280', '1005', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1281', '1006', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1282', '1007', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1283', '1008', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1284', '1009', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1285', '1010', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1286', '1011', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1287', '1012', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1288', '1013', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1289', '1014', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1290', '1015', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1291', '1016', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1292', '1017', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1293', '1018', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1294', '1019', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1295', '1020', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1296', '1021', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1297', '1022', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1298', '1023', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1299', '1024', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1300', '1025', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1301', '1026', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1302', '1027', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1303', '1028', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1304', '1029', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1305', '1030', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1306', '1031', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1307', '1032', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1308', '1033', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1309', '1034', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1310', '1035', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1311', '1036', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1312', '1037', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1313', '1038', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1314', '1039', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1315', '1040', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1316', '1041', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1317', '1042', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1318', '1043', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1319', '1044', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1320', '1045', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1321', '1046', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1322', '1047', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1323', '1048', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1324', '1049', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1325', '1050', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1326', '1051', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1327', '1052', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1328', '1053', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1329', '1054', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1330', '1055', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1331', '1056', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1332', '1057', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1333', '1058', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1334', '1059', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1335', '1060', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1336', '1061', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1337', '1062', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1338', '1063', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1339', '1064', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1340', '1065', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1341', '1066', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1342', '1067', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1343', '1068', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1344', '1069', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1345', '1070', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1346', '1071', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1347', '1072', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1348', '1073', null, null, null, null, null, '0.00');

-- ----------------------------
-- Table structure for binding_history
-- ----------------------------
DROP TABLE IF EXISTS `binding_history`;
CREATE TABLE `binding_history` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `binding_no` varchar(255) DEFAULT NULL COMMENT 'no of binding information',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'administrator id of who manage this binding',
  `partner_trade_no` varchar(255) DEFAULT NULL COMMENT 'explain of binding',
  `amount` decimal(11,2) DEFAULT NULL COMMENT 'amount of binding money',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of apply binding',
  `binding_time` datetime DEFAULT NULL COMMENT 'time when binding completed',
  `state` tinyint(4) DEFAULT '0' COMMENT 'state of binding',
  `type` smallint(6) DEFAULT '0',
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binding_history
-- ----------------------------
INSERT INTO `binding_history` VALUES ('28', '1500220062201811098603183269', '961', '15002200621541726570538', '2.00', '2018-11-09 09:22:46', '2018-11-09 09:22:46', '1', '0', null);
INSERT INTO `binding_history` VALUES ('29', '1500220062201811098697149881', '967', '15002200621541749252823', '6.00', '2018-11-09 15:40:54', '2018-11-09 15:40:55', '1', '0', null);
INSERT INTO `binding_history` VALUES ('30', '1500220062201811098704151478', '968', '15002200621541749359295', '1.20', '2018-11-09 15:42:39', '2018-11-09 15:42:40', '1', '0', null);
INSERT INTO `binding_history` VALUES ('31', '1500220062201811098633619822', '962', '15002200621541750177744', '300.00', '2018-11-09 15:56:18', '2018-11-09 15:56:19', '1', '0', null);
INSERT INTO `binding_history` VALUES ('32', '1500220062201811098741921973', '965', '15002200621541761090369', '2.00', '2018-11-09 18:58:10', '2018-11-09 18:58:11', '1', '0', null);
INSERT INTO `binding_history` VALUES ('33', '1500220062201811098798816489', '961', '15002200621541776968837', '2.00', '2018-11-09 23:22:43', '2018-11-09 23:22:44', '1', '0', null);
INSERT INTO `binding_history` VALUES ('34', '1500220062201811108816828935', '961', '15002200621541835653596', '2.00', '2018-11-10 15:40:46', '2018-11-10 15:40:47', '1', '0', null);
INSERT INTO `binding_history` VALUES ('35', '1500220062201811108858125237', '961', '15002200621541837767179', '4.04', '2018-11-10 16:16:00', '2018-11-10 16:16:01', '1', '0', null);
INSERT INTO `binding_history` VALUES ('36', '1500220062201811118961483853', '956', '15002200621541876190351', '2.00', '2018-11-11 02:56:29', '2018-11-11 02:56:30', '1', '0', null);
INSERT INTO `binding_history` VALUES ('37', '1500220062201811118956641684', '961', '15002200621541876456835', '2.00', '2018-11-11 03:00:56', '2018-11-11 03:00:57', '1', '0', null);
INSERT INTO `binding_history` VALUES ('38', '1500220062201811118880533212', '962', '15002200621541893873916', '2.00', '2018-11-11 07:51:14', '2018-11-11 07:51:15', '1', '0', null);
INSERT INTO `binding_history` VALUES ('39', '1500220062201811118965021292', '965', '15002200621541895331026', '2.00', '2018-11-11 08:15:31', '2018-11-11 08:15:32', '1', '0', null);
INSERT INTO `binding_history` VALUES ('40', '1500220062201811118905655918', '962', '15002200621541913309215', '2.00', '2018-11-11 13:15:09', '2018-11-11 13:15:10', '1', '0', null);

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user id of this booking',
  `cancel_user` bigint(20) DEFAULT NULL,
  `reg_num` bigint(10) DEFAULT NULL COMMENT 'number of sign up by this user',
  `pay_type` smallint(6) DEFAULT '0',
  `event_id` bigint(20) DEFAULT NULL COMMENT 'id of event for this booking',
  `description` varchar(100) DEFAULT NULL,
  `state` smallint(6) DEFAULT '0' COMMENT 'state of booking',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of booking',
  `out_trade_no` varchar(40) DEFAULT NULL,
  `out_refund_no` varchar(40) DEFAULT NULL,
  `name` varchar(20) DEFAULT '',
  `phone` varchar(20) DEFAULT '',
  `pay_honey` decimal(10,2) DEFAULT NULL,
  `pay_cost` decimal(10,2) DEFAULT NULL,
  `pay_online` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `opt3` varchar(30) DEFAULT '',
  `book_info` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1404 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('1337', '0', '961', '2', '1', '1264', '', '2', '2018-11-01 22:11:15', '1500220062154108146804257280', null, '噶是', '18641502372', '0.00', '0.02', '00000000.02', '', '\"\"');
INSERT INTO `booking` VALUES ('1338', '962', null, '1', '0', '1265', '', '0', '2018-11-01 22:34:19', null, null, '刘小蜂', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1339', '963', null, '1', '0', '1265', '', '0', '2018-11-01 23:31:15', null, null, 'Y。Y', '15045715418', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1340', '964', null, '1', '0', '1265', '', '0', '2018-11-02 03:05:01', null, null, '化龙', '17603602906', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1341', '965', null, '1', '0', '1265', '', '0', '2018-11-02 07:54:12', null, null, '我啊', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1342', '964', null, '1', '1', '1266', '', '1', '2018-11-02 09:50:36', '1500220062154112342623457772', null, '化龙', '17603602906', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1343', '967', null, '1', '1', '1266', '', '1', '2018-11-02 09:51:27', '1500220062154112348008750520', null, '杨小蜂', '18846079302', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1344', '963', null, '1', '1', '1266', '', '1', '2018-11-02 09:53:45', '1500220062154112362996595883', null, 'Y。Y', '15045715418', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1345', '962', null, '1', '1', '1266', '', '1', '2018-11-02 09:55:48', '', null, '刘小蜂', '18846140810', '0.00', '0.50', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1346', '965', null, '1', '1', '1266', '', '1', '2018-11-02 10:25:40', '1500220062154112552705593824', null, '小黄蜂', '18846140510', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1347', '968', null, '1', '1', '1266', '', '1', '2018-11-02 10:58:02', '1500220062154112747267685933', null, '舒瑶', '17745165119', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1348', '963', null, '1', '0', '1274', '', '1', '2018-11-03 08:16:55', null, null, '杨毅', '18846046148', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1349', '962', null, '1', '1', '1270', '', '0', '2018-11-03 23:07:31', '1500220062154125764450758630', null, '刘小蜂', '18846140810', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1350', '965', null, '1', '1', '1270', '', '0', '2018-11-03 23:11:41', '1500220062154125788834634128', null, '小黄蜂', '18846140510', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1351', '983', null, '1', '1', '1270', '', '0', '2018-11-03 23:22:32', '1500220062154125853991430900', null, '孙睿雪', '17745186552', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1352', '967', null, '1', '1', '1270', '', '0', '2018-11-03 23:34:17', '1500220062154125860930370861', null, '杨德全', '18846079302', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1353', '963', null, '1', '1', '1270', '', '0', '2018-11-03 23:46:46', '1500220062154126001093170088', null, '杨毅', '18846046148', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1354', '984', null, '1', '1', '1270', '', '0', '2018-11-03 23:54:34', '1500220062154126046033023444', null, '北海。', '13047495186', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1355', '967', null, '1', '0', '1279', '', '1', '2018-11-04 14:35:39', null, null, '杨德全', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1356', '967', null, '1', '0', '1265', '', '0', '2018-11-04 14:35:56', null, null, '杨德全', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1357', '967', null, '1', '1', '1280', '', '1', '2018-11-04 15:01:50', '1500220062154131490486657826', null, '杨德全', '18846079302', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1358', '985', null, '1', '1', '1280', '', '1', '2018-11-04 15:07:34', '1500220062154131524607219420', null, '水', '18045623295', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1359', '984', null, '1', '1', '1280', '', '1', '2018-11-04 20:42:10', '1500220062154133531405916887', null, '北泱', '13047495186', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1360', '964', null, '1', '1', '1281', '', '0', '2018-11-05 10:14:10', '1500220062154138404273695056', null, '闫化龙', '17603602906', '0.00', '0.80', '00000000.80', '', '\"\"');
INSERT INTO `booking` VALUES ('1361', '968', null, '1', '1', '1281', '', '0', '2018-11-05 10:14:20', '', null, '舒瑶', '17745165119', '0.00', '0.80', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1362', '984', null, '1', '1', '1281', '', '0', '2018-11-05 11:03:52', '1500220062154138699331890697', null, '北泱', '13047495186', '0.00', '0.80', '00000000.80', '', '\"\"');
INSERT INTO `booking` VALUES ('1363', '983', null, '1', '1', '1281', '', '0', '2018-11-05 11:51:18', '1500220062154138986595967917', null, '浅浅', '17745186552', '0.00', '0.80', '00000000.80', '', '\"\"');
INSERT INTO `booking` VALUES ('1364', '967', null, '1', '1', '1282', '', '0', '2018-11-06 10:27:14', '1500220062154147122914753228', null, '杨德全', '18846079302', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1365', '968', null, '1', '1', '1282', '', '0', '2018-11-06 10:27:14', '', null, '舒瑶', '17745165119', '0.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1366', '962', null, '1', '1', '1282', '', '0', '2018-11-06 10:27:24', '', null, '刘延龙', '18846140810', '1.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1367', '963', null, '1', '1', '1282', '', '0', '2018-11-06 10:31:33', '1500220062154147150066591866', null, '杨毅', '18846046148', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1368', '984', null, '1', '1', '1282', '', '0', '2018-11-06 10:47:17', '1500220062154147242680279731', null, '北泱', '13047495186', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1369', '962', null, '1', '1', '1283', '', '1', '2018-11-07 07:37:06', '1500220062154154741954723303', null, '刘延龙', '18846140810', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1370', '968', null, '1', '1', '1283', '', '1', '2018-11-07 07:51:30', '', null, '舒瑶', '17745165119', '0.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1371', '984', null, '1', '1', '1283', '', '1', '2018-11-07 07:54:26', '1500220062154154845497556588', null, '北泱', '13047495186', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1372', '964', null, '1', '1', '1283', '', '1', '2018-11-07 07:59:15', '', null, '闫化龙', '17603602906', '0.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1373', '963', null, '1', '1', '1283', '', '1', '2018-11-07 09:52:56', '1500220062154155559004278622', null, '杨毅', '18846046148', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1374', '985', null, '1', '1', '1283', '', '1', '2018-11-07 10:56:05', '1500220062154155935751272899', null, '水', '18045623295', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1375', '967', null, '1', '1', '1284', '', '1', '2018-11-07 12:23:30', '1500220062154156459371324708', null, '杨德全', '18846079302', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1376', '962', null, '1', '1', '1284', '', '1', '2018-11-07 12:27:07', '1500220062154156464785312438', null, '刘延龙', '18846140810', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1377', '983', null, '1', '1', '1284', '', '1', '2018-11-07 18:44:26', '1500220062154158745357176699', null, '浅浅', '17745186552', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1378', '984', null, '1', '1', '1285', '', '1', '2018-11-08 07:57:00', '1500220062154163501110455152', null, '北泱', '13047495186', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1379', '964', null, '1', '1', '1285', '', '1', '2018-11-08 08:10:24', '', null, '闫化龙', '17603602906', '0.00', '0.60', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1380', '968', null, '1', '1', '1285', '', '1', '2018-11-08 08:13:06', '', null, '舒瑶', '17745165119', '0.00', '0.60', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1381', '962', null, '1', '1', '1285', '', '1', '2018-11-08 10:02:54', '1500220062154164256618813140', null, '刘延龙', '18846140810', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1382', '983', null, '1', '1', '1285', '', '1', '2018-11-08 10:03:08', '1500220062154164257571445926', null, '浅浅', '17745186552', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1383', '985', null, '1', '1', '1285', '', '1', '2018-11-08 10:04:11', '1500220062154164262870122340', null, '水', '18045623295', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1384', '967', null, '1', '1', '1285', '', '1', '2018-11-08 10:07:00', '1500220062154164281433756416', null, '杨德全', '18846079302', '0.00', '0.60', '00000000.60', '', '\"\"');
INSERT INTO `booking` VALUES ('1386', '0', '961', '2', '1', '1297', '', '2', '2018-11-09 09:21:53', '1500220062154172650911055808', null, '噶是', '18641502372', '0.00', '2.00', '00000002.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1388', '961', null, '1', '0', '1287', null, '0', '2018-11-09 10:17:22', null, null, '噶是', '18641502372', '0.00', '20.00', '00000000.00', '', '[\"\\u5728\\u4f60\\u8fd9\",\"18641502372\",\"\\u5728\\u4f60\\u8fd9\",\"\\u5728\\u4f60\\u8fd9\\u4f60\\u5728\",1,\"123456789012345678\",\"\\u627e\\u4f60\",\"\\u5728\\u8fd9\\u8fb9\",\"\\u5728\\u4e0d\\u5728\",\"xbz\",\"\\u662f\\u4f60\\u8bf4\"]');
INSERT INTO `booking` VALUES ('1390', '956', null, '1', '1', '1302', '', '0', '2018-11-09 11:21:46', '', null, '你好', '13384255905', '0.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1391', '1059', null, '1', '1', '1290', null, '1', '2018-11-09 14:40:35', '1500220062154174561665076547', null, '大可乐', '18845582770', '0.00', '0.10', '00000000.10', '', '[\"\\u51af\\u4ed5\\u8d85\",\"18845582770\",1,\"\",\"230306199709187035\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1392', '962', null, '1', '1', '1303', '', '1', '2018-11-09 18:56:09', '', null, '刘延龙', '18846140810', '1.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1393', '965', null, '1', '1', '1303', '', '1', '2018-11-09 18:57:50', '1500220062154176106066085886', null, '小黄蜂', '18846140510', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1394', '961', null, '1', '0', '1305', null, '0', '2018-11-09 19:14:14', null, null, '噶是', '13588886666', '0.00', '0.10', '00000000.00', '', '[\"\\u627e\\u4f60\",\"13588886666\",\"\\u627e\\u4f60\",\"\\u5728\\u4f60\\u8fd9\",\"0\",\"123456789012345678\",\"\\u5728\\u4f60\\u8fd9\",\"4466\",\"\\u627e\\u4f60\",\"\\u5728\\u54ea\\u5462\",\"\\u5728\\u4f60\\u8fd9\"]');
INSERT INTO `booking` VALUES ('1395', '984', null, '1', '1', '1296', null, '0', '2018-11-09 21:17:55', '1500220062154176946812866338', null, '北泱', '13047495186', '0.00', '0.10', '00000000.10', '', '[\"\\u683e\\u6b63\\u7428\",\"13047495186\",\"jjj\",\"\\u6765\\u6765\\u6765\",\"0\",\"66666755588855666\",\"\\u9ed1\\u9f99\\u6c5f\",\"\\u6765\\u6765\\u6765\",\"\\u6765\\u6765\\u6765\",\"lljkon\",\"\\u9f99\\u732b\"]');
INSERT INTO `booking` VALUES ('1396', '963', null, '1', '1', '1296', null, '0', '2018-11-09 21:21:27', '1500220062154176970354873547', null, '小狼', '18846046148', '0.00', '0.10', '00000000.10', '', '[\"\\u6768\\u4e00\",\"18846046148\",\"\\u9f99\\u54e5\\u5e26\\u961f\",\"IG\\u725b\\u903c\",\"0\",\"12345678910111213\",\"\\u54c8\\u5c14\\u6ee8\",\"\\u81ea\\u52a8\\u5316\",\"\\u65e0\\u4e1a\\u6e38\\u6c11\",\"123456789\",\"123456789\"]');
INSERT INTO `booking` VALUES ('1397', '962', null, '1', '1', '1296', null, '0', '2018-11-09 21:23:39', '1500220062154176981079044055', null, '刘延龙', '18846140810', '0.00', '0.10', '00000000.10', '', '[\"\\u597d\",\"18846140810\",\"\\u597d\",\"\\u597d\",\"0\",\"37112299009084677\",\"\\u597d\",\"\\u597d\",\"\\u597d\",\"\\u597d\",\"\\u597d\"]');
INSERT INTO `booking` VALUES ('1398', '0', '961', '2', '1', '1297', '', '2', '2018-11-09 23:09:29', '1500220062154177616734436078', null, '噶是', '18641502372', '0.00', '2.00', '00000002.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1399', '0', '961', '4', '1', '1297', '', '2', '2018-11-10 15:40:15', '1500220062154183561222097146', null, '噶是', '18641502372', '0.00', '4.00', '00000004.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1400', '0', '961', '4', '1', '1297', '', '2', '2018-11-10 15:47:44', '1500220062154183606283983886', null, '噶是', '18641502372', '0.00', '4.00', '00000004.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1401', '961', null, '6', '1', '1297', '', '0', '2018-11-11 03:00:32', '1500220062154187642538641641', null, '噶是', '18641502372', '0.00', '6.00', '00000006.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1402', '962', null, '1', '1', '1308', '', '1', '2018-11-11 08:14:37', '1500220062154189527022332595', null, '刘延龙', '18846140810', '1.00', '2.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1403', '965', null, '2', '1', '1308', '', '1', '2018-11-11 08:14:49', '1500220062154189527833434620', null, '小黄蜂', '18846140510', '0.00', '4.00', '00000004.00', '', '\"\"');

-- ----------------------------
-- Table structure for boss
-- ----------------------------
DROP TABLE IF EXISTS `boss`;
CREATE TABLE `boss` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `boss_id` bigint(20) DEFAULT NULL COMMENT 'id of user who is boss of this site',
  `service_unit` decimal(3,1) DEFAULT NULL,
  `service_time` varchar(20) DEFAULT NULL,
  `start1` time DEFAULT NULL,
  `end1` time DEFAULT NULL,
  `start2` time DEFAULT NULL,
  `end2` time DEFAULT NULL,
  `cancel_time` int(5) DEFAULT NULL,
  `allow_pic` text CHARACTER SET latin1 COMMENT 'image of license of site',
  `id_pic1` text CHARACTER SET latin1 COMMENT 'front image of ID card',
  `id_pic2` text CHARACTER SET latin1 COMMENT 'back image of ID card',
  `id_no` varchar(20) DEFAULT NULL COMMENT 'number of ID card',
  `site_name` varchar(50) DEFAULT NULL COMMENT 'name of site',
  `site_icon` text COMMENT 'icon of site',
  `province` varchar(20) DEFAULT NULL COMMENT 'province of address of site',
  `city` varchar(20) DEFAULT NULL COMMENT 'city of address of site',
  `area` varchar(20) DEFAULT NULL COMMENT 'area of address of site',
  `detail_address` varchar(255) DEFAULT NULL COMMENT 'detail address of site',
  `longitude` double DEFAULT NULL COMMENT 'longitude of site',
  `latitude` double DEFAULT NULL COMMENT 'latitude of site',
  `site_introduction` text COMMENT 'introduction of site',
  `site_service` text COMMENT 'service introduction of site',
  `map_icon` varchar(100) DEFAULT 'map_icon.png',
  `site_type` int(11) DEFAULT NULL,
  `site_type_detail` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `boss_ibfk_1` (`boss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss
-- ----------------------------
INSERT INTO `boss` VALUES ('297', '961', '0.5', '1,2,3,4,5,6,7', '08:00:00', '12:00:00', '12:00:00', '18:00:00', '24', 'a615826316e6961207092cd925696455.jpg', 'de43d0295a2c503de072caa96293b30f.jpg', 'e24d50c195bb5311f67a82437ab0b677.jpg', '', '是你说', null, '6', '44', '509', '辽宁省丹东市振兴区洋河大街42-7号', '124.34354', '40.01011', '什么什么', '怎么这么早', 'map_icon.png', '31', '0,1');
INSERT INTO `boss` VALUES ('298', '962', '2.0', '1,2,3,4,5,6,7', '08:00:00', '18:00:00', '18:00:00', '18:00:00', '24', 'ba12bf0609fa80ee32900bf54e67759f.jpg', '4009c96db12cc55affe1076daeb6bd52.jpg', '956d4f17e5e2177ce2ed2f9e03583d76.jpg', '', '哈尔滨工程大学军工足球场地', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区北海路与西海路交叉口东南200米', '126.6774', '45.77854', '位于哈尔滨工程大学军工操场，拥有三块专业的足球场地。', '有出售矿泉水\n\n', 'map_icon.png', '0', '0');
INSERT INTO `boss` VALUES ('299', '956', '1.0', '2,3,4,5', '08:00:00', '12:00:00', '12:00:00', '18:00:00', '0', 'cd1921339bad271257be226ea5cf747c.png', 'f6f865ba519df0a2251b844369bfa352.png', '5d2f59d27aa81e29b57d09654db6d464.png', '', '我的体育我的体育我的体育我的体育', null, '6', '44', '512', '辽宁省丹东市东港市东港南路188号', '124.15209', '39.86172', '你好', '你好', 'map_icon.png', '0', '0');
INSERT INTO `boss` VALUES ('300', '964', '0.5', '1,2,3,4,5,6,7', '08:00:00', '12:00:00', '14:00:00', '20:00:00', '24', '47a3dd2b689ee2fccce4b54566f40543.jpg', '7a9e6ce9cd142249445e2d6287bde315.jpg', '52d0767a8ea793f7c8a5b0dcaf43b3ce.jpg', '', '林大篮球馆', null, '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路26号', '126.64070129395', '45.722148895264', '位于林大靠近理工大学附近篮球体育馆', '全场5v5全场比赛 3v3半场篮球赛。承办各种篮球比赛。篮球训练营教学', 'map_icon.png', '1', '1');
INSERT INTO `boss` VALUES ('301', '967', '2.0', '1,2,3,4,5,6,7', '08:00:00', '12:00:00', '14:00:00', '18:00:00', '12', 'ddd0a361996e428a83391d9a6f7f1e9a.jpg', 'f3fc141d58913ca823abefa742d3f965.jpg', 'a162c8f4ca7e6d7f09a2cff6e4709dd7.jpg', '', '锐羽羽毛球馆', null, '8', '62', '643', '黑龙江省测绘地理信息局(哈尔滨市南岗区)', '126.62557', '45.705288', '锐羽羽毛球馆坐落于学府东四道街上 地理位置优越 场地崭新 配备专业的教练团队及配套设施 更衣室 洗澡间 餐厅 水吧 一应俱全 满足您的休闲运动需求', '羽毛球1对1指导 羽毛球小班教学 羽毛球赛事承办 羽毛球场地出租 及 运动器材及耗材销售', 'map_icon.png', '23', '23');
INSERT INTO `boss` VALUES ('302', '968', '1.0', '1,2,3,4,5,6,7', '08:00:00', '12:00:00', '14:00:00', '21:00:00', '24', '601a064b77ae2b6fcba7563984a0bc08.jpg', '37c65c8698b9c74ad9871dc4dfbb3f8a.jpg', '1407acaea47e2817b1db2b8963f2803e.jpg', '', 'YOYO瑜伽', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区西大直街118号(近哈工大)', '126.62523', '45.741844', '瑜伽可以让人的身体得到极大的舒展 还在精神压力大吗，还在因为肥胖而烦恼吗，赶紧来做瑜伽吧', '瑜伽教学初中高级班\n自由瑜伽房\n饮食搭配营养课', 'map_icon.png', '6', '6');
INSERT INTO `boss` VALUES ('303', '963', '0.5', '1,2,3,4,5,6,7', '08:00:00', '13:00:00', '13:00:00', '21:00:00', '24', null, '7866b9ffeded439b7d67ba81dc53287c.jpg', '708992060fce8e1d58984a00db8b73b8.jpg', '', '奥赛gym', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区学府路52号', '126.61481', '45.71508', '因为热爱，所以专注；\n\n因为专注，所以专业；\n\n因为专业。所以永恒；\n\n', '器械丰富，教练专业，欢迎体验。', 'map_icon.png', '19', '19');
INSERT INTO `boss` VALUES ('304', '1012', null, null, null, null, null, null, null, 'ce2495c367eadaa19b1192d5525ef2a1.jpg', 'a850957ef7f0ed2e05d3c6ef215d1ffc.jpg', '59435074553fe0b90ab171fc844a2a80.jpg', '', '霏瑜伽专业教培中心', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区黄河路99号黄河绿园A5栋1901', '126.69438171387', '45.757171630859', null, null, 'map_icon.png', null, null);

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(6) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `provinceid` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', '110100', '市辖区', '110000');
INSERT INTO `cities` VALUES ('2', '110200', '县', '110000');
INSERT INTO `cities` VALUES ('3', '120100', '市辖区', '120000');
INSERT INTO `cities` VALUES ('4', '120200', '县', '120000');
INSERT INTO `cities` VALUES ('5', '130100', '石家庄市', '130000');
INSERT INTO `cities` VALUES ('6', '130200', '唐山市', '130000');
INSERT INTO `cities` VALUES ('7', '130300', '秦皇岛市', '130000');
INSERT INTO `cities` VALUES ('8', '130400', '邯郸市', '130000');
INSERT INTO `cities` VALUES ('9', '130500', '邢台市', '130000');
INSERT INTO `cities` VALUES ('10', '130600', '保定市', '130000');
INSERT INTO `cities` VALUES ('11', '130700', '张家口市', '130000');
INSERT INTO `cities` VALUES ('12', '130800', '承德市', '130000');
INSERT INTO `cities` VALUES ('13', '130900', '沧州市', '130000');
INSERT INTO `cities` VALUES ('14', '131000', '廊坊市', '130000');
INSERT INTO `cities` VALUES ('15', '131100', '衡水市', '130000');
INSERT INTO `cities` VALUES ('16', '140100', '太原市', '140000');
INSERT INTO `cities` VALUES ('17', '140200', '大同市', '140000');
INSERT INTO `cities` VALUES ('18', '140300', '阳泉市', '140000');
INSERT INTO `cities` VALUES ('19', '140400', '长治市', '140000');
INSERT INTO `cities` VALUES ('20', '140500', '晋城市', '140000');
INSERT INTO `cities` VALUES ('21', '140600', '朔州市', '140000');
INSERT INTO `cities` VALUES ('22', '140700', '晋中市', '140000');
INSERT INTO `cities` VALUES ('23', '140800', '运城市', '140000');
INSERT INTO `cities` VALUES ('24', '140900', '忻州市', '140000');
INSERT INTO `cities` VALUES ('25', '141000', '临汾市', '140000');
INSERT INTO `cities` VALUES ('26', '141100', '吕梁市', '140000');
INSERT INTO `cities` VALUES ('27', '150100', '呼和浩特市', '150000');
INSERT INTO `cities` VALUES ('28', '150200', '包头市', '150000');
INSERT INTO `cities` VALUES ('29', '150300', '乌海市', '150000');
INSERT INTO `cities` VALUES ('30', '150400', '赤峰市', '150000');
INSERT INTO `cities` VALUES ('31', '150500', '通辽市', '150000');
INSERT INTO `cities` VALUES ('32', '150600', '鄂尔多斯市', '150000');
INSERT INTO `cities` VALUES ('33', '150700', '呼伦贝尔市', '150000');
INSERT INTO `cities` VALUES ('34', '150800', '巴彦淖尔市', '150000');
INSERT INTO `cities` VALUES ('35', '150900', '乌兰察布市', '150000');
INSERT INTO `cities` VALUES ('36', '152200', '兴安盟', '150000');
INSERT INTO `cities` VALUES ('37', '152500', '锡林郭勒盟', '150000');
INSERT INTO `cities` VALUES ('38', '152900', '阿拉善盟', '150000');
INSERT INTO `cities` VALUES ('39', '210100', '沈阳市', '210000');
INSERT INTO `cities` VALUES ('40', '210200', '大连市', '210000');
INSERT INTO `cities` VALUES ('41', '210300', '鞍山市', '210000');
INSERT INTO `cities` VALUES ('42', '210400', '抚顺市', '210000');
INSERT INTO `cities` VALUES ('43', '210500', '本溪市', '210000');
INSERT INTO `cities` VALUES ('44', '210600', '丹东市', '210000');
INSERT INTO `cities` VALUES ('45', '210700', '锦州市', '210000');
INSERT INTO `cities` VALUES ('46', '210800', '营口市', '210000');
INSERT INTO `cities` VALUES ('47', '210900', '阜新市', '210000');
INSERT INTO `cities` VALUES ('48', '211000', '辽阳市', '210000');
INSERT INTO `cities` VALUES ('49', '211100', '盘锦市', '210000');
INSERT INTO `cities` VALUES ('50', '211200', '铁岭市', '210000');
INSERT INTO `cities` VALUES ('51', '211300', '朝阳市', '210000');
INSERT INTO `cities` VALUES ('52', '211400', '葫芦岛市', '210000');
INSERT INTO `cities` VALUES ('53', '220100', '长春市', '220000');
INSERT INTO `cities` VALUES ('54', '220200', '吉林市', '220000');
INSERT INTO `cities` VALUES ('55', '220300', '四平市', '220000');
INSERT INTO `cities` VALUES ('56', '220400', '辽源市', '220000');
INSERT INTO `cities` VALUES ('57', '220500', '通化市', '220000');
INSERT INTO `cities` VALUES ('58', '220600', '白山市', '220000');
INSERT INTO `cities` VALUES ('59', '220700', '松原市', '220000');
INSERT INTO `cities` VALUES ('60', '220800', '白城市', '220000');
INSERT INTO `cities` VALUES ('61', '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `cities` VALUES ('62', '230100', '哈尔滨市', '230000');
INSERT INTO `cities` VALUES ('63', '230200', '齐齐哈尔市', '230000');
INSERT INTO `cities` VALUES ('64', '230300', '鸡西市', '230000');
INSERT INTO `cities` VALUES ('65', '230400', '鹤岗市', '230000');
INSERT INTO `cities` VALUES ('66', '230500', '双鸭山市', '230000');
INSERT INTO `cities` VALUES ('67', '230600', '大庆市', '230000');
INSERT INTO `cities` VALUES ('68', '230700', '伊春市', '230000');
INSERT INTO `cities` VALUES ('69', '230800', '佳木斯市', '230000');
INSERT INTO `cities` VALUES ('70', '230900', '七台河市', '230000');
INSERT INTO `cities` VALUES ('71', '231000', '牡丹江市', '230000');
INSERT INTO `cities` VALUES ('72', '231100', '黑河市', '230000');
INSERT INTO `cities` VALUES ('73', '231200', '绥化市', '230000');
INSERT INTO `cities` VALUES ('74', '232700', '大兴安岭地区', '230000');
INSERT INTO `cities` VALUES ('75', '310100', '市辖区', '310000');
INSERT INTO `cities` VALUES ('76', '310200', '县', '310000');
INSERT INTO `cities` VALUES ('77', '320100', '南京市', '320000');
INSERT INTO `cities` VALUES ('78', '320200', '无锡市', '320000');
INSERT INTO `cities` VALUES ('79', '320300', '徐州市', '320000');
INSERT INTO `cities` VALUES ('80', '320400', '常州市', '320000');
INSERT INTO `cities` VALUES ('81', '320500', '苏州市', '320000');
INSERT INTO `cities` VALUES ('82', '320600', '南通市', '320000');
INSERT INTO `cities` VALUES ('83', '320700', '连云港市', '320000');
INSERT INTO `cities` VALUES ('84', '320800', '淮安市', '320000');
INSERT INTO `cities` VALUES ('85', '320900', '盐城市', '320000');
INSERT INTO `cities` VALUES ('86', '321000', '扬州市', '320000');
INSERT INTO `cities` VALUES ('87', '321100', '镇江市', '320000');
INSERT INTO `cities` VALUES ('88', '321200', '泰州市', '320000');
INSERT INTO `cities` VALUES ('89', '321300', '宿迁市', '320000');
INSERT INTO `cities` VALUES ('90', '330100', '杭州市', '330000');
INSERT INTO `cities` VALUES ('91', '330200', '宁波市', '330000');
INSERT INTO `cities` VALUES ('92', '330300', '温州市', '330000');
INSERT INTO `cities` VALUES ('93', '330400', '嘉兴市', '330000');
INSERT INTO `cities` VALUES ('94', '330500', '湖州市', '330000');
INSERT INTO `cities` VALUES ('95', '330600', '绍兴市', '330000');
INSERT INTO `cities` VALUES ('96', '330700', '金华市', '330000');
INSERT INTO `cities` VALUES ('97', '330800', '衢州市', '330000');
INSERT INTO `cities` VALUES ('98', '330900', '舟山市', '330000');
INSERT INTO `cities` VALUES ('99', '331000', '台州市', '330000');
INSERT INTO `cities` VALUES ('100', '331100', '丽水市', '330000');
INSERT INTO `cities` VALUES ('101', '340100', '合肥市', '340000');
INSERT INTO `cities` VALUES ('102', '340200', '芜湖市', '340000');
INSERT INTO `cities` VALUES ('103', '340300', '蚌埠市', '340000');
INSERT INTO `cities` VALUES ('104', '340400', '淮南市', '340000');
INSERT INTO `cities` VALUES ('105', '340500', '马鞍山市', '340000');
INSERT INTO `cities` VALUES ('106', '340600', '淮北市', '340000');
INSERT INTO `cities` VALUES ('107', '340700', '铜陵市', '340000');
INSERT INTO `cities` VALUES ('108', '340800', '安庆市', '340000');
INSERT INTO `cities` VALUES ('109', '341000', '黄山市', '340000');
INSERT INTO `cities` VALUES ('110', '341100', '滁州市', '340000');
INSERT INTO `cities` VALUES ('111', '341200', '阜阳市', '340000');
INSERT INTO `cities` VALUES ('112', '341300', '宿州市', '340000');
INSERT INTO `cities` VALUES ('113', '341400', '巢湖市', '340000');
INSERT INTO `cities` VALUES ('114', '341500', '六安市', '340000');
INSERT INTO `cities` VALUES ('115', '341600', '亳州市', '340000');
INSERT INTO `cities` VALUES ('116', '341700', '池州市', '340000');
INSERT INTO `cities` VALUES ('117', '341800', '宣城市', '340000');
INSERT INTO `cities` VALUES ('118', '350100', '福州市', '350000');
INSERT INTO `cities` VALUES ('119', '350200', '厦门市', '350000');
INSERT INTO `cities` VALUES ('120', '350300', '莆田市', '350000');
INSERT INTO `cities` VALUES ('121', '350400', '三明市', '350000');
INSERT INTO `cities` VALUES ('122', '350500', '泉州市', '350000');
INSERT INTO `cities` VALUES ('123', '350600', '漳州市', '350000');
INSERT INTO `cities` VALUES ('124', '350700', '南平市', '350000');
INSERT INTO `cities` VALUES ('125', '350800', '龙岩市', '350000');
INSERT INTO `cities` VALUES ('126', '350900', '宁德市', '350000');
INSERT INTO `cities` VALUES ('127', '360100', '南昌市', '360000');
INSERT INTO `cities` VALUES ('128', '360200', '景德镇市', '360000');
INSERT INTO `cities` VALUES ('129', '360300', '萍乡市', '360000');
INSERT INTO `cities` VALUES ('130', '360400', '九江市', '360000');
INSERT INTO `cities` VALUES ('131', '360500', '新余市', '360000');
INSERT INTO `cities` VALUES ('132', '360600', '鹰潭市', '360000');
INSERT INTO `cities` VALUES ('133', '360700', '赣州市', '360000');
INSERT INTO `cities` VALUES ('134', '360800', '吉安市', '360000');
INSERT INTO `cities` VALUES ('135', '360900', '宜春市', '360000');
INSERT INTO `cities` VALUES ('136', '361000', '抚州市', '360000');
INSERT INTO `cities` VALUES ('137', '361100', '上饶市', '360000');
INSERT INTO `cities` VALUES ('138', '370100', '济南市', '370000');
INSERT INTO `cities` VALUES ('139', '370200', '青岛市', '370000');
INSERT INTO `cities` VALUES ('140', '370300', '淄博市', '370000');
INSERT INTO `cities` VALUES ('141', '370400', '枣庄市', '370000');
INSERT INTO `cities` VALUES ('142', '370500', '东营市', '370000');
INSERT INTO `cities` VALUES ('143', '370600', '烟台市', '370000');
INSERT INTO `cities` VALUES ('144', '370700', '潍坊市', '370000');
INSERT INTO `cities` VALUES ('145', '370800', '济宁市', '370000');
INSERT INTO `cities` VALUES ('146', '370900', '泰安市', '370000');
INSERT INTO `cities` VALUES ('147', '371000', '威海市', '370000');
INSERT INTO `cities` VALUES ('148', '371100', '日照市', '370000');
INSERT INTO `cities` VALUES ('149', '371200', '莱芜市', '370000');
INSERT INTO `cities` VALUES ('150', '371300', '临沂市', '370000');
INSERT INTO `cities` VALUES ('151', '371400', '德州市', '370000');
INSERT INTO `cities` VALUES ('152', '371500', '聊城市', '370000');
INSERT INTO `cities` VALUES ('153', '371600', '滨州市', '370000');
INSERT INTO `cities` VALUES ('154', '371700', '荷泽市', '370000');
INSERT INTO `cities` VALUES ('155', '410100', '郑州市', '410000');
INSERT INTO `cities` VALUES ('156', '410200', '开封市', '410000');
INSERT INTO `cities` VALUES ('157', '410300', '洛阳市', '410000');
INSERT INTO `cities` VALUES ('158', '410400', '平顶山市', '410000');
INSERT INTO `cities` VALUES ('159', '410500', '安阳市', '410000');
INSERT INTO `cities` VALUES ('160', '410600', '鹤壁市', '410000');
INSERT INTO `cities` VALUES ('161', '410700', '新乡市', '410000');
INSERT INTO `cities` VALUES ('162', '410800', '焦作市', '410000');
INSERT INTO `cities` VALUES ('163', '410900', '濮阳市', '410000');
INSERT INTO `cities` VALUES ('164', '411000', '许昌市', '410000');
INSERT INTO `cities` VALUES ('165', '411100', '漯河市', '410000');
INSERT INTO `cities` VALUES ('166', '411200', '三门峡市', '410000');
INSERT INTO `cities` VALUES ('167', '411300', '南阳市', '410000');
INSERT INTO `cities` VALUES ('168', '411400', '商丘市', '410000');
INSERT INTO `cities` VALUES ('169', '411500', '信阳市', '410000');
INSERT INTO `cities` VALUES ('170', '411600', '周口市', '410000');
INSERT INTO `cities` VALUES ('171', '411700', '驻马店市', '410000');
INSERT INTO `cities` VALUES ('172', '420100', '武汉市', '420000');
INSERT INTO `cities` VALUES ('173', '420200', '黄石市', '420000');
INSERT INTO `cities` VALUES ('174', '420300', '十堰市', '420000');
INSERT INTO `cities` VALUES ('175', '420500', '宜昌市', '420000');
INSERT INTO `cities` VALUES ('176', '420600', '襄樊市', '420000');
INSERT INTO `cities` VALUES ('177', '420700', '鄂州市', '420000');
INSERT INTO `cities` VALUES ('178', '420800', '荆门市', '420000');
INSERT INTO `cities` VALUES ('179', '420900', '孝感市', '420000');
INSERT INTO `cities` VALUES ('180', '421000', '荆州市', '420000');
INSERT INTO `cities` VALUES ('181', '421100', '黄冈市', '420000');
INSERT INTO `cities` VALUES ('182', '421200', '咸宁市', '420000');
INSERT INTO `cities` VALUES ('183', '421300', '随州市', '420000');
INSERT INTO `cities` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `cities` VALUES ('185', '429000', '省直辖行政单位', '420000');
INSERT INTO `cities` VALUES ('186', '430100', '长沙市', '430000');
INSERT INTO `cities` VALUES ('187', '430200', '株洲市', '430000');
INSERT INTO `cities` VALUES ('188', '430300', '湘潭市', '430000');
INSERT INTO `cities` VALUES ('189', '430400', '衡阳市', '430000');
INSERT INTO `cities` VALUES ('190', '430500', '邵阳市', '430000');
INSERT INTO `cities` VALUES ('191', '430600', '岳阳市', '430000');
INSERT INTO `cities` VALUES ('192', '430700', '常德市', '430000');
INSERT INTO `cities` VALUES ('193', '430800', '张家界市', '430000');
INSERT INTO `cities` VALUES ('194', '430900', '益阳市', '430000');
INSERT INTO `cities` VALUES ('195', '431000', '郴州市', '430000');
INSERT INTO `cities` VALUES ('196', '431100', '永州市', '430000');
INSERT INTO `cities` VALUES ('197', '431200', '怀化市', '430000');
INSERT INTO `cities` VALUES ('198', '431300', '娄底市', '430000');
INSERT INTO `cities` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `cities` VALUES ('200', '440100', '广州市', '440000');
INSERT INTO `cities` VALUES ('201', '440200', '韶关市', '440000');
INSERT INTO `cities` VALUES ('202', '440300', '深圳市', '440000');
INSERT INTO `cities` VALUES ('203', '440400', '珠海市', '440000');
INSERT INTO `cities` VALUES ('204', '440500', '汕头市', '440000');
INSERT INTO `cities` VALUES ('205', '440600', '佛山市', '440000');
INSERT INTO `cities` VALUES ('206', '440700', '江门市', '440000');
INSERT INTO `cities` VALUES ('207', '440800', '湛江市', '440000');
INSERT INTO `cities` VALUES ('208', '440900', '茂名市', '440000');
INSERT INTO `cities` VALUES ('209', '441200', '肇庆市', '440000');
INSERT INTO `cities` VALUES ('210', '441300', '惠州市', '440000');
INSERT INTO `cities` VALUES ('211', '441400', '梅州市', '440000');
INSERT INTO `cities` VALUES ('212', '441500', '汕尾市', '440000');
INSERT INTO `cities` VALUES ('213', '441600', '河源市', '440000');
INSERT INTO `cities` VALUES ('214', '441700', '阳江市', '440000');
INSERT INTO `cities` VALUES ('215', '441800', '清远市', '440000');
INSERT INTO `cities` VALUES ('216', '441900', '东莞市', '440000');
INSERT INTO `cities` VALUES ('217', '442000', '中山市', '440000');
INSERT INTO `cities` VALUES ('218', '445100', '潮州市', '440000');
INSERT INTO `cities` VALUES ('219', '445200', '揭阳市', '440000');
INSERT INTO `cities` VALUES ('220', '445300', '云浮市', '440000');
INSERT INTO `cities` VALUES ('221', '450100', '南宁市', '450000');
INSERT INTO `cities` VALUES ('222', '450200', '柳州市', '450000');
INSERT INTO `cities` VALUES ('223', '450300', '桂林市', '450000');
INSERT INTO `cities` VALUES ('224', '450400', '梧州市', '450000');
INSERT INTO `cities` VALUES ('225', '450500', '北海市', '450000');
INSERT INTO `cities` VALUES ('226', '450600', '防城港市', '450000');
INSERT INTO `cities` VALUES ('227', '450700', '钦州市', '450000');
INSERT INTO `cities` VALUES ('228', '450800', '贵港市', '450000');
INSERT INTO `cities` VALUES ('229', '450900', '玉林市', '450000');
INSERT INTO `cities` VALUES ('230', '451000', '百色市', '450000');
INSERT INTO `cities` VALUES ('231', '451100', '贺州市', '450000');
INSERT INTO `cities` VALUES ('232', '451200', '河池市', '450000');
INSERT INTO `cities` VALUES ('233', '451300', '来宾市', '450000');
INSERT INTO `cities` VALUES ('234', '451400', '崇左市', '450000');
INSERT INTO `cities` VALUES ('235', '460100', '海口市', '460000');
INSERT INTO `cities` VALUES ('236', '460200', '三亚市', '460000');
INSERT INTO `cities` VALUES ('237', '469000', '省直辖县级行政单位', '460000');
INSERT INTO `cities` VALUES ('238', '500100', '市辖区', '500000');
INSERT INTO `cities` VALUES ('239', '500200', '县', '500000');
INSERT INTO `cities` VALUES ('240', '500300', '市', '500000');
INSERT INTO `cities` VALUES ('241', '510100', '成都市', '510000');
INSERT INTO `cities` VALUES ('242', '510300', '自贡市', '510000');
INSERT INTO `cities` VALUES ('243', '510400', '攀枝花市', '510000');
INSERT INTO `cities` VALUES ('244', '510500', '泸州市', '510000');
INSERT INTO `cities` VALUES ('245', '510600', '德阳市', '510000');
INSERT INTO `cities` VALUES ('246', '510700', '绵阳市', '510000');
INSERT INTO `cities` VALUES ('247', '510800', '广元市', '510000');
INSERT INTO `cities` VALUES ('248', '510900', '遂宁市', '510000');
INSERT INTO `cities` VALUES ('249', '511000', '内江市', '510000');
INSERT INTO `cities` VALUES ('250', '511100', '乐山市', '510000');
INSERT INTO `cities` VALUES ('251', '511300', '南充市', '510000');
INSERT INTO `cities` VALUES ('252', '511400', '眉山市', '510000');
INSERT INTO `cities` VALUES ('253', '511500', '宜宾市', '510000');
INSERT INTO `cities` VALUES ('254', '511600', '广安市', '510000');
INSERT INTO `cities` VALUES ('255', '511700', '达州市', '510000');
INSERT INTO `cities` VALUES ('256', '511800', '雅安市', '510000');
INSERT INTO `cities` VALUES ('257', '511900', '巴中市', '510000');
INSERT INTO `cities` VALUES ('258', '512000', '资阳市', '510000');
INSERT INTO `cities` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `cities` VALUES ('260', '513300', '甘孜藏族自治州', '510000');
INSERT INTO `cities` VALUES ('261', '513400', '凉山彝族自治州', '510000');
INSERT INTO `cities` VALUES ('262', '520100', '贵阳市', '520000');
INSERT INTO `cities` VALUES ('263', '520200', '六盘水市', '520000');
INSERT INTO `cities` VALUES ('264', '520300', '遵义市', '520000');
INSERT INTO `cities` VALUES ('265', '520400', '安顺市', '520000');
INSERT INTO `cities` VALUES ('266', '522200', '铜仁地区', '520000');
INSERT INTO `cities` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `cities` VALUES ('268', '522400', '毕节地区', '520000');
INSERT INTO `cities` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `cities` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `cities` VALUES ('271', '530100', '昆明市', '530000');
INSERT INTO `cities` VALUES ('272', '530300', '曲靖市', '530000');
INSERT INTO `cities` VALUES ('273', '530400', '玉溪市', '530000');
INSERT INTO `cities` VALUES ('274', '530500', '保山市', '530000');
INSERT INTO `cities` VALUES ('275', '530600', '昭通市', '530000');
INSERT INTO `cities` VALUES ('276', '530700', '丽江市', '530000');
INSERT INTO `cities` VALUES ('277', '530800', '思茅市', '530000');
INSERT INTO `cities` VALUES ('278', '530900', '临沧市', '530000');
INSERT INTO `cities` VALUES ('279', '532300', '楚雄彝族自治州', '530000');
INSERT INTO `cities` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `cities` VALUES ('281', '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `cities` VALUES ('282', '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `cities` VALUES ('283', '532900', '大理白族自治州', '530000');
INSERT INTO `cities` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `cities` VALUES ('285', '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `cities` VALUES ('286', '533400', '迪庆藏族自治州', '530000');
INSERT INTO `cities` VALUES ('287', '540100', '拉萨市', '540000');
INSERT INTO `cities` VALUES ('288', '542100', '昌都地区', '540000');
INSERT INTO `cities` VALUES ('289', '542200', '山南地区', '540000');
INSERT INTO `cities` VALUES ('290', '542300', '日喀则地区', '540000');
INSERT INTO `cities` VALUES ('291', '542400', '那曲地区', '540000');
INSERT INTO `cities` VALUES ('292', '542500', '阿里地区', '540000');
INSERT INTO `cities` VALUES ('293', '542600', '林芝地区', '540000');
INSERT INTO `cities` VALUES ('294', '610100', '西安市', '610000');
INSERT INTO `cities` VALUES ('295', '610200', '铜川市', '610000');
INSERT INTO `cities` VALUES ('296', '610300', '宝鸡市', '610000');
INSERT INTO `cities` VALUES ('297', '610400', '咸阳市', '610000');
INSERT INTO `cities` VALUES ('298', '610500', '渭南市', '610000');
INSERT INTO `cities` VALUES ('299', '610600', '延安市', '610000');
INSERT INTO `cities` VALUES ('300', '610700', '汉中市', '610000');
INSERT INTO `cities` VALUES ('301', '610800', '榆林市', '610000');
INSERT INTO `cities` VALUES ('302', '610900', '安康市', '610000');
INSERT INTO `cities` VALUES ('303', '611000', '商洛市', '610000');
INSERT INTO `cities` VALUES ('304', '620100', '兰州市', '620000');
INSERT INTO `cities` VALUES ('305', '620200', '嘉峪关市', '620000');
INSERT INTO `cities` VALUES ('306', '620300', '金昌市', '620000');
INSERT INTO `cities` VALUES ('307', '620400', '白银市', '620000');
INSERT INTO `cities` VALUES ('308', '620500', '天水市', '620000');
INSERT INTO `cities` VALUES ('309', '620600', '武威市', '620000');
INSERT INTO `cities` VALUES ('310', '620700', '张掖市', '620000');
INSERT INTO `cities` VALUES ('311', '620800', '平凉市', '620000');
INSERT INTO `cities` VALUES ('312', '620900', '酒泉市', '620000');
INSERT INTO `cities` VALUES ('313', '621000', '庆阳市', '620000');
INSERT INTO `cities` VALUES ('314', '621100', '定西市', '620000');
INSERT INTO `cities` VALUES ('315', '621200', '陇南市', '620000');
INSERT INTO `cities` VALUES ('316', '622900', '临夏回族自治州', '620000');
INSERT INTO `cities` VALUES ('317', '623000', '甘南藏族自治州', '620000');
INSERT INTO `cities` VALUES ('318', '630100', '西宁市', '630000');
INSERT INTO `cities` VALUES ('319', '632100', '海东地区', '630000');
INSERT INTO `cities` VALUES ('320', '632200', '海北藏族自治州', '630000');
INSERT INTO `cities` VALUES ('321', '632300', '黄南藏族自治州', '630000');
INSERT INTO `cities` VALUES ('322', '632500', '海南藏族自治州', '630000');
INSERT INTO `cities` VALUES ('323', '632600', '果洛藏族自治州', '630000');
INSERT INTO `cities` VALUES ('324', '632700', '玉树藏族自治州', '630000');
INSERT INTO `cities` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `cities` VALUES ('326', '640100', '银川市', '640000');
INSERT INTO `cities` VALUES ('327', '640200', '石嘴山市', '640000');
INSERT INTO `cities` VALUES ('328', '640300', '吴忠市', '640000');
INSERT INTO `cities` VALUES ('329', '640400', '固原市', '640000');
INSERT INTO `cities` VALUES ('330', '640500', '中卫市', '640000');
INSERT INTO `cities` VALUES ('331', '650100', '乌鲁木齐市', '650000');
INSERT INTO `cities` VALUES ('332', '650200', '克拉玛依市', '650000');
INSERT INTO `cities` VALUES ('333', '652100', '吐鲁番地区', '650000');
INSERT INTO `cities` VALUES ('334', '652200', '哈密地区', '650000');
INSERT INTO `cities` VALUES ('335', '652300', '昌吉回族自治州', '650000');
INSERT INTO `cities` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `cities` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `cities` VALUES ('338', '652900', '阿克苏地区', '650000');
INSERT INTO `cities` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `cities` VALUES ('340', '653100', '喀什地区', '650000');
INSERT INTO `cities` VALUES ('341', '653200', '和田地区', '650000');
INSERT INTO `cities` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `cities` VALUES ('343', '654200', '塔城地区', '650000');
INSERT INTO `cities` VALUES ('344', '654300', '阿勒泰地区', '650000');
INSERT INTO `cities` VALUES ('345', '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizer_id` bigint(20) DEFAULT '0' COMMENT 'organizer id of this event',
  `state` tinyint(2) DEFAULT '0' COMMENT 'state of event',
  `name` varchar(50) DEFAULT NULL COMMENT 'name of event',
  `owner` int(1) DEFAULT '1',
  `is_train` int(1) DEFAULT '0',
  `type` smallint(6) DEFAULT NULL COMMENT 'type of event on event type table''',
  `start_time` datetime DEFAULT NULL COMMENT 'start time of event',
  `end_time` datetime DEFAULT NULL COMMENT 'finish time of event',
  `province` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT 'province of event where it places',
  `city` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT 'city of event',
  `area` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'area of event',
  `detail_address` varchar(255) DEFAULT NULL COMMENT 'detail address of event',
  `longitude` double DEFAULT NULL COMMENT 'longitude of event',
  `latitude` double DEFAULT NULL COMMENT 'latitude of event',
  `limit` int(11) DEFAULT NULL COMMENT 'maximum number of sign up people',
  `condition` varchar(30) DEFAULT NULL,
  `person_limit` int(11) DEFAULT NULL,
  `pay_type` int(2) DEFAULT NULL,
  `cost` float DEFAULT '0',
  `publicity` tinyint(2) DEFAULT '1' COMMENT 'publicity of this event',
  `pic` text CHARACTER SET latin1 COMMENT 'picture url of event',
  `comment` text COMMENT 'brief introduction of event',
  `reg_time` datetime DEFAULT NULL COMMENT 'submit time of event',
  `is_used` int(1) DEFAULT '0',
  `additional` tinyint(2) DEFAULT '0' COMMENT 'additional option for personal role',
  `is_checked` tinyint(2) DEFAULT '0',
  `read_count` bigint(20) DEFAULT '0',
  `agent_name` varchar(30) DEFAULT NULL,
  `agent_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `event_ibfk_1` (`organizer_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`organizer_id`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1309 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1264', '961', '0', '你手机', '1', '0', '3', '2018-12-01 22:09:00', '2018-12-02 22:09:00', '6', '44', '509', '博林·印象(振兴区博林·印象中央大道南)', '124.34354', '40.01011', '100', null, '2', '2', '0.01', '1', 'b3f6fdab29db6d5abfdf299ddf651a3a.jpg', '在你这你在', '2018-11-01 22:10:44', '0', '0', '0', '25', '噶是', '18641502372');
INSERT INTO `event` VALUES ('1266', '962', '1', '哈尔滨大学生创业大赛决赛报名', '1', '0', '32', '2018-11-03 08:00:00', '2018-11-03 17:00:00', '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路38号', '126.62506', '45.725418', '1000', null, '1', '1', '0.5', '1', 'bd9dd1e9387aa1580407f93abdc5d7db.jpg', '请能够参加明天创业大赛的成员报名参加。', '2018-11-02 09:46:57', '0', '0', '1', '49', '刘小蜂', '18846140810');
INSERT INTO `event` VALUES ('1269', '968', '0', '瑜伽预备课', '1', '0', '6', '2018-11-02 20:17:00', '2018-12-02 20:17:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区西大直街118号(近哈工大)', '126.62523', '45.741844', '100', null, '1', '1', '5', '1', 'ee95852fe876b9683483410c672afb44.jpg', '这是一个和学校相关的', '2018-11-02 20:18:51', '0', '0', '0', '5', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1270', '968', '0', '热身教学', '1', '0', '6', '2018-11-02 20:19:00', '2018-12-02 20:19:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区西大直街118号(近哈工大)', '126.62523', '45.741844', '100', null, '1', '1', '1', '1', '4b100acfb124e56b3544ffa5a83d7c4d.jpg', '这是一个和学校相关的', '2018-11-02 20:20:27', '0', '0', '0', '32', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1271', '965', '1', '喝白茶玩桌游', '1', '0', '21', '2018-11-04 08:20:00', '2018-11-04 18:20:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区和兴路26号东北林业大学', '126.63166746497', '45.720539348277', '20', null, '2', '2', '29', '1', '944fa31625a013676bc71249ae6f8ea2.jpg', '【内容】教大家玩一种新桌游《宿命》\n欢迎带朋友来，互相认识，水果茶饮免费。\n不可以抽烟哦～', '2018-11-02 20:22:59', '0', '1', '0', '2', '小黄蜂', '18846140510');
INSERT INTO `event` VALUES ('1272', '965', '1', '桌面足球', '1', '0', '17', '2018-11-05 14:23:00', '2018-11-05 19:23:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区理工大道', '126.62018492818', '45.715626346502', '50', null, '5', '2', '19.9', '1', '0cac51286a022e0673997c3e61e2a490.jpg', '【内容】桌上足球，二对二，花式玩法，活动免费，报名费是咖啡和甜点的钱，大家一起来玩呀。', '2018-11-02 20:26:46', '0', '1', '0', '4', '小黄蜂', '18846140510');
INSERT INTO `event` VALUES ('1273', '967', '1', '锐羽杯新秀羽毛球赛', '1', '0', '23', '2018-11-03 09:00:00', '2018-11-04 17:00:00', '8', '62', '643', '黑龙江省测绘地理信息局(哈尔滨市南岗区)', '126.62557', '45.705288', '40', null, '5', '1', '10', '1', '5a3c7ca07fadcc8aed75663e0254c691.jpg', '【比赛时间】11.3～11.4\n【比赛地点】锐羽羽毛球馆\n【对手】 抽签决定\n【球衣颜色】红 蓝\n【备注】', '2018-11-03 00:04:17', '0', '0', '0', '7', '杨', '18846079302');
INSERT INTO `event` VALUES ('1274', '967', '1', '锐羽青年培训体验班', '1', '0', '23', '2018-11-03 18:30:00', '2018-11-03 21:00:00', '8', '62', '643', '黑龙江省测绘地理信息局小区(南岗区)', '126.62557', '45.705288', '20', null, '1', '1', '0', '1', 'c6b4591a824080cffe336e65d5d65167.jpg', '【比赛时间】11.3\n【比赛地点】锐羽羽毛球馆\n【对手】 随机分配\n【球衣颜色】红 蓝\n【备注】', '2018-11-03 00:06:45', '0', '0', '1', '5', '杨', '18846079302');
INSERT INTO `event` VALUES ('1275', '964', '1', '3v3 一起打球啊！', '1', '0', '1', '2018-11-03 08:13:00', '2018-11-03 08:13:00', '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路26号', '126.64070129395', '45.722148895264', '9', null, '3', '1', '7', '1', 'cd0b759c402657258a1e6833fef6730e.jpg', '3V3篮球，有意者直接预约。', '2018-11-03 08:15:04', '0', '0', '0', '0', '闫化龙', '17603602906');
INSERT INTO `event` VALUES ('1276', '963', '0', '私聊体验课一次', '1', '0', '19', '2018-11-04 09:00:00', '2018-11-18 20:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区学府路52号', '126.61481', '45.71508', '50', null, '1', '1', '10', '1', 'e451b04e64c00b93af6b95a00dfc0709.jpg,fd64b04c9c682c3b5c00ca4f3f74cc9a.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-11-03 08:16:05', '0', '0', '0', '7', '杨毅', '18846046148');
INSERT INTO `event` VALUES ('1277', '965', '1', '冬天要来了，一起滑雪吧', '1', '0', '14', '2018-11-04 08:13:00', '2018-11-04 12:13:00', '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路26号', '126.63818255067', '45.720741589521', '12', null, '2', '2', '69', '1', '12d7fafa873644002dbb8a3c63ebdfa8.jpg', '在林大门口集合，一起去万达滑雪吧～\n冬天快来了，滑雪要提上日程了。', '2018-11-03 08:16:14', '0', '1', '0', '4', '小黄蜂', '18846140510');
INSERT INTO `event` VALUES ('1278', '964', '1', '青少年篮球培训免费活动', '1', '0', '1', '2018-11-03 08:16:00', '2018-11-03 08:16:00', '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路26号', '126.64070129395', '45.722148895264', '10', null, '2', '1', '0', '1', 'df81af71e11cee757cc000e4e4e65cf1.jpg', '免费青少年篮球培训，欢迎8-12岁的孩子加入。', '2018-11-03 08:18:43', '0', '0', '0', '0', '闫化龙', '17603602906');
INSERT INTO `event` VALUES ('1279', '964', '1', '青少年篮球培训', '1', '0', '1', '2018-11-03 08:19:00', '2018-11-05 08:19:00', '8', '62', '645', '黑龙江省哈尔滨市香坊区和兴路26号', '126.64070129395', '45.722148895264', '10', null, '3', '1', '0', '1', 'b374a992c3135875ff5e595d294d957c.jpg', '免费青少年篮球培训，欢迎8-12岁的孩子加入。', '2018-11-03 08:20:48', '0', '0', '0', '6', '闫化龙', '17603602906');
INSERT INTO `event` VALUES ('1280', '962', '1', '活动7', '1', '0', '5', '2018-11-05 14:59:00', '2018-11-05 14:59:00', '8', '62', '643', '黑龙江省眼科医院(东大直街151号)', '126.62506', '45.725418', '1000', null, '1', '1', '0.6', '1', '808b16b74289a7004eee179ca9df6e83.jpg', '还有四天', '2018-11-04 15:00:55', '0', '0', '1', '18', '刘小蜂', '18846140810');
INSERT INTO `event` VALUES ('1282', '964', '0', '一起打篮球', '1', '0', '1', '2018-11-06 14:25:00', '2018-11-26 13:25:00', '8', '62', '643', '哈尔滨市哈尔滨工业大学篮球场(哈尔滨市南岗区)', '126.64070129395', '45.722148895264', '9', null, '2', '1', '1', '1', 'a8b7b145b46ecd47998dcae17882746f.jpg', '一起打篮球', '2018-11-06 10:26:38', '0', '0', '0', '19', '闫化龙', '17603602906');
INSERT INTO `event` VALUES ('1283', '967', '1', '打球送U盘', '1', '0', '23', '2018-11-07 10:27:00', '2018-11-08 10:27:00', '8', '62', '644', '黑龙江省哈尔滨市道外区大有坊街74号', '126.62557', '45.705288', '90', null, '6', '1', '1', '1', '4a8a0f9f1a940478da401889dfcc54c5.jpg', '【比赛时间】11.3\n【比赛地点】锐羽羽毛球馆\n【对手】 随机分配\n【球衣颜色】红 蓝\n【备注】', '2018-11-06 10:28:29', '0', '0', '0', '20', '杨', '18846079302');
INSERT INTO `event` VALUES ('1284', '963', '1', '学累了？来一起撸铁吧！', '1', '0', '19', '2018-11-08 09:53:00', '2018-11-10 09:53:00', '8', '62', '643', '哈尔滨工程大学学生第五公寓(南岗区)', '126.61481', '45.71508', '20', null, '1', '1', '1', '1', 'd00bf5afa1b0fbe74af8731273432543.jpeg', '干就完了！', '2018-11-07 09:55:25', '0', '0', '1', '10', '杨毅', '18846046148');
INSERT INTO `event` VALUES ('1285', '962', '1', '本周六中午聚餐，有时间吗？', '1', '0', '0', '2018-11-10 11:30:00', '2018-11-10 13:30:00', '8', '62', '643', '肯德基(一曼街店)', '126.6774', '45.77854', '100', null, '1', '1', '0.6', '1', '23b270798579fdece07a8a33a8ece2a5.jpg', '还有周末聚餐，有时间不？', '2018-11-08 07:48:02', '0', '0', '1', '48', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1290', '0', '1', '2018-2019“蜂体杯”冬季室内足球联赛竞赛规程', '0', '0', '0', '2018-11-11 18:00:00', '2018-11-10 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区会展体育馆(公交站)4楼世界波球场', '126.704826', '45.75148', '1000', '1,1,1,-1,1,-1,-1,-1,-1,-1,-1', null, '1', '0.1', '1', 'events/1290_img1.png', '<p align=\"center\"><strong>2018-2019</strong><strong>&ldquo;蜂体杯&rdquo;冬季室内足球联赛</strong></p><p align=\"center\"><strong>竞赛规程</strong></p><p align=\"left\"><strong>一、主办单位</strong></p><p align=\"left\">哈尔滨蜂体网络科技有限公司</p><p align=\"left\"><strong>二、协办单位</strong></p><p align=\"left\">哈尔滨国际会展中心世界波球场</p><p align=\"left\"><strong>三、赞助单位</strong></p><p align=\"left\">十号足球铺、天缘足球主题烤吧、正德老年公寓、蓝格格</p><p align=\"left\"><strong>四</strong><strong>、比赛时间</strong></p><p align=\"left\">2018年11月11日 至 2019年1月中旬</p><p align=\"left\">（每星期二晚18:30-21:00、每周日晚18:30-21:00）</p><p align=\"left\">报名截止时间为：2018年11月10日17：00。</p><p align=\"left\"><strong>五</strong><strong>、比赛地点</strong></p><p align=\"left\">哈尔滨国际会展中心体育馆世界波室内足球场，哈尔滨市南岗区黄河路200号。</p><p align=\"left\"><strong>六</strong><strong>、参赛年龄</strong></p><p align=\"left\">18-50周岁，身体健康，经常参加足球运动的成年人。</p><p align=\"left\"><strong>七</strong><strong>、参赛代表队及资格</strong></p><p align=\"left\">参赛球队可由机关事业单位、学校、企业、部队等单位人员组成，也可通过自有组合以俱乐部球队形式参加比赛。每名队员只能代表一个队参加比赛。</p><p align=\"left\">（一）本次比赛，可接受8-12支球队报名参赛。</p><p align=\"left\">（二）考虑到各支队伍的情况，本次每支队伍报名允许注册报名人数为20人（不包括教练和队长），但是每场比赛最多可参与比赛人数14人。</p><p align=\"left\">（三）各队不允许有现役或退役3年内的职业球员参赛。</p><p align=\"left\">（四）各队上场比赛前，由赛会工作人员进行资格审查，上场人员均须提供合法有效身份证件原件，审核通过后方可登场参赛。</p><p align=\"left\"><strong>八</strong><strong>、规则</strong></p><p align=\"left\">（一）本次比赛为6人制室内比赛，每队上场人数不得超过6人，其中1人为守门员。比赛用球为低弹标准4号球。</p><p align=\"left\">（二）比赛参考国际足联最新审定的《五人制足球竞赛规则》，根据业余球员特点规则略有改变，以组委会规定为准并具有最终解释权。</p><p align=\"left\">（三）每场比赛分上下半场进行，半场30分钟，中场休息5分钟。</p><p align=\"left\">（四）比赛采用单循环+排名赛赛制，赢一场积3分，平一场积1分，负一场积0分。单循环比赛结束后根据实际排名决出本次比赛的最终排名。</p><p align=\"left\">（五）详细赛程待球队报名及分组结束后适时公布。</p><p><strong><br></strong></p><p align=\"left\"><strong>（六）规则特别注意事项：</strong></p><p align=\"left\">&nbsp;1. 为保护运动员，本次比赛对犯规判罚尺度严格，禁止任何冲撞，严禁铲球。比赛中严禁出现铲球，一旦出现铲人，坚决给予黄牌或红牌惩罚。</p><p align=\"left\">2. 任意球，如出现判犯规，对方罚任意球。</p><p align=\"left\">3.边线球全部为间接球，防守队员应退出5米，罚球直接射进无效，中途碰到本方或对方身体后进球有效。边线球压线发球，发球人不得进入场内发球。</p><p align=\"left\">4. 背后有动作一律视为犯规，罚间接任意球，争抢队员禁止使用鲁莽或过分的力量，被视为严重犯规的，可根据犯规严重性给予警告或红黄牌。</p><p align=\"left\">5. 比赛如果出现以下情况裁判员将直接出示红牌将该队员罚出场：队员使用过度危险动作或犯规动作；恶意辱骂及推搡对方队员和裁判；之前曾被警告后没有改正；违反体育道德等情况（具体判罚将由裁判根据场上实际情况自行掌握，其他队员不得干涉裁判的判罚，要严格遵守）。</p><p align=\"left\">6. 可随时换人，报名队员均可替换上场，换下者可以再次换上比赛，换人不受人数限制。但必须先下后上，不得出现换人方超过6人同时在场情况，换人违例的裁判可视情况给予警告或判罚红、黄牌。</p><p align=\"left\">7. 当本队队员被红牌罚下后2分钟后可另换球员入场，并事先通知裁判，被红牌罚下的队员取消本场比赛资格，如果在2分钟以内，少一人的球队丢球，则替补队友可以立即登场。</p><p align=\"left\">8.边线球、角球、任意球、时间不得超过4秒，如果违规将交换发球权。对方防守球员需自觉离开5米，若不够5米可向裁判示意，若擅自发球则视为默许距离，比赛继续进行。</p><p align=\"left\">9. 守门员发球一律为手抛球，但不能直接过中线，活球可以直接过球场，如罚球违例将由对方在中线发球。</p><p align=\"left\">10.场上队员以及场下队员及拉拉队员禁止说脏话脏字，干扰和影响比赛秩序，有以上情况加以警告，严重者红牌处罚。</p><p align=\"left\">11. 各参赛队必须提前15分钟到场准备，比赛规定时间开始15分钟后如对方人员不齐将必须以现有人员上场比赛，如现有人员不足4人按弃权处罚，判对方3：0获胜。</p><p align=\"left\">12.被出示1次黄牌的，球队的纪律保证金（押金）将被扣除50元。被出示1次红牌的，球队的纪律保证金（押金）将被扣除100元。</p><p align=\"left\">13.单场比赛被出示2张黄牌或1张红牌的队员，应立即退出场地，不再允许其继续比赛，球队的纪律保证金（押金）将被扣除100元，该队员下一轮停赛。</p><p align=\"left\">14.双方队员发生打架斗殴事件，谩骂，殴打裁判直接递交公安机关处理并取消该队之后所有比赛资格，已交所有保证金不予退还。</p><p align=\"left\">15.本次比赛的所有裁判由比赛主办方选派，具有丰富的比赛执哨经验，裁判保证遵守公平公正的判罚原则，场上所有队员都必须严格服从裁判的判罚，如对判罚有异议，可向组委会书面提出。</p><p align=\"left\">16.各队队员要尊重对手，尊重裁判，一旦出现违规违纪现象将取消该队员的比赛资格，如果球队出现打架，罢赛等违规现象，将立即取消该球队的比赛资格，并扣除球队纪律保证金。</p><p align=\"left\">17.赛会组委会有权组织裁判、各队负责人召开追加专项纪律会议，并按少数服从多数民主决策原则，对情节严重的违规违纪行为作出追加处罚。</p><p align=\"left\">18.本届比赛不允许外援参加。</p><p align=\"left\"><strong>九</strong><strong>、装备</strong></p><p align=\"left\">（一）参赛各队必须自备颜色一致的队服，队长左臂佩戴明显标志。守门员服装可以不同。服装颜色和号码在报名时提交组委会。（主客队球衣撞色的，客队穿组委会提供应急号衫）</p><p align=\"left\">（二）上场队员必须佩戴护腿板，球鞋只允许为平底或胶质碎丁足球鞋。</p><p align=\"left\">（三）参赛队员一律不得配戴饰物、戒指、项链、手表、手环等。</p><p align=\"left\">（四）参赛队员号码经报名确认后，中途不得更改。</p><p><strong><br></strong></p><p align=\"left\"><strong>十</strong><strong>、报名费和纪律保证金</strong></p><p>每支队伍3000元。（由于球队原因退赛，费用不退）</p><p>注：包含场地费2000元；保证金1000元（多退少补）</p><p>保证金用于比赛中对红黄牌罚款扣费，如出现球队违规被取消比赛资格保证金将不予退还，如顺利完成比赛将在比赛后按红黄牌及处罚扣除情况予以退还余额，无违规违纪的全额退还。</p><p align=\"left\"><strong>十</strong><strong>一</strong><strong>、特别注意事项</strong></p><p align=\"left\">（一）参赛队员应具备参加足球比赛所需的身体健康条件，赛前应进行身体检查和监控，确保身体状况良好并能够适应比赛环境。参赛队员必须身体健康无重大疾病，此项各队领队和队长一定要负责把关，并在报名时由球队负责人签字。</p><p align=\"left\">（二）本次比赛所有参赛各队意外伤害险自理（如参加比赛各队队员必须有意外伤害险）。</p><p align=\"left\">（三）如发生非赛会组织原因产生的意外伤害情况，所需医疗急救等相关费用由各队和运动员自理。</p><p><strong><br></strong></p><p align=\"left\"><strong>十</strong><strong>二</strong><strong>、奖励</strong></p><p align=\"left\">按胜负积分进行排名，积分相同的比较净胜球，进球多的靠前，积分和净胜球多的比较胜负关系，胜出者靠前。</p><p align=\"left\">冠军，奖励奖杯一座、奖金800元人民币（或者同等价值奖品）。</p><p align=\"left\">亚军，奖励500元人民币（或者同等价值奖品）。</p><p align=\"left\">季军，奖励200元人民币（或者同等价值奖品）。</p><p align=\"left\">金靴奖一名，奖励护腿板、球袜等实物装备。</p><p align=\"left\">金手套奖一名，奖励手套等实物装备。</p><p align=\"left\">每周微信投票评选最佳，奖励球袜等实物装备。</p><p align=\"left\"><strong>十</strong><strong>三</strong><strong>、报名</strong></p><p align=\"left\">报名电话：18846140810（同微信）</p><p align=\"left\">联系人：刘延龙</p><p align=\"left\">交费方式（如需开具发票，需单独联系）&mdash;&mdash;</p><p align=\"left\">1）微信转账：18846140810（刘延龙）</p><p align=\"left\">2）支付宝转账：18846140810（刘延龙）</p><p align=\"left\">3）公司银行卡：140540122000103823（哈尔滨农商银行南通大街支行）</p><p align=\"left\"><strong>十</strong><strong>四</strong><strong>、本规程解释权归哈尔滨蜂体网络科技有限公司。未尽事宜，另行制定通知。</strong></p><p align=\"left\">哈尔滨蜂体网络科技有限公司</p><p align=\"left\">2018年11月5日</p>', '2018-11-08 12:53:55', '0', '0', '0', '57', null, '18846140810');
INSERT INTO `event` VALUES ('1291', '0', '0', '蜂体杯冬季室内足球联赛赛程', '0', '0', '0', '2018-11-11 18:00:00', '2019-01-15 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区会展体育馆', '126.704826', '45.75148', '10000', '1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1', null, '2', '0', '1', 'events/1291_img1.png', '<p align=\"center\"><strong><span style=\"color: rgb(226, 80, 65);\">2018-2019&ldquo;蜂体杯&rdquo;冬季室内业余足球联赛赛程表</span></strong></p><p align=\"center\"><strong><span style=\"color: rgb(226, 80, 65);\">（以每周开赛前的公告为准）</span></strong></p><p><span style=\"color: rgb(226, 80, 65);\">第一轮2019年11月11日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>永丰</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>中正蓝德</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>社联</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>龙腾</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>国安流浪者</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第二轮2019年11月18日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>社联</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>中正蓝德</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第三轮2019年11月25日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>启航金融</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>中正蓝德</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>社联</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第四轮2019年12月2日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"196\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"183\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"183\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>中正蓝德</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>永丰</strong><br></td><td valign=\"top\" width=\"183\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"183\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>社联</strong><br></td><td valign=\"top\" width=\"183\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"183\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>启航金融</strong></p></td></tr><tr><td valign=\"top\" width=\"196\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"183\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第五轮2019年12月9日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>社联</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>中正蓝德</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第六轮2019年12月16日（前五轮积分相近者相互踢一轮）</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>第一名</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>第二名</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>第三名</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>第四名</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>第五名</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>第六名</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>第七名</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>第八名</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>第九名</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>第十名</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第七轮2019年12月23日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>中正蓝德</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>国安流浪者</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>社联</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第八轮2019年12月30日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>社联</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>中正蓝德</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>江湖金封</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>天缘烤吧</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第九轮2019年1月6日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>启航金融</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>龙腾</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>中正蓝德</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>社联</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>国安流浪者</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table><p><span style=\"color: rgb(226, 80, 65);\">第十轮2019年1月13日</span></p><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td valign=\"top\" width=\"189\"><strong>队伍</strong><br></td><td valign=\"top\" width=\"189\"><strong>场地时间</strong><br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>队伍</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>中正蓝德</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>国安流浪者</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>龙腾</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>社联</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>亚麻战斗</strong><br></td><td valign=\"top\" width=\"189\">1号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>昌达加固</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>天缘烤吧</strong><br></td><td valign=\"top\" width=\"189\">2号场（周日）19:40-20:50<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>永丰</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>启航金融</strong><br></td><td valign=\"top\" width=\"189\">3号场（周二）18:30-19:40<br></td><td valign=\"top\" width=\"189\"><p align=\"right\"><strong>江湖金封</strong></p></td></tr><tr><td valign=\"top\" width=\"189\"><strong>&nbsp;</strong><br></td><td valign=\"top\" width=\"189\"><br></td><td valign=\"top\" width=\"189\"><br></td></tr></tbody></table>', '2018-11-08 13:22:30', '0', '0', '0', '71', null, '18846140810');
INSERT INTO `event` VALUES ('1297', '961', '0', '世界上', '1', '0', '5', '2018-11-13 09:20:00', '2018-11-15 09:20:00', '6', '44', '509', '丹东市第二中学(振兴区英才街2号)', '124.34354', '40.01011', '10', null, '20', '1', '1', '1', 'fdf1aedc7f392e7588769c71fa9d893d.jpg', '你这你在', '2018-11-09 09:21:33', '0', '0', '1', '11', '噶是', '18641502372');
INSERT INTO `event` VALUES ('1302', '956', '0', '测试活动测试活动测试活动测试活动', '1', '0', '2', '2018-11-10 11:10:00', '2018-12-10 11:10:00', '6', '44', '512', '辽宁省丹东市东港市育才街8号', '124.15209', '39.86172', '5', null, '2', '1', '1', '1', '0a6c1191d3ac17691d18ff40092ccf93.gif', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-11-09 11:12:45', '0', '0', '1', '7', '你好', '13384255905');
INSERT INTO `event` VALUES ('1303', '965', '1', 'OK', '1', '0', '6', '2018-11-10 18:54:00', '2018-11-10 21:54:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区地铁1号线', '126.65592193604', '45.768825531006', '20', null, '5', '1', '1', '1', '8f367226cb22a1e990d221ca2fe7557a.jpg', '在林大门口集合，一起去万达滑雪吧～\n冬天快来了，滑雪要提上日程了。', '2018-11-09 18:55:32', '0', '1', '1', '6', '小黄蜂', '18846140510');
INSERT INTO `event` VALUES ('1308', '965', '1', '喝茶练字桌游', '1', '0', '17', '2018-11-13 08:10:00', '2018-11-13 15:10:00', '8', '62', '643', '哈尔滨市港城酒店(南岗区南通大街149号)', '126.67118889229', '45.776628657693', '225', null, '5', '1', '2', '1', '50947f53b5ab9d037b6af73ec28096d2.jpg', '在文化公园集合，一起去打牌吧吧～\n冬天快来了，滑雪要提上日程了。', '2018-11-11 08:13:40', '0', '1', '1', '4', '小黄蜂', '18846140510');

-- ----------------------------
-- Table structure for event_share
-- ----------------------------
DROP TABLE IF EXISTS `event_share`;
CREATE TABLE `event_share` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'boss id of site',
  `event_id` bigint(20) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  `content` text COMMENT 'introductive picture name of site',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2262 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_share
-- ----------------------------
INSERT INTO `event_share` VALUES ('2246', '962', '1265', '1', null);
INSERT INTO `event_share` VALUES ('2247', '962', '1266', '1', null);
INSERT INTO `event_share` VALUES ('2248', '968', '1270', '1', null);
INSERT INTO `event_share` VALUES ('2249', '962', '1270', '2', null);
INSERT INTO `event_share` VALUES ('2250', '962', '1280', '1', null);
INSERT INTO `event_share` VALUES ('2251', '962', '1281', '2', null);
INSERT INTO `event_share` VALUES ('2252', '964', '1282', '1', null);
INSERT INTO `event_share` VALUES ('2253', '962', '1283', '1', null);
INSERT INTO `event_share` VALUES ('2254', '967', '1284', '1', null);
INSERT INTO `event_share` VALUES ('2255', '962', '1285', '1', null);
INSERT INTO `event_share` VALUES ('2256', '962', '1290', '1', null);
INSERT INTO `event_share` VALUES ('2257', '1029', '1290', '1', null);
INSERT INTO `event_share` VALUES ('2258', '962', '1291', '1', null);
INSERT INTO `event_share` VALUES ('2259', '1038', '1291', '1', null);
INSERT INTO `event_share` VALUES ('2260', '962', '1296', '1', null);
INSERT INTO `event_share` VALUES ('2261', '965', '1303', '1', null);

-- ----------------------------
-- Table structure for event_type
-- ----------------------------
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_type
-- ----------------------------
INSERT INTO `event_type` VALUES ('0', '足球');
INSERT INTO `event_type` VALUES ('1', '篮球');
INSERT INTO `event_type` VALUES ('2', '台球');
INSERT INTO `event_type` VALUES ('3', '排球');
INSERT INTO `event_type` VALUES ('4', '网球');
INSERT INTO `event_type` VALUES ('5', '壁球');
INSERT INTO `event_type` VALUES ('6', '瑜伽');
INSERT INTO `event_type` VALUES ('7', '舞蹈');
INSERT INTO `event_type` VALUES ('8', '电竞');
INSERT INTO `event_type` VALUES ('9', '爬山');
INSERT INTO `event_type` VALUES ('10', '轮滑');
INSERT INTO `event_type` VALUES ('11', '武术');
INSERT INTO `event_type` VALUES ('12', '旅游');
INSERT INTO `event_type` VALUES ('13', '滑冰');
INSERT INTO `event_type` VALUES ('14', '滑雪');
INSERT INTO `event_type` VALUES ('15', '拳击');
INSERT INTO `event_type` VALUES ('16', '跑步');
INSERT INTO `event_type` VALUES ('17', '棋牌');
INSERT INTO `event_type` VALUES ('18', '户外');
INSERT INTO `event_type` VALUES ('19', '健身');
INSERT INTO `event_type` VALUES ('20', '游泳');
INSERT INTO `event_type` VALUES ('21', '桌游');
INSERT INTO `event_type` VALUES ('22', '骑行');
INSERT INTO `event_type` VALUES ('23', '羽毛球');
INSERT INTO `event_type` VALUES ('24', '乒乓球');
INSERT INTO `event_type` VALUES ('25', '保龄球');
INSERT INTO `event_type` VALUES ('26', '跆拳道');
INSERT INTO `event_type` VALUES ('27', '高尔夫');
INSERT INTO `event_type` VALUES ('28', '运动装备');
INSERT INTO `event_type` VALUES ('29', '射击射箭');
INSERT INTO `event_type` VALUES ('30', '轰趴聚会');
INSERT INTO `event_type` VALUES ('31', '综合场馆');
INSERT INTO `event_type` VALUES ('32', '其他');

-- ----------------------------
-- Table structure for exchange
-- ----------------------------
DROP TABLE IF EXISTS `exchange`;
CREATE TABLE `exchange` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'id of user who register this exchange',
  `good_id` int(5) DEFAULT NULL COMMENT 'id of goods',
  `state` tinyint(2) DEFAULT '0' COMMENT 'state of exchange',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of exchange',
  `send_time` datetime DEFAULT NULL COMMENT 'time when administrator check the sending good',
  `accept_time` datetime DEFAULT NULL COMMENT 'time when exchange finish',
  `comment` text COMMENT 'brief introduction of exchange',
  `company` varchar(30) DEFAULT NULL COMMENT 'company name of transfer',
  `company_id` varchar(30) DEFAULT NULL COMMENT 'id of company',
  `address_no` bigint(20) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `good_id` (`good_id`),
  KEY `exchange_ibfk_1` (`user_id`),
  CONSTRAINT `exchange_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`no`),
  CONSTRAINT `exchange_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exchange
-- ----------------------------
INSERT INTO `exchange` VALUES ('330', '962', '67', '0', '2018-11-12 13:24:27', null, null, '谢谢', null, null, '193');

-- ----------------------------
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `boss_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES ('532', '970', '962');
INSERT INTO `favourite` VALUES ('534', '962', '962');
INSERT INTO `favourite` VALUES ('535', '964', '962');
INSERT INTO `favourite` VALUES ('536', '964', '964');
INSERT INTO `favourite` VALUES ('537', '968', '964');
INSERT INTO `favourite` VALUES ('538', '968', '962');
INSERT INTO `favourite` VALUES ('539', '962', '964');
INSERT INTO `favourite` VALUES ('540', '965', '964');
INSERT INTO `favourite` VALUES ('541', '965', '962');
INSERT INTO `favourite` VALUES ('543', '962', '968');
INSERT INTO `favourite` VALUES ('544', '965', '968');
INSERT INTO `favourite` VALUES ('546', '961', '956');
INSERT INTO `favourite` VALUES ('547', '963', '968');
INSERT INTO `favourite` VALUES ('548', '963', '964');
INSERT INTO `favourite` VALUES ('549', '963', '962');
INSERT INTO `favourite` VALUES ('551', '961', '961');
INSERT INTO `favourite` VALUES ('552', '963', '963');
INSERT INTO `favourite` VALUES ('553', '963', '967');
INSERT INTO `favourite` VALUES ('554', '965', '963');
INSERT INTO `favourite` VALUES ('555', '965', '967');
INSERT INTO `favourite` VALUES ('557', '962', '967');
INSERT INTO `favourite` VALUES ('558', '967', '962');
INSERT INTO `favourite` VALUES ('559', '967', '963');
INSERT INTO `favourite` VALUES ('560', '967', '964');
INSERT INTO `favourite` VALUES ('561', '967', '967');
INSERT INTO `favourite` VALUES ('562', '967', '968');
INSERT INTO `favourite` VALUES ('563', '1004', '962');
INSERT INTO `favourite` VALUES ('564', '1024', '962');
INSERT INTO `favourite` VALUES ('565', '962', '963');
INSERT INTO `favourite` VALUES ('566', '1022', '962');

-- ----------------------------
-- Table structure for favourite_event
-- ----------------------------
DROP TABLE IF EXISTS `favourite_event`;
CREATE TABLE `favourite_event` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=774 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite_event
-- ----------------------------
INSERT INTO `favourite_event` VALUES ('757', '962', '1265');
INSERT INTO `favourite_event` VALUES ('758', '962', '1266');
INSERT INTO `favourite_event` VALUES ('759', '965', '1266');
INSERT INTO `favourite_event` VALUES ('760', '965', '1276');
INSERT INTO `favourite_event` VALUES ('761', '965', '1277');
INSERT INTO `favourite_event` VALUES ('762', '965', '1272');
INSERT INTO `favourite_event` VALUES ('763', '964', '1279');
INSERT INTO `favourite_event` VALUES ('764', '962', '1283');
INSERT INTO `favourite_event` VALUES ('765', '962', '1285');
INSERT INTO `favourite_event` VALUES ('766', '962', '1289');
INSERT INTO `favourite_event` VALUES ('767', '962', '1290');
INSERT INTO `favourite_event` VALUES ('770', '962', '1291');
INSERT INTO `favourite_event` VALUES ('771', '962', '1284');
INSERT INTO `favourite_event` VALUES ('772', '962', '1282');
INSERT INTO `favourite_event` VALUES ('773', '1059', '1290');

-- ----------------------------
-- Table structure for favourite_feedback
-- ----------------------------
DROP TABLE IF EXISTS `favourite_feedback`;
CREATE TABLE `favourite_feedback` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `feedback_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment` text,
  `submit_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  `isDeleted` int(1) DEFAULT '0',
  `parent_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('211', '1265', '965', '嗡嗡嗡～', '2018-11-02 07:54:40', '0', '0', null);
INSERT INTO `feedback` VALUES ('212', '1265', '965', '怎么中奖？', '2018-11-02 07:54:55', '1', '0', '211');
INSERT INTO `feedback` VALUES ('213', '1285', '1004', '啥聚餐，咋这么便宜啊', '2018-11-08 13:03:19', '0', '0', null);
INSERT INTO `feedback` VALUES ('214', '1285', '962', '我们自己吃，哈哈。', '2018-11-08 17:41:02', '1', '0', '213');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT 'name of goods',
  `cost` int(11) DEFAULT '0' COMMENT 'price of goods calculated by honey',
  `amount` int(11) DEFAULT '0' COMMENT 'amount of goods which can sell',
  `add_time` datetime DEFAULT NULL COMMENT 'add time of goods on landing page',
  `state` tinyint(1) DEFAULT '1' COMMENT 'state of goods(0,1)',
  `comment` text COMMENT 'brief introduction',
  `avatar` text CHARACTER SET latin1 COMMENT 'logo of goods',
  `pic` text COMMENT 'picture of goods',
  `isDeleted` smallint(6) DEFAULT '0' COMMENT 'state of deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('45', 'cbff ', '1000000000', '0', '2018-05-13 10:49:41', '0', '<p><strong>sdf</strong></p><p><strong><em>dfg df &nbsp;</em></strong></p>', '15261797687228.jpg', '15261797789543.jpg', '0');
INSERT INTO `goods` VALUES ('47', '测试', '100000', '0', '2018-05-13 20:36:22', '0', '<p><strong><span style=\"color: rgb(26, 188, 156);\"><em><u><s>测试</s></u></em></span></strong></p><p><strong><span style=\"color: rgb(26, 188, 156);\"><em><u><s><img src=\"https://www.fengteam.cn/backend/uploads/4ac96c4bf7156a14683114593d5a3019098b38ed.jpg\" style=\"width: 343px;\" class=\"fr-fic fr-dib\"></s></u></em></span></strong><br></p><p><br></p>', '15262149677515.jpg', '15262149806332.jpg', '0');
INSERT INTO `goods` VALUES ('48', 'artert', '100', '0', '2018-05-14 00:17:26', '0', '<p>as</p>', '15262282374853.jpg', '15262282449395.jpg', '0');
INSERT INTO `goods` VALUES ('49', '华为P20手机', '100000000', '6', '2018-05-14 09:30:26', '0', '<p><img src=\"https://www.fengteam.cn/backend/uploads/3ca20709440a697dc97067b008bb5bb0f3aae630.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/5cb33b5b87743a02382cdb575e5547a0218c72b2.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/7426c3f1486ba61d87a5b8f4255d1011709f226c.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/87154f7c05a5b18626383a72852770c434354ef0.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263019073749.jpg', '', '0');
INSERT INTO `goods` VALUES ('50', '商品同天', '50', '6', '2018-05-14 16:39:53', '0', '<p>吃吃吃吃</p><p><img src=\"https://www.fengteam.cn/backend/uploads/343158f5d57951a762dea184302058170ac7eafb.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263019073749.jpg', '', '0');
INSERT INTO `goods` VALUES ('51', '1211', '1', '81', '2018-07-18 00:56:43', '0', '<p><span style=\"color: rgb(251, 160, 38);\"><strong><em><u><s>温热</s></u></em></strong></span><span style=\"color: rgb(251, 160, 38);\"><strong><em><u><s><img src=\"https://www.fengteam.cn/backend/uploads/5f711b339e38a05078b19ee8fdfedd16f7b3d81d.jpg\" style=\"width: 347px;\" class=\"fr-fic fr-dib\"></s></u></em></strong></span></p>', '', '', '1');
INSERT INTO `goods` VALUES ('53', 'IPhoneX', '3600000', '8', '2018-05-15 21:10:43', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/dd654e9169586b6c3d1f5f3d84c32b0af139c4d2.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263897656529.jpg', '15263898407056.jpg', '0');
INSERT INTO `goods` VALUES ('54', '华为手机P20', '2000000', '19', '2018-05-15 21:12:21', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/73ed15bb2dd25f0bbad9b5171a962c63f46040ce.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/367debf149684316b8bcf3e737c46fb99ba78dff.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"><img src=\"https://www.fengteam.cn/backend/uploads/3aa50723fcdd715b5e00705f58b480e92c7508bd.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/c697a74d068ad8cf9e9b66cfbfba17f760888526.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263899278206.jpg', '15263899384562.jpg', '0');
INSERT INTO `goods` VALUES ('55', '迪卡侬帐篷', '1000000', '30', '2018-05-15 21:05:06', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/c9d45a94b588a9c03764028beae448f3015fd1b8.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/f7bb1b75d03493ef9afad89cbcfdce55ac983943.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/899189a881ba9b94ec6fb14638250f032f3ec8c6.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/1c17abba0a56fe88afc0befcdc21baa621f644bc.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/0cf0a0a81a3c4a858cdcaa35d6478a7571bec8f7.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263894655019.jpg', '15263894798476.jpg', '0');
INSERT INTO `goods` VALUES ('56', '小米运动耳机', '900000', '9', '2018-05-15 21:16:31', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/a97e11c58694eae8402c99fbda8d97dba126361f.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/e88d07aa3229d31a8fc3f69eec0d505e1bf1f87a.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263901712975.jpg', '15263901885344.jpg', '0');
INSERT INTO `goods` VALUES ('57', '印花瑜伽垫', '800000', '20', '2018-05-15 21:21:01', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/499b4483cf2432824597dca55a77990cfd94e3ab.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/93888711641ac6e430fb9e4992a589fcf561bf57.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/482413d510b81cc881afaaadaffa34f09024beed.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/95be89d7c92546258f613dd399505d20b3661549.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/11821ee0600f2ea9196f9599f7f4c459f4a125b4.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263904381454.jpg', '15263904583606.jpg', '0');
INSERT INTO `goods` VALUES ('58', '骆驼速干衣', '400000', '40', '2018-05-15 21:25:52', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/817f690942c17b6d9056c116f73f8bfe87e4a14c.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/4f5ae9d138b555a34d959f3e3cddf461e4034243.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/48d6e32fa9775dfad324015bd50d44a3fa0e6d48.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/12aaa2edcfa113e64d4b6266711cdf543af21b84.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263907321423.jpg', '15263907478967.jpg', '0');
INSERT INTO `goods` VALUES ('59', '运动水杯', '300000', '49', '2018-05-15 21:28:34', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/a47fd701ec0e221e97589b5298a6b5c26133888a.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/549e1361752f315beb5af1e2d9b05cdbe07494de.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/696f4e3c4cb9301c428bdea4c606c19f60fdd863.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/f1b689879d1050bae4ceaa4cdd901f8c4cae6b0f.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263909007516.jpg', '15263909117807.jpg', '0');
INSERT INTO `goods` VALUES ('60', '冷感运动毛巾', '250000', '45', '2018-05-15 21:31:19', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/5ce848d2d804146ebeba6adbf47253afc9ebfa06.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/b908976e8471713edc38346115a8879a82a6b174.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/cc4850047fdf32379ef8c26bdf64192cd417e3c4.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/304926f7462f3aa4e0008293a68f3b4907076787.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263910284641.jpg', '15263910472633.jpg', '0');
INSERT INTO `goods` VALUES ('61', '运动手机臂包', '200000', '25', '2018-05-15 21:35:12', '0', '<p><img src=\"https://www.fengteam.cn/backend/uploads/c9fb3f669ea9eb2cf1802f01cd15a16e6af8ca15.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/6772be01f623638dffb569b1c308f8ecdb904829.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/a7b96da8ce3b0dc3d0f44b20ce1c7e5f18012c55.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/11ab4f12d0fc142cdd863c3c789f7e55b4226078.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/71c49ac07396ad6550b6dfbe56a7961108d7f6af.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/7b4daa8b86327bacc3fdc2b22cf21a08aa94da77.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/8fa239fc12f2f008530f6673c4036fbee92b373b.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263912901421.jpg', '15263913097987.jpg', '0');
INSERT INTO `goods` VALUES ('66', '234', '234', '0', '2018-09-05 20:52:51', '0', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/64537b155e89dbad6cd8ce370182381186b2b145.png\" style=\"width: 195px;\" class=\"fr-fic fr-dib\"><em>werwerwerwertest</em></p><p><em><img src=\"https://www.fengteam.cn/backend_test/uploads/ad8aa662e4f6dd67946c502c248f9cde9e9e9fd4.png\" style=\"width: 152px;\" class=\"fr-fic fr-dib\"></em></p><p><em>wewerw5674563453</em></p>', '15361519546467.png', '', '1');
INSERT INTO `goods` VALUES ('67', '10元话费', '100000', '91', '2018-11-12 13:28:22', '1', '<h4 style=\"text-align: center;\"><strong>领取兑换规则</strong></h4><hr><p style=\"text-align: center;\">每天通过微信步数可以在后花园领取蜂蜜，满足一定量就可以兑换话费</p><hr><p style=\"text-align: center;\"><strong>移动、联通、电信不限</strong></p><hr><p style=\"text-align: center;\"><strong>到账时间</strong></p><p style=\"text-align: center;\">话费1-2天内到账</p><hr><p style=\"text-align: center;\"><strong>数量</strong></p><p style=\"text-align: center;\">只限100份</p><hr><h4 style=\"text-align: center;\">每天发起活动，预定场馆，参加活动，都可以增加蜂蜜！！！</h4><h4 style=\"text-align: center;\">最快只需要5天！！！</h4><h4 style=\"text-align: center;\"><span style=\"font-family: Impact,Charcoal,sans-serif;\">分享到微信群里蜂蜜增加更快！！！</span></h4><p><br></p>', '15420004919961.png', '15420005004122.png', '0');

-- ----------------------------
-- Table structure for honey
-- ----------------------------
DROP TABLE IF EXISTS `honey`;
CREATE TABLE `honey` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '0' COMMENT 'type of position(event or site)',
  `position` bigint(20) DEFAULT NULL COMMENT 'id of position',
  `amount` int(11) DEFAULT NULL COMMENT 'amount of honey',
  `create_time` datetime DEFAULT NULL COMMENT 'created time of honey',
  `longitude` double DEFAULT NULL COMMENT 'position longitude(optional)',
  `latitude` double DEFAULT NULL COMMENT 'position latitude(optional)',
  `pick_choice` int(11) DEFAULT '0' COMMENT 'pick chance for honey',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honey
-- ----------------------------

-- ----------------------------
-- Table structure for honey_backyard
-- ----------------------------
DROP TABLE IF EXISTS `honey_backyard`;
CREATE TABLE `honey_backyard` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=1888 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honey_backyard
-- ----------------------------
INSERT INTO `honey_backyard` VALUES ('1883', '1068', '1839', '4', '0', '2018-11-12 14:00:19', '0');
INSERT INTO `honey_backyard` VALUES ('1878', '1034', '7587', '7', '2', '2018-11-12 09:52:16', '0');
INSERT INTO `honey_backyard` VALUES ('1877', '1038', '8276', '5', '1', '2018-11-12 09:51:55', '0');
INSERT INTO `honey_backyard` VALUES ('1879', '965', '3030', '4', '1', '2018-11-12 09:52:49', '0');
INSERT INTO `honey_backyard` VALUES ('1876', '1038', '17177', '1', '1', '2018-11-11 23:28:32', '0');
INSERT INTO `honey_backyard` VALUES ('1886', '962', '11916', '3', '2', '2018-11-13 10:10:30', '0');
INSERT INTO `honey_backyard` VALUES ('1881', '968', '7949', '8', '1', '2018-11-12 13:27:03', '0');

-- ----------------------------
-- Table structure for honey_friend
-- ----------------------------
DROP TABLE IF EXISTS `honey_friend`;
CREATE TABLE `honey_friend` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user id of binding information',
  `friend_id` bigint(20) DEFAULT NULL COMMENT 'name of credit card owner',
  `status` int(2) DEFAULT '0' COMMENT 'number of credit card',
  PRIMARY KEY (`no`),
  KEY `binding_ibfk_1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1313 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honey_friend
-- ----------------------------
INSERT INTO `honey_friend` VALUES ('1298', '968', '962', '1');
INSERT INTO `honey_friend` VALUES ('1299', '964', '962', '1');
INSERT INTO `honey_friend` VALUES ('1300', '967', '962', '1');
INSERT INTO `honey_friend` VALUES ('1301', '963', '962', '1');
INSERT INTO `honey_friend` VALUES ('1302', '965', '962', '1');
INSERT INTO `honey_friend` VALUES ('1303', '962', '965', '1');
INSERT INTO `honey_friend` VALUES ('1304', '962', '968', '1');
INSERT INTO `honey_friend` VALUES ('1305', '962', '964', '1');
INSERT INTO `honey_friend` VALUES ('1306', '962', '967', '1');
INSERT INTO `honey_friend` VALUES ('1307', '985', '962', '1');
INSERT INTO `honey_friend` VALUES ('1308', '984', '962', '1');
INSERT INTO `honey_friend` VALUES ('1309', '962', '985', '1');
INSERT INTO `honey_friend` VALUES ('1310', '961', '961', '0');
INSERT INTO `honey_friend` VALUES ('1311', '962', '984', '1');
INSERT INTO `honey_friend` VALUES ('1312', '962', '963', '1');

-- ----------------------------
-- Table structure for member_state
-- ----------------------------
DROP TABLE IF EXISTS `member_state`;
CREATE TABLE `member_state` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'id of user who is member',
  `cost` float DEFAULT NULL COMMENT 'cost which user sign',
  `expire_time` date DEFAULT NULL COMMENT 'expire time of member state',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of member',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT 'out_trade_no of payment',
  PRIMARY KEY (`no`),
  KEY `member_state_ibfk_1` (`user_id`),
  CONSTRAINT `member_state_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_state
-- ----------------------------
INSERT INTO `member_state` VALUES ('5', '962', '9.9', '2018-12-02', '2018-11-02 09:55:21', '15002200621541123713881');

-- ----------------------------
-- Table structure for payment_history
-- ----------------------------
DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  `room_booking_id` bigint(20) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2061 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_history
-- ----------------------------
INSERT INTO `payment_history` VALUES ('1940', '961', '3', '0.02', '1264', null, '2018-11-01 22:11:15');
INSERT INTO `payment_history` VALUES ('1941', '961', '10', '0.02', null, '1443', '2018-11-01 22:12:10');
INSERT INTO `payment_history` VALUES ('1942', '961', '9', '0.00', null, '1443', '2018-11-01 22:12:10');
INSERT INTO `payment_history` VALUES ('1943', '962', '3', '0.50', '1266', null, '2018-11-02 09:50:36');
INSERT INTO `payment_history` VALUES ('1944', '962', '3', '0.50', '1266', null, '2018-11-02 09:51:27');
INSERT INTO `payment_history` VALUES ('1945', '962', '3', '0.50', '1266', null, '2018-11-02 09:53:45');
INSERT INTO `payment_history` VALUES ('1946', '962', '3', '0.50', '1266', null, '2018-11-02 09:55:48');
INSERT INTO `payment_history` VALUES ('1947', '962', '1', '0.50', '1266', null, '2018-11-02 09:55:48');
INSERT INTO `payment_history` VALUES ('1948', '962', '3', '0.50', '1266', null, '2018-11-02 10:25:40');
INSERT INTO `payment_history` VALUES ('1949', '962', '3', '0.50', '1266', null, '2018-11-02 10:58:02');
INSERT INTO `payment_history` VALUES ('1950', '961', '4', '0.02', '1264', null, '2018-11-02 23:55:05');
INSERT INTO `payment_history` VALUES ('1951', '968', '3', '1.00', '1270', null, '2018-11-03 23:07:31');
INSERT INTO `payment_history` VALUES ('1952', '968', '3', '1.00', '1270', null, '2018-11-03 23:11:41');
INSERT INTO `payment_history` VALUES ('1953', '968', '3', '1.00', '1270', null, '2018-11-03 23:22:32');
INSERT INTO `payment_history` VALUES ('1954', '968', '3', '1.00', '1270', null, '2018-11-03 23:34:17');
INSERT INTO `payment_history` VALUES ('1955', '968', '3', '1.00', '1270', null, '2018-11-03 23:46:46');
INSERT INTO `payment_history` VALUES ('1956', '968', '3', '1.00', '1270', null, '2018-11-03 23:54:34');
INSERT INTO `payment_history` VALUES ('1957', '962', '3', '0.60', '1280', null, '2018-11-04 15:01:50');
INSERT INTO `payment_history` VALUES ('1958', '962', '3', '0.60', '1280', null, '2018-11-04 15:07:34');
INSERT INTO `payment_history` VALUES ('1959', '962', '3', '0.60', '1280', null, '2018-11-04 20:42:10');
INSERT INTO `payment_history` VALUES ('1960', '962', '3', '0.80', '1281', null, '2018-11-05 10:14:10');
INSERT INTO `payment_history` VALUES ('1961', '962', '3', '0.80', '1281', null, '2018-11-05 10:14:20');
INSERT INTO `payment_history` VALUES ('1962', '968', '1', '0.80', '1281', null, '2018-11-05 10:14:20');
INSERT INTO `payment_history` VALUES ('1963', '962', '3', '0.80', '1281', null, '2018-11-05 11:03:52');
INSERT INTO `payment_history` VALUES ('1964', '962', '3', '0.80', '1281', null, '2018-11-05 11:51:18');
INSERT INTO `payment_history` VALUES ('1965', '962', '10', '300.00', null, '1444', '2018-11-06 10:20:35');
INSERT INTO `payment_history` VALUES ('1966', '962', '9', '0.00', null, '1444', '2018-11-06 10:20:35');
INSERT INTO `payment_history` VALUES ('1967', '964', '3', '1.00', '1282', null, '2018-11-06 10:27:14');
INSERT INTO `payment_history` VALUES ('1968', '964', '3', '1.00', '1282', null, '2018-11-06 10:27:14');
INSERT INTO `payment_history` VALUES ('1969', '968', '1', '1.00', '1282', null, '2018-11-06 10:27:14');
INSERT INTO `payment_history` VALUES ('1970', '964', '3', '1.00', '1282', null, '2018-11-06 10:27:24');
INSERT INTO `payment_history` VALUES ('1971', '964', '3', '1.00', '1282', null, '2018-11-06 10:31:33');
INSERT INTO `payment_history` VALUES ('1972', '964', '3', '1.00', '1282', null, '2018-11-06 10:47:17');
INSERT INTO `payment_history` VALUES ('1973', '956', '10', '40.00', null, '1445', '2018-11-06 13:10:48');
INSERT INTO `payment_history` VALUES ('1974', '956', '9', '40.00', null, '1445', '2018-11-06 13:10:48');
INSERT INTO `payment_history` VALUES ('1975', '967', '3', '1.00', '1283', null, '2018-11-07 07:37:06');
INSERT INTO `payment_history` VALUES ('1976', '967', '3', '1.00', '1283', null, '2018-11-07 07:51:30');
INSERT INTO `payment_history` VALUES ('1977', '968', '1', '1.00', '1283', null, '2018-11-07 07:51:30');
INSERT INTO `payment_history` VALUES ('1978', '967', '3', '1.00', '1283', null, '2018-11-07 07:54:26');
INSERT INTO `payment_history` VALUES ('1979', '967', '3', '1.00', '1283', null, '2018-11-07 07:59:15');
INSERT INTO `payment_history` VALUES ('1980', '964', '1', '1.00', '1283', null, '2018-11-07 07:59:15');
INSERT INTO `payment_history` VALUES ('1981', '967', '3', '1.00', '1283', null, '2018-11-07 09:52:56');
INSERT INTO `payment_history` VALUES ('1982', '967', '3', '1.00', '1283', null, '2018-11-07 10:56:05');
INSERT INTO `payment_history` VALUES ('1983', '963', '3', '1.00', '1284', null, '2018-11-07 12:23:30');
INSERT INTO `payment_history` VALUES ('1984', '963', '3', '1.00', '1284', null, '2018-11-07 12:27:07');
INSERT INTO `payment_history` VALUES ('1985', '963', '3', '1.00', '1284', null, '2018-11-07 18:44:26');
INSERT INTO `payment_history` VALUES ('1986', '962', '3', '0.60', '1285', null, '2018-11-08 07:57:00');
INSERT INTO `payment_history` VALUES ('1987', '962', '3', '0.60', '1285', null, '2018-11-08 08:10:24');
INSERT INTO `payment_history` VALUES ('1988', '964', '1', '0.60', '1285', null, '2018-11-08 08:10:24');
INSERT INTO `payment_history` VALUES ('1989', '962', '3', '0.60', '1285', null, '2018-11-08 08:13:06');
INSERT INTO `payment_history` VALUES ('1990', '968', '1', '0.60', '1285', null, '2018-11-08 08:13:06');
INSERT INTO `payment_history` VALUES ('1991', '962', '3', '0.60', '1285', null, '2018-11-08 10:02:54');
INSERT INTO `payment_history` VALUES ('1992', '962', '3', '0.60', '1285', null, '2018-11-08 10:03:08');
INSERT INTO `payment_history` VALUES ('1993', '962', '3', '0.60', '1285', null, '2018-11-08 10:04:11');
INSERT INTO `payment_history` VALUES ('1994', '962', '3', '0.60', '1285', null, '2018-11-08 10:07:00');
INSERT INTO `payment_history` VALUES ('2014', '0', '13', '20.00', '1287', null, '2018-11-09 02:24:25');
INSERT INTO `payment_history` VALUES ('2015', '956', '12', '20.00', '1287', null, '2018-11-09 02:24:25');
INSERT INTO `payment_history` VALUES ('2016', '956', '10', '30.00', null, '1446', '2018-11-09 02:48:09');
INSERT INTO `payment_history` VALUES ('2017', '956', '9', '30.00', null, '1446', '2018-11-09 02:48:09');
INSERT INTO `payment_history` VALUES ('2018', '961', '3', '2.00', '1297', null, '2018-11-09 09:21:53');
INSERT INTO `payment_history` VALUES ('2019', '961', '0', '2.00', null, null, '2018-11-09 09:22:47');
INSERT INTO `payment_history` VALUES ('2020', '0', '13', '20.00', '1287', null, '2018-11-09 09:51:09');
INSERT INTO `payment_history` VALUES ('2021', '956', '12', '20.00', '1287', null, '2018-11-09 09:51:09');
INSERT INTO `payment_history` VALUES ('2022', '0', '13', '20.00', '1287', null, '2018-11-09 10:25:08');
INSERT INTO `payment_history` VALUES ('2023', '956', '12', '20.00', '1287', null, '2018-11-09 10:25:08');
INSERT INTO `payment_history` VALUES ('2024', '956', '3', '1.00', '1302', null, '2018-11-09 11:21:46');
INSERT INTO `payment_history` VALUES ('2025', '956', '1', '1.00', '1302', null, '2018-11-09 11:21:46');
INSERT INTO `payment_history` VALUES ('2026', '0', '13', '0.10', '1290', null, '2018-11-09 14:40:35');
INSERT INTO `payment_history` VALUES ('2027', '967', '0', '6.00', null, null, '2018-11-09 15:40:55');
INSERT INTO `payment_history` VALUES ('2028', '968', '0', '1.20', null, null, '2018-11-09 15:42:41');
INSERT INTO `payment_history` VALUES ('2029', '962', '0', '300.00', null, null, '2018-11-09 15:56:20');
INSERT INTO `payment_history` VALUES ('2030', '961', '10', '0.02', null, '1447', '2018-11-09 16:12:30');
INSERT INTO `payment_history` VALUES ('2031', '961', '9', '0.00', null, '1447', '2018-11-09 16:12:30');
INSERT INTO `payment_history` VALUES ('2032', '962', '10', '300.00', null, '1448', '2018-11-09 16:21:53');
INSERT INTO `payment_history` VALUES ('2033', '962', '9', '0.00', null, '1448', '2018-11-09 16:21:53');
INSERT INTO `payment_history` VALUES ('2034', '962', '11', '300.00', null, '1448', '2018-11-09 16:23:14');
INSERT INTO `payment_history` VALUES ('2035', '962', '14', '0.00', null, '1448', '2018-11-09 16:23:14');
INSERT INTO `payment_history` VALUES ('2036', '965', '3', '1.00', '1303', null, '2018-11-09 18:56:09');
INSERT INTO `payment_history` VALUES ('2037', '965', '3', '1.00', '1303', null, '2018-11-09 18:57:50');
INSERT INTO `payment_history` VALUES ('2038', '965', '0', '2.00', null, null, '2018-11-09 18:58:12');
INSERT INTO `payment_history` VALUES ('2039', '0', '13', '0.10', '1296', null, '2018-11-09 21:17:55');
INSERT INTO `payment_history` VALUES ('2040', '0', '13', '0.10', '1296', null, '2018-11-09 21:21:27');
INSERT INTO `payment_history` VALUES ('2041', '0', '13', '0.10', '1296', null, '2018-11-09 21:23:39');
INSERT INTO `payment_history` VALUES ('2042', '961', '4', '2.00', '1297', null, '2018-11-09 23:09:03');
INSERT INTO `payment_history` VALUES ('2043', '961', '3', '2.00', '1297', null, '2018-11-09 23:09:29');
INSERT INTO `payment_history` VALUES ('2044', '961', '0', '2.00', null, null, '2018-11-09 23:22:44');
INSERT INTO `payment_history` VALUES ('2045', '961', '4', '2.00', '1297', null, '2018-11-10 01:01:13');
INSERT INTO `payment_history` VALUES ('2046', '961', '3', '4.00', '1297', null, '2018-11-10 15:40:15');
INSERT INTO `payment_history` VALUES ('2047', '961', '0', '2.00', null, null, '2018-11-10 15:40:48');
INSERT INTO `payment_history` VALUES ('2048', '961', '4', '4.00', '1297', null, '2018-11-10 15:47:22');
INSERT INTO `payment_history` VALUES ('2049', '961', '3', '4.00', '1297', null, '2018-11-10 15:47:44');
INSERT INTO `payment_history` VALUES ('2050', '961', '0', '4.04', null, null, '2018-11-10 16:16:02');
INSERT INTO `payment_history` VALUES ('2051', '956', '0', '2.00', null, null, '2018-11-11 02:56:31');
INSERT INTO `payment_history` VALUES ('2052', '961', '4', '4.00', '1297', null, '2018-11-11 02:59:41');
INSERT INTO `payment_history` VALUES ('2053', '961', '3', '6.00', '1297', null, '2018-11-11 03:00:32');
INSERT INTO `payment_history` VALUES ('2054', '961', '0', '2.00', null, null, '2018-11-11 03:00:57');
INSERT INTO `payment_history` VALUES ('2055', '962', '0', '2.00', null, null, '2018-11-11 07:51:16');
INSERT INTO `payment_history` VALUES ('2056', '965', '3', '2.00', '1308', null, '2018-11-11 08:14:37');
INSERT INTO `payment_history` VALUES ('2057', '965', '3', '4.00', '1308', null, '2018-11-11 08:14:49');
INSERT INTO `payment_history` VALUES ('2058', '965', '1', '2.00', '1308', null, '2018-11-11 08:14:49');
INSERT INTO `payment_history` VALUES ('2059', '965', '0', '2.00', null, null, '2018-11-11 08:15:33');
INSERT INTO `payment_history` VALUES ('2060', '962', '0', '2.00', null, null, '2018-11-11 13:15:11');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(20) DEFAULT NULL COMMENT 'permission name of administrator',
  `perm_text` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user', 'ç”¨æˆ·ç®¡ç†');
INSERT INTO `permission` VALUES ('2', 'event', 'æ´»åŠ¨ç®¡ç†');
INSERT INTO `permission` VALUES ('3', 'booking', 'èœ‚çº¦ç®¡ç†');
INSERT INTO `permission` VALUES ('4', 'member', 'ä¼šå‘˜è´­ä¹°è®¢å•');
INSERT INTO `permission` VALUES ('5', 'exchange', 'å…‘æ¢è®¢å•ç®¡ç†');
INSERT INTO `permission` VALUES ('6', 'present', 'æçŽ°ç®¡ç†');
INSERT INTO `permission` VALUES ('7', 'commodity', 'å•†å“ç®¡ç†');
INSERT INTO `permission` VALUES ('8', 'evaluation', 'è¯„ä»·ç®¡ç†');
INSERT INTO `permission` VALUES ('9', 'rule', 'è§„åˆ™ç®¡ç†');
INSERT INTO `permission` VALUES ('10', 'system', 'ç³»ç»Ÿç®¡ç†');
INSERT INTO `permission` VALUES ('11', 'reset', 'ä¿®æ”¹å¯†ç ');
INSERT INTO `permission` VALUES ('12', 'alarm', 'ç³»ç»Ÿæ¶ˆæ¯');

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` varchar(6) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', '110000', '北京市');
INSERT INTO `provinces` VALUES ('2', '120000', '天津市');
INSERT INTO `provinces` VALUES ('3', '130000', '河北省');
INSERT INTO `provinces` VALUES ('4', '140000', '山西省');
INSERT INTO `provinces` VALUES ('5', '150000', '内蒙古自治区');
INSERT INTO `provinces` VALUES ('6', '210000', '辽宁省');
INSERT INTO `provinces` VALUES ('7', '220000', '吉林省');
INSERT INTO `provinces` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `provinces` VALUES ('9', '310000', '上海市');
INSERT INTO `provinces` VALUES ('10', '320000', '江苏省');
INSERT INTO `provinces` VALUES ('11', '330000', '浙江省');
INSERT INTO `provinces` VALUES ('12', '340000', '安徽省');
INSERT INTO `provinces` VALUES ('13', '350000', '福建省');
INSERT INTO `provinces` VALUES ('14', '360000', '江西省');
INSERT INTO `provinces` VALUES ('15', '370000', '山东省');
INSERT INTO `provinces` VALUES ('16', '410000', '河南省');
INSERT INTO `provinces` VALUES ('17', '420000', '湖北省');
INSERT INTO `provinces` VALUES ('18', '430000', '湖南省');
INSERT INTO `provinces` VALUES ('19', '440000', '广东省');
INSERT INTO `provinces` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `provinces` VALUES ('21', '460000', '海南省');
INSERT INTO `provinces` VALUES ('22', '500000', '重庆市');
INSERT INTO `provinces` VALUES ('23', '510000', '四川省');
INSERT INTO `provinces` VALUES ('24', '520000', '贵州省');
INSERT INTO `provinces` VALUES ('25', '530000', '云南省');
INSERT INTO `provinces` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `provinces` VALUES ('27', '610000', '陕西省');
INSERT INTO `provinces` VALUES ('28', '620000', '甘肃省');
INSERT INTO `provinces` VALUES ('29', '630000', '青海省');
INSERT INTO `provinces` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `provinces` VALUES ('31', '650000', '新疆维吾尔自治区');
INSERT INTO `provinces` VALUES ('32', '710000', '台湾省');
INSERT INTO `provinces` VALUES ('33', '810000', '香港特别行政区');
INSERT INTO `provinces` VALUES ('34', '820000', '澳门特别行政区');

-- ----------------------------
-- Table structure for rating
-- ----------------------------
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user id of comment',
  `event_id` bigint(20) DEFAULT NULL COMMENT 'event id for comment',
  `room_booking_id` bigint(20) DEFAULT NULL,
  `point` smallint(6) DEFAULT NULL COMMENT 'point of comment',
  `comment` text COMMENT 'content of comment',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of comment',
  PRIMARY KEY (`id`),
  KEY `rating_ibfk_1` (`user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rating
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` smallint(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `permission` varchar(500) DEFAULT '{"p_10":"1","p_20":"1","p_30":"0","p_40":"0","p_50":"0","p_60":"0","p_70":"0","p_80":"0","p_90":"0","p_100":"0","p_110":"0","p_120":"0"}',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '{\"p_10\":\"1\",\"p_20\":\"1\",\"p_30\":\"1\",\"p_40\":\"1\",\"p_50\":\"1\",\"p_60\":\"1\",\"p_70\":\"1\",\"p_80\":\"1\",\"p_90\":\"1\",\"p_100\":1,\"p_110\":\"1\",\"p_120\":\"1\"}');
INSERT INTO `role` VALUES ('4', 'asdf', '{\"p_10\":1,\"p_20\":1,\"p_30\":1,\"p_40\":0,\"p_50\":0,\"p_60\":0,\"p_70\":0,\"p_80\":\"0\",\"p_90\":\"0\",\"p_100\":0,\"p_110\":0,\"p_120\":0}');
INSERT INTO `role` VALUES ('6', 'qwe', '{\"p_10\":\"1\",\"p_20\":\"1\",\"p_30\":\"0\",\"p_40\":\"0\",\"p_50\":\"0\",\"p_60\":\"0\",\"p_70\":\"0\",\"p_80\":\"0\",\"p_90\":\"0\",\"p_100\":\"0\",\"p_110\":\"0\",\"p_120\":\"0\"}');

-- ----------------------------
-- Table structure for role_inf
-- ----------------------------
DROP TABLE IF EXISTS `role_inf`;
CREATE TABLE `role_inf` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_inf
-- ----------------------------
INSERT INTO `role_inf` VALUES ('1', '1', '1');
INSERT INTO `role_inf` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boss_id` int(11) DEFAULT NULL,
  `room_name` varchar(10) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1265 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1190', '961', '1号', '0.01', '2018-11-08 22:09:31');
INSERT INTO `room` VALUES ('1191', '961', '2号', '0.01', '2018-11-08 22:09:31');
INSERT INTO `room` VALUES ('1192', '962', '1号场地', '300.00', '2018-11-08 22:28:40');
INSERT INTO `room` VALUES ('1193', '962', '2号场地', '300.00', '2018-11-08 22:28:40');
INSERT INTO `room` VALUES ('1194', '962', '3号场地', '300.00', '2018-11-08 22:28:40');
INSERT INTO `room` VALUES ('1195', '962', '1号场地', '300.00', '2018-11-08 22:32:23');
INSERT INTO `room` VALUES ('1196', '962', '2号场地', '300.00', '2018-11-08 22:32:23');
INSERT INTO `room` VALUES ('1197', '962', '3号场地', '300.00', '2018-11-08 22:32:23');
INSERT INTO `room` VALUES ('1198', '962', '1号场地', '300.00', '2018-11-08 22:32:24');
INSERT INTO `room` VALUES ('1199', '962', '2号场地', '300.00', '2018-11-08 22:32:24');
INSERT INTO `room` VALUES ('1200', '962', '3号场地', '300.00', '2018-11-08 22:32:24');
INSERT INTO `room` VALUES ('1201', '962', '1号场地', '300.00', '2018-11-09 07:46:04');
INSERT INTO `room` VALUES ('1202', '962', '2号场地', '300.00', '2018-11-09 07:46:04');
INSERT INTO `room` VALUES ('1203', '962', '3号场地', '300.00', '2018-11-09 07:46:04');
INSERT INTO `room` VALUES ('1204', '962', '1号场地', '300.00', '2018-11-09 07:47:36');
INSERT INTO `room` VALUES ('1205', '962', '2号场地', '300.00', '2018-11-09 07:47:36');
INSERT INTO `room` VALUES ('1206', '962', '3号场地', '300.00', '2018-11-09 07:47:36');
INSERT INTO `room` VALUES ('1207', '956', '1号场', '10.00', '2018-11-09 11:53:14');
INSERT INTO `room` VALUES ('1208', '956', '2号场', '10.00', '2018-11-09 11:53:14');
INSERT INTO `room` VALUES ('1209', '956', '3号场', '10.00', '2018-11-09 11:53:14');
INSERT INTO `room` VALUES ('1210', '964', '1号场', '20.00', '2018-11-09 18:02:40');
INSERT INTO `room` VALUES ('1211', '964', '2号场', '20.00', '2018-11-09 18:02:40');
INSERT INTO `room` VALUES ('1212', '964', '3号场', '20.00', '2018-11-09 18:02:40');
INSERT INTO `room` VALUES ('1213', '964', '4号场', '20.00', '2018-11-09 18:02:40');
INSERT INTO `room` VALUES ('1214', '968', '初级班', '10.00', '2018-11-09 20:15:36');
INSERT INTO `room` VALUES ('1215', '968', '中级班', '10.00', '2018-11-09 20:15:36');
INSERT INTO `room` VALUES ('1216', '968', '高级班', '20.00', '2018-11-09 20:15:36');
INSERT INTO `room` VALUES ('1217', '968', '营养课', '5.00', '2018-11-09 20:15:36');
INSERT INTO `room` VALUES ('1218', '967', '全场', '40.00', '2018-11-09 23:59:31');
INSERT INTO `room` VALUES ('1219', '967', '半场', '20.00', '2018-11-09 23:59:31');
INSERT INTO `room` VALUES ('1220', '963', '体验一次', '10.00', '2018-11-10 07:57:43');
INSERT INTO `room` VALUES ('1221', '963', '体验一次', '10.00', '2018-11-10 08:13:26');
INSERT INTO `room` VALUES ('1222', '962', '1号场地', '300.00', '2018-11-13 07:40:33');
INSERT INTO `room` VALUES ('1223', '962', '2号场地', '300.00', '2018-11-13 07:40:33');
INSERT INTO `room` VALUES ('1224', '962', '3号场地', '300.00', '2018-11-13 07:40:33');
INSERT INTO `room` VALUES ('1225', '962', '1号场地', '300.00', '2018-11-13 07:41:58');
INSERT INTO `room` VALUES ('1226', '962', '2号场地', '300.00', '2018-11-13 07:41:58');
INSERT INTO `room` VALUES ('1227', '962', '3号场地', '300.00', '2018-11-13 07:41:58');
INSERT INTO `room` VALUES ('1228', '962', '1号场地', '300.00', '2018-11-13 07:42:32');
INSERT INTO `room` VALUES ('1229', '962', '2号场地', '300.00', '2018-11-13 07:42:32');
INSERT INTO `room` VALUES ('1230', '962', '3号场地', '300.00', '2018-11-13 07:42:32');
INSERT INTO `room` VALUES ('1231', '962', '1号场地', '300.00', '2018-11-13 07:44:15');
INSERT INTO `room` VALUES ('1232', '962', '2号场地', '300.00', '2018-11-13 07:44:15');
INSERT INTO `room` VALUES ('1233', '962', '3号场地', '300.00', '2018-11-13 07:44:15');
INSERT INTO `room` VALUES ('1234', '962', '1号场地', '300.00', '2018-11-13 07:44:50');
INSERT INTO `room` VALUES ('1235', '962', '2号场地', '300.00', '2018-11-13 07:44:50');
INSERT INTO `room` VALUES ('1236', '962', '3号场地', '300.00', '2018-11-13 07:44:50');
INSERT INTO `room` VALUES ('1237', '962', '1号场地', '300.00', '2018-11-13 07:45:53');
INSERT INTO `room` VALUES ('1238', '962', '2号场地', '300.00', '2018-11-13 07:45:53');
INSERT INTO `room` VALUES ('1239', '962', '3号场地', '300.00', '2018-11-13 07:45:53');
INSERT INTO `room` VALUES ('1240', '962', '1号场地', '300.00', '2018-11-13 07:46:36');
INSERT INTO `room` VALUES ('1241', '962', '2号场地', '300.00', '2018-11-13 07:46:36');
INSERT INTO `room` VALUES ('1242', '962', '3号场地', '300.00', '2018-11-13 07:46:36');
INSERT INTO `room` VALUES ('1243', '962', '1号场地', '300.00', '2018-11-13 07:49:43');
INSERT INTO `room` VALUES ('1244', '962', '2号场地', '300.00', '2018-11-13 07:49:43');
INSERT INTO `room` VALUES ('1245', '962', '3号场地', '300.00', '2018-11-13 07:49:43');
INSERT INTO `room` VALUES ('1246', '962', '1号场地', '300.00', '2018-11-13 07:49:45');
INSERT INTO `room` VALUES ('1247', '962', '2号场地', '300.00', '2018-11-13 07:49:45');
INSERT INTO `room` VALUES ('1248', '962', '3号场地', '300.00', '2018-11-13 07:49:45');
INSERT INTO `room` VALUES ('1249', '962', '1号场地', '300.00', '2018-11-13 07:49:46');
INSERT INTO `room` VALUES ('1250', '962', '2号场地', '300.00', '2018-11-13 07:49:46');
INSERT INTO `room` VALUES ('1251', '962', '3号场地', '300.00', '2018-11-13 07:49:46');
INSERT INTO `room` VALUES ('1252', '962', '1号场地', '300.00', '2018-11-13 07:50:18');
INSERT INTO `room` VALUES ('1253', '962', '2号场地', '300.00', '2018-11-13 07:50:18');
INSERT INTO `room` VALUES ('1254', '962', '3号场地', '300.00', '2018-11-13 07:50:18');
INSERT INTO `room` VALUES ('1255', '962', '1号场地', '300.00', '2018-11-13 07:51:00');
INSERT INTO `room` VALUES ('1256', '962', '2号场地', '300.00', '2018-11-13 07:51:00');
INSERT INTO `room` VALUES ('1257', '962', '3号场地', '300.00', '2018-11-13 07:51:00');
INSERT INTO `room` VALUES ('1258', '962', '西侧场地', '300.00', '2018-11-13 10:19:43');
INSERT INTO `room` VALUES ('1259', '962', '中间场地', '300.00', '2018-11-13 10:19:43');
INSERT INTO `room` VALUES ('1260', '962', '东侧场地', '300.00', '2018-11-13 10:19:43');
INSERT INTO `room` VALUES ('1261', '961', '1号', '0.01', '2018-11-15 01:18:07');
INSERT INTO `room` VALUES ('1262', '961', '2号', '0.01', '2018-11-15 01:18:07');
INSERT INTO `room` VALUES ('1263', '961', '1号', '0.01', '2018-11-16 16:10:30');
INSERT INTO `room` VALUES ('1264', '961', '2号', '0.01', '2018-11-16 16:10:30');

-- ----------------------------
-- Table structure for room_booking
-- ----------------------------
DROP TABLE IF EXISTS `room_booking`;
CREATE TABLE `room_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_num` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `boss_id` bigint(20) NOT NULL,
  `state` int(2) DEFAULT '0' COMMENT 'state of booking',
  `book_info` text,
  `out_trade_no` varchar(40) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `pay_cost` decimal(10,2) DEFAULT NULL,
  `pay_wallet` decimal(10,2) DEFAULT '0.00',
  `pay_honey` decimal(10,2) DEFAULT NULL,
  `pay_online` decimal(10,2) DEFAULT NULL,
  `out_refund_no` char(40) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `room_id` (`boss_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1449 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of room_booking
-- ----------------------------
INSERT INTO `room_booking` VALUES ('1443', null, '961', '961', '2', '[{\"user_id\":\"961\",\"room_id\":\"1190\",\"start_time\":\"2018-11-02 08:30:00\",\"end_time\":\"2018-11-02 09:00:00\"},{\"user_id\":\"961\",\"room_id\":\"1191\",\"start_time\":\"2018-11-02 09:30:00\",\"end_time\":\"2018-11-02 10:00:00\"}]', '', '2018-11-01 22:12:10', '0.02', '0.02', '0.00', '0.00', null, '2018-11-02 08:30:00', '2018-11-02 10:00:00');
INSERT INTO `room_booking` VALUES ('1444', null, '962', '962', '2', '[{\"user_id\":\"962\",\"room_id\":\"1259\",\"start_time\":\"2018-11-10 10:00:00\",\"end_time\":\"2018-11-10 12:00:00\"}]', '1500220062154147082740075744', '2018-11-06 10:20:35', '300.00', '7.50', '2.00', '290.50', null, '2018-11-10 10:00:00', '2018-11-10 12:00:00');
INSERT INTO `room_booking` VALUES ('1445', null, '956', '956', '2', '[{\"user_id\":\"956\",\"room_id\":\"1207\",\"start_time\":\"2018-11-07 11:00:00\",\"end_time\":\"2018-11-07 12:00:00\"},{\"user_id\":\"956\",\"room_id\":\"1208\",\"start_time\":\"2018-11-07 12:00:00\",\"end_time\":\"2018-11-07 13:00:00\"},{\"user_id\":\"956\",\"room_id\":\"1209\",\"start_time\":\"2018-11-07 13:00:00\",\"end_time\":\"2018-11-07 14:00:00\"},{\"user_id\":\"956\",\"room_id\":\"1209\",\"start_time\":\"2018-11-07 14:00:00\",\"end_time\":\"2018-11-07 15:00:00\"}]', '', '2018-11-06 13:10:48', '40.00', '40.00', '0.00', '0.00', null, '2018-11-07 11:00:00', '2018-11-07 15:00:00');
INSERT INTO `room_booking` VALUES ('1446', null, '956', '956', '2', '[{\"user_id\":\"956\",\"room_id\":\"1207\",\"start_time\":\"2018-11-13 12:00:00\",\"end_time\":\"2018-11-13 13:00:00\"},{\"user_id\":\"956\",\"room_id\":\"1208\",\"start_time\":\"2018-11-13 11:00:00\",\"end_time\":\"2018-11-13 12:00:00\"},{\"user_id\":\"956\",\"room_id\":\"1208\",\"start_time\":\"2018-11-13 12:00:00\",\"end_time\":\"2018-11-13 13:00:00\"}]', '', '2018-11-09 02:48:09', '30.00', '30.00', '0.00', '0.00', null, '2018-11-13 11:00:00', '2018-11-13 13:00:00');
INSERT INTO `room_booking` VALUES ('1447', null, '961', '961', '2', '[{\"user_id\":\"961\",\"room_id\":\"1190\",\"start_time\":\"2018-11-10 10:00:00\",\"end_time\":\"2018-11-10 10:30:00\"},{\"user_id\":\"961\",\"room_id\":\"1191\",\"start_time\":\"2018-11-10 09:30:00\",\"end_time\":\"2018-11-10 10:00:00\"}]', '', '2018-11-09 16:12:30', '0.02', '0.02', '0.00', '0.00', null, '2018-11-10 09:30:00', '2018-11-10 10:30:00');
INSERT INTO `room_booking` VALUES ('1448', null, '962', '962', '3', '[{\"user_id\":\"962\",\"room_id\":\"1206\",\"start_time\":\"2018-11-12 08:00:00\",\"end_time\":\"2018-11-12 10:00:00\"}]', '1500220062154175170378578901', '2018-11-09 16:21:53', '300.00', '0.00', '2.00', '298.00', '15002200621541751791966', '2018-11-12 08:00:00', '2018-11-12 10:00:00');

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `value` float DEFAULT NULL COMMENT 'rule value of program',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('1', '2000');
INSERT INTO `rule` VALUES ('2', '50');
INSERT INTO `rule` VALUES ('3', '50');
INSERT INTO `rule` VALUES ('4', '1');
INSERT INTO `rule` VALUES ('5', '3');
INSERT INTO `rule` VALUES ('6', '200');
INSERT INTO `rule` VALUES ('7', '50000');
INSERT INTO `rule` VALUES ('8', '9.9');
INSERT INTO `rule` VALUES ('9', '10000');
INSERT INTO `rule` VALUES ('10', '1');
INSERT INTO `rule` VALUES ('11', '20000');
INSERT INTO `rule` VALUES ('12', '2');
INSERT INTO `rule` VALUES ('13', '20000');
INSERT INTO `rule` VALUES ('14', '2');

-- ----------------------------
-- Table structure for share_data
-- ----------------------------
DROP TABLE IF EXISTS `share_data`;
CREATE TABLE `share_data` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'boss id of site',
  `boss_id` bigint(20) DEFAULT NULL,
  `share_day` text,
  `content` text COMMENT 'introductive picture name of site',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2266 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share_data
-- ----------------------------
INSERT INTO `share_data` VALUES ('2260', '961', '961', '5', '{\"book_date\":\"2018-11-2\",\"book_info\":[{\"cost\":\"0.01\",\"status\":1,\"room_id\":\"1190\",\"book_id\":\"\",\"user_id\":\"961\",\"room_name\":\"1\\u53f7\",\"start\":\"08:30\",\"end\":\"09:00\",\"start_time\":1541118600000,\"end_time\":1541120400000,\"state\":0},{\"cost\":\"0.01\",\"status\":1,\"room_id\":\"1191\",\"book_id\":\"\",\"user_id\":\"961\",\"room_name\":\"2\\u53f7\",\"start\":\"09:30\",\"end\":\"10:00\",\"start_time\":1541122200000,\"end_time\":1541124000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2261', '962', '962', '6', '{\"book_date\":\"2018-11-10\",\"book_info\":[{\"cost\":\"300.00\",\"status\":1,\"room_id\":\"1259\",\"book_id\":\"\",\"user_id\":\"962\",\"room_name\":\"\\u4e2d\\u95f4\\u573a\\u5730\",\"start\":\"10:00\",\"end\":\"12:00\",\"start_time\":1541815200000,\"end_time\":1541822400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2262', '956', '956', '3', '{\"book_date\":\"2018-11-7\",\"book_info\":[{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1207\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"11:00\",\"end\":\"12:00\",\"start_time\":1541559600000,\"end_time\":1541563200000,\"state\":0},{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1208\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"12:00\",\"end\":\"13:00\",\"start_time\":1541563200000,\"end_time\":1541566800000,\"state\":0},{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1209\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"13:00\",\"end\":\"14:00\",\"start_time\":1541566800000,\"end_time\":1541570400000,\"state\":0},{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1209\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"14:00\",\"end\":\"15:00\",\"start_time\":1541570400000,\"end_time\":1541574000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2263', '956', '956', '2', '{\"book_date\":\"2018-11-13\",\"book_info\":[{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1207\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"12:00\",\"end\":\"13:00\",\"start_time\":1542081600000,\"end_time\":1542085200000,\"state\":0},{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1208\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"11:00\",\"end\":\"12:00\",\"start_time\":1542078000000,\"end_time\":1542081600000,\"state\":0},{\"cost\":\"10.00\",\"status\":1,\"room_id\":\"1208\",\"book_id\":\"\",\"user_id\":\"956\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"12:00\",\"end\":\"13:00\",\"start_time\":1542081600000,\"end_time\":1542085200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2264', '961', '961', '6', '{\"book_date\":\"2018-11-10\",\"book_info\":[{\"cost\":\"0.01\",\"status\":1,\"room_id\":\"1190\",\"book_id\":\"\",\"user_id\":\"961\",\"room_name\":\"1\\u53f7\",\"start\":\"10:00\",\"end\":\"10:30\",\"start_time\":1541815200000,\"end_time\":1541817000000,\"state\":0},{\"cost\":\"0.01\",\"status\":1,\"room_id\":\"1191\",\"book_id\":\"\",\"user_id\":\"961\",\"room_name\":\"2\\u53f7\",\"start\":\"09:30\",\"end\":\"10:00\",\"start_time\":1541813400000,\"end_time\":1541815200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2265', '962', '962', '1', '{\"book_date\":\"2018-11-12\",\"book_info\":[{\"cost\":\"300.00\",\"status\":1,\"room_id\":\"1206\",\"book_id\":\"\",\"user_id\":\"962\",\"room_name\":\"3\\u53f7\\u573a\\u5730\",\"start\":\"08:00\",\"end\":\"10:00\",\"start_time\":1541980800000,\"end_time\":1541988000000,\"state\":0}]}');

-- ----------------------------
-- Table structure for site_picture
-- ----------------------------
DROP TABLE IF EXISTS `site_picture`;
CREATE TABLE `site_picture` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `boss_id` bigint(20) DEFAULT NULL COMMENT 'boss id of site',
  `picture` text COMMENT 'introductive picture name of site',
  `order` int(1) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2596 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_picture
-- ----------------------------
INSERT INTO `site_picture` VALUES ('2548', '956', '4be229016cd3b228f0b6b8985e27cc50.png', '0');
INSERT INTO `site_picture` VALUES ('2549', '956', '957094948dfaca7ca77b950f0e1ee87a.png', '1');
INSERT INTO `site_picture` VALUES ('2550', '956', 'bc808064af7e5681b36d1b7444c10d9f.png', '2');
INSERT INTO `site_picture` VALUES ('2551', '964', 'a86643759a36b3e3692b5c2058e0577e.jpg', '0');
INSERT INTO `site_picture` VALUES ('2552', '964', '037a1baeedd4834c3ec960048337dca3.jpg', '1');
INSERT INTO `site_picture` VALUES ('2553', '968', '15399d22cd5bd7ee83061871e14cac04.jpg', '0');
INSERT INTO `site_picture` VALUES ('2554', '967', '196defc98d3556c295fa3eabf3905773.jpg', '0');
INSERT INTO `site_picture` VALUES ('2573', '963', '76c7dd769b6f4d4b63a8655701d13717.jpg', '1');
INSERT INTO `site_picture` VALUES ('2574', '963', '13f20b84a1f836f4989c64aeba2fddca.jpg', '2');
INSERT INTO `site_picture` VALUES ('2575', '963', '8b4749a18fa362855e9efe08d14cdd1b.jpg', '0');
INSERT INTO `site_picture` VALUES ('2576', '963', 'da4466beb0e61b99c62cab57f559d319.jpg', '6');
INSERT INTO `site_picture` VALUES ('2577', '963', 'e09cf5eb5ed8d65143f7ff26d1b4c5ed.jpg', '7');
INSERT INTO `site_picture` VALUES ('2578', '963', 'ae6feb05fff22bae4d02bd520c9b0803.jpg', '4');
INSERT INTO `site_picture` VALUES ('2579', '963', 'b7a91e5b0983a3ab6f6c31d2675ce636.jpg', '3');
INSERT INTO `site_picture` VALUES ('2580', '963', '4471dd8d0871ca6c735174ee62c796ab.jpg', '5');
INSERT INTO `site_picture` VALUES ('2593', '962', '2a0a09821d862fa9cd89a97a1092377d.jpg', '0');
INSERT INTO `site_picture` VALUES ('2595', '961', 'b92a023079718780a5d2d1349460035f.jpg', '0');

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_type` int(2) DEFAULT NULL COMMENT 'boss id of site',
  `event_type_id` int(5) DEFAULT NULL,
  `content` text COMMENT 'introductive picture name of site',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('1', '0', '1', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('2', '0', '2', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('3', '0', '3', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('4', '0', '4', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('5', '0', '5', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('6', '0', '6', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('7', '0', '7', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('8', '0', '8', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('9', '0', '9', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('10', '0', '10', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('11', '0', '11', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('12', '0', '12', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('13', '0', '13', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('14', '0', '14', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('15', '0', '15', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('16', '0', '16', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('17', '0', '17', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('18', '0', '18', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('19', '0', '19', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('20', '0', '20', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('21', '0', '21', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('22', '0', '22', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('23', '0', '23', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('24', '0', '24', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('25', '0', '25', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('26', '0', '26', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('27', '0', '27', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('28', '0', '28', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('29', '0', '29', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('30', '0', '30', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('31', '0', '31', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('32', '0', '32', '哈尔滨工程大学篮球馆位于南通大街145号，是一所联营的球场，场地地板为美国进口地板，不伤膝盖，非常适合打球。曾经举办过哈尔滨市篮球比赛。');
INSERT INTO `template` VALUES ('33', '1', '1', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('34', '1', '2', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('35', '1', '3', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('36', '1', '4', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('37', '1', '5', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('38', '1', '6', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('39', '1', '7', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('40', '1', '8', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('41', '1', '9', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('42', '1', '10', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('43', '1', '11', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('44', '1', '12', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('45', '1', '13', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('46', '1', '14', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('47', '1', '15', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('48', '1', '16', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('49', '1', '17', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('50', '1', '18', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('51', '1', '19', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('52', '1', '20', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('53', '1', '21', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('54', '1', '22', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('55', '1', '23', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('56', '1', '24', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('57', '1', '25', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('58', '1', '26', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('59', '1', '27', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('60', '1', '28', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('61', '1', '29', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('62', '1', '30', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('63', '1', '31', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('64', '1', '32', '【营业时间】\n【服务类型】\n【食品饮料】\n');
INSERT INTO `template` VALUES ('65', '2', '1', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('66', '2', '2', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('67', '2', '3', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('68', '2', '4', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('69', '2', '5', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('70', '2', '6', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('71', '2', '7', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('72', '2', '8', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('73', '2', '9', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('74', '2', '10', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('75', '2', '11', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('76', '2', '12', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('77', '2', '13', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('78', '2', '14', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('79', '2', '15', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('80', '2', '16', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('81', '2', '17', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('82', '2', '18', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('83', '2', '19', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('84', '2', '20', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('85', '2', '21', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('86', '2', '22', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('87', '2', '23', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('88', '2', '24', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('89', '2', '25', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('90', '2', '26', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('91', '2', '27', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('92', '2', '28', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('93', '2', '29', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('94', '2', '30', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('95', '2', '31', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】');
INSERT INTO `template` VALUES ('96', '2', '32', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】\n');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL COMMENT 'avatar name of user',
  `nickname` varchar(20) DEFAULT '' COMMENT 'nickname of user in wechat',
  `name` varchar(20) DEFAULT '' COMMENT 'real name of user',
  `role` tinyint(2) DEFAULT '0' COMMENT 'role of user',
  `state` tinyint(2) DEFAULT '0' COMMENT 'state of passing sign up',
  `gender` int(2) DEFAULT '0',
  `phone` varchar(15) DEFAULT '' COMMENT 'phone number of user',
  `show_state` int(2) DEFAULT '0',
  `sport_type` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT '0',
  `person_sign` varchar(256) DEFAULT '',
  `shared_count` int(10) DEFAULT '0',
  `id_no` varchar(30) DEFAULT NULL,
  `id_pic1` varchar(30) DEFAULT NULL,
  `id_pic2` varchar(30) DEFAULT NULL,
  `honey` int(10) DEFAULT '0' COMMENT 'amount of honey which user have',
  `reg_time` datetime DEFAULT NULL COMMENT 'sign up time of user',
  `forbidden` tinyint(2) DEFAULT '0' COMMENT 'forbidden state',
  `open_id` varchar(50) DEFAULT NULL,
  `todayfirst` int(11) DEFAULT '0',
  `session_key` varchar(50) DEFAULT '',
  `daily_honey` varchar(50) DEFAULT '[0,0]',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', null, '', '', '1', '1', '1', '18846140510', '0', '3,5,6', '20', null, '0', null, null, null, '2753', '2018-09-23 21:04:33', '0', null, '26', '', '[0,0]');
INSERT INTO `user` VALUES ('956', 'https://wx.qlogo.cn/mmopen/vi_32/lnicx9Gwd7jjuVtDp0eMWFFUiaTWMrNyPdmibWS8n84fibxK3c7hom7wsJ5wcNqpePKico6JicAVSHOkRB7h7MPWmfrg/132', 'adrian', '你好', '1', '2', '0', '13384255905', '0', '10,0,2', '30', '我的', '0', null, null, null, '257', '2018-11-02 11:50:22', '0', 'oMH3D5DjR7NT_QQD1FAsbN3w0lK4', '9', '', '[0,30]');
INSERT INTO `user` VALUES ('959', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIS2PfgBfiaibqcLvaiaicyIDSp9lJDeeMcAOdzjO73m9rX5KWyfEwZuOoTaoafURiccIxcQ/132', '公孙胜', '公孙胜', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-01 20:34:49', '0', 'oMH3D5HcjU3cEkoUqVa3GmnpceG0', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('960', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJuxeuRKHC9LanZMiayoJQ0KG3o6icOAhj3MN4v0rf7aHnOicgE1wPcnBW7KcGBiayeHVChpCqSDf6iaRw/132', '董平', '董平', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-01 20:36:16', '0', 'oMH3D5OV3cBADSu3KCteIjrJeefE', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('961', 'https://wx.qlogo.cn/mmopen/vi_32/LCtAfCKVQfKUWhbVQicuXfsaU1pCa5LvXGPZ2T2o1jiaBiaRJicKOHibnJaVAv3ibPVwrjZ7v1c0tgWRDKuT0vLBIXHw/132', '高富志', '噶是', '1', '2', '0', '18641502372', '0', '0,1', '18', '这是你', '0', null, null, null, '21651', '2018-11-01 22:07:10', '0', 'oMH3D5A80NRBLcizdY3ALWMoKEhA', '11', '', '[0,2510]');
INSERT INTO `user` VALUES ('962', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISMS5EOf3z4RrJmItptJpbQxkNySeGzhFxKLD1KAD7lMpXfZehFLBLr00iawOpMWGVu1mnBVIoFUA/132', '青石', '刘延龙', '1', '2', '0', '18846140810', '0', null, '0', '', '0', null, null, null, '23725', '2018-11-06 07:29:00', '0', 'oMH3D5IYmW7nLzra0OuJ2C_yY8DI', '13', '', '[0,0]');
INSERT INTO `user` VALUES ('963', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoOCMicuYx93gW3WxIdkibssW2hXI80t9zU5Lr27AjV8cQCvwK8iaAIhiawqhl3VCJergwviaIS4NHZ4icA/132', 'Y。Y', '杨毅', '1', '2', '0', '18846046148', '0', null, '0', '', '0', null, null, null, '22847', '2018-11-02 21:50:06', '0', 'oMH3D5DA6kNCVNuWP_Na5e4zH2wE', '12', '', '[0,7124]');
INSERT INTO `user` VALUES ('964', 'https://wx.qlogo.cn/mmopen/vi_32/0jbPhPmB3uXkQBaiaBskYFbwTAyI9lrSWOTrgAWibFUhu5p7A9mYOW247uGgBdIvTlZkAkWBXVpYnoFUibo64MtUQ/132', '化龙', '闫化龙', '1', '2', '0', '17603602906', '0', null, '0', '', '0', null, null, null, '28035', '2018-11-02 17:55:26', '0', 'oMH3D5GXHzJJ-gUVQaqgW7H_3DIU', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('965', 'https://wx.qlogo.cn/mmopen/vi_32/ib7ymR5sdB4ETAzTnsXErmfDZDIXiaXliaBjmA1xHG7jVOZtmukyYh51tSggDuyETJ5cTP8jpGyrctAhwN9LaicHaA/132', '立一默', '小黄蜂', '2', '2', '1', '18846140510', '0', '6,22', '25', '', '0', null, null, null, '19611', '2018-11-02 07:48:33', '0', 'oMH3D5EDsoa0wKd6f3thTyT_X76Y', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('966', 'https://wx.qlogo.cn/mmopen/vi_32/XAxTcGFpib3oKzIeokEe5JRmGmxD0UZKib1mR2OIQmf0Hd96b6ta3Rs9gypPMDQb5DzFeo69sYHNeeiajTTvWK6dw/132', '张星', '张星', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-02 08:30:48', '0', 'oMH3D5IJ94CmUBQ4iyQqMS89I-1I', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('967', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK2AXeKBY0iatMdtrQgKgMhFBfKXZ7BnrATEVJeOKYQBC8aia0GCMlnY6lIhE16RRGYlicEP4ibC1mibcQ/132', 'Yang Dq', '杨德全', '1', '2', '0', '18846079302', '0', null, '0', '', '0', null, null, null, '39335', '2018-11-02 17:59:10', '0', 'oMH3D5Cz5MdobK228P4qD-QWMf60', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('968', 'https://wx.qlogo.cn/mmopen/vi_32/N8M1CGTicRctK5dP0nZM99g0QiaBPFiccIkVyuxibfFMws8UzODsmkIMPBuL1gicoDvDJnZFiaU8ribWdrRwYqDeAnrkQ/132', '@ _  @', '舒瑶', '1', '2', '0', '17745165119', '0', null, '0', '', '0', null, null, null, '30808', '2018-11-02 18:03:41', '0', 'oMH3D5NW6Vg2DQEw_X0nU4ur0q5M', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('969', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIR4uQkm666sbeyIsvLJfWQKSVkuG5aYVhccaWQH5YsyGNtrvlMjicHdIsicsOwMYmsxQ/132', '呼延灼', '呼延灼', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-02 12:47:51', '0', 'oMH3D5Cos3AWXRcn1Ef3nbCJSkMc', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('970', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erJEqa95HvFXHsIf24NAUwSibPsdlLDrYwVfzxkaLdIjibvTcoLcSE5RMNne5sY7lXyd3ctOiaTKva5Q/132', '赵春恩', '', '2', '2', '0', '15645133992', '0', null, '0', '', '0', null, null, null, '9236', '2018-11-02 14:26:02', '0', 'oMH3D5DHC2q5hGFQwqGthmvvsfyg', '2', '', '[0,9236]');
INSERT INTO `user` VALUES ('971', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKprgQnx5VG9IkgecnZ2QIFOE42Tn5gI4gic73UI3GkvLlC2w8nXembrM8kzaNfXyC6JBUOpNPQJYA/132', '南宫封遥', '南宫封遥', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-02 20:10:51', '0', 'oMH3D5KgCINgGu9rsHMXwLmVNJnQ', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('972', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erKAdzDhXia4SnzdjmteAsD5fhVgeiaCI0JYBs4XDMSdpINSibVB8icXFib0zO52zhYvO0qR1VAZwiaXJKg/132', '木槿', '木槿', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:07:15', '0', 'oMH3D5DPrJCtCwUEICrmRujLT5Ug', '3', '', '[0,0]');
INSERT INTO `user` VALUES ('973', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOxZwnsfSckrewiayRLR0wBReqVQ5RGaucJ4DepIwNpgRJTHf2xSyTOKR20R238ZvZDFwkxmYHISQ/132', '劉慶偉', '劉慶偉', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '20584', '2018-11-03 09:07:15', '0', 'oMH3D5KhzZz2qr_83LviZEq9J-eI', '3', '', '[0,20584]');
INSERT INTO `user` VALUES ('974', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKuql41lPj0mw7fIp1W88m9Sb99qDWHs0jC3LLmMtiaGZxqe0FAGHpF0tXiafMWymAV21RPu0FIqq2g/132', '悦', '悦', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '8812', '2018-11-03 09:08:04', '0', 'oMH3D5Pva5b3aFiGBzV2A0i6aQq4', '3', '', '[0,8812]');
INSERT INTO `user` VALUES ('975', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ7UOoqZrdTXibicgicwD4YibL0Ao4DVHrnwUficzquFckh8AlLF9eRkPibeic0wCXUz0J9YrAeyOEs4CGVw/132', '气泡下面的汽水', '气泡下面的汽水', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:08:13', '0', 'oMH3D5IelR1axe9CLvxyhB77jYZY', '3', '', '[0,0]');
INSERT INTO `user` VALUES ('976', 'https://wx.qlogo.cn/mmopen/vi_32/yT6gPj1gGx1FTDYxKmib5umnb0Ox1BiaUT33bibKkVEkALEbpISia75lhXRzIxtXdNdmCjictzmJXiaMgwyZicbc4c86w/132', '西西里贝儿', '西西里贝儿', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:08:45', '0', 'oMH3D5J8BxsUfVEjRMJT39e74kHo', '5', '', '[0,0]');
INSERT INTO `user` VALUES ('977', 'https://wx.qlogo.cn/mmopen/vi_32/197ftmjibGJkAbaxVTTjhlhDT0WfpQRP68hPtA4XTXkBGyDdZggz4ZNoNggWoOf9slCCkvTlK69iaqCPHhuY5iaqA/132', '初心', '初心', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:09:13', '0', 'oMH3D5Iy8LVTf7DTEmH_BjvGZxh4', '3', '', '[0,0]');
INSERT INTO `user` VALUES ('978', 'https://wx.qlogo.cn/mmopen/vi_32/Q6B4ZCz9tIu1J0PRuwbtiauE2icibsMgOiaFFyq9PRbHJmLlxuicL6PSCsb7RG3gItleWTMzKBZaxicolr4n76EI4Czw/132', '低城', '低城', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:10:39', '0', 'oMH3D5HLCO0IUL6rfr9coXwGwZ38', '4', '', '[0,0]');
INSERT INTO `user` VALUES ('979', 'https://wx.qlogo.cn/mmopen/vi_32/MS1SWltnJElew3FY51AG3HQVjPwM23U8zdwQCaUDUOnfrN2iawuyPnPfen7xRAVeTmH5HYLlrRTMFk8LzOqo2Ew/132', 'Dingding', 'Dingding', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:11:27', '0', 'oMH3D5JmE5thd44-9d_boAIyFyR0', '3', '', '[0,0]');
INSERT INTO `user` VALUES ('980', 'https://wx.qlogo.cn/mmopen/vi_32/F53lxMgiaXMJ5icJojmm3k7wb21sHXc3ydsS1ELZMgU4tunsWMr0waibB9h6P28gSduuK6fQQYjTEAWfI6N6icw8ibw/132', '叫我uncle 李', '叫我uncle 李', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:13:59', '0', 'oMH3D5CueZiLFgsyhb6k9SMgaMUg', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('981', 'https://wx.qlogo.cn/mmopen/vi_32/UWxB5icibIOOgG3jp9P7cP5DSPqEHvHicBkNicQbYxI44UZXsrT5crOsicvTrmQLNOmA96y34ib7uFcfZeNpXhxb8ICQ/132', '少年', '少年', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:14:47', '0', 'oMH3D5Bsrw0uB0XRHAOYj4ulVd7Q', '3', '', '[0,0]');
INSERT INTO `user` VALUES ('982', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erN340w73icrhl00bOPswiaYpux7wFuKjO9K3WJ8iaDl6RlScR7SzAcQSDVJZoQ0GDbZ0NgGrnf89UAA/132', '长安', '长安', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 09:14:58', '0', 'oMH3D5NUZfFem_kiNR3OUOj6tggk', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('983', 'https://wx.qlogo.cn/mmopen/vi_32/Q4uAeNibqiaHSHqjeYicsskTF4lA4YvHzvbz7sjfZZ5Y72z9SMqW8ztEic3eSTtO5xWLA6YhogYAc7OK30IDqvOe1A/132', '浅浅', '浅浅', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-03 23:21:57', '0', 'oMH3D5Cp22i_uEmHZ0mcIFHKbPO0', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('984', 'https://wx.qlogo.cn/mmopen/vi_32/nUYFrDawI8bPgdOkQiayletfC5icP5BVeqW0BtyArIOqsMpIVDt8KNKTzHPPojooewY2ZHBPI5ONPnXbEl3nMdEw/132', '北海。', '北海。', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '21954', '2018-11-03 23:54:05', '0', 'oMH3D5DQyjjsK_jrueBa-BI26ERE', '12', '', '[0,7277]');
INSERT INTO `user` VALUES ('985', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er6ibTlLmxgKHTTKuBrFN3jtBOvOGIDZGD2YEP5hW8AMxAwKnSRGxPcQo6Lew3v93vQUctJslezic3A/132', '水', '水', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '20584', '2018-11-04 15:06:55', '0', 'oMH3D5JTbt5U034HF6V5f_cf8pRU', '9', '', '[0,20584]');
INSERT INTO `user` VALUES ('986', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWHqcx2zIN5cPXMB4G5yVIYViaROMLugpZqMI3GJOKRUsrpo5Sr1nkicHJxmLu98oaHOagMqKegThA/132', '司空浪迹', '司空浪迹', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-04 16:13:05', '0', 'oMH3D5APv5E0G5pb1nm5xGTOjanw', '4', '', '[0,0]');
INSERT INTO `user` VALUES ('987', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLSEtGul3OLHRxSRShicN5cxPyzjl9Z9P7ZuagQeGJrGpPeDQeGBoOwraAdIWnicqwZaUXBHYvQ62OA/132', '赢鼎君', '赢鼎君', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-04 16:13:10', '0', 'oMH3D5BTPliz5EUesD6MkvV5cJwg', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('988', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoia6X5XWdSA5kziaA0uOa2xKWt83lIDZib16dNloRla94wliaSNTrYxib375lqmxjb1Co2wAiaWvgwl5Og/132', '黑土杰作', '黑土杰作', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '5315', '2018-11-04 16:13:11', '0', 'oMH3D5D7RqStBirmwOfzRlDAcIHs', '4', '', '[0,5315]');
INSERT INTO `user` VALUES ('989', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyNOEic1I3QM9dNG1llTcCibHiaQmSA0icc25piaACk6ArqLBlr4hkbmxDUiafqAGasib0TNM2PGKnTibwyQ/132', '行者无疆', '行者无疆', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-04 16:13:14', '0', 'oMH3D5Bj_q3pFFJna1gbcqNjn1ZU', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('990', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erlgh5DdWcqJrlg9n5kdwicmGmRh5s8DfAWXpSml7Ra8M3giaqJFfuZhtpKPv7kYWHJEAuf1ZZR3uwg/132', '于剑堃', '于剑堃', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '10288', '2018-11-04 16:13:31', '0', 'oMH3D5GeJ1yxJuzjPEe90SJPN5OM', '4', '', '[0,10288]');
INSERT INTO `user` VALUES ('991', 'https://wx.qlogo.cn/mmopen/vi_32/GN8sA5AThzrPibeib7ibYbbXjpChsjblgianX0DOo534giaEe0B6KG9Xc9KVJOs9oVwB9AYztpbOoiclvHB51XYLOtCg/132', 'A北方民宿 | 专业民宿运营', 'A北方民宿 | 专业民宿运营', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-04 16:15:33', '0', 'oMH3D5Khtc5GRETGydZetBxoG24Q', '4', '', '[0,0]');
INSERT INTO `user` VALUES ('992', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkIicaUBBoyGiazPu6ppcwZlia8YAxTtESe9R6tXBnMkJjjD7W9aUWI9mcqL5WO7nQdfLRXCspcic2uA/132', 'Buffon', 'Buffon', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-04 21:06:08', '0', 'oMH3D5P-GjBmAuvvlAN29H-QJUUE', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('993', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIWe9ibicO4OPYjuOiczCJUUNxtJmH2e7Vq1v2jJEaMRBVFSPAJvKib1XmJB0mpX4GGLdEg/132', '关胜', '关胜', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-05 21:03:59', '0', 'oMH3D5Os19klCLGf1l7AsmWzRuVE', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('994', 'https://wx.qlogo.cn/mmopen/vi_32/XCOqicez7cTfps1wRAqAMWzBicNb5Wd7yiccmGYicHqECEtMVWpNrUtC01uB67d8SEDzZqTaQFgqRHZibZAk252LcpA/132', '李其明', '李其明', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '5265', '2018-11-06 09:31:50', '0', 'oMH3D5ItzDkItEr25Wld8b12YWD4', '6', '', '[0,5265]');
INSERT INTO `user` VALUES ('995', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ereicGE317RHIlGGW1siaFdCe8n9FPWrHqSV5MQicDIr2UOo7HojZSXyCFUM9dluib9U6lUVFnx60HDuA/132', '天马行空', '天马行空', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:25:25', '0', 'oMH3D5JSBfyE3GUsZPIva6va4Fo4', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('996', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeAq6Ew3Q8Pd82a9RebUtCOHy8dmLGbVcr9VxrgFMRS0EicQ7HGs6uxpCB4ss5D5biaSgWvkDk467Q/132', '常亮', '常亮', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:28:18', '0', 'oMH3D5N5Xk6DXwJmv-fDUvl06N4M', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('997', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL6Ty5mKV8OB3WoXGicHnPqia0N8fsWQQ265cGNzJl0Ua9p0gBG7tb99uV85qsSegHiaU5rs5ocfcL1Q/132', '雨石', '雨石', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:36:37', '0', 'oMH3D5JNJurvGQrmA-Fx_4IQ5xHY', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('998', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoBDWashnx1icTvYGqVNXulDLNHvy7pYTlgcNhR7HicPqDBdcPDflfElMrsyxQibb3arMJcnCNVuku2w/132', '', '', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:37:29', '0', 'oMH3D5J_k1KnWux450cTnNJEfPdA', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('999', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGF8EuRWSIqRyibIwfwUCW1tDIrZZy1qL994JMKvFV4VpNvw1Gkxq5lEUtOtr91hbRgicFgsYR5abg/132', '子非鱼', '子非鱼', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:40:11', '0', 'oMH3D5H4M-8VznqdtYSbn7oJqarc', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1000', 'https://wx.qlogo.cn/mmopen/vi_32/ia4mUhwrrGe7NmmdzLOq4kQhsgnibZ0CV6QpFzEK458fZbvaibcwjImBt8bQGGhk69jMR2ibwficrZeicGrp8n98iajicA/132', '马竞是冠军', '马竞是冠军', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 10:47:50', '0', 'oMH3D5JKIqgGx-G5zKHitrGfLkRI', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1001', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoxw6NzjM93akRlkewly2CncicFDFZsZEFr90WDWZB2eePFb9FaQB9xtyttCiaOpDUpPIvIyUcRA9CA/132', 'A.༺麒麟商贸༻', 'A.༺麒麟商贸༻', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 11:00:51', '0', 'oMH3D5C9dMdjqDKtdxrkM2DrKkzY', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('1002', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJZzrPyyR1DusN8YgGlKVEGvibnZnUmrYHsc4pPvWzy7kkt9DSnCnekwOV07icDUxho4MlKuMmOH7Jw/132', '杨', '杨', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 12:59:32', '0', 'oMH3D5Cy8K7BhzlFb5TRPen1m5-s', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1003', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJxvTt7U999zcbatufLGkJB8dXIDnDibYicUEgK4sptcABiayDWsRwepgKQ6zkZpwXzevv3MzmkWPibVg/132', '哈尔滨兄弟足球专业装备立峰', '哈尔滨兄弟足球专业装备立峰', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 13:00:47', '0', 'oMH3D5CdYYFam6V6URoIvmisDh9I', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1004', 'https://wx.qlogo.cn/mmopen/vi_32/JsTl27nENOvmOejN1oFQCO9xf1liacnJDARmV9HaB0HYpDrEXhduhaIXhKjWlgEacvrsILPzUf1ZwYhvQskQ39g/132', '罗纳尔多', '罗纳尔多', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 13:03:28', '0', 'oMH3D5E8Wg5DnnBReCBejvWQu-PI', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1005', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eprABHDfSWrm3wXHbmGU6MtervMu18icvgSvXBXA0vTo4kZenFNib1MDibDbTJEynsjvm0P46nHNictZQ/132', '银河保卫', '银河保卫', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 13:08:56', '0', 'oMH3D5Ba0mKXyhcTWQ5o77sCCh8g', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1006', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKHtibL2UPmZqnVH1EWNk7IraUV1YsNUz26sX3ctLfbfOzVFeoQ8BEYoG2GkEfVrdWIA1Mib0xiaP9mg/132', '謸氕づ_軒', '謸氕づ_軒', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 13:10:45', '0', 'oMH3D5PiCLi0-M7sAP-kwvRxgm4M', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('1007', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83equ1BiapyUiaZp8nosxatbkTrlouHBic0ia8D4fHLAsYMAaoMUibY3oVJxde3lVVoT9GyoVicUxaGO7RpibA/132', '格式化ღ生活', '格式化ღ生活', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 13:14:04', '0', 'oMH3D5O71xcASDWGyihlt9mZ-6_A', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1008', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erq2aZfqFqDyddtN6kh9gsfrBM7ZJtr5C2BbZ4ABDw5EqFDUfiaXFCFrRciaOGib5QBkYgCy0U9uRWVQ/132', 'LIN', 'LIN', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 14:39:24', '0', 'oMH3D5MRgYUmqF_JdiXN3Az1vLl8', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('1009', 'https://wx.qlogo.cn/mmopen/vi_32/E2mJYZx7dz2008FfNickeDaHSloBLGLjyicd0ibFHicjibQVa5ulh1nweuaK8uSd9IdImfeOqa5FfviamSibY5Sib7GxAQ/132', '小新', '小新', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 14:44:22', '0', 'oMH3D5FMX2zAkZInoJkOisg-0BvE', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1010', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erq2aZfqFqDyfRpTGo0ib94h5FRuX2JuRxqTm1Ouuvicm7u4kA1T9HvDGCpUPPFtLehrh0xkg3W7OSg/132', '飞翔的时代', '飞翔的时代', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 17:55:52', '0', 'oMH3D5IwT_Bb1cu8eFHpHkdTkNlw', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('1011', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKBrqTKvvrFicnAxibgHxrcADg1PcicPKQ7e8IJRwaoMb6mP3rXnCibfJcAqL7mjicHmEU0pvVbKWV6VOw/132', '遇见', '遇见', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-06 20:43:41', '0', 'oMH3D5IsHaWp0_lyxvrrvzYM5wOY', '6', '', '[0,0]');
INSERT INTO `user` VALUES ('1012', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epP0aHseGFYtLiaOHLk8Sxiciciaic7n7haicl308Fbkib7IoicPIj6orQuHB9IkVJzLxLxnGRP6eqfibwKXIA/132', '', '郝爱红', '1', '2', '0', '18145633907', '0', null, '0', '', '0', null, null, null, '0', '2018-11-11 08:43:43', '0', 'oMH3D5Pe6e0lypqGvzAVWmB_GLfs', '11', '', '[0,0]');
INSERT INTO `user` VALUES ('1013', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGGD874aayI2Az5oMga0A4B0NG1WeFYbA2tHyIBupJ0PaMa6rUMVrM1jugzK37hXKqOfmHZGPribQ/132', 'Tony健军82号', 'Tony健军82号', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 07:54:49', '0', 'oMH3D5FdfvVkKkWBsPirY9Ul2Yuk', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1014', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep0ApGJkhXsicoSzcrYSQ7bVfV7lFcKmfImk2vz1GWdJdFm5Eib5iaWppzlmGRGlInyBoESnNLKUIUOw/132', '坚持', '坚持', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 07:56:15', '0', 'oMH3D5ITYwppkwDJXk8S5jpe3LWs', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1015', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqkdiawP7gb95OtxDIXtMS3jFicCbGGMoR2QVrVBC5cTicOrOnrp75TSpHqJVb9t9CfjJ3t3MiaRXUSbw/132', 'Mr 何某某', 'Mr 何某某', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:01:38', '0', 'oMH3D5N547StBjNYQHX5q1p0W_FI', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1016', 'https://wx.qlogo.cn/mmopen/vi_32/0QNnCo92HCkWZXyhZqccia9Cu5yIHh3AYJCMLSDh0SMp7ic2U5Y10oUdF2wnRENVrYzAUIDCJBA0QE42Lia8Fmcew/132', 'liberal ', 'liberal ', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:02:34', '0', 'oMH3D5LTZkeqjY0uBO03hr_AZzeI', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1017', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOemNWDXXEkVpU1FDQBPJgibk7H2fD04ol3TzCsNPj8Wa1ZfCu5tLnWY7X9zbEgjnMTSQMO6hmvmw/132', '10', '10', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:03:10', '0', 'oMH3D5FIm6UfMLrQjmMWilMnNADs', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1018', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMkN5ibbichvhP2IKuenoPPlttOyYEQbIbo2rg8ZJlfoXvADSBP2HgKyuspl2iaQh4ZPP4mO6teiaLqQ/132', '李直', '李直', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:04:55', '0', 'oMH3D5JTHOzaL8aTH8HXM47kOVag', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1019', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoqADf5wm0An2iaZ96AqxFXOZdwPr6qhY19Sp8cfLmpD1grEsSH0HiaHuyTTN8fv1az2O7aoxgMwiakw/132', '张琦Titan', '张琦Titan', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:06:13', '0', 'oMH3D5ONlrBIO6NcMgVcP41pTuF0', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1020', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq9TJlIBPxDOPtMXMKEiaClXe55QH0ba1Xe70zyiask1yn2QPs6sbfKNER76zCzSBjHG4NBHlE5f7sQ/132', 'carrasco', 'carrasco', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:07:21', '0', 'oMH3D5OEtGv4Bl9KEQ-6xLyUTKZI', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1021', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqUQvkXyrIhnmQfSYgsiaKRHja790AqfEhiblBGCcWWB7Pu17R7PEowibIwggnNOyBH7ayPX0tdHtSkg/132', '李怀岩', '李怀岩', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:08:29', '0', 'oMH3D5EWwhGX5O6_tLMPxePczIfA', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1022', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIlZoPic2xYOmfVfaE6SBmic3Fkfughye6iaia93nrXSiceO0WNKtYDhNTTemR5khOaibhpV2rhwBQeAqpg/132', 'A千恩五金17766510010千恩靓号', 'A千恩五金17766510010千恩靓号', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:09:52', '0', 'oMH3D5Mqdzb65f-Q8D7rLmVSVoSY', '11', '', '[0,0]');
INSERT INTO `user` VALUES ('1023', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eojfyxYxhiaVqMVVeSZWnqicFsEsXq9jjVwicX5FIYqWWEZLHbgxgud6XicIMNeIbvNia22pQCpRoPpk4g/132', '陈', '陈', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:18:14', '0', 'oMH3D5DaTbWnprPlbZgW7tQjr9Es', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1024', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKUibRYVae485bSibA3vG9VqQWtcc01S4icfmbCOTjGRbDuC9pCIwsJVoXT3v1ozbelHotvBwgqydP8w/132', 'NY的味道', 'NY的味道', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:19:11', '0', 'oMH3D5P1GzgYuU_TPz304ka1-m2I', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1025', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKPiayvKUhCibSQIkkRtbB4dT2FaIxbfs7lXA9WsI8do4kaNECW8pK4wo6iaL3pYfRC1vLIicWAUGb6kg/132', '財子', '財子', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 08:29:47', '0', 'oMH3D5JzVC6yRXBHdZWQJiwiAPDA', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1026', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIBFqG8ZS9Bbnk3vqkJAiaUbSc9iaZy0MauN4pRudlfhzl2zSekyuIh1w5pa9qlk80sT5ICRicmLDdKw/132', '迭戈', '迭戈', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 09:40:50', '0', 'oMH3D5Gibyfv1Lz5uQeiviOL1bYI', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1027', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0OUJicXE9EicbiaibLickznwRDGPDtQuQzd4BnT7E2u8ZicCYr6qA7yr6y9umick8zwicWPwkib0hAK0amLg/132', '', '', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:00:19', '0', 'oMH3D5GMnMJzgXbF2fsrMaOxWt90', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1028', 'https://wx.qlogo.cn/mmopen/vi_32/aKIdKFRCicsbRtExzF4XzTFFxdK2FqHblsccGhjItlkibBd2Yz68RGlwJCt9N5ibGBMh1JUWKYn6NZQ4Tgt13JedA/132', '晗哥', '晗哥', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:01:08', '0', 'oMH3D5Lcy_ef3U5YgzI9K38B3nF8', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1029', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqU3YqAKTAQtCnjaHIT3H1ekFNfrGQDsEQlmKXUOkAgw6IYbPrexyQIxPxCiaWdu7ynnlnyJXibm7MA/132', '✨邢潇洒✨', '✨邢潇洒✨', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:01:43', '0', 'oMH3D5Hq-IIZwtx4LV6nUGpVB24A', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1030', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKgMia2L0O2TO152piaUxOnicZzHtkibbv9jyyOK1kyrDBciclThiccFiaRHsQZn6iaCbVDxLn8sZiaqhCYzAw/132', '@@@@@@@', '@@@@@@@', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:03:11', '0', 'oMH3D5N3-OoBXZkR5JlYE42_39dA', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1031', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJxkhJGcNRDf5RMqHy0ozz7c9d7kAGuFHL7rfnxUQHATfQP1230H38WJXkqicn6wDWOS4luTYX8k0Q/132', '于明龙', '于明龙', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:08:26', '0', 'oMH3D5F-qZv4APQQSdkQuAyow5Y0', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1032', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIFUqaN1iaSkqgP3JTnyULby2ATo3icSicWucpEprdzvDEYtnticGibrc4Nu83DtOicC1k5cRCE6IxVcTJQ/132', '金波', '金波', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:11:50', '0', 'oMH3D5Mp-hB1wdKhjqNjl9SGTZUM', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1033', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKejH6JZpFognTYnVtpV7NW4NU5TA9wg6IwiaYenh6icjDE7iaCB6oYHs2ice9wPcrpPVEOHEBtA0MJTQ/132', '李宏书', '李宏书', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:11:51', '0', 'oMH3D5Eie6_lsS5-X8fXwpX8_pZc', '10', '', '[0,0]');
INSERT INTO `user` VALUES ('1034', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoH1BQ5LHKyibgib19AdBDZ9puicIubtTae0HdwUrfpTiaXkpYntRkNlMCnuOtO3clhWEBKcBcUvibIOEw/132', '李国宾', '李国宾', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:12:19', '0', 'oMH3D5JxEYEtMsY4A0ELFz_sSWxs', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('1035', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eozN0K2bfFuy0SDsr8wlHpLoQk6qnBLHjOzYY7h6czLhwW4BHZ4uSX88qyibVgsnBCdbuFNJDaZibdA/132', '既为神', '既为神', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:16:25', '0', 'oMH3D5JNrSUgLAysM9kkqU2HvXaQ', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1036', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoHJkAPfDia8zjGsicAiaEG6QCuDiaw5XJgrwiaQ58eXRPPDibmWds5dpk3BxOltIeymibRDtLQTJfoTuU0Q/132', 'xin', 'xin', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:23:57', '0', 'oMH3D5FCcWdOqWjTBYO5Vdf5oWvE', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1037', 'https://wx.qlogo.cn/mmopen/vi_32/raxyW2mzOq9MMyBlpStZSpFyLC682JuYE9H52LgmhFMor5QniaPHk1xuicjovmcYovz2U19Id3MicZu8xLpNTI7zg/132', '梅西笑了', '梅西笑了', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:28:58', '0', 'oMH3D5AAzMYf9KN1Vj83ivQdBsAY', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1038', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBOCRZESIq6Vr8eQ8FLdxnOicVKibCLFSx4zXib2E65fWn1GcugsgHtgBrRQZicVQoRicyLvM1AgFKvXQQ/132', '孔星星', '孔星星', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:30:30', '0', 'oMH3D5Akd0sOZHLNu4thDxg_Nwzo', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('1039', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofr4W1SptUJ5bDRibBia85tCeYTQbgEfUFwGdmJBZjJyarq80UpebmzpuJKr2dghjDsQ6ichDbsavmQ/132', '王伟东', '王伟东', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:33:14', '0', 'oMH3D5MMu-OYagxWSUGUmySQJG0c', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1040', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epKmcaWFVicQtYkSXrUwh1pIEhnyGun1kZ50Dne4FiaFZttiadC8kKZibCHich9B1epAtB3L6b2agSXmAA/132', 'Y℡_大光', 'Y℡_大光', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:38:22', '0', 'oMH3D5BS2y-gf5NXzOhGwcrdvpp0', '11', '', '[0,0]');
INSERT INTO `user` VALUES ('1041', 'https://wx.qlogo.cn/mmopen/vi_32/y4pK6A1BBUlOVpbRXJXQJCXtZjhAHOJiaxNTJqMjqabo8md5ytS25bC8aqMhSJFPhp61KXYHrjuTVicjGJ0H2UzA/132', '瑞熙美业创始人 成万老师', '瑞熙美业创始人 成万老师', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:41:50', '0', 'oMH3D5JkrRaZTT672ig76SknJNmw', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1042', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJBHAIDNduSiaMYLoM0lvTXU8SY9A2PqDIFHjyViaibK3FKuDuetrcrMllGqsPxIAvT0ickbv1mR5y9mA/132', '小涛15546185213', '小涛15546185213', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 13:48:24', '0', 'oMH3D5B5sUDpFiw_mLOieDaRPdwE', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1043', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoWffBBRSAr43YGR1hT1icompOEDpShXfV9G574Zq65qd2LBCzkic8Es4kbTd721YD55yYxmaibAaDEg/132', 'WL', 'WL', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:10:22', '0', 'oMH3D5FFtn3rF2K7H4x_reU7U3rw', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1044', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRWagZygFm0OQBy3elblE5F2zIhtJISJgJmqsBd1aaaeKy2CROWHKZmLuO3fRaecFGQ8FXgaDRicA/132', '费鹏 ≮天佑鹏成≯', '费鹏 ≮天佑鹏成≯', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:16:03', '0', 'oMH3D5EkBpHgycufNpo72LKr3Hiw', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1045', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqCWooDwSBusaCJUWY9g4oO5kWiciaYHGP8VuWemMtWwMT0gADFUwZNt3CawxrLGjG3gcnTK7E8Y2pA/132', '不忘初心', '不忘初心', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:16:12', '0', 'oMH3D5AfYFJUxIww3NJHN6JFWNBo', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1046', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoqOZoXkF3v2pgsxpslcoMF1sjlbFscuqPFxzqRN1WcJKxJAVeKf9qxp36hnNnuRa7nMz57Jxyv9w/132', '李磊', '李磊', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:16:48', '0', 'oMH3D5E1R6kaK_sVc4NffCvO97qY', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1047', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erOudcFHgnVa9lBT2eY0QSr96g6AWjnjQjbmzIK1yjeo27biaibiau0EYMwgaPVQicA8Oib2CBnM8Mcevw/132', '华仔天空', '华仔天空', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:21:35', '0', 'oMH3D5NDhXP3lU0koYAnpJWtH-6k', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1048', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeVGjZVOzhBDLuVchImNt530Eic8BcNPsBNjyDNasZ8a0cBwGp9HbQiabHW41DAOwrzNJ41vib9owaA/132', '佳多宝-爱而思感统训练中心', '佳多宝-爱而思感统训练中心', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 14:39:46', '0', 'oMH3D5MorvuX6qIIOlhJXVhp11-c', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1049', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLuLyoiaXxa02GibNa2byxfkkQaKHHNzCyprS67o93pKR3cA2advyOwBOadyP6LXfRPOX3lHVHUvPsA/132', '悟', '悟', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 15:18:54', '0', 'oMH3D5HrzMS6E7_GLFpXySVRalUw', '8', '', '[0,0]');
INSERT INTO `user` VALUES ('1050', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLhchNRRribD6ibGRzELnY4D2FzFAibnmkUjwbUrNeTq64QZiaJKT1MaOEAbTVVbHbUBvTYOlUehEPsDA/132', '邢全超', '邢全超', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-08 18:44:57', '0', 'oMH3D5A41FFRHJPwUTiKGkmO0yJQ', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1051', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIQfX2sZ9Cm4ibY6PBUZialLbvuEuiaKajYBhUpQJuoQ8jB4G4AbBjchLIiafZtdJ5Ksmibw/132', '鲁智深', '鲁智深', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 07:18:34', '0', 'oMH3D5KUw0VbXmyVc3XNoCeF7C8k', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1052', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLFJA27iczVXtfHEWExlngW7Ticb20yNChDYGcbtsPXiaSjyNtBqCQXFSpJ0ylrYREUSZUZyic2hLrnTQ/132', '孙超', '孙超', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 11:59:16', '0', 'oMH3D5CvbbTrj18fZCzF_T_2kUfk', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1053', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKPdEnYlEFicKp48gEK50kM6Bcgr6XWgoY0ia0VHQck9KrqSj6l0ibr3tFnOaZwBYQZhYWcsAkc1yX4Q/132', '宇峰', '宇峰', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 12:04:59', '0', 'oMH3D5MJKp1WczNRnEHt1lCnR6kU', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1054', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoQyd6GwCeSCYY75ephlNdibCVcNNfhpWkMkrwMRJicVt0Z6Pia8aZxXh6KAxSNnV1gdONWooxRnJ4oQ/132', '陪你淋雨', '陪你淋雨', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 12:05:50', '0', 'oMH3D5Ld0Hz6m3jNxvFXTHTKKlBY', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1055', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIVnIUaaVl9hbOdOlxLF7bgtI4b9hmJjK8n2vxhzh37icKiaDpUmw3nbstSSBpeCu00fg/132', '一阵雨', '一阵雨', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 12:10:39', '0', 'oMH3D5L_NHBz2mXeTpQ42iLLIyC0', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1056', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiblUQYUHD2dmiaaTaibcIBwlTvgVlNy3d6dDxDKRrCIhxTybrr21kbjZiaz0nWJKq5psicMMkzibQCuvA/132', '大广  ^O^风', '大广  ^O^风', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 13:29:54', '0', 'oMH3D5MX8YOETgCvDTlTBr5fDf2w', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1057', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI04QSoOoHBLAcbyj7Gecz0YxIECoyMOiaG7iciaYXnY55gsz5awb3hveDN2SZ7BJlianaWY2Q20elkog/132', '@   *      *      @', '@   *      *      @', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 13:55:37', '0', 'oMH3D5J8U7lcY2ZtkQADv6RWvHFM', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1058', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epvqXG8IR61eYdnT5QicGLCmv6l0CO1FI084Wn6Sa51NUxUicjwTk1kVoDuSGkXfqS5cbEBoMR2ApxA/132', '王洪成', '王洪成', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 14:04:27', '0', 'oMH3D5Iy9Xv3kn7t6jYFXMlajc0k', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1059', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eow6jXTBFAOIAYXIzC65ib2bicYMVjGARTYk3BFibwoPUV3ib1nkQibChmP810EJjXEucWhxJzxndicuObA/132', '大可乐', '大可乐', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 14:29:00', '0', 'oMH3D5PKMynnF_hNfWLCSa5KUjk4', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1060', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQdAtqiaS9GYIZNsQSj0yEYAZpyFgG1BibOfibUVJia0Jq1ZbkqU9M8Vu139N9POv9IQicfEDGXOlxPRw/132', '花荣', '花荣', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 20:10:56', '0', 'oMH3D5HlJNqd6f8CpLLJN0a6MFLA', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1061', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep42QngJYVCfFfsIoyBhcEh5DwVibFZygD1eGXt5X3SlPegGASicUP1W74Q4Ve5pZeTYQrsJ7icmRbHA/132', '༺༬姚磊༬༻', '༺༬姚磊༬༻', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-09 21:18:44', '0', 'oMH3D5GWGWZ_BpT0mR25IhIOOgBA', '9', '', '[0,0]');
INSERT INTO `user` VALUES ('1062', 'https://wx.qlogo.cn/mmopen/vi_32/gk9fd05BbIDL7yaB84nnQFt9nQuIfRKWdmbibaKuJqrv6SibX2J2dyQSgHTK2ofMoA3SYian2Fbe15G87eN1AvW2g/132', '杨勇', '杨勇', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-10 17:23:31', '0', 'oMH3D5I9kUebTh0cgRExU95mDlOM', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1063', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLX8ole5k6gIVFnffkrpc7hVVKSyvap2ZVDgWiadenQAtfuXP2frXRic8uugHEc5DcnqclJibIibnVEmw/132', '李应', '李应', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-11 02:46:12', '0', 'oMH3D5KQ0lgZvmxIxqgBDcJ_Rv9o', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1064', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJuxeuRKHC9LYoOoGgXHzRdfx6GibazYOLI7wurJCzVbicjt7ianHKEAz1nslibz9vCb6d0jmfgllhFpw/132', '张清', '张清', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-11 03:00:31', '0', 'oMH3D5KWJFsTVW_INzOtL0Lun-Yc', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1065', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK6PibiaxEI1EIichApicrKj4uOy5qVibVfvkicNMtxl5h9TR0EqOtFiciaspMurLwu7iaUFOAVW5rcwlWeDtQ/132', '津昊', '津昊', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-11 10:58:20', '0', 'oMH3D5JG_emVc89vxRcfhRsBJWtU', '11', '', '[0,0]');
INSERT INTO `user` VALUES ('1066', 'https://wx.qlogo.cn/mmopen/vi_32/pqWxqdxuL0xauHjvqztTuKmmQcjv87zibWFRw6bDb3icLdketgM7QDOr70yKvF4A53ld51voJ68txYK1tiaiauEKibg/132', '@W', '@W', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-11 21:45:17', '0', 'oMH3D5JswVujO7YMZGiyBRKGEBsk', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1067', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWD0Utnpnv6dnGwBzcb4bc5H5y5eTp5T0rz3WQbgC6qfpIIiagCZ254nTV5TuA9mUUz0iamiaedJHFQ/132', '贺鑫', '贺鑫', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-12 10:40:24', '0', 'oMH3D5MrZo78gHrfLnH5e-wggi2s', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1068', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epsS9sLOg9iah2KG6vWsoOhUDIs9TLyZfA2H1cic0A3DeFr1IDO0Yesgp2FI99yhDw4pP2w1g6JLFQw/132', '王志民18686787056', '王志民18686787056', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-12 14:00:12', '0', 'oMH3D5CRiaUvyhC2socjxI6vOmAw', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('1069', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI5HeSC8CZAaUeZdQKcktaJPonrxXEhgQliczfIicTFIK9IySFahia6EgBMplLxBVgzIDqFtdqoZFXVw/132', '夏大雨（Summer big rain）', '夏大雨（Summer big rain）', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-12 14:05:48', '0', 'oMH3D5JaL62BvT_3qhsChzvUCEso', '12', '', '[0,0]');
INSERT INTO `user` VALUES ('1070', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJUSUdGJFtQolW49Vqbl6ZjTVAH3bibWYXvEImogCnKhxrYhgeglcvtXz4ibyibF9H0svpwq5zL33ialg/132', 'Mr.赵', 'Mr.赵', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-12 14:14:42', '0', 'oMH3D5M3W6k98uLBYsxErp9NHYWI', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1071', 'https://wx.qlogo.cn/mmopen/vi_32/tkTp28Qwv6eia65icgxKkoiaq3EecNEW9sZ0kCic6v3raV6tVHPucnz3hy2PPcDx6ejcksSWqLm9Q7Piao9CcNhZw4A/132', '周新平', '周新平', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-12 15:10:51', '0', 'oMH3D5L6G5NB1hiWdZufnp3nsUqM', '0', '', '[0,0]');
INSERT INTO `user` VALUES ('1072', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erqO12hPwAjKg1MncZPTPfJXIeENictcL1Q2F5CIAVyT4xhvFH8moAjiceTE6X07fhonntO0zxMCEEg/132', '王小囧', '王小囧', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '1143', '2018-11-13 10:42:32', '0', 'oMH3D5PgWyWZZyQGzudDcp535zE0', '13', '', '[0,1143]');
INSERT INTO `user` VALUES ('1073', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX9Dic8tZDyYl7Qlrwicyx7icsRicea2SW00zH4oiaFzC6SkkDOIICibC6ibicciacS5PdZbWGajL3XEaX0TA/132', '刘小龙', '刘小龙', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-11-13 13:18:14', '0', 'oMH3D5ONhzxQDSnqT8iewYAVHgyk', '0', '', '[0,0]');
