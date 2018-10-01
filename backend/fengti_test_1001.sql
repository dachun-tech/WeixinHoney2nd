/*
Navicat MySQL Data Transfer

Source Server         : fengti
Source Server Version : 50173
Source Host           : 39.107.226.107:3306
Source Database       : fengti_test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-10-01 20:16:18
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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accept_address
-- ----------------------------
INSERT INTO `accept_address` VALUES ('191', '946', '舒瑶', '17745165119', '0', '0', '0', '五公寓', '100065', '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_admin
-- ----------------------------
INSERT INTO `alarm_admin` VALUES ('1001', '0', '936', null, '2018-09-14 23:15:37', '0');
INSERT INTO `alarm_admin` VALUES ('1002', '0', '934', null, '2018-09-14 23:19:57', '0');
INSERT INTO `alarm_admin` VALUES ('1003', '0', '938', null, '2018-09-15 00:39:40', '0');
INSERT INTO `alarm_admin` VALUES ('1004', '0', '935', null, '2018-09-15 00:39:42', '0');
INSERT INTO `alarm_admin` VALUES ('1005', '0', '937', null, '2018-09-15 00:56:46', '0');
INSERT INTO `alarm_admin` VALUES ('1006', '0', '940', null, '2018-09-17 10:52:08', '0');
INSERT INTO `alarm_admin` VALUES ('1007', '0', '0', null, '2018-09-17 10:57:03', '0');
INSERT INTO `alarm_admin` VALUES ('1008', '0', '939', null, '2018-09-17 12:13:13', '0');
INSERT INTO `alarm_admin` VALUES ('1009', '0', '0', null, '2018-09-18 10:45:14', '0');
INSERT INTO `alarm_admin` VALUES ('1010', '0', '942', null, '2018-09-18 12:32:16', '0');
INSERT INTO `alarm_admin` VALUES ('1011', '0', '0', null, '2018-09-23 21:04:33', '0');
INSERT INTO `alarm_admin` VALUES ('1012', '0', '946', null, '2018-09-25 09:04:36', '0');
INSERT INTO `alarm_admin` VALUES ('1013', '0', '945', null, '2018-09-25 09:07:57', '0');
INSERT INTO `alarm_admin` VALUES ('1014', '0', '948', null, '2018-09-25 09:14:32', '0');
INSERT INTO `alarm_admin` VALUES ('1015', '0', '947', null, '2018-09-25 10:13:18', '0');
INSERT INTO `alarm_admin` VALUES ('1016', '0', '943', null, '2018-09-25 15:14:26', '0');
INSERT INTO `alarm_admin` VALUES ('1017', '0', '949', null, '2018-09-27 13:55:49', '0');
INSERT INTO `alarm_admin` VALUES ('1018', '0', '950', null, '2018-09-27 20:49:59', '0');
INSERT INTO `alarm_admin` VALUES ('1019', '1', '942', null, '2018-09-29 22:01:05', '0');
INSERT INTO `alarm_admin` VALUES ('1020', '1', '935', null, '2018-10-01 19:50:52', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=3663 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_user
-- ----------------------------
INSERT INTO `alarm_user` VALUES ('2671', '935', '3', '是男是女是', '935', '2018-09-15 00:48:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2670', '935', '6', null, null, '2018-09-15 00:42:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3209', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-27 21:40:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2669', '936', '3', '结束活动', '936', '2018-09-15 00:05:51', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('2683', '935', '3', '是男是女是', '938', '2018-09-16 01:49:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3172', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2676', '935', '3', '是男是女是', '937', '2018-09-16 01:09:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3176', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3175', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3174', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3173', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3170', '939', '3', '喝茶', '939', '2018-09-27 21:10:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3171', '939', '9', '喝茶', '939', '2018-09-27 21:10:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3169', '942', '9', '试一下', '950', '2018-09-27 21:10:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3116', '942', '14', '艺术馆的吃饭场地', '942', '2018-09-27 17:15:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3117', '946', '16', '艺术馆的吃饭场地', '942', '2018-09-27 17:15:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2696', '939', '6', null, null, '2018-09-17 20:38:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2697', '935', '9', '是男是女是', null, '2018-09-17 20:38:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3179', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2700', '935', '3', '拿着手机', '935', '2018-09-18 12:59:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2701', '935', '9', '拿着手机', '935', '2018-09-18 12:59:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2702', '935', '3', '说呢就', '938', '2018-09-18 15:20:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2704', '935', '3', '说呢就', '937', '2018-09-18 23:37:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3200', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:37:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3199', '942', '17', '盟科瑜伽的2号场场地', '939', '2018-09-27 21:34:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3201', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:37:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2708', '942', '3', '这是个测试', '939', '2018-09-19 08:31:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2709', '939', '9', '这是个测试', '942', '2018-09-19 08:31:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2710', '942', '3', '足球', '942', '2018-09-19 08:33:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2711', '942', '9', '足球', '942', '2018-09-19 08:33:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2712', '935', '3', '说呢就', '935', '2018-09-19 08:45:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2713', '935', '9', '说呢就', '935', '2018-09-19 08:45:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2714', '942', '3', '这是个测试', '942', '2018-09-19 21:55:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2715', '942', '9', '这是个测试', '942', '2018-09-19 21:55:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2716', '935', '5', null, null, '2018-09-20 08:49:41', '1', '0', '1053');
INSERT INTO `alarm_user` VALUES ('3202', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:37:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2719', '935', '9', '拿着手机', null, '2018-09-20 08:49:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2720', '942', '5', null, null, '2018-09-21 08:58:50', '1', '0', '1067');
INSERT INTO `alarm_user` VALUES ('3211', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:48:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2722', '935', '0', null, '935', '2018-09-21 09:14:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2723', '942', '3', '第二版测试', '942', '2018-09-21 10:08:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2724', '942', '9', '第二版测试', '942', '2018-09-21 10:08:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2725', '942', '3', '第二版测试', '943', '2018-09-21 10:30:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2726', '943', '9', '第二版测试', '942', '2018-09-21 10:30:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2727', '942', '3', '测试', '942', '2018-09-21 10:42:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2728', '942', '9', '测试', '942', '2018-09-21 10:42:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2729', '939', '20', null, '942', '2018-09-21 10:45:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2730', '942', '20', null, '943', '2018-09-21 10:48:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2731', '942', '20', null, '946', '2018-09-21 10:49:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2732', '942', '20', null, '942', '2018-09-21 10:51:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2733', '942', '3', '测试', '945', '2018-09-21 10:53:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2734', '945', '9', '测试', '942', '2018-09-21 10:53:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2735', '945', '20', null, '942', '2018-09-21 11:24:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2736', '942', '3', '第二版测试', '947', '2018-09-21 11:45:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2737', '947', '9', '第二版测试', '942', '2018-09-21 11:45:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2738', '939', '5', null, null, '2018-09-21 12:44:12', '1', '0', '1064');
INSERT INTO `alarm_user` VALUES ('2739', '942', '5', null, null, '2018-09-21 12:44:12', '1', '0', '1064');
INSERT INTO `alarm_user` VALUES ('2740', '935', '5', null, null, '2018-09-21 13:18:58', '1', '0', '1065');
INSERT INTO `alarm_user` VALUES ('2741', '942', '5', null, null, '2018-09-21 14:07:48', '1', '0', '1068');
INSERT INTO `alarm_user` VALUES ('2742', '943', '5', null, null, '2018-09-21 14:07:48', '1', '0', '1068');
INSERT INTO `alarm_user` VALUES ('2743', '947', '5', null, null, '2018-09-21 14:07:48', '1', '0', '1068');
INSERT INTO `alarm_user` VALUES ('2744', '935', '3', '说呢就', '937', '2018-09-21 21:04:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3210', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:48:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2746', '939', '14', '盟科瑜伽的1个号场', '942', '2018-09-21 21:20:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2747', '942', '16', '盟科瑜伽的1个号场', '942', '2018-09-21 21:20:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2748', '939', '3', '桌游', '939', '2018-09-21 21:31:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2749', '939', '9', '桌游', '939', '2018-09-21 21:31:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2750', '942', '3', '测试', '939', '2018-09-21 21:32:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2751', '939', '9', '测试', '942', '2018-09-21 21:32:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2752', '939', '14', '盟科瑜伽的1个号场', '942', '2018-09-21 21:34:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2753', '942', '16', '盟科瑜伽的1个号场', '942', '2018-09-21 21:34:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2754', '939', '18', '盟科瑜伽2', '942', '2018-09-21 21:34:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2755', '939', '17', '盟科瑜伽2', '942', '2018-09-21 21:34:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2756', '939', '3', '桌游', '942', '2018-09-21 21:35:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2757', '942', '9', '桌游', '939', '2018-09-21 21:35:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2758', '939', '14', '盟科瑜伽的1个号场', '942', '2018-09-21 21:39:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2759', '942', '16', '盟科瑜伽的1个号场', '942', '2018-09-21 21:39:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2760', '939', '18', '盟科瑜伽2', '942', '2018-09-21 21:41:08', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2761', '939', '17', '盟科瑜伽2', '942', '2018-09-21 21:41:08', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2762', '935', '13', '发生过很多风格', '935', '2018-09-22 10:11:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2763', '942', '5', null, null, '2018-09-22 10:34:59', '1', '0', '1069');
INSERT INTO `alarm_user` VALUES ('2764', '945', '5', null, null, '2018-09-22 10:34:59', '1', '0', '1069');
INSERT INTO `alarm_user` VALUES ('2765', '939', '5', null, null, '2018-09-22 10:34:59', '1', '0', '1069');
INSERT INTO `alarm_user` VALUES ('3059', '942', '3', '测试一下', '942', '2018-09-26 16:20:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3058', '942', '9', '测试一下', '942', '2018-09-26 16:05:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3055', '942', '13', '赛事。。。。', '942', '2018-09-26 16:01:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3146', '947', '17', '盟科瑜伽的2号场场地', '939', '2018-09-27 20:43:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3057', '942', '3', '测试一下', '942', '2018-09-26 16:05:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3054', '946', '16', '艺术馆的吃饭场地', '942', '2018-09-26 15:55:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3053', '942', '14', '艺术馆的吃饭场地', '942', '2018-09-26 15:55:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3152', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3153', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3051', '935', '3', '备注和取消活动功能', '938', '2018-09-26 15:28:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3074', '935', '4', '备注和取消活动功能', '938', '2018-09-26 19:55:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3075', '935', '3', '备注和取消活动功能', '938', '2018-09-26 19:55:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3159', '942', '3', '这是个测试', '950', '2018-09-27 21:05:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3072', '935', '3', '备注和取消活动功能', '938', '2018-09-26 18:56:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3070', '935', '4', '备注和取消活动功能', '938', '2018-09-26 18:55:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3113', '943', '4', '我', '942', '2018-09-27 17:11:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3068', '935', '3', '备注和取消活动功能', '938', '2018-09-26 18:55:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3114', '943', '3', '我', '942', '2018-09-27 17:11:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3115', '942', '9', '我', '943', '2018-09-27 17:11:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3067', '935', '4', '备注和取消活动功能', '938', '2018-09-26 18:55:08', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3064', '935', '4', '备注和取消活动功能', '938', '2018-09-26 18:53:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3060', '942', '9', '测试一下', '942', '2018-09-26 16:20:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3061', '942', '3', '天天测试', '942', '2018-09-26 16:22:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3062', '942', '9', '天天测试', '942', '2018-09-26 16:22:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3063', '942', '4', '天天测试', '942', '2018-09-26 16:22:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3154', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3155', '939', '18', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:51:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3156', '942', '17', '盟科瑜伽的2号场场地', '939', '2018-09-27 20:51:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3157', '935', '3', '备注和取消活动功能', '949', '2018-09-27 20:57:49', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3158', '949', '9', '备注和取消活动功能', '935', '2018-09-27 20:57:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3100', '937', '16', 'shehjsjdhdhsjjwj的1号场,2号,3号场场地', '949', '2018-09-27 14:07:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3101', '949', '14', 'shehjsjdhdhsjjwj的2号,3号场,2号场地', '949', '2018-09-27 16:13:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3102', '937', '16', 'shehjsjdhdhsjjwj的2号,3号场,2号场地', '949', '2018-09-27 16:13:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3103', '949', '14', 'shehjsjdhdhsjjwj的3号场,1号场场地', '949', '2018-09-27 16:19:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3104', '937', '16', 'shehjsjdhdhsjjwj的3号场,1号场场地', '949', '2018-09-27 16:19:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3105', '949', '14', 'shehjsjdhdhsjjwj的1号场场地', '949', '2018-09-27 16:41:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3106', '937', '16', 'shehjsjdhdhsjjwj的1号场场地', '949', '2018-09-27 16:41:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3107', '949', '14', 'shehjsjdhdhsjjwj的2号场地', '949', '2018-09-27 16:42:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3108', '937', '16', 'shehjsjdhdhsjjwj的2号场地', '949', '2018-09-27 16:42:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3109', '949', '14', 'shehjsjdhdhsjjwj的1号场场地', '949', '2018-09-27 16:44:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3110', '937', '16', 'shehjsjdhdhsjjwj的1号场场地', '949', '2018-09-27 16:44:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3111', '943', '3', '我', '942', '2018-09-27 17:11:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3112', '942', '9', '我', '943', '2018-09-27 17:11:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3065', '935', '3', '备注和取消活动功能', '938', '2018-09-26 18:55:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3144', '947', '17', '盟科瑜伽的1号场场地', '939', '2018-09-27 20:43:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3093', '945', '13', '赛事。。。。', '945', '2018-09-27 10:59:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3090', '939', '5', null, null, '2018-09-27 09:17:40', '1', '0', '1110');
INSERT INTO `alarm_user` VALUES ('3091', '942', '5', null, null, '2018-09-27 09:17:40', '1', '0', '1110');
INSERT INTO `alarm_user` VALUES ('3092', '940', '5', null, null, '2018-09-27 09:17:40', '0', '0', '1110');
INSERT INTO `alarm_user` VALUES ('3089', '948', '5', null, null, '2018-09-27 09:17:40', '1', '0', '1110');
INSERT INTO `alarm_user` VALUES ('3088', '945', '5', null, null, '2018-09-27 09:17:40', '1', '0', '1110');
INSERT INTO `alarm_user` VALUES ('3234', '939', '17', '艺术馆场馆睡觉场地', '946', '2018-09-28 07:19:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3145', '939', '18', '盟科瑜伽的2号场场地', '947', '2018-09-27 20:43:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3085', '935', '4', '备注和取消活动功能', '938', '2018-09-26 19:57:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3083', '935', '3', '备注和取消活动功能', '938', '2018-09-26 19:57:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3124', '946', '3', '吸猫', '942', '2018-09-27 20:12:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3125', '942', '9', '吸猫', '946', '2018-09-27 20:12:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3081', '935', '3', '说呢就', '938', '2018-09-26 19:56:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3080', '935', '4', '备注和取消活动功能', '938', '2018-09-26 19:56:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3142', '939', '16', '盟科瑜伽的2号场场地', '947', '2018-09-27 20:43:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2830', '935', '3', '说呢就', '937', '2018-09-23 20:04:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3198', '939', '18', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:34:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3195', '942', '17', '盟科瑜伽的2号场场地', '939', '2018-09-27 21:33:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3196', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:34:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3197', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:34:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2837', '935', '9', '发生过很多风格', null, '2018-09-24 07:59:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2838', '942', '3', '测试', '942', '2018-09-24 09:47:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2839', '942', '9', '测试', '942', '2018-09-24 09:47:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3233', '946', '18', '艺术馆场馆睡觉场地', '939', '2018-09-28 07:19:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2841', '939', '14', '盟科瑜伽地方2', '942', '2018-09-24 10:24:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2842', '942', '16', '盟科瑜伽地方2', '942', '2018-09-24 10:24:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2843', '942', '3', '测试', '942', '2018-09-24 12:23:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2844', '942', '9', '测试', '942', '2018-09-24 12:23:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2845', '939', '4', '桌游', '942', '2018-09-24 12:34:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2846', '942', '8', '桌游', null, '2018-09-24 12:34:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2847', '939', '4', '桌游', '942', '2018-09-24 12:34:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2848', '942', '8', '桌游', null, '2018-09-24 12:34:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2849', '942', '5', null, null, '2018-09-24 14:38:25', '1', '0', '1099');
INSERT INTO `alarm_user` VALUES ('2850', '939', '9', '桌游', null, '2018-09-24 17:29:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2851', '942', '13', '这是场比赛', '942', '2018-09-24 18:42:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3184', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:25:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3127', '943', '3', '我', '942', '2018-09-27 20:12:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3128', '942', '9', '我', '943', '2018-09-27 20:12:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3129', '939', '3', '喝茶', '942', '2018-09-27 20:16:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3130', '942', '9', '喝茶', '939', '2018-09-27 20:16:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3131', '939', '3', '喝茶', '947', '2018-09-27 20:42:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3132', '947', '9', '喝茶', '939', '2018-09-27 20:42:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3133', '943', '20', null, '945', '2018-09-27 20:42:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3134', '943', '19', null, '945', '2018-09-27 20:42:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3135', '943', '20', null, '945', '2018-09-27 20:42:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3136', '943', '20', null, '945', '2018-09-27 20:42:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3137', '943', '20', null, '945', '2018-09-27 20:42:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3138', '943', '20', null, '945', '2018-09-27 20:42:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3139', '947', '14', '盟科瑜伽的1号场场地', '947', '2018-09-27 20:42:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2860', '946', '13', '小丸子跑步', '946', '2018-09-25 09:07:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2861', '946', '6', null, null, '2018-09-25 09:10:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2862', '942', '3', '这是个测试', '945', '2018-09-25 09:12:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2863', '945', '9', '这是个测试', '942', '2018-09-25 09:12:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2864', '945', '3', '健身', '945', '2018-09-25 09:12:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2865', '945', '9', '健身', '945', '2018-09-25 09:12:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2866', '945', '13', '哈佳铁路', '945', '2018-09-25 09:16:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2867', '942', '3', '这是个测试', '948', '2018-09-25 09:16:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2868', '948', '9', '这是个测试', '942', '2018-09-25 09:16:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2869', '945', '14', '盟科瑜伽地方2', '945', '2018-09-25 09:17:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2870', '945', '16', '盟科瑜伽地方2', '945', '2018-09-25 09:17:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2871', '945', '3', '健身', '948', '2018-09-25 09:23:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2872', '948', '9', '健身', '945', '2018-09-25 09:23:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2873', '942', '13', '这是个测试赛事活动比', '942', '2018-09-25 09:27:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2874', '945', '3', '健身', '946', '2018-09-25 09:29:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2875', '946', '9', '健身', '945', '2018-09-25 09:29:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2876', '948', '20', null, '942', '2018-09-25 09:31:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2877', '945', '3', '健身', '942', '2018-09-25 09:31:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2878', '942', '9', '健身', '945', '2018-09-25 09:31:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2879', '0', '12', '这是个测试赛事活动比', '942', '2018-09-25 09:35:04', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('2880', '942', '14', '艺术馆地方吃饭', '942', '2018-09-25 09:55:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2881', '942', '16', '艺术馆地方吃饭', '942', '2018-09-25 09:55:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2882', '945', '3', '健身', '947', '2018-09-25 10:18:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2883', '947', '9', '健身', '945', '2018-09-25 10:18:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2884', '939', '3', '桌游', '947', '2018-09-25 10:20:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2885', '947', '9', '桌游', '939', '2018-09-25 10:20:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2886', '947', '3', '健身房打卡——今日练背', '942', '2018-09-25 10:25:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2887', '942', '9', '健身房打卡——今日练背', '947', '2018-09-25 10:25:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2888', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2889', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2890', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2891', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2892', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2893', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2894', '939', '20', null, '947', '2018-09-25 10:27:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2895', '939', '20', null, '947', '2018-09-25 10:27:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3120', '946', '3', '吸猫', '946', '2018-09-27 18:58:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3121', '946', '9', '吸猫', '946', '2018-09-27 18:58:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3122', '946', '3', '吸猫', '939', '2018-09-27 19:02:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2899', '942', '3', '测试', '947', '2018-09-25 10:31:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2900', '947', '9', '测试', '942', '2018-09-25 10:31:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2901', '942', '20', null, '947', '2018-09-25 10:34:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2902', '942', '14', '艺术馆地方吃饭', '942', '2018-09-25 10:37:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2903', '942', '16', '艺术馆地方吃饭', '942', '2018-09-25 10:37:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2904', '942', '14', '艺术馆地方吃饭', '942', '2018-09-25 10:38:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2905', '942', '16', '艺术馆地方吃饭', '942', '2018-09-25 10:38:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2906', '947', '14', '盟科瑜伽地方2', '947', '2018-09-25 10:41:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2907', '947', '16', '盟科瑜伽地方2', '947', '2018-09-25 10:41:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2908', '942', '3', '测试', '942', '2018-09-25 10:58:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2909', '942', '9', '测试', '942', '2018-09-25 10:58:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2910', '946', '14', '艺术馆地方吃饭', '946', '2018-09-25 11:06:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2911', '946', '16', '艺术馆地方吃饭', '946', '2018-09-25 11:06:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2912', '948', '20', null, '946', '2018-09-25 11:21:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3228', '939', '16', '盟科瑜伽场馆2号场,2号场场地', '942', '2018-09-28 06:48:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3204', '942', '14', '盟科瑜伽场馆1号场场地', '942', '2018-09-27 21:39:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3177', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2917', '942', '14', '艺术馆地方睡觉', '942', '2018-09-25 11:35:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2918', '946', '16', '艺术馆地方睡觉', '942', '2018-09-25 11:35:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3178', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3123', '939', '9', '吸猫', '946', '2018-09-27 19:02:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2922', '942', '3', '这是个测试', '939', '2018-09-25 12:07:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2923', '939', '9', '这是个测试', '942', '2018-09-25 12:07:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2924', '940', '14', '艺术馆地方睡觉', '940', '2018-09-25 12:18:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2925', '946', '16', '艺术馆地方睡觉', '940', '2018-09-25 12:18:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2926', '946', '18', '艺术馆睡觉', '940', '2018-09-25 12:18:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2927', '946', '17', '艺术馆睡觉', '940', '2018-09-25 12:18:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2928', '942', '3', '测试', '940', '2018-09-25 12:19:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2929', '940', '9', '测试', '942', '2018-09-25 12:19:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2930', '935', '3', '说呢就', '937', '2018-09-25 12:59:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3229', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 06:49:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2932', '935', '3', '说呢就', '937', '2018-09-25 13:00:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2934', '935', '3', '说呢就', '937', '2018-09-25 13:01:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2936', '935', '3', '说呢就', '938', '2018-09-25 13:06:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2938', '939', '13', '这是个测试赛事活动比', '939', '2018-09-25 15:07:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2939', '945', '20', null, '943', '2018-09-25 15:14:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2940', '943', '3', '狼人杀', '943', '2018-09-25 15:18:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2941', '943', '9', '狼人杀', '943', '2018-09-25 15:18:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2942', '943', '3', '狼人杀', '942', '2018-09-25 15:19:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2943', '942', '9', '狼人杀', '943', '2018-09-25 15:19:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2944', '943', '4', '狼人杀', '942', '2018-09-25 15:19:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2945', '942', '8', '狼人杀', null, '2018-09-25 15:19:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2946', '943', '4', '狼人杀', '942', '2018-09-25 15:19:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2947', '942', '8', '狼人杀', null, '2018-09-25 15:19:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2948', '943', '3', '狼人杀', '948', '2018-09-25 15:23:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2949', '948', '9', '狼人杀', '943', '2018-09-25 15:23:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2950', '942', '5', null, null, '2018-09-25 16:00:19', '1', '0', '1114');
INSERT INTO `alarm_user` VALUES ('2951', '947', '5', null, null, '2018-09-25 16:26:23', '1', '0', '1100');
INSERT INTO `alarm_user` VALUES ('2952', '942', '5', null, null, '2018-09-25 16:26:23', '1', '0', '1100');
INSERT INTO `alarm_user` VALUES ('2953', '0', '12', '这是场比赛', '942', '2018-09-25 16:26:23', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('2955', '0', '12', '金斌', '938', '2018-09-25 16:28:56', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3118', '946', '14', '艺术馆的吃饭场地', '946', '2018-09-27 18:56:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2956', '946', '18', '艺术馆吃饭', '942', '2018-09-25 17:02:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2957', '946', '17', '艺术馆吃饭', '942', '2018-09-25 17:02:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2958', '945', '5', null, null, '2018-09-25 17:18:03', '1', '0', '1111');
INSERT INTO `alarm_user` VALUES ('2959', '948', '5', null, null, '2018-09-25 17:18:03', '1', '0', '1111');
INSERT INTO `alarm_user` VALUES ('2960', '946', '5', null, null, '2018-09-25 17:18:03', '1', '0', '1111');
INSERT INTO `alarm_user` VALUES ('2961', '942', '5', null, null, '2018-09-25 17:18:03', '1', '0', '1111');
INSERT INTO `alarm_user` VALUES ('2962', '947', '5', null, null, '2018-09-25 17:18:03', '1', '0', '1111');
INSERT INTO `alarm_user` VALUES ('2963', '935', '3', '备注和取消活动功能', '935', '2018-09-25 18:57:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2964', '935', '9', '备注和取消活动功能', '935', '2018-09-25 18:57:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2965', '935', '4', '备注和取消活动功能', '935', '2018-09-25 19:06:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3226', '948', '9', '我', null, '2018-09-28 06:47:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3227', '942', '14', '盟科瑜伽场馆2号场,2号场场地', '942', '2018-09-28 06:48:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3180', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3168', '950', '3', '试一下', '942', '2018-09-27 21:10:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3166', '942', '3', '这是个测试', '942', '2018-09-27 21:10:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3167', '942', '9', '这是个测试', '942', '2018-09-27 21:10:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3225', '942', '9', '我', null, '2018-09-28 06:47:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3223', '945', '5', null, null, '2018-09-28 06:47:05', '1', '0', '1107');
INSERT INTO `alarm_user` VALUES ('3224', '942', '5', null, null, '2018-09-28 06:47:05', '1', '0', '1107');
INSERT INTO `alarm_user` VALUES ('3222', '948', '9', '我', '943', '2018-09-27 23:38:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3221', '943', '3', '我', '948', '2018-09-27 23:38:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3220', '948', '9', '这是个测试', '942', '2018-09-27 23:38:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3218', '939', '5', null, null, '2018-09-27 22:44:16', '1', '0', '1175');
INSERT INTO `alarm_user` VALUES ('3219', '942', '3', '这是个测试', '948', '2018-09-27 23:38:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2976', '939', '5', null, null, '2018-09-25 21:31:22', '1', '0', '1075');
INSERT INTO `alarm_user` VALUES ('2977', '947', '5', null, null, '2018-09-25 21:31:22', '1', '0', '1075');
INSERT INTO `alarm_user` VALUES ('3213', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-27 21:49:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3214', '939', '18', '盟科瑜伽场馆1号场场地', '942', '2018-09-27 21:54:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3215', '942', '17', '盟科瑜伽场馆1号场场地', '939', '2018-09-27 21:54:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3216', '942', '5', null, null, '2018-09-27 22:44:16', '1', '0', '1175');
INSERT INTO `alarm_user` VALUES ('3217', '947', '5', null, null, '2018-09-27 22:44:16', '1', '0', '1175');
INSERT INTO `alarm_user` VALUES ('2983', '947', '20', null, '939', '2018-09-25 22:37:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3231', '939', '14', '艺术馆场馆睡觉场地', '939', '2018-09-28 07:19:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3162', '950', '3', '试一下', '939', '2018-09-27 21:08:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3163', '939', '9', '试一下', '950', '2018-09-27 21:08:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('2988', '946', '5', null, null, '2018-09-26 00:57:31', '1', '0', '1073');
INSERT INTO `alarm_user` VALUES ('3232', '946', '16', '艺术馆场馆睡觉场地', '939', '2018-09-28 07:19:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3193', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:32:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3192', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:32:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3181', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:14:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3182', '949', '14', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:15:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3183', '937', '16', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:15:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3185', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:25:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3186', '939', '18', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:27:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3187', '942', '17', '盟科瑜伽的2号场场地', '939', '2018-09-27 21:27:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3188', '937', '18', 'shehjsjdhdhsjjwj的1号场场地', '949', '2018-09-27 21:28:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3189', '949', '17', 'shehjsjdhdhsjjwj的1号场场地', '937', '2018-09-27 21:28:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3190', '937', '18', 'shehjsjdhdhsjjwj的3号场场地', '949', '2018-09-27 21:28:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3191', '949', '17', 'shehjsjdhdhsjjwj的3号场场地', '937', '2018-09-27 21:28:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3003', '942', '14', '艺术馆地方吃饭', '942', '2018-09-26 08:30:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3004', '942', '16', '艺术馆地方吃饭', '942', '2018-09-26 08:30:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3005', '939', '14', '艺术馆地方睡觉', '939', '2018-09-26 08:31:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3006', '939', '16', '艺术馆地方睡觉', '939', '2018-09-26 08:31:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3007', '942', '3', '这是另外一个测试', '942', '2018-09-26 08:32:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3008', '942', '9', '这是另外一个测试', '942', '2018-09-26 08:32:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3009', '942', '4', '这是另外一个测试', '942', '2018-09-26 08:33:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3010', '946', '18', '艺术馆吃饭', '942', '2018-09-26 08:34:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3011', '946', '17', '艺术馆吃饭', '942', '2018-09-26 08:34:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3012', '939', '0', null, '942', '2018-09-26 08:35:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3013', '942', '13', '这是个测试赛事', '942', '2018-09-26 08:52:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3014', '942', '3', '这是个测试', '942', '2018-09-26 08:53:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3015', '942', '9', '这是个测试', '942', '2018-09-26 08:53:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3016', '0', '12', '这是个测试赛事', '942', '2018-09-26 09:00:01', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3017', '945', '13', '这是个测试赛事', '945', '2018-09-26 09:03:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3208', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:40:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3151', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3020', '942', '3', '这是另外一个测试', '945', '2018-09-26 09:05:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3021', '945', '9', '这是另外一个测试', '942', '2018-09-26 09:05:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3022', '945', '14', '艺术馆地方睡觉', '945', '2018-09-26 09:06:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3023', '945', '16', '艺术馆地方睡觉', '945', '2018-09-26 09:06:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3207', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:39:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3147', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:49:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3141', '947', '14', '盟科瑜伽的2号场场地', '947', '2018-09-27 20:43:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3026', '942', '14', '艺术馆地方吃饭', '942', '2018-09-26 09:09:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3027', '946', '16', '艺术馆地方吃饭', '942', '2018-09-26 09:09:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3028', '943', '20', null, '945', '2018-09-26 09:27:38', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3029', '939', '20', null, '947', '2018-09-26 09:55:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3206', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:39:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3032', '942', '13', '这又是一次测试', '942', '2018-09-26 10:19:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3033', '942', '13', '哈佳铁路', '942', '2018-09-26 10:20:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3034', '942', '20', null, '940', '2018-09-26 10:28:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3035', '942', '3', '这是另外一个测试', '940', '2018-09-26 10:30:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3036', '940', '9', '这是另外一个测试', '942', '2018-09-26 10:30:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3205', '939', '16', '盟科瑜伽场馆1号场场地', '942', '2018-09-27 21:39:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3037', '946', '3', '修身养性', '945', '2018-09-26 12:05:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3038', '945', '9', '修身养性', '946', '2018-09-26 12:05:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3039', '942', '4', '这是另外一个测试', '945', '2018-09-26 12:05:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3040', '942', '3', '又是一个测试', '942', '2018-09-26 12:08:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3041', '942', '9', '又是一个测试', '942', '2018-09-26 12:08:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3043', '942', '3', '这是个测试', '940', '2018-09-26 12:11:33', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3044', '940', '9', '这是个测试', '942', '2018-09-26 12:11:33', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3161', '935', '4', '备注和取消活动功能', '949', '2018-09-27 21:06:01', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3045', '942', '3', '测试', '942', '2018-09-26 13:51:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3046', '942', '9', '测试', '942', '2018-09-26 13:51:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3047', '942', '14', '艺术馆地方吃饭', '942', '2018-09-26 14:05:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3048', '946', '16', '艺术馆地方吃饭', '942', '2018-09-26 14:05:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3049', '942', '13', '这是个测试赛事，，，', '942', '2018-09-26 14:11:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3050', '0', '12', '这是个测试赛事，，，', '942', '2018-09-26 14:38:48', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3148', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:49:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3149', '942', '14', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3150', '939', '16', '盟科瑜伽的2号场场地', '942', '2018-09-27 20:50:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3230', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 06:49:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3212', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:49:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3165', '939', '9', '这是个测试', '942', '2018-09-27 21:10:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3203', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-27 21:37:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3119', '946', '16', '艺术馆的吃饭场地', '946', '2018-09-27 18:56:54', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3194', '939', '18', '盟科瑜伽的2号场场地', '942', '2018-09-27 21:33:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3164', '942', '3', '这是个测试', '939', '2018-09-27 21:10:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3160', '950', '9', '这是个测试', '942', '2018-09-27 21:05:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3077', '935', '4', '备注和取消活动功能', '938', '2018-09-26 19:56:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3078', '935', '3', '备注和取消活动功能', '938', '2018-09-26 19:56:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3143', '939', '18', '盟科瑜伽的1号场场地', '947', '2018-09-27 20:43:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3237', '942', '4', '天天测试', '942', '2018-09-28 07:29:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3236', '942', '9', '天天测试', '942', '2018-09-28 07:28:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3140', '939', '16', '盟科瑜伽的1号场场地', '947', '2018-09-27 20:42:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3126', '943', '4', '我', '942', '2018-09-27 20:12:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3099', '949', '14', 'shehjsjdhdhsjjwj的1号场,2号,3号场场地', '949', '2018-09-27 14:07:06', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3235', '942', '3', '天天测试', '942', '2018-09-28 07:28:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3094', '945', '14', '艺术馆的睡觉场地', '945', '2018-09-27 11:00:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3095', '946', '16', '艺术馆的睡觉场地', '945', '2018-09-27 11:00:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3096', '945', '20', null, '943', '2018-09-27 11:00:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3097', '945', '19', null, '943', '2018-09-27 11:00:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3098', '945', '20', null, '943', '2018-09-27 11:06:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3238', '942', '3', '天天测试', '942', '2018-09-28 07:29:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3239', '942', '9', '天天测试', '942', '2018-09-28 07:29:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3240', '949', '14', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场场地', '949', '2018-09-28 08:06:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3241', '937', '16', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场场地', '949', '2018-09-28 08:06:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3242', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-28 08:07:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3243', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-28 08:07:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3244', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '949', '2018-09-28 08:15:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3245', '949', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-28 08:15:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3246', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '949', '2018-09-28 08:15:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3247', '949', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-28 08:15:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3248', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 08:37:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3249', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 08:37:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3250', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 08:37:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3251', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 08:37:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3252', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 08:38:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3253', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 08:38:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3254', '937', '20', null, '949', '2018-09-28 08:57:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3255', '950', '3', '试一下', '946', '2018-09-28 09:05:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3256', '946', '9', '试一下', '950', '2018-09-28 09:05:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3257', '946', '3', '好好学习', '942', '2018-09-28 09:13:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3258', '942', '9', '好好学习', '946', '2018-09-28 09:13:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3259', '937', '3', 'Sjfh', '949', '2018-09-28 09:27:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3260', '949', '9', 'Sjfh', '937', '2018-09-28 09:27:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3261', '946', '3', '好好学习', '948', '2018-09-28 09:29:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3262', '948', '9', '好好学习', '946', '2018-09-28 09:29:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3263', '946', '3', '吸猫', '948', '2018-09-28 09:30:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3264', '948', '9', '吸猫', '946', '2018-09-28 09:30:22', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3265', '942', '5', null, null, '2018-09-28 09:48:50', '1', '0', '1106');
INSERT INTO `alarm_user` VALUES ('3266', '940', '5', null, null, '2018-09-28 09:48:50', '0', '0', '1106');
INSERT INTO `alarm_user` VALUES ('3267', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-28 09:57:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3268', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-28 09:57:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3269', '946', '3', '好好学习', '939', '2018-09-28 10:06:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3270', '939', '9', '好好学习', '946', '2018-09-28 10:06:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3271', '942', '3', '天天测试', '939', '2018-09-28 10:06:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3272', '939', '9', '天天测试', '942', '2018-09-28 10:06:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3273', '946', '3', '修身养性', '939', '2018-09-28 10:07:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3274', '939', '9', '修身养性', '946', '2018-09-28 10:07:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3275', '942', '3', '测试蜂蜜', '942', '2018-09-28 10:11:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3276', '942', '9', '测试蜂蜜', '942', '2018-09-28 10:11:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3277', '939', '3', '哦', '942', '2018-09-28 10:11:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3278', '942', '9', '哦', '939', '2018-09-28 10:11:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3279', '942', '5', null, null, '2018-09-28 10:19:30', '1', '0', '1187');
INSERT INTO `alarm_user` VALUES ('3280', '949', '14', 'shehjsjdhdhsjjwj场馆3号场,2号,1号场,2号,3号场场地', '949', '2018-09-28 10:20:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3281', '937', '16', 'shehjsjdhdhsjjwj场馆3号场,2号,1号场,2号,3号场场地', '949', '2018-09-28 10:20:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3282', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '949', '2018-09-28 10:20:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3283', '949', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-28 10:20:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3284', '942', '5', null, null, '2018-09-28 10:25:15', '1', '0', '1186');
INSERT INTO `alarm_user` VALUES ('3285', '949', '14', 'shehjsjdhdhsjjwj场馆1号场,1号场,2号场地', '949', '2018-09-28 10:32:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3286', '937', '16', 'shehjsjdhdhsjjwj场馆1号场,1号场,2号场地', '949', '2018-09-28 10:32:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3287', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-28 10:43:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3288', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-28 10:43:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3289', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '949', '2018-09-28 10:44:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3290', '949', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-28 10:44:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3291', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '949', '2018-09-28 10:45:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3292', '949', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-28 10:45:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3293', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:50:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3294', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:50:25', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3295', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:51:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3296', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 10:51:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3297', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:53:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3298', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:53:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3299', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-28 10:53:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3300', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-28 10:53:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3301', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:53:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3302', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 10:53:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3303', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-28 10:54:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3304', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-28 10:54:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3305', '949', '14', 'shehjsjdhdhsjjwj场馆1号场,2号,2号,2号,3号场,1号场,3号场场地', '949', '2018-09-28 10:55:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3306', '937', '16', 'shehjsjdhdhsjjwj场馆1号场,2号,2号,2号,3号场,1号场,3号场场地', '949', '2018-09-28 10:55:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3307', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:55:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3308', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:55:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3309', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 10:56:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3310', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 10:56:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3311', '942', '3', '花钱退款测试', '942', '2018-09-28 11:00:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3312', '942', '9', '花钱退款测试', '942', '2018-09-28 11:00:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3313', '942', '4', '花钱退款测试', '942', '2018-09-28 11:02:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3314', '942', '8', '花钱退款测试', null, '2018-09-28 11:02:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3315', '942', '3', '花钱退款测试', '946', '2018-09-28 11:18:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3316', '946', '9', '花钱退款测试', '942', '2018-09-28 11:18:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3317', '942', '3', '花钱退款测试', '947', '2018-09-28 11:21:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3318', '947', '9', '花钱退款测试', '942', '2018-09-28 11:21:18', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3319', '942', '4', '花钱退款测试', '947', '2018-09-28 11:21:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3320', '947', '8', '花钱退款测试', null, '2018-09-28 11:21:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3321', '942', '4', '花钱退款测试', '946', '2018-09-28 11:22:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3322', '946', '8', '花钱退款测试', null, '2018-09-28 11:22:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3323', '942', '3', '花钱退款测试', '947', '2018-09-28 11:23:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3324', '947', '9', '花钱退款测试', '942', '2018-09-28 11:23:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3325', '943', '3', '对方', '943', '2018-09-28 11:32:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3326', '943', '9', '对方', '943', '2018-09-28 11:32:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3327', '943', '4', '对方', '943', '2018-09-28 11:33:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3328', '943', '8', '对方', null, '2018-09-28 11:33:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3329', '943', '3', '对方', '945', '2018-09-28 12:02:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3330', '945', '9', '对方', '943', '2018-09-28 12:02:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3331', '942', '20', null, '950', '2018-09-28 12:20:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3332', '946', '20', null, '939', '2018-09-28 12:25:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3333', '948', '20', null, '939', '2018-09-28 12:25:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3334', '947', '3', '腿', '942', '2018-09-28 12:32:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3335', '942', '9', '腿', '947', '2018-09-28 12:32:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3336', '947', '4', '腿', '942', '2018-09-28 12:32:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3337', '942', '8', '腿', null, '2018-09-28 12:32:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3338', '937', '4', 'Sjfh', '949', '2018-09-28 13:02:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3339', '949', '8', 'Sjfh', null, '2018-09-28 13:02:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3340', '937', '4', 'Sjfh', '949', '2018-09-28 13:03:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3341', '949', '8', 'Sjfh', null, '2018-09-28 13:03:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3342', '937', '3', 'Sjfh', '949', '2018-09-28 13:04:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3343', '949', '9', 'Sjfh', '937', '2018-09-28 13:04:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3344', '937', '4', 'Sjfh', '949', '2018-09-28 13:04:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3345', '949', '8', 'Sjfh', null, '2018-09-28 13:04:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3346', '945', '3', '三国杀', '942', '2018-09-28 14:12:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3347', '942', '9', '三国杀', '945', '2018-09-28 14:12:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3348', '945', '4', '三国杀', '942', '2018-09-28 14:12:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3349', '942', '8', '三国杀', null, '2018-09-28 14:12:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3350', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 14:13:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3351', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 14:13:24', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3352', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-28 14:13:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3353', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-28 14:13:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3354', '943', '3', '对方', '942', '2018-09-28 14:15:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3355', '942', '9', '对方', '943', '2018-09-28 14:15:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3356', '949', '3', '234', '949', '2018-09-28 14:30:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3357', '949', '9', '234', '949', '2018-09-28 14:30:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3358', '950', '3', '这个不萌', '942', '2018-09-28 14:49:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3359', '942', '9', '这个不萌', '950', '2018-09-28 14:49:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3360', '942', '13', '萌赛事...', '942', '2018-09-28 16:42:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3361', '949', '5', null, null, '2018-09-28 16:50:15', '1', '0', '1194');
INSERT INTO `alarm_user` VALUES ('3362', '942', '3', '蜂蜜测试', '942', '2018-09-28 16:56:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3363', '942', '9', '蜂蜜测试', '942', '2018-09-28 16:56:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3364', '942', '5', null, null, '2018-09-28 16:59:01', '1', '0', '1205');
INSERT INTO `alarm_user` VALUES ('3365', '942', '3', '动图', '942', '2018-09-28 18:49:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3366', '942', '9', '动图', '942', '2018-09-28 18:49:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3367', '942', '3', '动图测试', '942', '2018-09-28 18:49:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3368', '942', '9', '动图测试', '942', '2018-09-28 18:49:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3369', '942', '4', '动图测试', '942', '2018-09-28 18:50:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3370', '942', '3', '动图测试', '942', '2018-09-28 18:50:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3371', '942', '9', '动图测试', '942', '2018-09-28 18:50:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3372', '942', '3', '？？？', '939', '2018-09-28 21:07:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3373', '939', '9', '？？？', '942', '2018-09-28 21:07:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3374', '937', '3', 'Sjfh', '949', '2018-09-29 02:23:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3375', '949', '9', 'Sjfh', '937', '2018-09-29 02:23:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3376', '949', '13', '培训12', '949', '2018-09-29 02:24:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3377', '949', '14', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场场地', '949', '2018-09-29 02:24:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3378', '937', '16', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场场地', '949', '2018-09-29 02:24:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3379', '942', '9', '天天测试', null, '2018-09-29 02:29:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3380', '939', '9', '天天测试', null, '2018-09-29 02:29:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3381', '947', '9', '花钱退款测试', null, '2018-09-29 07:00:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3382', '939', '3', '是羁绊', '942', '2018-09-29 08:19:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3383', '942', '9', '是羁绊', '939', '2018-09-29 08:19:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3384', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:24:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3385', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:24:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3386', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:25:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3387', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:25:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3388', '942', '3', '你花钱了吗', '942', '2018-09-29 08:31:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3389', '942', '9', '你花钱了吗', '942', '2018-09-29 08:31:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3390', '942', '4', '你花钱了吗', '942', '2018-09-29 08:32:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3391', '942', '8', '你花钱了吗', null, '2018-09-29 08:32:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3392', '942', '3', '你花钱了吗', '948', '2018-09-29 08:33:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3393', '948', '9', '你花钱了吗', '942', '2018-09-29 08:33:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3394', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:38:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3395', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 08:38:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3396', '948', '3', '卡路里', '942', '2018-09-29 08:39:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3397', '942', '9', '卡路里', '948', '2018-09-29 08:39:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3398', '942', '4', '花钱退款测试', '947', '2018-09-29 08:39:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3399', '947', '8', '花钱退款测试', null, '2018-09-29 08:39:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3400', '942', '3', '你花钱了吗', '947', '2018-09-29 08:45:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3401', '947', '9', '你花钱了吗', '942', '2018-09-29 08:45:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3402', '947', '14', '盟科瑜伽场馆2号场场地', '947', '2018-09-29 08:46:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3403', '939', '16', '盟科瑜伽场馆2号场场地', '947', '2018-09-29 08:46:04', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3404', '947', '3', '练完放假！！！', '942', '2018-09-29 08:46:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3405', '942', '9', '练完放假！！！', '947', '2018-09-29 08:46:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3406', '942', '4', '你花钱了吗', '947', '2018-09-29 08:48:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3407', '947', '8', '你花钱了吗', null, '2018-09-29 08:48:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3408', '947', '3', '练完放假！！！', '947', '2018-09-29 08:49:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3409', '947', '9', '练完放假！！！', '947', '2018-09-29 08:49:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3410', '942', '19', null, '947', '2018-09-29 08:56:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3411', '942', '20', null, '947', '2018-09-29 08:56:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3412', '942', '9', '动图测试', null, '2018-09-29 09:24:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3413', '942', '3', '你花钱了吗', '945', '2018-09-29 09:28:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3414', '945', '9', '你花钱了吗', '942', '2018-09-29 09:28:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3415', '942', '4', '你花钱了吗', '945', '2018-09-29 09:28:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3416', '945', '8', '你花钱了吗', null, '2018-09-29 09:28:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3417', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 10:58:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3418', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 10:58:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3419', '942', '5', null, null, '2018-09-29 11:01:09', '1', '0', '1171');
INSERT INTO `alarm_user` VALUES ('3420', '948', '5', null, null, '2018-09-29 11:01:09', '1', '0', '1171');
INSERT INTO `alarm_user` VALUES ('3421', '942', '3', '时间', '942', '2018-09-29 11:01:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3422', '942', '9', '时间', '942', '2018-09-29 11:01:39', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3423', '945', '3', '吃鸡', '942', '2018-09-29 11:02:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3424', '942', '9', '吃鸡', '945', '2018-09-29 11:02:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3425', '945', '14', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 11:29:35', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3426', '939', '16', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 11:29:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3427', '949', '5', null, null, '2018-09-29 12:07:00', '1', '0', '1167');
INSERT INTO `alarm_user` VALUES ('3428', '949', '3', '活动测', '949', '2018-09-29 12:43:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3429', '949', '9', '活动测', '949', '2018-09-29 12:43:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3430', '949', '3', '活动测', '949', '2018-09-29 12:57:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3431', '949', '9', '活动测', '949', '2018-09-29 12:57:55', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3432', '949', '5', null, null, '2018-09-29 13:02:56', '1', '0', '1172');
INSERT INTO `alarm_user` VALUES ('3433', '949', '14', 'shehjsjdhdhsjjwj场馆2号,2号,2号,2号场地', '949', '2018-09-29 13:15:29', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3434', '937', '16', 'shehjsjdhdhsjjwj场馆2号,2号,2号,2号场地', '949', '2018-09-29 13:15:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3435', '942', '5', null, null, '2018-09-29 13:51:43', '1', '0', '1153');
INSERT INTO `alarm_user` VALUES ('3436', '939', '9', '？？？', null, '2018-09-29 13:55:05', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3437', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '949', '2018-09-29 13:55:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3438', '949', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 13:55:16', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3439', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '949', '2018-09-29 13:55:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3440', '949', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 13:55:19', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3441', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-29 13:55:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3442', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-29 13:55:56', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3443', '942', '3', '时间测试', '948', '2018-09-29 13:57:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3444', '948', '9', '时间测试', '942', '2018-09-29 13:57:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3445', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 14:04:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3446', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 14:04:21', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3447', '942', '4', '时间', '942', '2018-09-29 14:05:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3448', '942', '3', '时间', '942', '2018-09-29 14:05:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3449', '942', '9', '时间', '942', '2018-09-29 14:05:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3450', '942', '14', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 14:28:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3451', '939', '16', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 14:28:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3452', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-09-29 14:28:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3453', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 14:28:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3454', '935', '5', null, null, '2018-09-29 14:30:02', '0', '0', '1078');
INSERT INTO `alarm_user` VALUES ('3455', '942', '3', '收费', '942', '2018-09-29 14:30:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3456', '942', '9', '收费', '942', '2018-09-29 14:30:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3457', '942', '3', '收费', '945', '2018-09-29 14:45:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3458', '945', '9', '收费', '942', '2018-09-29 14:45:52', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3459', '942', '3', '时间', '945', '2018-09-29 14:46:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3460', '945', '9', '时间', '942', '2018-09-29 14:46:36', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3461', '942', '4', '时间', '945', '2018-09-29 14:46:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3462', '942', '3', '时间', '945', '2018-09-29 14:46:44', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3463', '945', '9', '时间', '942', '2018-09-29 14:46:44', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3464', '942', '4', '时间', '945', '2018-09-29 14:46:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3465', '942', '3', '你花钱了吗', '945', '2018-09-29 14:47:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3466', '945', '9', '你花钱了吗', '942', '2018-09-29 14:47:27', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3467', '942', '4', '你花钱了吗', '945', '2018-09-29 14:47:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3468', '945', '8', '你花钱了吗', null, '2018-09-29 14:47:31', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3469', '942', '3', '测试花钱', '945', '2018-09-29 14:48:34', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3470', '945', '9', '测试花钱', '942', '2018-09-29 14:48:34', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3471', '942', '3', '你花钱了吗', '945', '2018-09-29 14:49:08', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3472', '945', '9', '你花钱了吗', '942', '2018-09-29 14:49:08', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3473', '942', '4', '你花钱了吗', '945', '2018-09-29 14:49:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3474', '945', '8', '你花钱了吗', null, '2018-09-29 14:49:15', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3475', '942', '3', '你花钱了吗', '945', '2018-09-29 14:49:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3476', '945', '9', '你花钱了吗', '942', '2018-09-29 14:49:45', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3477', '942', '4', '你花钱了吗', '945', '2018-09-29 14:49:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3478', '945', '8', '你花钱了吗', null, '2018-09-29 14:49:50', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3479', '943', '3', '你是谁在一起玩游戏玩手机游戏网易游戏', '943', '2018-09-29 14:52:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3480', '943', '9', '你是谁在一起玩游戏玩手机游戏网易游戏', '943', '2018-09-29 14:52:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3481', '943', '4', '你是谁在一起玩游戏玩手机游戏网易游戏', '943', '2018-09-29 14:52:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3482', '943', '8', '你是谁在一起玩游戏玩手机游戏网易游戏', null, '2018-09-29 14:52:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3483', '942', '3', '你花钱了吗', '945', '2018-09-29 14:54:30', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3484', '945', '9', '你花钱了吗', '942', '2018-09-29 14:54:30', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3485', '943', '3', '你是谁在一起玩游戏玩手机游戏网易游戏', '942', '2018-09-29 14:54:48', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3486', '942', '9', '你是谁在一起玩游戏玩手机游戏网易游戏', '943', '2018-09-29 14:54:48', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3487', '942', '4', '你花钱了吗', '945', '2018-09-29 14:55:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3488', '945', '8', '你花钱了吗', null, '2018-09-29 14:55:47', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3489', '945', '14', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 14:56:59', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3490', '939', '16', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 14:56:59', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3491', '939', '18', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 14:57:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3492', '945', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 14:57:31', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3493', '942', '14', '盟科瑜伽场馆1号场,2号场场地', '942', '2018-09-29 14:59:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3494', '939', '16', '盟科瑜伽场馆1号场,2号场场地', '942', '2018-09-29 14:59:20', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3495', '945', '14', '盟科瑜伽场馆2号场,2号场场地', '945', '2018-09-29 14:59:26', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3496', '939', '16', '盟科瑜伽场馆2号场,2号场场地', '945', '2018-09-29 14:59:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3497', '939', '18', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 14:59:51', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3498', '945', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 14:59:51', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3499', '939', '18', '盟科瑜伽场馆2号场场地', '945', '2018-09-29 15:00:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3500', '945', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 15:00:02', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3501', '942', '14', '艺术馆场馆吃饭场地', '942', '2018-09-29 15:00:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3502', '946', '16', '艺术馆场馆吃饭场地', '942', '2018-09-29 15:00:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3503', '942', '14', '艺术馆场馆玩耍场地', '942', '2018-09-29 15:20:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3504', '946', '16', '艺术馆场馆玩耍场地', '942', '2018-09-29 15:20:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3505', '946', '18', '艺术馆场馆玩耍场地', '942', '2018-09-29 15:20:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3506', '942', '17', '艺术馆场馆玩耍场地', '946', '2018-09-29 15:20:56', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3507', '947', '14', '盟科瑜伽场馆1号场场地', '947', '2018-09-29 15:27:32', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3508', '939', '16', '盟科瑜伽场馆1号场场地', '947', '2018-09-29 15:27:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3509', '939', '18', '盟科瑜伽场馆2号场场地', '947', '2018-09-29 15:28:12', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3510', '947', '17', '盟科瑜伽场馆2号场场地', '939', '2018-09-29 15:28:12', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3511', '939', '18', '盟科瑜伽场馆1号场场地', '947', '2018-09-29 15:28:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3512', '947', '17', '盟科瑜伽场馆1号场场地', '939', '2018-09-29 15:28:17', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3513', '937', '3', '测试测', '937', '2018-09-29 15:36:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3514', '937', '9', '测试测', '937', '2018-09-29 15:36:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3515', '937', '11', '测试测', '937', '2018-09-29 15:39:01', '1', '0', '0');
INSERT INTO `alarm_user` VALUES ('3516', '937', '3', '测试测', '937', '2018-09-29 15:51:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3517', '937', '9', '测试测', '937', '2018-09-29 15:51:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3518', '937', '4', '测试测', '937', '2018-09-29 15:51:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3519', '937', '8', '测试测', null, '2018-09-29 15:51:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3520', '942', '13', '这是个赛事', '942', '2018-09-29 15:52:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3521', '0', '12', '这是个赛事', '942', '2018-09-29 15:52:49', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3522', '937', '3', '测试测', '937', '2018-09-29 15:55:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3523', '937', '9', '测试测', '937', '2018-09-29 15:55:42', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3524', '937', '4', '测试测', '937', '2018-09-29 15:57:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3525', '937', '8', '测试测', null, '2018-09-29 15:57:17', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3526', '937', '3', '测试测', '937', '2018-09-29 16:00:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3527', '937', '9', '测试测', '937', '2018-09-29 16:00:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3528', '937', '4', '测试测', '937', '2018-09-29 16:03:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3529', '937', '8', '测试测', null, '2018-09-29 16:03:36', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3530', '937', '3', '测试测', '937', '2018-09-29 16:09:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3531', '937', '9', '测试测', '937', '2018-09-29 16:09:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3532', '937', '4', '测试测', '937', '2018-09-29 16:10:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3533', '937', '8', '测试测', null, '2018-09-29 16:10:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3534', '937', '3', '测试测', '937', '2018-09-29 16:12:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3535', '937', '9', '测试测', '937', '2018-09-29 16:12:35', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3536', '937', '3', '测试测', '937', '2018-09-29 16:25:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3537', '937', '9', '测试测', '937', '2018-09-29 16:25:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3538', '937', '4', '测试测', '937', '2018-09-29 16:26:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3539', '937', '8', '测试测', null, '2018-09-29 16:26:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3540', '937', '3', '测试测', '937', '2018-09-29 16:27:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3541', '937', '9', '测试测', '937', '2018-09-29 16:27:31', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3542', '937', '4', '测试测', '937', '2018-09-29 16:35:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3543', '937', '8', '测试测', null, '2018-09-29 16:35:49', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3544', '937', '4', '测试测', '937', '2018-09-29 16:39:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3545', '937', '8', '测试测', null, '2018-09-29 16:39:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3546', '937', '4', '测试测', '937', '2018-09-29 17:02:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3547', '937', '8', '测试测', null, '2018-09-29 17:02:46', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3548', '937', '3', '测试测', '937', '2018-09-29 17:04:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3549', '937', '9', '测试测', '937', '2018-09-29 17:04:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3550', '937', '11', '测试测', '937', '2018-09-29 17:05:39', '1', '0', '0');
INSERT INTO `alarm_user` VALUES ('3551', '937', '14', 'shehjsjdhdhsjjwj场馆3号场,3号场,3号场,3号场场地', '937', '2018-09-29 17:25:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3552', '937', '16', 'shehjsjdhdhsjjwj场馆3号场,3号场,3号场,3号场场地', '937', '2018-09-29 17:25:26', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3553', '942', '3', '花钱', '942', '2018-09-29 17:29:33', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3554', '942', '9', '花钱', '942', '2018-09-29 17:29:33', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3555', '942', '4', '花钱', '942', '2018-09-29 17:29:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3556', '942', '8', '花钱', null, '2018-09-29 17:29:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3557', '937', '13', '赛事432', '937', '2018-09-29 18:39:41', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3558', '0', '12', '赛事432', '937', '2018-09-29 18:40:02', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3559', '937', '13', '赛事432', '937', '2018-09-29 18:41:19', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3560', '0', '12', '赛事432', '937', '2018-09-29 18:41:39', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3561', '937', '13', '赛事432', '937', '2018-09-29 18:44:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3562', '0', '12', '赛事432', '937', '2018-09-29 18:50:39', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3563', '0', '12', '赛事432', '937', '2018-09-29 18:52:33', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3564', '939', '5', null, null, '2018-09-29 21:16:42', '1', '0', '1181');
INSERT INTO `alarm_user` VALUES ('3565', '942', '5', null, null, '2018-09-29 21:16:42', '1', '0', '1181');
INSERT INTO `alarm_user` VALUES ('3566', '946', '5', null, null, '2018-09-29 21:16:42', '1', '0', '1181');
INSERT INTO `alarm_user` VALUES ('3567', '942', '5', null, null, '2018-09-29 21:16:42', '1', '0', '1208');
INSERT INTO `alarm_user` VALUES ('3568', '942', '5', null, null, '2018-09-29 21:17:01', '1', '0', '1214');
INSERT INTO `alarm_user` VALUES ('3569', '937', '14', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 21:18:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3570', '937', '16', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 21:18:11', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3571', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:21:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3572', '937', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:21:58', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3573', '937', '18', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 21:40:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3574', '937', '17', 'shehjsjdhdhsjjwj场馆1号场场地', '937', '2018-09-29 21:40:09', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3575', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:41:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3576', '937', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:41:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3577', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:41:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3578', '937', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 21:41:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3579', '942', '14', '艺术馆场馆玩耍,玩耍场地', '942', '2018-09-29 21:57:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3580', '946', '16', '艺术馆场馆玩耍,玩耍场地', '942', '2018-09-29 21:57:32', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3581', '946', '18', '艺术馆场馆玩耍场地', '942', '2018-09-29 21:57:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3582', '942', '17', '艺术馆场馆玩耍场地', '946', '2018-09-29 21:57:50', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3583', '946', '18', '艺术馆场馆玩耍场地', '942', '2018-09-29 21:58:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3584', '942', '17', '艺术馆场馆玩耍场地', '946', '2018-09-29 21:58:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3585', '942', '13', '这是个赛事', '942', '2018-09-29 22:06:29', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3586', '0', '12', '这是个赛事', '942', '2018-09-29 22:07:32', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3587', '0', '12', '这是个赛事', '0', '2018-09-29 22:07:37', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3588', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 22:08:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3589', '937', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-29 22:08:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3590', '937', '14', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场,1号场,2号,3号场,1号场,2号,3号场,1号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,', '937', '2018-09-29 22:39:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3591', '937', '16', 'shehjsjdhdhsjjwj场馆1号场,2号,3号场,1号场,2号,3号场,1号场,2号,3号场,1号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,3号场,2号,', '937', '2018-09-29 22:39:14', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3592', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-29 22:40:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3593', '937', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-29 22:40:02', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3594', '939', '20', null, '946', '2018-09-29 22:52:15', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3595', '948', '3', '卡路里', '946', '2018-09-29 22:58:40', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3596', '946', '9', '卡路里', '948', '2018-09-29 22:58:40', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3597', '937', '13', '赛事432', '937', '2018-09-30 01:05:47', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3598', '0', '12', '赛事432', '937', '2018-09-30 01:06:03', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3599', '949', '9', 'Sjfh', null, '2018-09-30 06:50:16', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3600', '948', '9', '你花钱了吗', null, '2018-09-30 06:50:16', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3601', '948', '9', '时间测试', null, '2018-09-30 06:50:16', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3602', '942', '9', '时间', null, '2018-09-30 06:50:16', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3603', '945', '9', '测试花钱', null, '2018-09-30 06:50:16', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3604', '942', '14', '艺术馆场馆玩耍场地', '942', '2018-09-30 06:51:10', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3605', '946', '16', '艺术馆场馆玩耍场地', '942', '2018-09-30 06:51:10', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3606', '945', '3', '吃鸡', '939', '2018-09-30 07:16:45', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3607', '939', '9', '吃鸡', '945', '2018-09-30 07:16:45', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3608', '945', '4', '吃鸡', '939', '2018-09-30 07:16:52', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3609', '939', '8', '吃鸡', null, '2018-09-30 07:16:52', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3610', '942', '5', null, null, '2018-09-30 08:52:49', '1', '0', '1182');
INSERT INTO `alarm_user` VALUES ('3611', '939', '5', null, null, '2018-09-30 08:52:49', '1', '0', '1182');
INSERT INTO `alarm_user` VALUES ('3612', '945', '5', null, null, '2018-09-30 08:52:49', '0', '0', '1216');
INSERT INTO `alarm_user` VALUES ('3613', '948', '5', null, null, '2018-09-30 08:52:49', '0', '0', '1217');
INSERT INTO `alarm_user` VALUES ('3614', '942', '5', null, null, '2018-09-30 08:52:49', '1', '0', '1220');
INSERT INTO `alarm_user` VALUES ('3615', '946', '5', null, null, '2018-09-30 08:52:49', '0', '0', '1220');
INSERT INTO `alarm_user` VALUES ('3616', '942', '9', '你是谁在一起玩游戏玩手机游戏网易游戏', null, '2018-09-30 10:10:53', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3617', '939', '14', '盟科瑜伽场馆2号场场地', '939', '2018-09-30 10:19:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3618', '939', '16', '盟科瑜伽场馆2号场场地', '939', '2018-09-30 10:19:28', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3619', '939', '5', null, null, '2018-09-30 18:42:13', '1', '0', '1113');
INSERT INTO `alarm_user` VALUES ('3620', '942', '5', null, null, '2018-09-30 18:42:13', '1', '0', '1196');
INSERT INTO `alarm_user` VALUES ('3621', '942', '5', null, null, '2018-09-30 18:42:13', '1', '0', '1198');
INSERT INTO `alarm_user` VALUES ('3622', '948', '5', null, null, '2018-09-30 18:42:13', '0', '0', '1223');
INSERT INTO `alarm_user` VALUES ('3623', '942', '5', null, null, '2018-09-30 18:42:13', '1', '0', '1228');
INSERT INTO `alarm_user` VALUES ('3624', '945', '5', null, null, '2018-09-30 18:42:13', '0', '0', '1228');
INSERT INTO `alarm_user` VALUES ('3625', '950', '5', null, null, '2018-09-30 21:31:48', '0', '0', '1180');
INSERT INTO `alarm_user` VALUES ('3626', '939', '5', null, null, '2018-09-30 21:31:48', '1', '0', '1180');
INSERT INTO `alarm_user` VALUES ('3627', '942', '5', null, null, '2018-09-30 21:31:48', '1', '0', '1180');
INSERT INTO `alarm_user` VALUES ('3628', '948', '5', null, null, '2018-09-30 21:31:48', '0', '0', '1180');
INSERT INTO `alarm_user` VALUES ('3629', '939', '5', null, null, '2018-09-30 21:31:48', '1', '0', '1210');
INSERT INTO `alarm_user` VALUES ('3630', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-30 22:21:09', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3631', '937', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-30 22:21:09', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3632', '937', '18', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-30 22:22:27', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3633', '937', '17', 'shehjsjdhdhsjjwj场馆3号场场地', '937', '2018-09-30 22:22:27', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3634', '937', '18', 'shehjsjdhdhsjjwj场馆2号场地', '949', '2018-09-30 22:25:24', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3635', '949', '17', 'shehjsjdhdhsjjwj场馆2号场地', '937', '2018-09-30 22:25:24', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3636', '945', '5', null, null, '2018-10-01 00:11:08', '0', '0', '1119');
INSERT INTO `alarm_user` VALUES ('3637', '942', '5', null, null, '2018-10-01 00:11:08', '1', '0', '1151');
INSERT INTO `alarm_user` VALUES ('3638', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-10-01 03:41:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3639', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-10-01 03:41:37', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3640', '946', '18', '艺术馆场馆玩耍场地', '942', '2018-10-01 03:42:03', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3641', '942', '17', '艺术馆场馆玩耍场地', '946', '2018-10-01 03:42:03', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3642', '942', '9', '吃鸡', null, '2018-10-01 07:00:00', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3643', '939', '18', '盟科瑜伽场馆2号场场地', '942', '2018-10-01 07:14:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3644', '942', '17', '盟科瑜伽场馆2号场场地', '939', '2018-10-01 07:14:43', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3645', '942', '3', '花钱测试', '942', '2018-10-01 07:17:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3646', '942', '9', '花钱测试', '942', '2018-10-01 07:17:01', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3647', '942', '4', '花钱测试', '942', '2018-10-01 07:17:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3648', '942', '8', '花钱测试', null, '2018-10-01 07:17:23', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3649', '942', '3', '花钱测试', '939', '2018-10-01 07:43:33', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3650', '939', '9', '花钱测试', '942', '2018-10-01 07:43:33', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3651', '939', '3', '活动', '942', '2018-10-01 10:45:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3652', '942', '9', '活动', '939', '2018-10-01 10:45:13', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3653', '942', '3', '大懒猫', '942', '2018-10-01 12:11:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3654', '942', '9', '大懒猫', '942', '2018-10-01 12:11:07', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3655', '942', '3', '大懒猫', '952', '2018-10-01 12:12:27', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3656', '952', '9', '大懒猫', '942', '2018-10-01 12:12:27', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3657', '942', '9', '练完放假！！！', null, '2018-10-01 14:39:38', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3658', '947', '9', '练完放假！！！', null, '2018-10-01 14:39:38', '0', '0', null);
INSERT INTO `alarm_user` VALUES ('3659', '942', '3', '大懒猫', '939', '2018-10-01 14:40:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3660', '939', '9', '大懒猫', '942', '2018-10-01 14:40:57', '1', '0', null);
INSERT INTO `alarm_user` VALUES ('3661', '942', '5', null, null, '2018-10-01 19:38:10', '1', '0', '1221');
INSERT INTO `alarm_user` VALUES ('3662', '947', '5', null, null, '2018-10-01 19:38:10', '0', '0', '1221');

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
) ENGINE=InnoDB AUTO_INCREMENT=1227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binding
-- ----------------------------
INSERT INTO `binding` VALUES ('1185', '0', null, null, null, null, null, '48.39');
INSERT INTO `binding` VALUES ('1207', '935', '高非', '6215581502000113621', '210623198607317333', '18641502372', '世界上就', '0.00');
INSERT INTO `binding` VALUES ('1212', '939', null, null, null, null, null, '56.15');
INSERT INTO `binding` VALUES ('1213', '940', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1214', '941', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1215', '942', '刘延龙', '8488481581881618161', '371081681091081', '18846140810', 'T裤特意', '28.61');
INSERT INTO `binding` VALUES ('1216', '943', null, null, null, null, null, '0.20');
INSERT INTO `binding` VALUES ('1217', '944', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1218', '945', null, null, null, null, null, '0.07');
INSERT INTO `binding` VALUES ('1219', '946', null, null, null, null, null, '13.50');
INSERT INTO `binding` VALUES ('1220', '947', null, null, null, null, null, '0.12');
INSERT INTO `binding` VALUES ('1221', '948', null, null, null, null, null, '0.02');
INSERT INTO `binding` VALUES ('1222', '949', null, null, null, null, null, '99.92');
INSERT INTO `binding` VALUES ('1223', '937', null, null, null, null, null, '0.99');
INSERT INTO `binding` VALUES ('1224', '950', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1225', '951', null, null, null, null, null, '0.00');
INSERT INTO `binding` VALUES ('1226', '952', null, null, null, null, null, '0.00');

-- ----------------------------
-- Table structure for binding_history
-- ----------------------------
DROP TABLE IF EXISTS `binding_history`;
CREATE TABLE `binding_history` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `binding_no` bigint(20) DEFAULT NULL COMMENT 'no of binding information',
  `amount` int(11) DEFAULT NULL COMMENT 'amount of binding money',
  `submit_time` datetime DEFAULT NULL COMMENT 'submit time of apply binding',
  `binding_time` datetime DEFAULT NULL COMMENT 'time when binding completed',
  `state` tinyint(4) DEFAULT '0' COMMENT 'state of binding',
  `comment` varchar(255) DEFAULT NULL COMMENT 'explain of binding',
  `binding_man` int(11) DEFAULT NULL COMMENT 'administrator id of who manage this binding',
  `type` smallint(6) DEFAULT '0',
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of binding_history
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('1042', '935', null, '1', '0', '1053', '在。找你', '1', '2018-09-15 00:48:11', null, null, '没啥', '18641502372', '0.00', '0.10', '00000000.00', null, null);
INSERT INTO `booking` VALUES ('1056', '935', null, '1', '1', '1065', '', '1', '2018-09-18 12:59:35', '1500220062153724676957176314', null, '没啥', '18641502372', '0.00', '0.01', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1059', '939', null, '1', '0', '1064', '', '1', '2018-09-19 08:31:18', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1060', '942', null, '1', '0', '1067', '', '1', '2018-09-19 08:33:26', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1061', '935', null, '1', '0', '1066', '', '0', '2018-09-19 08:45:10', null, null, '没啥', '18641502372', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1062', '942', null, '1', '0', '1064', '', '1', '2018-09-19 21:55:27', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1063', '942', null, '1', '0', '1068', '', '1', '2018-09-21 10:08:17', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1064', '943', null, '1', '0', '1068', '', '1', '2018-09-21 10:30:45', null, null, '化龙', '17903602906', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1065', '942', null, '2', '1', '1069', '', '1', '2018-09-21 10:42:19', '1500220062153749772884217929', null, '青石', '18846140810', '0.00', '0.20', '00000000.20', '', '\"\"');
INSERT INTO `booking` VALUES ('1066', '945', null, '1', '1', '1069', '', '1', '2018-09-21 10:53:11', '1500220062153749838463037101', null, '杨德全', '18846079302', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1067', '947', null, '1', '0', '1068', '1111', '1', '2018-09-21 11:45:50', null, null, 'Y。Y', '18846046148', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1069', '939', null, '1', '0', '1075', '', '1', '2018-09-21 21:31:36', null, null, '周一', '18846140510', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1070', '939', null, '1', '1', '1069', '', '1', '2018-09-21 21:32:20', '1500220062153753672517399144', null, '周一', '18846140510', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1071', '0', '942', '1', '1', '1075', '', '2', '2018-09-21 21:35:44', '1500220062153753693480950426', '15002200621537763661101', '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1072', '935', null, '1', '0', '1078', null, '1', '2018-09-22 10:11:15', null, null, '没啥', '', '0.00', '1.10', '00000000.00', '', '[\"77\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1077', '942', null, '1', '1', '1106', '', '1', '2018-09-24 09:47:56', '1500220062153775366762288542', null, '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1078', '942', null, '1', '1', '1099', '', '1', '2018-09-24 12:23:01', '1500220062153776297250735862', null, '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1079', '0', '942', '1', '0', '1109', null, '2', '2018-09-24 18:42:36', null, null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '[\"\\u5218\\u5ef6\\u9f99\",\"18846140810\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1080', '946', null, '1', '0', '1073', null, '1', '2018-09-25 09:07:44', null, null, '舒瑶', '17745165119', '0.00', '2.00', '00000000.00', '', '[\"\\u8212\\u7476\",\"17745165119\",\"1\",\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1081', '945', null, '1', '0', '1110', '', '1', '2018-09-25 09:12:05', null, null, '测试', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1082', '945', null, '1', '0', '1111', '', '1', '2018-09-25 09:12:22', null, null, 'test', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1083', '945', null, '1', '0', '1107', null, '1', '2018-09-25 09:16:30', null, null, 'test', '18846079302', '0.00', '0.00', '00000000.00', '', '[\"\\u6768\\u5fb7\\u5168\",\"18846079302\",\"0\",\"\",\"\",\"\\u54c8\\u5c14\\u6ee8\\u5de5\\u7a0b\\u5927\\u5b66\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1084', '948', null, '1', '0', '1110', '', '1', '2018-09-25 09:16:34', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1085', '948', null, '2', '0', '1111', 'off', '1', '2018-09-25 09:23:42', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1086', '0', '942', '1', '1', '1113', null, '2', '2018-09-25 09:27:01', '1500220062153783881246023063', '', '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '[\"\\u5218\\u5ef6\\u9f99\",\"18846140810\",\"\",\"\",\"\",\"\\u54c8\\u5c14\\u6ee8\\u5de5\\u7a0b\\u5927\\u5b66\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1087', '946', null, '1', '0', '1111', '', '1', '2018-09-25 09:29:05', null, null, '舒瑶', '17745165119', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1088', '942', null, '1', '0', '1111', '', '1', '2018-09-25 09:31:35', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1089', '947', null, '1', '0', '1111', '', '1', '2018-09-25 10:18:53', null, null, '杨毅', '18846046148', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1090', '947', null, '1', '0', '1075', '备注能看到吗？', '1', '2018-09-25 10:20:39', null, null, '杨毅', '18846046148', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1091', '942', null, '1', '0', '1114', '', '1', '2018-09-25 10:25:30', null, null, '青石', '18846140810', '0.00', '5.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1092', '947', null, '10', '1', '1100', '能看到吗？', '1', '2018-09-25 10:31:44', '1500220062153784269383870012', null, '杨一', '18846046148', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1093', '942', null, '1', '1', '1100', '备注？', '1', '2018-09-25 10:58:39', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1095', '939', null, '2', '0', '1110', '', '1', '2018-09-25 12:07:44', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1096', '940', null, '1', '1', '1106', '', '1', '2018-09-25 12:19:28', '1500220062153784916233611443', null, '水', '18045623295', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1101', '939', null, '1', '0', '1113', null, '1', '2018-09-25 15:07:47', null, null, '周一', '18846140510', '0.00', '0.10', '00000000.00', '', '[\"\\u5468\\u7acb\",\"18846140510\",\"\",\"\",\"\",\"\\u4e1c\\u5317\\u6797\\u4e1a\\u5927\\u5b66\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1102', '943', null, '1', '0', '1116', '', '0', '2018-09-25 15:18:47', null, null, '哈哈', '17603601234', '0.00', '0.01', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1103', '0', '942', '1', '1', '1116', '', '2', '2018-09-25 15:19:11', '', '15002200621537859962265', '青石', '18846140810', '0.00', '0.01', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1104', '948', null, '1', '1', '1116', '', '0', '2018-09-25 15:23:49', '1500220062153786022058815848', null, '栾正琨', '13047495186', '0.00', '0.01', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1106', '0', '935', '1', '0', '1117', '其他用户报名活动时填写的备注', '2', '2018-09-25 18:57:11', null, null, '没啥', '18641502372', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1107', '0', '942', '1', '0', '1118', '', '2', '2018-09-26 08:32:47', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1108', '0', '942', '1', '1', '1119', null, '2', '2018-09-26 08:52:58', '', '', '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '[\"\\u5218\\u5ef6\\u9f99\",\"18846140810\",\"0\",\"371122199009084677\",\"\\u54c8\\u5c14\\u6ee8\",\"\\u54c8\\u5c14\\u6ee8\\u5de5\\u7a0b\\u5927\\u5b66\",\"\\u5b66\\u751f\",\"18846140810\",\"4\\u7c738\\u80a1\"]');
INSERT INTO `booking` VALUES ('1109', '942', null, '1', '0', '1110', '', '1', '2018-09-26 08:53:24', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1110', '945', null, '1', '1', '1119', null, '1', '2018-09-26 09:03:03', '1500220062153792377642527544', null, 'Y', '18846079302', '0.00', '0.10', '00000000.10', '', '[\"\\u6768\\u5fb7\\u5168\",\"18846079302\",\"0\",\"230103199402147311\",\"\\u54c8\\u5c14\\u6ee8\",\"\\u54c8\\u5c14\\u6ee8\\u5de5\\u7a0b\\u5927\\u5b66\",\"\\u5b66\\u751f\",\"Waiting_0214\",\"510656275@qq.com\"]');
INSERT INTO `booking` VALUES ('1111', '0', '945', '1', '0', '1118', '', '2', '2018-09-26 09:05:02', null, null, '有', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1114', '942', null, '1', '1', '1151', null, '1', '2018-09-26 10:19:24', '1500220062153792835512898119', null, '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '[\"\\u5218\\u5ef6\\u9f99\",\"18846140810\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1115', '942', null, '1', '0', '1107', null, '1', '2018-09-26 10:20:25', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '[\"\\u5218\",\"18846140810\",\"0\",\"\",\"\",\"\\u5927\\u5b66\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1116', '940', null, '10', '0', '1118', '', '0', '2018-09-26 10:30:12', null, null, '水', '18045623295', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1117', '945', null, '1', '0', '1123', '', '0', '2018-09-26 12:05:13', null, null, 'Man', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1118', '942', null, '1', '1', '1152', '', '0', '2018-09-26 12:08:34', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1120', '940', null, '10', '0', '1110', '', '1', '2018-09-26 12:11:33', null, null, '水', '18045623295', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1121', '942', null, '1', '0', '1153', '', '1', '2018-09-26 13:51:22', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1122', '0', '942', '1', '0', '1157', null, '2', '2018-09-26 14:11:37', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '[\"\\u5218\",\"18846140810\",null,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1124', '942', null, '1', '0', '1158', null, '0', '2018-09-26 16:01:16', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '[\"\\u5218\",\"18846140810\",null,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1126', '942', null, '1', '0', '1159', '', '0', '2018-09-26 16:05:28', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1127', '942', null, '1', '0', '1160', '', '0', '2018-09-26 16:20:37', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1128', '0', '942', '1', '0', '1161', '', '2', '2018-09-26 16:22:29', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1136', '945', null, '1', '0', '1158', null, '0', '2018-09-27 10:59:44', null, null, 'Man', '18846079392', '0.00', '0.00', '00000000.00', '', '[\"\\u6768\\u5fb7\\u5168\",\"18846079392\",\"0\",\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1139', '946', null, '2', '0', '1174', '', '0', '2018-09-27 18:58:03', null, null, '舒瑶', '17745165119', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1140', '939', null, '1', '0', '1174', '', '0', '2018-09-27 19:02:43', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1141', '942', null, '1', '0', '1174', '', '0', '2018-09-27 20:12:04', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1142', '942', null, '1', '0', '1171', '', '1', '2018-09-27 20:12:28', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1143', '942', null, '1', '0', '1175', '', '1', '2018-09-27 20:16:29', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1144', '947', null, '2', '0', '1175', '', '1', '2018-09-27 20:42:06', null, null, '杨一', '18846046148', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1146', '950', null, '1', '0', '1180', '', '1', '2018-09-27 21:05:19', null, null, '徐海涛', '18519196546', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1147', '939', null, '1', '0', '1181', '', '1', '2018-09-27 21:08:58', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1148', '939', null, '1', '0', '1180', '', '1', '2018-09-27 21:10:01', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1149', '942', null, '1', '0', '1180', '', '1', '2018-09-27 21:10:03', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1150', '942', null, '1', '0', '1181', '', '1', '2018-09-27 21:10:20', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1151', '939', null, '10', '0', '1175', '', '1', '2018-09-27 21:10:26', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1152', '948', null, '1', '0', '1180', '', '1', '2018-09-27 23:38:24', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1153', '948', null, '2', '0', '1171', '', '1', '2018-09-27 23:38:45', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1155', '942', null, '1', '0', '1182', '', '1', '2018-09-28 07:29:10', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1156', '946', null, '2', '0', '1181', '', '1', '2018-09-28 09:05:20', null, null, '舒瑶', '17745165119', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1157', '942', null, '1', '0', '1183', '', '0', '2018-09-28 09:13:23', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1159', '948', null, '1', '0', '1183', '', '0', '2018-09-28 09:29:47', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1160', '948', null, '2', '0', '1174', '', '0', '2018-09-28 09:30:22', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1161', '939', null, '10', '0', '1183', '', '0', '2018-09-28 10:06:24', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1162', '939', null, '10', '0', '1182', '', '1', '2018-09-28 10:06:47', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1163', '939', null, '5', '0', '1123', '', '0', '2018-09-28 10:07:57', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1164', '942', null, '1', '0', '1186', '', '1', '2018-09-28 10:11:10', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1165', '942', null, '1', '0', '1187', '', '1', '2018-09-28 10:11:26', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1171', '945', null, '1', '1', '1191', '', '0', '2018-09-28 12:02:10', '1500220062153810732293316214', null, 'Man', '18846079302', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1175', '942', null, '1', '1', '1191', '', '0', '2018-09-28 14:15:02', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1176', '949', null, '1', '1', '1194', '', '1', '2018-09-28 14:30:02', '', null, '我名字', '13384255905', '0.00', '1.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1177', '942', null, '1', '0', '1198', '', '1', '2018-09-28 14:49:35', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1178', '942', null, '1', '1', '1203', null, '0', '2018-09-28 16:42:26', '', null, '青石', '', '0.00', '0.10', '00000000.00', '', '[\"\",\"\",null,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1179', '942', null, '1', '0', '1205', '', '1', '2018-09-28 16:56:15', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1180', '942', null, '1', '0', '1208', '', '1', '2018-09-28 18:49:30', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1182', '942', null, '1', '0', '1196', '', '1', '2018-09-28 18:50:09', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1183', '939', null, '1', '0', '1210', '', '1', '2018-09-28 21:07:34', null, null, '周一', '18846140510', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1184', '949', null, '1', '1', '1184', '', '0', '2018-09-29 02:23:47', '', null, '我名字', '13384255905', '0.00', '0.50', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1185', '949', null, '1', '1', '1167', null, '1', '2018-09-29 02:24:07', '', null, '我名字', '', '0.00', '1.00', '00000000.00', '', '[\"345\",\"\",1,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1186', '942', null, '1', '1', '1214', '', '1', '2018-09-29 08:19:55', '', null, '青石', '18846140810', '1.50', '2.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1188', '948', null, '1', '1', '1217', '', '1', '2018-09-29 08:33:15', '1500220062153818118598185416', null, '栾正琨', '13047495186', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1189', '942', null, '1', '1', '1220', '', '1', '2018-09-29 08:39:04', '1500220062153818153392499337', null, '青石', '18846140810', '0.00', '0.01', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1191', '942', null, '1', '1', '1221', '', '1', '2018-09-29 08:46:15', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1192', '947', null, '5', '1', '1221', '', '1', '2018-09-29 08:49:47', '1500220062153818218067695079', null, '杨一', '18846046148', '0.00', '0.50', '00000000.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1195', '942', null, '1', '1', '1222', '', '0', '2018-09-29 11:02:51', '1500220062153819016191757727', null, '青石', '18846140810', '0.00', '0.01', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1197', '949', null, '5', '1', '1172', '', '1', '2018-09-29 12:57:55', '', null, '我名字', '13384255905', '0.00', '5.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1198', '948', null, '1', '0', '1223', '', '1', '2018-09-29 13:57:52', null, null, '栾正琨', '13047495186', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1199', '942', null, '1', '0', '1224', '', '0', '2018-09-29 14:05:19', null, null, '青石', '18846140810', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1200', '942', null, '1', '1', '1228', '', '1', '2018-09-29 14:30:28', '1500220062153820261973631560', null, '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '\"\"');
INSERT INTO `booking` VALUES ('1201', '945', null, '2', '1', '1228', '', '1', '2018-09-29 14:45:52', '1500220062153820354391916140', null, 'Man', '18846079302', '0.00', '0.20', '00000000.20', '', '\"\"');
INSERT INTO `booking` VALUES ('1205', '945', null, '1', '0', '1216', '', '1', '2018-09-29 14:48:34', null, null, 'Man', '18846079302', '0.00', '0.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1210', '942', null, '1', '1', '1231', '', '0', '2018-09-29 14:54:48', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1219', '0', '937', '5', '1', '1232', '', '2', '2018-09-29 16:27:31', '1500220062153820963569434355', null, 'skdk', '13384255905', '0.00', '0.05', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1220', '0', '937', '5', '1', '1232', '', '2', '2018-09-29 17:04:29', '1500220062153821185987268514', null, 'skdk', '13384255905', '0.00', '0.05', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1221', '0', '942', '1', '1', '1234', '', '2', '2018-09-29 17:29:33', '1500220062153821336452515958', null, '青石', '18846140810', '0.00', '12.00', '00000001.53', '', '\"\"');
INSERT INTO `booking` VALUES ('1222', '0', '937', '1', '1', '1195', null, '2', '2018-09-29 18:39:41', '', null, 'skdk', '', '0.00', '0.01', '00000000.00', '', '[\"\",\"\",2,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1223', '0', '937', '1', '1', '1195', null, '2', '2018-09-29 18:41:19', '', null, 'skdk', '', '0.00', '0.01', '00000000.00', '', '[\"\",\"\",2,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1224', '0', '937', '1', '1', '1195', null, '2', '2018-09-29 18:44:52', '1500220062153821788173065508', null, 'skdk', '', '0.00', '0.01', '00000000.01', '', '[\"\",\"\",2,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1225', '0', '942', '1', '1', '1233', null, '2', '2018-09-29 22:06:29', '1500220062153822997662791574', null, '青石', '18846140810', '0.00', '0.10', '00000000.10', '', '[\"\\u5218\\u5ef6\\u9f99\",\"18846140810\",1,\"37158486-\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1226', '946', null, '1', '1', '1220', '', '1', '2018-09-29 22:58:40', '1500220062153823309554277188', null, '舒瑶', '17745165119', '0.00', '0.01', '00000000.01', '', '\"\"');
INSERT INTO `booking` VALUES ('1227', '0', '937', '1', '1', '1195', null, '2', '2018-09-30 01:05:47', '', null, 'skdk', '', '0.00', '0.01', '00000000.00', '', '[\"\",\"\",2,\"\",\"\",\"\",\"\",\"\",\"\"]');
INSERT INTO `booking` VALUES ('1228', '0', '939', '1', '1', '1222', '', '2', '2018-09-30 07:16:45', '', null, '周一', '18846140510', '0.00', '0.01', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1229', '0', '942', '1', '1', '1237', '', '2', '2018-10-01 07:17:01', '1500220062153834941192660398', null, '青石', '18846140810', '1.50', '5.00', '00000003.50', '', '\"\"');
INSERT INTO `booking` VALUES ('1230', '939', null, '1', '1', '1237', '', '0', '2018-10-01 07:43:33', '', null, '周一', '18846140510', '0.00', '5.00', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1231', '942', null, '1', '1', '1239', '', '0', '2018-10-01 10:45:13', '1500220062153836190387318113', null, '青石', '18846140810', '0.00', '1.00', '00000001.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1232', '942', null, '1', '1', '1240', '', '0', '2018-10-01 12:11:07', '', null, '青石', '18846140810', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1233', '952', null, '1', '0', '1240', '', '0', '2018-10-01 12:12:27', null, null, '夏大雨', '13810458695', '0.00', '0.10', '00000000.00', '', '\"\"');
INSERT INTO `booking` VALUES ('1234', '939', null, '1', '1', '1240', '', '0', '2018-10-01 14:40:57', '', null, '周一', '18846140510', '0.00', '0.10', '00000000.00', '', '\"\"');

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
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss
-- ----------------------------
INSERT INTO `boss` VALUES ('290', '935', '2.0', '3,4,5', '08:00:00', '12:00:00', '13:00:00', '18:00:00', '24', '52a68cd290c939afa972a6af0a9834aa.jpg', 'aa60da19f88f2fce00b15e2f310b6e05.jpg', 'b973f1527ba5d45142230cad4626480e.jpg', '', '年终总结', null, '6', '44', '509', '辽宁省丹东市振兴区科技街10阿姐阿卡', '124.33866', '40.01755', '不能没客人', '哼哼唧唧', 'map_icon.png', '10', '10');
INSERT INTO `boss` VALUES ('291', '937', '0.5', '2,3,4,5', '08:00:00', '12:00:00', '14:00:00', '18:00:00', '0', '52339d148a96c2c48a0fd2d842f49e17.jpg', 'b392f2a53f4d3a5a7f69515acdbff0a1.jpg', '65c622c32789cae1652471a77b222f5b.jpg', '', 'shehjsjdhdhsjjwj', null, '6', '44', '512', '辽宁省丹东市东港市新兴路1号', '124.14562', '39.884644', '场馆123123', '场馆234', 'map_icon.png', '13', '13');
INSERT INTO `boss` VALUES ('292', '939', '2.0', '1,2,3,5,6,7', '08:00:00', '12:00:00', '14:00:00', '23:00:00', '0', '37d7eaec01d10e018b5986109d66c0f3.jpg', 'f185459a5c5b007d28a5335a45dbd6d0.jpg', '744e7e308f8fce381dd020049e228a91.jpg', '', '盟科瑜伽', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区宣化街573号', '126.66802883148', '45.772839246743', 'uno，狼人杀，三国杀，在你应该珍惜的时候学会别无所求', '【饮品】果茶免费\n【营业时间】24小时', 'map_icon.png', '31', '30,29,21');
INSERT INTO `boss` VALUES ('294', '946', '24.0', '1,2,3,4,5,6,7', '08:00:00', '12:00:00', '14:00:00', '18:00:00', '24', '9cbe105f0e7173c6841d8f9ee6e3b6ee.jpg', '48b0a073ba1335a0227029d206e776e7.jpg', '3e86d408572cb75a3f43c2c696d2afbb.jpg', '', '艺术馆', null, '8', '62', '643', '黑龙江省哈尔滨市南岗区世昌路与灵水路交叉口南50米', '126.6839', '45.77126', '适合团体聚会，可容纳20到30人', '这是一家艺术氛围浓厚的轰趴馆，让你身心放松', 'map_icon.png', '30', '30');

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
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1053', '935', '1', '是男是女是', '1', '0', '4', '2018-09-18 00:45:00', '2018-09-20 00:45:00', '6', '44', '509', '绿城紫金园(振兴区绿城紫金园科技街北)', '124.33866', '40.01755', '10', null, '2', '2', '0.1', '1', 'ffa1d0a9a7b97ab50112ba6697e0aae8.jpg,e6b2141042c0bebb70bf4952ad899c54.jpg,c3ec831340862eca821eccaacb07320e.jpg', '是男是女是', '2018-09-15 00:47:02', '0', '0', '1', '82', '试试', '18641502372');
INSERT INTO `event` VALUES ('1055', '0', '1', '；考虑考虑', '0', '0', '0', '2018-09-16 09:45:00', '2018-09-28 00:45:00', '6', '39', '461', '辽宁省沈阳市沈河区', '123.436498', '41.805331', '10', '-1,-1,-1,-1,-1,-1,-1,-1,-1', null, '2', '1.1', '1', 'events/1055_img1.png,events/1055_img2.png', '<p>现场感受到法国</p>', '2018-09-15 00:59:07', '0', '0', '0', '0', null, '123');
INSERT INTO `event` VALUES ('1056', '0', '1', '色认为儿女', '0', '0', '0', '2018-09-20 10:50:00', '2018-09-27 22:50:00', '6', '44', '509', '辽宁省丹东市振兴区的辅导辅导辅导辅导辅导辅导辅导辅导辅导辅导', '124.3849', '40.125382', '10', '1,0,-1,-1,-1,-1,-1,-1,-1', null, '2', '0.1', '1', 'events/1056_img1.png,events/1056_img2.png', '<p>是的发生的发</p>', '2018-09-15 01:01:12', '0', '0', '0', '71', null, '123123');
INSERT INTO `event` VALUES ('1059', '0', '1', '晒是的发送到', '0', '0', '3', '2018-09-16 08:00:00', '2018-09-20 18:00:00', '6', '44', '512', '辽宁省丹东市东港市', '124.15791', '39.878598', '48', '1,0,0,-1,-1,0,-1,-1,-1', null, '2', '0.8', '1', 'events/1059_img1.jpg,events/1059_img2.png,events/1059_img3.png', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/bf22cf7e6c66b0e0cba5f559163fda48bd7f61d7.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p>你好</p>', '2018-09-16 01:42:28', '0', '0', '1', '54', null, '32132132132');
INSERT INTO `event` VALUES ('1060', '940', '1', '足球', '1', '0', '0', '2018-09-17 10:52:00', '2018-09-17 10:52:00', '8', '62', '644', '哈尔滨市哈尔滨工程大学图书馆(南通大街145号)', '126.68760895729', '45.777029801931', '20', null, '8', '2', '0.9', '1', '763dad4cc9e95ec25158a3f61394f7f6.jpg', '足球', '2018-09-17 10:53:42', '0', '1', '0', '0', '周迪', '18045623295');
INSERT INTO `event` VALUES ('1061', '940', '1', '足球', '1', '0', '0', '2018-09-17 10:54:00', '2018-09-17 12:54:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68723210692', '45.777089664724', '20', null, '10', '2', '1', '1', 'b740dc008062ddb714fd3feed77f869c.jpg', '足球', '2018-09-17 10:55:13', '0', '1', '0', '4', '周迪', '18045623295');
INSERT INTO `event` VALUES ('1062', '0', '1', '这是个测试', '1', '0', '32', '2018-09-17 10:57:00', '2018-09-18 12:57:00', '1', '0', '0', '北京市海淀区颐和园路5号', '116.31025', '39.99287', '100', null, '1', '2', '0', '1', '3ac77ac64d0deac42702fd6204fc5e8d.jpg', '这是个测试', '2018-09-17 10:58:44', '0', '1', '0', '0', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1063', '939', '2', '茶话会', '1', '0', '32', '2018-09-18 20:47:00', '2018-09-18 22:47:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街145号哈工程大学', '126.66802883148', '45.772839246743', '12', null, '2', '2', '0', '1', '039927797c4179d407d43f796495b43a.jpg', '一起聊生活，做一个接纳的人', '2018-09-17 20:49:30', '0', '0', '0', '9', '周一', '18846140510');
INSERT INTO `event` VALUES ('1064', '942', '1', '这是个测试', '1', '0', '0', '2018-09-18 12:33:00', '2018-09-21 12:33:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68828', '45.77719', '100', null, '1', '2', '0', '1', '6f3b65561d3519c9368037b8d31220dc.jpg', '发布活动模板12\r\n哈哈哈哈', '2018-09-18 12:34:18', '0', '1', '0', '26', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1065', '935', '1', '拿着手机', '1', '0', '4', '2018-09-20 12:55:00', '2018-09-21 12:55:00', '6', '44', '509', '绿城紫金园(振兴区绿城紫金园科技街北)', '124.33866', '40.01755', '12', null, '2', '2', '0.01', '1', 'f3dde0713164b8de5ad92c2c8c4b9138.jpg', '在你这你在', '2018-09-18 12:55:46', '0', '0', '1', '8', '没啥', '18641502372');
INSERT INTO `event` VALUES ('1066', '935', '0', '说呢就', '1', '0', '5', '2018-09-18 13:05:00', '2018-11-18 13:05:00', '6', '44', '509', '学子园(丹东市振兴区科技街10号)', '124.33866', '40.01755', '123', null, '1', '1', '0', '1', '39d91bd3c894932a441b873753de179c.jpg', '在。找你', '2018-09-18 13:06:21', '0', '0', '0', '119', '没啥', '18641502372');
INSERT INTO `event` VALUES ('1067', '942', '1', '足球', '1', '0', '0', '2018-09-19 08:32:00', '2018-09-21 08:32:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68645', '45.77491', '100', null, '5', '1', '0', '1', 'a3ea08821581cbd3efdf70dead564d19.jpg', '发布活动模板12\r\n哈哈哈哈', '2018-09-19 08:33:12', '0', '1', '0', '3', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1068', '942', '1', '第二版测试', '1', '0', '30', '2018-09-21 10:05:00', '2018-09-21 14:05:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街145号哈尔滨工程大学内', '126.68426', '45.77426', '20', null, '1', '2', '0', '1', 'f65d6296c39d3a32cd1e03e705f23c00.jpg', '这是个测试\n测试一下软件是否好用', '2018-09-21 10:06:15', '0', '1', '0', '14', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1069', '942', '1', '测试', '1', '0', '1', '2018-09-21 10:34:00', '2018-09-22 10:34:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.688286', '45.777206', '10', null, '2', '1', '0.1', '1', 'd233f4e5e94ef7598cf427f56cc19d00.jpg', '这是个测试\n测试一下软件是否好用', '2018-09-21 10:35:09', '0', '1', '0', '13', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1073', '0', '1', '小丸子跑步', '0', '0', '15', '2018-09-27 00:30:00', '2018-09-26 00:55:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区', '126.681558', '45.777485', '2000', '1,1,1,0,-1,-1,-1,-1,-1', null, '2', '2', '1', 'events/1073_img1.jpg', '<p>很厚很厚</p><p><img src=\"https://www.fengteam.cn/backend_test/uploads/efb6741090718f9cec50d2634f7a57d1d4a20a28.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '2018-09-21 21:00:11', '0', '0', '0', '18', null, '18846140510');
INSERT INTO `event` VALUES ('1074', '0', '1', '哈尔滨蜂体网络科技有', '0', '0', '0', '2018-09-22 20:55:00', '2018-09-21 19:55:00', '8', '62', '649', '黑龙江省哈尔滨市', '126.625001', '45.989094', '122', '1,1,-1,-1,0,-1,-1,-1,-1', null, '2', '0.1', '1', 'events/1074_img1.jpg', '<p>这是个bugubugbug</p>', '2018-09-21 21:01:53', '0', '0', '0', '0', null, '18846140810');
INSERT INTO `event` VALUES ('1075', '939', '1', '桌游', '1', '0', '17', '2018-09-24 21:29:00', '2018-09-25 21:29:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街115号(文化公园大门对面,临近欧亚男科医院)', '126.66802883148', '45.772839246743', '500', null, '200', '2', '0.1', '1', '6e82c9ec38a085ca8e7ba0d3d051402a.jpg', '一起聊生活，做一个接纳的人', '2018-09-21 21:30:06', '0', '0', '1', '42', '周一', '18846140510');
INSERT INTO `event` VALUES ('1076', '937', '1', 'hidden', '1', '0', '3', '2018-09-22 01:58:00', '2018-09-24 01:58:00', '6', '44', '512', '辽宁省丹东市东港市东港南路192号', '124.14562', '39.884644', '5', null, '2', '1', '0.1', '0', '8da00f39a5c94cb33b3c474b3c0948f9.png,b633c703ad2f1295524aa26bfa92cafa.png', '发布活动模板12\r\n哈哈哈哈', '2018-09-22 02:01:34', '0', '0', '0', '0', 'sjdh', '13384255905');
INSERT INTO `event` VALUES ('1077', '935', '0', '隐私活动', '1', '0', '2', '2018-10-22 09:47:00', '2018-11-22 09:47:00', '6', '44', '509', '青橙小酒馆(振兴区绿城紫金园文庆路南)', '124.33866', '40.01755', '10', null, '1', '1', '1.5', '0', 'b74fe7ebc3f2cf66dcd334033ab4c9fc.jpg', 'zzn', '2018-09-22 09:48:01', '0', '0', '0', '0', '没啥', '18641502372');
INSERT INTO `event` VALUES ('1078', '0', '1', '发生过很多风格', '0', '0', '6', '2018-09-24 10:25:00', '2018-09-29 14:30:00', '6', '44', '509', '辽宁省丹东市振兴区是的发送到发', '124.381678', '40.120706', '10', '1,-1,0,-1,-1,-1,-1,-1,-1', null, '2', '1.1', '1', 'events/1078_img1.jpg', '<p>阿道夫</p>', '2018-09-22 10:08:21', '0', '0', '1', '74', null, '12312312312');
INSERT INTO `event` VALUES ('1098', '942', '1', '测试', '1', '0', '0', '2018-09-23 14:21:00', '2018-09-24 14:21:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区东大直街1号(哈尔滨工程大学对面)', '126.66883', '45.78021', '100', null, '10', '1', '0.1', '1', '18a83f71eb40eab6414748635d4d0eac.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-22 14:22:03', '0', '1', '0', '4', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1099', '942', '1', '测试', '1', '0', '0', '2018-09-23 14:22:00', '2018-09-24 14:22:00', '8', '62', '643', '哈尔滨文化公园(哈尔滨市南岗区)', '126.66751', '45.78126', '1002', null, '10', '1', '0.1', '1', '5991f6f37c30a196e8ae33148c5c3b8a.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-22 14:22:48', '0', '1', '0', '3', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1100', '942', '1', '测试', '1', '0', '0', '2018-09-24 14:23:00', '2018-09-25 16:23:00', '8', '62', '643', '黑龙江省冰上训练中心(哈尔滨市南岗区)', '126.66985', '45.781322', '1000', null, '10', '1', '0.1', '1', '8432b2e280f08e7f3837e3c670c3e122.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-22 14:23:53', '0', '1', '0', '14', '刘延龙', '18846140810');
INSERT INTO `event` VALUES ('1101', '0', '1', '金斌', '0', '0', '0', '2018-09-23 02:40:00', '2018-09-26 02:40:00', '6', '44', '509', '辽宁省丹东市振兴区', '124.341931', '40.144708', '10', '1,0,0,0,-1,-1,-1,-1,-1', null, '1', '20', '1', 'events/1101_img1.png,events/1101_img2.png,events/1101_img3.png', '<p>你好 我给你关于篮球比赛赛事</p><p><img src=\"https://www.fengteam.cn/backend_test/uploads/d3e23fad715659d29a3ae1b2318bca96c6bb813d.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><h1><strong><u>this is test detail</u></strong></h1>', '2018-09-23 02:44:43', '0', '0', '0', '79', null, '12312312312');
INSERT INTO `event` VALUES ('1102', '937', '1', '我的活动', '1', '0', '2', '2018-09-23 21:05:00', '2018-09-24 10:05:00', '6', '44', '512', '辽宁省丹东市东港市东港南路188号', '124.14562', '39.884644', '10', null, '2', '2', '0.1', '1', '0cc3d681536ba3254aa49f81d6ae55d3.png,3fb144ff35ca91a199b5983ba55f2eea.png', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-23 20:06:42', '0', '0', '0', '6', 'sjdh', '13384255905');
INSERT INTO `event` VALUES ('1103', '937', '1', '短啊患得', '1', '0', '3', '2018-09-23 20:27:00', '2018-09-23 20:31:00', '6', '44', '512', '辽宁省丹东市东港市育才街8号', '124.14562', '39.884644', '15', null, '2', '2', '0.1', '1', 'e9039864bcc625cebc8ecc47bf3d4838.jpg,7535505324be4c13ecaf1874e5068adf.jpg', '山东就休息计算机\n啊就是好\n', '2018-09-23 20:30:56', '0', '0', '0', '1', 'sjdh', '13384255905');
INSERT INTO `event` VALUES ('1104', '937', '1', '接电话电', '1', '0', '4', '2018-09-23 20:31:00', '2018-09-23 20:36:00', '6', '44', '512', '辽宁省丹东市东港市育才街8号', '124.14562', '39.884644', '15', null, '2', '2', '0.1', '1', '30aed4d99808e31f287c14e555e31a7b.jpg,1a7e94ab06901a8020655cca1c56a8b7.jpg', '【比赛时间】\n【比赛地点】\n东莞方法\n【对手】\n【球衣颜色】\n【备注】', '2018-09-23 20:33:38', '0', '0', '0', '2', 'sjdh', '13384255905');
INSERT INTO `event` VALUES ('1105', '935', '1', '是你说', '1', '0', '5', '2018-09-23 22:41:00', '2018-09-23 22:41:00', '6', '44', '509', '绿城紫金园(振兴区绿城紫金园科技街北)', '124.33866', '40.01755', '10', null, '1', '1', '0.01', '1', '01f2884da4b24ff9a3a1ee7f7a34d64d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-23 22:44:20', '0', '0', '0', '0', '没啥', '18641502372');
INSERT INTO `event` VALUES ('1106', '942', '1', '测试', '1', '0', '0', '2018-09-24 09:45:00', '2018-09-28 09:45:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区北海路与西海路交叉口东南200米', '126.6774', '45.77854', '1000', null, '10', '2', '0.1', '1', 'cd47a122d9f25c1308a0ab8905a3ebff.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-24 09:47:29', '0', '1', '0', '18', '青石', '18846140810');
INSERT INTO `event` VALUES ('1107', '0', '1', '哈佳铁路', '0', '0', '18', '2018-09-29 10:00:00', '2018-09-28 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区', '126.68119', '45.777155', '1333', '1,1,1,-1,-1,1,-1,-1,-1', null, '1', '0', '1', 'events/1107_img1.jpg', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/be73f4ee5e87342cdb723def6116afb91149ec92.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p>一起运动呀~</p>', '2018-09-24 10:13:08', '0', '0', '0', '7', null, '18846140510');
INSERT INTO `event` VALUES ('1108', '0', '1', '学子杯比赛', '1', '0', '32', '2018-09-30 12:00:00', '2018-09-28 12:10:00', '8', '74', '780', '哈尔滨工程大学军工操场东侧', '124.439751', '51.640993', '1000', '1,1,0,0,0,0,0,0,0', null, '2', '0.1', '1', '', '<p><strong>这是一次值得大家参加的比赛。</strong></p><p><strong><u>希望大家踊跃参与。</u></strong></p><p><strong><sup><span style=\"font-family: Impact,Charcoal,sans-serif;\">比赛时间</span></sup></strong></p><p><span class=\"fr-emoticon fr-deletable fr-emoticon-img\" style=\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f604.svg);\">&nbsp;</span>&nbsp;</p><p><br></p><p><img src=\"https://www.fengteam.cn/backend_test/uploads/dd0798fd0c5baa68bf8a9dab8dde6d45ed8908ac.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '2018-09-24 12:13:08', '0', '0', '0', '0', null, '18846140810');
INSERT INTO `event` VALUES ('1109', '0', '1', '这是场比赛', '0', '0', '32', '2018-09-30 12:00:00', '2018-09-28 12:00:00', '8', '62', '659', '黑龙江省哈尔滨市南岗区哈尔滨工程大学军工操场', '128.39792', '44.860546', '1000', '1,1,0,0,-1,-1,-1,-1,-1', null, '2', '0.1', '1', 'events/1109_img1.jpg', '<p><strong>这是一次值得大家参加的比赛。</strong></p><p><strong><u>希望大家踊跃参与。</u></strong></p><p><strong><sup>比赛时间</sup></strong></p><p>&nbsp;&nbsp;</p><p><br></p><p><img src=\"https://www.fengteam.cn/backend_test/uploads/dd0798fd0c5baa68bf8a9dab8dde6d45ed8908ac.jpg\" class=\"fr-fic fr-dii\"></p>', '2018-09-24 12:16:03', '0', '0', '0', '13', null, '18846140810');
INSERT INTO `event` VALUES ('1110', '942', '1', '这是个测试', '1', '0', '26', '2018-09-25 09:01:00', '2018-09-27 09:01:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号图书馆', '126.68753', '45.77601', '1000', null, '10', '2', '0', '1', '1b9c8c18bff6d163e05219c71c5051d6.jpg,20d4d24679d0d495b47c4ccc99817366.jpg,5068162609a32cce134aaf13b1fb9818.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-25 09:02:17', '0', '1', '0', '24', '青石', '18846140810');
INSERT INTO `event` VALUES ('1111', '945', '1', '健身', '1', '0', '19', '2018-09-25 09:09:00', '2018-09-25 17:09:00', '8', '62', '643', '哈尔滨工程大学学生第三公寓(南岗区)', '126.683815', '45.772015', '99', null, '2', '1', '0', '1', '526d8c3052c856853b15e0bd02b978f1.jpg', 'test', '2018-09-25 09:11:40', '0', '1', '0', '19', '杨', '18846079302');
INSERT INTO `event` VALUES ('1112', '948', '1', '测试', '1', '0', '5', '2018-09-25 09:14:00', '2018-09-25 09:14:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学电工电子实验教学中心', '126.68228', '45.77613', '6', null, '2', '1', '0', '1', '0e3a21f41383b83433ca25054693bae7.jpg', '哈哈哈哈', '2018-09-25 09:16:03', '0', '1', '0', '0', '233', '13047495186');
INSERT INTO `event` VALUES ('1113', '0', '1', '这是个测试赛事活动比', '0', '0', '32', '2018-10-01 12:00:00', '2018-09-30 12:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街145号哈尔滨工程大学61号楼3015', '126.652021', '45.75723', '1000', '1,1,-1,0,0,1,0,0,0', null, '2', '0.1', '1', 'events/1113_img1.jpg,events/1113_img2.jpg,events/1113_img3.jpg', '<p><strong>一、&nbsp;主办单位</strong></p><p>中国田径协会</p><p>北京市体育局</p><p><strong>二、&nbsp;联合主办单位</strong></p><p>中央电视台</p><p><strong>三、&nbsp;承办单位</strong></p><p>中奥路跑（北京）体育管理有限公司</p><p>北京市体育竞赛管理中心</p><p><strong>四、&nbsp;协办单位</strong></p><p>北京市委宣传部、北京市公安局（北京市公安局治安管理总队、北京市公安局公安交通管理局）、北京市卫生和计划生育委员会、北京市环保局、北京市城市管理委员会、北京市交通委员会、天安门地区管理委员会、北京市气象局、共青团北京市委员会、北京市无线电管理局、北京奥林匹克公园管理委员会、北京市城市道路养护管理中心、北京公共交通控股（集团）有限公司、北京市地铁运营有限公司、北京市电力公司、北京城市副中心投资建设集团、北京体育大学</p><p><strong>五、&nbsp;备案单位</strong></p><p>国际田径联合会</p><p>国际马拉松和公路跑协会</p><p><strong>六、&nbsp;比赛日期与时间</strong></p><p>2018年9月16日星期日上午7:30</p><p><strong>七、&nbsp;比赛项目及规模</strong></p><p>马拉松（42.195公里）</p><p>参赛规模30000人</p><p><strong>八、&nbsp;比赛组别</strong></p><p>男子马拉松</p><p>女子马拉松</p><p><strong>九、&nbsp;比赛路线</strong></p><p>（一）起点：天安门广场</p><p>（二）终点：奥林匹克公园景观大道中心区庆典广场</p><p>比赛路线沿途经过东城区、西城区、海淀区、朝阳区</p><p><strong>十、&nbsp;竞赛办法</strong></p><p>（一）所有参赛选手须按照中国田径协会审定的国际田联最新竞赛规则和本届比赛规程执行。参加冠军赛的中国田协注册运动员还须按照全国马拉松冠军赛规程执行。</p><p>（二）比赛检录：所有选手须正确佩戴本届赛事号码布。大众选手至少在赛前60分钟到达指定区域进行检录集结。特邀运动员、参加冠军赛的中国田协注册运动员须在赛前40分钟到天安门广场纪念碑南侧专门检录区进行检录, 特邀运动员出示护照或身份证件原件，注册运动员提交注册卡。</p><p>（三）起跑顺序：按特邀运动员、冠军赛运动员和大众选手（按个人成绩分区站位）顺序延后排列，各区域间距10米。非竞速轮椅选手须在大众选手分区站位最尾端出发。</p><p>（四）发令：采用一枪发令同时起跑的办法。</p><p>（五）计时办法</p><p>1、本次比赛采用感应计时并为所有参赛选手提供计时芯片。芯片将在参赛物品领取现场与号码布同时发放，不收取押金。</p><p>2、本次比赛在起点、每5公里点、21.0975公里点、折返点和终点设有计时毯，计时芯片将在参赛选手通过起点计时毯开始计时。选手在跑进过程中，均须通过所有的计时毯。在关门时间内完成比赛但缺少任何一个计时点的成绩，将不予排名，非获奖选手的成绩排名以净计时为准。</p><p>（六）赛时分段关门与时间：为了保证参赛选手赛时安全，比赛路线将按公里点位置设置分段关门时间，分路段、分时对社会交通进行临时管制。关门时间按自然时间计算，关门时间到后，相应公里点的计时毯停止工作，相应路段将恢复社会交通。未跑到相应公里点的选手须退出赛道，以免发生危险。退出赛道的选手可到路线沿途就近的收容站搭乘收容车，或自行选乘公共交通到终点取衣。</p><p>赛时分段关门时间见下表：</p><table width=\"273\"><tbody><tr><td valign=\"center\" width=\"138\">公里点<br></td><td valign=\"top\" width=\"134\">关门时间<br></td></tr><tr><td valign=\"center\" width=\"138\">5公里<br></td><td valign=\"top\" width=\"134\">8:25<br></td></tr><tr><td valign=\"center\" width=\"138\">10公里<br></td><td valign=\"top\" width=\"134\">9:00<br></td></tr><tr><td valign=\"center\" width=\"138\">15公里<br></td><td valign=\"top\" width=\"134\">9:40<br></td></tr><tr><td valign=\"center\" width=\"138\">20公里<br></td><td valign=\"top\" width=\"134\">10:20<br></td></tr><tr><td valign=\"center\" width=\"138\">25公里&nbsp;<br></td><td valign=\"top\" width=\"134\">11:00<br></td></tr><tr><td valign=\"center\" width=\"138\">30公里<br></td><td valign=\"top\" width=\"134\">11:45<br></td></tr><tr><td valign=\"center\" width=\"138\">35公里<br></td><td valign=\"top\" width=\"134\">12:35<br></td></tr><tr><td valign=\"center\" width=\"138\">40公里<br></td><td valign=\"top\" width=\"134\">13:20<br></td></tr><tr><td valign=\"center\" width=\"138\">终 &nbsp;点<br></td><td valign=\"top\" width=\"134\">13:45<br></td></tr></tbody></table><p>（七）存取衣</p><p>比赛当日，参赛选手需在起点指定区域凭本届赛事号码布寄存个人物品，危险物品及液体禁止带入起点。选手不要将贵重物品存放在包内（如手机、有效证件、现金、各种钥匙、信用卡、电子产品等），如发生损坏或遗失，后果由选手本人承担。起点存衣服务将于鸣枪前15分钟截止，请选手提前合理安排时间。</p><p>比赛当日，参赛选手需在14:45前到终点指定区域领取寄存物品。如当日超过领取时间没有领取，可凭本届赛事号码布于赛后一周内到赛事组委会领取，否则组委会将按无人认领处理。</p><p>（八）饮料、饮水、用水、能量补给站</p><table width=\"489\"><tbody><tr><td valign=\"center\" width=\"140\">公里点<br></td><td valign=\"top\" width=\"117\">饮料/饮水站<br></td><td valign=\"center\" width=\"117\">饮水/用水站<br></td><td valign=\"top\" width=\"115\">能量补给站<br></td></tr><tr><td valign=\"center\" width=\"140\">5公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">7.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">10公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">12.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">15公里&nbsp;<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">17.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">20公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">22.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">25公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">27.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">30公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr><tr><td valign=\"center\" width=\"140\">32.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">35公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">37.5公里<br></td><td valign=\"top\" width=\"117\"><br></td><td valign=\"center\" width=\"117\">&radic;<br></td><td valign=\"top\" width=\"115\">&radic;<br></td></tr><tr><td valign=\"center\" width=\"140\">40公里<br></td><td valign=\"top\" width=\"117\">&radic;<br></td><td valign=\"center\" width=\"117\"><br></td><td valign=\"top\" width=\"115\"><br></td></tr></tbody></table><p>（九）卫生间、喷淋与环境保护</p><p>1、组委会在起点、比赛路线沿途（2公里至5公里每间隔1公里、7.5公里至40公里每间隔2.5公里）及终点设置移动卫生间。</p><p>2、组委会在13公里、18.5公里、23.5公里、28.5公里、31.5公里、33.5公里、35.5公里、37公里、39.5公里、41.5公里点附近设置喷淋设备。</p><p>3、参赛选手在起点、比赛路线沿途及终点非卫生间区域不得随地便溺，不得随意丢弃任何包装纸、瓶罐和垃圾，应将其投入垃圾箱内，共同保护环境。</p><p>（十）医疗救护</p><p>1、组委会在起点、比赛路线沿途（自5公里开始每间隔2.5公里）及终点设立固定医疗站；医疗站工作人员有权根据选手状况判断并中止其继续参加比赛。如参赛选手不听从医护人员建议，坚持参赛产生的一切后果及责任，由选手本人承担。</p><p>2、组委会在比赛路线沿途设置AED移动医疗救护服务。</p><p>3、组委会在比赛路线沿途及终点设置医疗服务点及志愿者协助救护，参赛选手可随时向他们请求帮助。</p><p>（十一）本次比赛将按照国际田联及中国田径协会的规定对参赛选手进行兴奋剂检查。</p><p>（十二）有关竞赛的其它具体要求和安排，请查阅《官方手册》。</p><p><strong>十一、参加办法</strong></p><p>（一）参赛选手年龄要求:比赛当年年满20岁（1998年12月31日以前出生）。</p><p>（二）参赛选手身体状况要求</p><p>马拉松是一项高负荷、大强度、长距离的竞技运动，也是一项高风险的竞技项目，对参赛者身体状况有较高的要求，参赛者应身体健康，有长期参加跑步锻炼的基础并完成过半程马拉松距离以上的训练或比赛。有以下身体状况者不宜参加比赛:</p><p>1、先天性心脏病和风湿性心脏病;</p><p>2、高血压和脑血管疾病;</p><p>3、心肌炎和其他心脏病;</p><p>4、冠状动脉病和严重心律不齐；</p><p>5、血糖过高或过低的糖尿病;</p><p>6、比赛日前两周以内患感冒；</p><p>7、其它不适合运动的疾病；</p><p>8、孕妇。</p><p>（三）本次比赛参赛资格获取将采用抽签方式确定，具体报名方式、报名流程及相关信息请查阅北京马拉松官方网站的《报名须知》。</p><p>（四）报名费</p><p>1、中国籍报名者（含港、澳、台）:200元人民币/人</p><p>2、外国籍报名者:50美元/人</p><p>组委会确认获得参赛资格的选手，报名费将不予返还。</p><p>（五）参赛物品领取</p><p>1、获得参赛资格后，组委会将通知选手查询参赛号码并下载领物单。</p><p>2、获得参赛资格的选手，赛前请到北京马拉松博览会领取参赛物品，《领物须知》将于赛前在北京马拉松官方网站发布。</p>', '2018-09-25 09:19:53', '0', '0', '0', '20', null, '18846140810');
INSERT INTO `event` VALUES ('1114', '947', '1', '健身房打卡——今日练背', '1', '0', '19', '2018-09-25 14:00:00', '2018-09-25 16:00:00', '8', '62', '643', '哈尔滨工程大学16公寓前健身房', '126.68616', '45.771763', '4', null, '1', '2', '5', '1', '738a15f344a3417179685b8892ce04ca.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-25 10:18:25', '0', '1', '0', '12', '杨毅', '18846046148');
INSERT INTO `event` VALUES ('1115', '937', '1', '胡就到家', '1', '0', '4', '2018-09-25 11:45:00', '2018-09-25 12:00:00', '6', '44', '512', '辽宁省丹东市东港市育才街8', '124.14562', '39.884644', '10', null, '2', '1', '0', '1', 'f97cca4f5dff69a06d68b085ce68d4f7.jpg,c6063b82d6df1e69092392923825b7cc.jpg', '随机打劫大家', '2018-09-25 11:38:33', '0', '0', '0', '4', 'sjdh', '13384255905');
INSERT INTO `event` VALUES ('1116', '943', '0', '狼人杀', '1', '0', '11', '2022-09-26 15:15:00', '2024-09-25 15:15:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学电工电子实验教学中心', '126.68228074908', '45.776130916957', '12', null, '2', '2', '0.01', '1', '69ac803f799992e79aee2fc4b261b5c7.jpg', '一起来狼人杀', '2018-09-25 15:17:43', '0', '1', '0', '29', '预言家', '17603602906');
INSERT INTO `event` VALUES ('1117', '935', '0', '备注和取消活动功能', '1', '0', '3', '2018-09-29 18:50:00', '2018-10-25 18:50:00', '6', '44', '509', '林园海鲜家常菜(丹东市振兴区)', '124.33866', '40.01755', '10', null, '1', '1', '0', '1', '7c4318ed346dda0a1b77351371c3ace5.jpg', '你在哪住', '2018-09-25 18:51:13', '0', '0', '0', '77', '没啥', '18641502372');
INSERT INTO `event` VALUES ('1118', '942', '0', '这是另外一个测试', '1', '0', '0', '2018-10-26 08:31:00', '2018-11-26 08:31:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.6883', '45.7772', '1000', null, '10', '2', '0', '1', '62d24ffbdd9d24eb4870476698a3025d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】红色还是白色\n【备注】', '2018-09-26 08:32:25', '0', '1', '0', '22', '青石', '18846140810');
INSERT INTO `event` VALUES ('1119', '0', '1', '这是个测试赛事', '0', '0', '0', '2018-10-06 08:20:00', '2018-10-01 00:00:00', '8', '62', '642', '黑龙江省哈尔滨市南岗区南通大街145号哈尔滨工程大学61号楼3015', '126.622694', '45.777275', '10000', '1,1,1,1,1,1,1,1,1', null, '2', '0.1', '1', 'events/1119_img1.png', '<p><br></p><p><br></p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p><br></p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p><br></p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p><br></p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p><p>这是个测试赛事的活动</p>', '2018-09-26 08:49:20', '0', '0', '0', '17', null, '18846140810');
INSERT INTO `event` VALUES ('1120', '945', '1', '登山', '1', '0', '18', '2018-09-26 08:56:00', '2018-09-27 00:56:00', '26', '53', '575', '西藏自治区日喀则市定日县扎西宗乡北峰', '86.91182', '28.02148', '99', null, '3', '1', '0', '1', '62d0d29704705946c340c5ac622ba743.jpg', '勇攀高峰', '2018-09-26 09:00:01', '0', '1', '0', '0', '杨', '18846079302');
INSERT INTO `event` VALUES ('1121', '943', '1', '', '1', '0', '1', '2018-09-26 09:01:00', '2018-09-26 09:01:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街258号', '126.66581600904', '45.776760418568', '10', null, '3', '1', '1', '1', 'a08c8b491e52066e72b3c9cdf84c070d.jpg', '一起打篮球', '2018-09-26 09:02:56', '0', '1', '0', '0', '淘淘', '17603602906');
INSERT INTO `event` VALUES ('1122', '946', '1', '学习局', '1', '0', '31', '2018-09-26 09:07:00', '2018-09-26 09:07:00', '8', '62', '643', '哈尔滨工程大学逸夫馆(哈尔滨市南岗区)', '126.6839', '45.77126', '109', null, '109', '2', '0', '1', '94f12284f0f0689b32c76641c6b3ef46.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】\n', '2018-09-26 09:09:48', '0', '0', '0', '0', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1123', '946', '0', '修身养性', '1', '0', '12', '2018-09-26 09:11:00', '2018-10-07 09:11:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学', '126.6839', '45.77126', '100', null, '5', '2', '0', '1', 'bdd29c163de85e4fd3ac86dec69a7dbc.jpg', '留得残荷听雨声', '2018-09-26 09:14:51', '0', '0', '0', '16', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1124', '945', '1', '哈哈哈', '1', '0', '9', '2018-09-26 09:13:00', '2018-09-26 09:13:00', '8', '63', '664', '黑龙江省齐齐哈尔市铁锋区站前大街136号', '123.99609', '47.34063', '1000', null, '10', '2', '0.1', '1', '2f0cb4f2893c54b4c42278c660736798.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-26 09:14:54', '0', '1', '0', '0', '几', '18846079302');
INSERT INTO `event` VALUES ('1151', '0', '1', '这又是一次测试', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-01 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街145号哈尔滨工程大学军工操场', '126.652021', '45.75723', '1000', '1,1,0,0,0,0,0,0,0', null, '2', '0.1', '1', 'events/1151_img1.jpg', '<p>无聊的测试</p>', '2018-09-26 10:18:27', '0', '0', '0', '28', null, '18846140810');
INSERT INTO `event` VALUES ('1152', '942', '0', '又是一个测试', '1', '0', '6', '2018-09-26 12:05:00', '2018-10-09 12:05:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68828', '45.777203', '1000', null, '10', '1', '0.1', '1', '7792cdb3dc14faae6c37455be4be0c4c.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】你踢\n\n【备注】\n牛骨\n你踢\n\n一', '2018-09-26 12:06:01', '0', '1', '0', '7', '青石', '18846140810');
INSERT INTO `event` VALUES ('1153', '942', '1', '测试', '1', '0', '0', '2018-09-26 13:50:00', '2018-09-29 13:50:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68829', '45.777206', '10000', null, '10', '2', '0', '1', 'd0f3afde497e18da5d667df36deb38a1.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-26 13:50:53', '0', '1', '0', '9', '青石', '18846140810');
INSERT INTO `event` VALUES ('1154', '0', '0', '赛事测试111', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-05 00:00:00', '8', '62', '648', '黑龙江省哈尔滨市松北区', '126.534752', '45.806016', '1000', '1,1,-1,-1,-1,-1,-1,-1,-1', null, '2', '0', '1', 'events/1154_img1.jpg', '<p>测试</p>', '2018-09-26 13:51:57', '0', '0', '0', '0', null, '18846140810');
INSERT INTO `event` VALUES ('1156', '0', '0', '赛事测试111222', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-05 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区', '126.652021', '45.75723', '1000', '-1,-1,-1,-1,-1,-1,-1,-1,-1', null, '2', '0', '1', 'events/1155_img1.jpg', '<p>测试</p>', '2018-09-26 13:52:17', '0', '0', '0', '4', null, '18846140810');
INSERT INTO `event` VALUES ('1157', '0', '0', '这是个测试赛事，，，', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-05 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨体育学院', '126.677687', '45.760485', '10000', '1,1,1,-1,-1,-1,-1,-1,-1', null, '2', '0', '1', 'events/1157_img1.jpg', '<p>测试。。。。。。。。。。</p>', '2018-09-26 14:11:10', '0', '0', '0', '5', null, '18846140810');
INSERT INTO `event` VALUES ('1158', '0', '0', '赛事。。。。', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-06 00:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区', '126.677771', '45.760703', '1000', '1,1,1,-1,-1,-1,-1,-1,-1', null, '2', '0', '1', 'events/1158_img1.jpg', '<p>测试一下</p>', '2018-09-26 16:00:51', '0', '0', '0', '22', null, '18846140810');
INSERT INTO `event` VALUES ('1159', '942', '0', '测试一下', '1', '0', '0', '2018-09-26 16:04:00', '2018-10-15 16:04:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68829', '45.777157', '10002', null, '1002', '1', '0', '1', '759060e01b9a52b2ef3db2039781b9c7.jpg', '【比赛时间】\n【比赛地点】\n【对手】追他\n追\n【球衣颜色】\n【备注】\n修路这个影响一一打野\n后缀名\n新会\n工作经验', '2018-09-26 16:05:16', '0', '1', '0', '7', '青石', '18846140810');
INSERT INTO `event` VALUES ('1160', '942', '0', '测试一下', '1', '0', '0', '2018-09-26 16:17:00', '2018-10-28 18:17:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68829', '45.77721', '1000', null, '15', '2', '0', '1', 'b587464153fa3e844875964f9564c3b0.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】\n\n\n', '2018-09-26 16:18:21', '0', '1', '0', '5', '青石', '18846140810');
INSERT INTO `event` VALUES ('1161', '942', '1', '天天测试', '1', '0', '2', '2018-09-27 16:21:00', '2018-09-30 16:21:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.688286', '45.77714', '1000', null, '10', '2', '0', '1', '7c4f3068528333bf59b8f1b54ce82a78.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-26 16:22:21', '0', '1', '0', '4', '青石', '18846140810');
INSERT INTO `event` VALUES ('1167', '0', '1', '培训12', '0', '1', '2', '2018-09-27 08:00:00', '2018-09-29 12:00:00', '6', '44', '512', '辽宁省丹东市东港市东港市教育局', '124.149224', '39.885828', '5', '1,0,0,-1,-1,-1,-1,-1,-1', null, '1', '1', '1', 'events/1167_img1.png,events/1167_img2.jpg,events/1167_img3.png', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/9e429020bbe1fcf5f78e6d53f8e853bb1f20c533.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p>爱丽丝的看法</p>', '2018-09-27 01:07:17', '0', '0', '0', '12', null, '12312312312');
INSERT INTO `event` VALUES ('1168', '942', '1', '再来个测试', '1', '0', '0', '2018-09-28 09:20:00', '2018-09-30 09:20:00', '8', '62', '643', '家欣旅馆(哈尔滨市南岗区平准街37)', '126.671974', '45.758335', '1000', null, '1', '1', '0', '1', '209569bdd5dc7a7c980224546e13b440.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 09:21:17', '0', '1', '0', '18', '青石', '18846140810');
INSERT INTO `event` VALUES ('1169', '942', '1', '继续测试', '1', '0', '6', '2018-09-28 09:21:00', '2018-09-30 09:21:00', '8', '62', '643', '家欣旅馆(哈尔滨市南岗区平准街37)', '126.67195', '45.758324', '1000', null, '12', '1', '0', '1', 'd79de229585aea3abf6b3f9ad77209f6.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 09:22:01', '0', '1', '0', '12', '青石', '18846140810');
INSERT INTO `event` VALUES ('1170', '945', '1', '鲨鱼', '1', '0', '32', '2018-09-28 10:57:00', '2018-09-29 10:57:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.68828', '45.77716', '99', null, '3', '1', '0', '1', '384087810925977f9802fc92fb5eaa4f.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 10:58:48', '0', '1', '0', '5', '嘻嘻嘻', '18846079302');
INSERT INTO `event` VALUES ('1171', '943', '1', '我', '1', '0', '0', '2018-09-28 11:09:00', '2018-09-29 11:01:00', '8', '62', '644', '哈尔滨市哈尔滨工程大学图书馆(南通大街145号)', '126.68822452426', '45.777300119344', '29', null, '2', '0', '0', '1', '26ff146add096489b1097790555e8d82.jpg', '足球', '2018-09-27 11:03:17', '0', '1', '1', '18', '我', '17603602906');
INSERT INTO `event` VALUES ('1172', '949', '1', '活动测', '1', '0', '3', '2018-09-27 14:16:00', '2018-09-29 10:57:00', '6', '44', '512', '辽宁省丹东市东港市东港路15号', '124.14847', '39.88733', '1000', null, '5', '2', '1', '1', 'f38b369325e5b39b665ad98e7d5ed2e9.jpg,f11e7d045b24cfd9aecdfa62783625d7.jpg,09044d834593bea129864208841ab282.jpg', '【比赛时间】\n【比赛地点】\n【对手】辉丰股份过\n【球衣颜色】\n【备注】', '2018-09-27 14:00:06', '0', '1', '0', '12', '我名字', '13384255905');
INSERT INTO `event` VALUES ('1173', '942', '1', '这是个活动', '1', '0', '2', '2018-09-27 17:16:00', '2018-09-27 17:16:00', '8', '62', '643', '哈尔滨文化公园(哈尔滨市南岗区)', '126.673386', '45.77818', '1000', null, '10', '1', '0', '1', 'ec3e4f5a045a1e3d317bfd3b134e7dbe.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 17:16:58', '0', '1', '0', '0', '青石', '18846140810');
INSERT INTO `event` VALUES ('1174', '946', '0', '吸猫', '1', '0', '32', '2018-09-27 17:17:00', '2018-11-27 13:20:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区世昌路与灵水路交叉口南50米', '126.6839', '45.77126', '10', null, '2', '2', '0', '1', 'f019b48e0ec80b1e83da589ea79771c8.jpg', '模板吗', '2018-09-27 17:19:58', '0', '0', '0', '22', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1175', '939', '1', '喝茶', '1', '0', '21', '2018-09-27 22:00:00', '2018-09-27 22:21:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街115号(文化公园大门对面,临近欧亚男科医院)', '126.66802883148', '45.772839246743', '500', null, '200', '2', '0', '1', '3d69b2c35e7726aea2c26ca19f3a0530.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 20:16:11', '0', '0', '0', '14', '周一', '18846140510');
INSERT INTO `event` VALUES ('1176', '950', '1', '跑起来', '1', '0', '16', '2018-09-27 20:50:00', '2018-09-29 20:50:00', '1', '0', '0', 'IN北京(北京市通州区兴贸一街12号院)', '116.57809', '39.76635', '5', null, '2', '1', '0', '1', '33e649cf3cef8346df1a100f35c5b3f7.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 20:52:50', '0', '1', '0', '0', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1177', '950', '1', '跑起来', '1', '0', '16', '2018-09-27 20:54:00', '2018-09-29 20:54:00', '1', '0', '0', 'IN北京(北京市通州区兴贸一街12号院)', '116.57809', '39.766354', '10', null, '2', '1', '0', '1', '8c4cc40e89cdcc20e2f982782f55445d.jpg', '哈哈哈哈哈哈', '2018-09-27 20:55:40', '0', '1', '0', '0', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1178', '950', '1', '跑起来', '1', '0', '16', '2018-09-27 20:56:00', '2018-09-27 20:56:00', '1', '0', '0', 'IN北京(北京市通州区兴贸一街12号院)', '116.57829', '39.76636', '10', null, '1', '1', '0', '1', 'f18e167ccde20ca744ebe93db22c0a6a.jpg', '还好还好哈', '2018-09-27 20:57:08', '0', '1', '0', '0', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1179', '950', '1', '跑起来', '1', '0', '16', '2018-09-27 20:58:00', '2018-09-30 20:58:00', '1', '0', '0', 'IN北京(北京市通州区兴贸一街12号院)', '116.57808', '39.76635', '10', null, '1', '1', '0', '1', '9c97c5993a7da9117cc93c533c9bfb48.jpg', '哈哈哈', '2018-09-27 20:59:19', '0', '1', '0', '1', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1180', '942', '1', '这是个测试', '1', '0', '16', '2018-09-27 21:03:00', '2018-09-30 21:03:00', '8', '62', '643', '哈尔滨文化公园(南岗区)', '126.67342', '45.778206', '1000', null, '1', '1', '0', '1', '468075a32d80c2c353fb84d4f63810bb.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-27 21:04:06', '0', '1', '0', '26', '青石', '18846140810');
INSERT INTO `event` VALUES ('1181', '950', '1', '试一下', '1', '0', '3', '2018-09-27 21:03:00', '2018-09-29 21:03:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区中兴右街', '126.57794', '45.706852', '10', null, '2', '1', '0', '1', 'c5e6dded7f0ecd14e15d7c2c3d24b963.jpg', '哈哈', '2018-09-27 21:04:48', '0', '1', '0', '15', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1182', '942', '1', '天天测试', '1', '0', '5', '2018-09-29 07:28:00', '2018-09-30 07:28:00', '8', '62', '643', '哈尔滨文化公园(哈尔滨市南岗区)', '126.67343', '45.7782', '1000', null, '10', '1', '0', '1', '3bef243467dab079f2cdf8ee364df0d6.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 07:28:50', '0', '1', '1', '12', '青石', '18846140810');
INSERT INTO `event` VALUES ('1183', '946', '0', '好好学习', '1', '0', '31', '2018-09-28 09:06:00', '2019-09-28 09:06:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区世昌路与灵水路交叉口南50米', '126.6839', '45.77126', '100', null, '10', '2', '0', '1', '4292f4dd9082b73aea4288f487345732.jpg,13ff2ca5d31f6d01b0e8c852ee50a688.jpg,0c9e53a483ae55c7f8f2df8300a7a65d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】\n', '2018-09-28 09:08:40', '0', '0', '0', '21', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1184', '937', '0', 'Sjfh', '1', '0', '3', '2018-09-30 09:22:00', '2018-10-10 09:22:00', '6', '44', '512', '辽宁省丹东市东港市育才街8号', '124.14562', '39.884644', '50', null, '2', '2', '0.5', '1', 'ddf28295c2525a543ba07cd02a646d49.jpg,74deb55fa8ecd44da01e259ddf813095.jpg', '【比赛时间】\n【比赛地点】sjdjfjdj \n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 09:24:43', '0', '0', '1', '15', 'skdk', '13384255905');
INSERT INTO `event` VALUES ('1185', '937', '0', 'Cesh ', '1', '0', '0', '2018-09-28 09:24:00', '2018-10-05 09:24:00', '6', '44', '512', '辽宁省丹东市东港市新兴路1号', '124.14562', '39.884644', '100', null, '4', '2', '1', '1', '414da3669f33db6320082cda8b79307d.jpg,a47da19d8e6cd3f3507f7f2be512fa5f.jpg', 'Skdjfjjddjjdjjdjfjfs ', '2018-09-28 09:26:04', '0', '0', '0', '18', 'skdk', '13384255905');
INSERT INTO `event` VALUES ('1186', '942', '1', '测试蜂蜜', '1', '0', '6', '2018-09-28 10:10:00', '2018-09-28 10:24:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.688286', '45.777184', '1000', null, '10', '2', '0', '1', 'b06e9673333873a7d825026e98d810ed.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 10:10:58', '0', '1', '0', '2', '青石', '18846140810');
INSERT INTO `event` VALUES ('1187', '939', '1', '哦', '1', '0', '2', '2018-09-28 10:14:00', '2018-09-28 10:19:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区宣化街573号', '126.66802883148', '45.772839246743', '2000', null, '100', '2', '0', '1', 'faec6a8d1a85c8d24b955f0373405807.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 10:11:03', '0', '0', '0', '23', '周一', '18846140510');
INSERT INTO `event` VALUES ('1188', '942', '1', '花钱退款测试', '1', '0', '3', '2018-09-29 10:59:00', '2018-09-30 10:59:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.688286', '45.777184', '100', null, '10', '2', '0.1', '1', '4ceadc0347d1fe00f16d70e0ae3a8e5c.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 10:59:56', '0', '1', '1', '15', '青石', '18846140810');
INSERT INTO `event` VALUES ('1189', '946', '0', '学习学习再学习', '1', '0', '18', '2018-09-29 11:15:00', '2018-10-07 11:15:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区世昌路与灵水路交叉口南50米', '126.6839', '45.77126', '10', null, '1', '1', '0.1', '1', 'f99624ee8caccbd79e539707bcc4177f.jpg', '这是一个和学校相关的', '2018-09-28 11:18:17', '0', '0', '0', '1', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1190', '947', '1', '腿', '1', '0', '19', '2018-09-29 10:00:00', '2018-09-29 12:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学16栋哈尔滨工程大学16公寓附近', '126.685875', '45.7714', '10', null, '2', '1', '0.1', '1', 'ea009f886abaf3295b1e2004d9cd3727.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 11:20:04', '0', '1', '0', '8', '杨毅', '18846046148');
INSERT INTO `event` VALUES ('1191', '943', '0', '对方', '1', '0', '1', '2018-10-03 00:31:00', '2018-10-05 11:31:00', '8', '62', '643', '哈尔滨市船舶电子大世界(哈尔滨市南岗区)', '126.66676014662', '45.776108468031', '8', null, '2', '1', '0.1', '1', '81a9cae52a4fea8ef14579ee6531d24a.jpg', '一起打篮球', '2018-09-28 11:32:25', '0', '1', '0', '7', '我', '17603602906');
INSERT INTO `event` VALUES ('1192', '945', '0', '三国杀', '1', '0', '21', '2018-09-30 11:59:00', '2018-10-07 11:59:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68564', '45.77784', '16', null, '1', '1', '0.01', '1', '7dac9c8cac7c7ed6d8cf57f7592e716b.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 12:01:25', '0', '1', '0', '21', 'Man', '18846079302');
INSERT INTO `event` VALUES ('1193', '950', '1', '跑起来', '1', '0', '16', '2018-09-28 12:01:00', '2018-09-30 12:01:00', '1', '0', '0', '京东集团总部(大兴区科创十一街18号院)', '116.56291', '39.786236', '10', null, '2', '1', '0', '1', '22b980841e68d6c26c0afe6a9ac39daf.jpg', '哈哈哈哈', '2018-09-28 12:02:56', '0', '1', '0', '9', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1194', '949', '1', '234', '1', '0', '2', '2018-09-28 13:45:00', '2018-09-28 16:45:00', '6', '44', '512', '辽宁省丹东市东港市东港南路188号', '124.15209', '39.86172', '234', null, '2', '1', '1', '1', 'b973a494ee645f3ffe2e44a03a88a84b.gif', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 13:47:22', '0', '1', '0', '12', '我名字', '13384255905');
INSERT INTO `event` VALUES ('1195', '0', '1', '赛事432', '0', '0', '0', '2018-09-29 08:40:00', '2018-09-30 13:00:00', '6', '44', '512', '辽宁省丹东市东港市东港市教育局', '124.149911', '39.885894', '23', '-1,-1,-1,-1,-1,-1,-1,-1,-1', null, '2', '0.01', '1', 'events/1195_img1.gif,events/1195_img2.gif', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/1edf31bb11aee9b4f8eaab7518ac79ec9b4cb5c1.gif\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p>234234234</p>', '2018-09-28 13:52:36', '0', '0', '0', '22', null, '12312312312');
INSERT INTO `event` VALUES ('1196', '942', '1', '动图测试', '1', '0', '2', '2018-09-29 14:24:00', '2018-09-30 14:24:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68753', '45.77601', '1000', null, '10', '1', '0', '1', 'fc91fea196eb854449c2c93c4d73d313.gif', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 14:24:55', '0', '1', '1', '24', '青石', '18846140810');
INSERT INTO `event` VALUES ('1197', '950', '1', '哈哈哈', '1', '0', '4', '2018-09-28 14:31:00', '2018-09-30 14:31:00', '1', '0', '0', '京东集团总部(大兴区科创十一街18号院)', '116.56291', '39.786236', '11', null, '1', '1', '0', '1', 'f3e53a806964cee89fd183217fd7d491.jpg', '哈哈哈\n', '2018-09-28 14:33:18', '0', '1', '0', '3', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1198', '950', '1', '这个不萌', '1', '0', '3', '2018-09-28 14:47:00', '2018-09-30 14:47:00', '1', '0', '0', '京东集团总部(大兴区科创十一街18号院)', '116.56291', '39.786236', '10', null, '1', '1', '0', '1', '64c33a23ab419e410305d34dea200c8b.gif', '哈哈', '2018-09-28 14:48:14', '0', '1', '0', '8', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1204', '942', '1', '蜂蜜测试', '1', '0', '5', '2018-09-28 16:51:00', '2018-09-28 16:53:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.688255', '45.77725', '1000', null, '1', '1', '0', '1', '41424708f4add3e7ab44080b55424dfc.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 16:54:11', '0', '1', '0', '0', '青石', '18846140810');
INSERT INTO `event` VALUES ('1205', '942', '1', '蜂蜜测试', '1', '0', '7', '2018-09-28 16:55:00', '2018-09-28 16:59:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68753', '45.77601', '1000', null, '10', '1', '0', '1', '8217954949788f5e68d09fa877bf32fc.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 16:56:05', '0', '1', '0', '4', '青石', '18846140810');
INSERT INTO `event` VALUES ('1206', '942', '1', '照片大小测试', '1', '0', '6', '2018-09-28 16:58:00', '2018-09-28 17:05:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.688286', '45.77715', '1000', null, '10', '1', '0', '1', 'd9fc0ac983cb2ef1b3ec2f0da1786537.jpg,b76cf22562ec3e6576633e9e5ca7f435.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 17:01:48', '0', '1', '0', '2', '青石', '18846140810');
INSERT INTO `event` VALUES ('1207', '0', '0', '动图赛事', '0', '0', '0', '2018-10-06 17:00:00', '2018-10-06 23:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区', '126.652021', '45.75723', '1000', '1,1,-1,-1,-1,-1,-1,-1,-1', null, '1', '0.1', '1', 'events/1207_img1.gif', '<p>.........</p>', '2018-09-28 17:05:32', '0', '0', '0', '2', null, '18846140810');
INSERT INTO `event` VALUES ('1208', '942', '1', '动图', '1', '0', '5', '2018-09-28 17:06:00', '2018-09-29 19:06:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.688286', '45.777172', '1000', null, '10', '2', '0', '1', '762c2677a2d33ea0e4547ddf18978649.gif', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 17:08:20', '0', '1', '0', '11', '青石', '18846140810');
INSERT INTO `event` VALUES ('1209', '942', '1', '动图大', '1', '0', '6', '2018-09-28 17:11:00', '2018-09-29 19:11:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.688255', '45.777164', '1000', null, '1', '1', '0', '1', 'f22a594d1297a05e2ea4be45ceaa03e5.gif', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 17:12:41', '0', '1', '0', '10', '青石', '18846140810');
INSERT INTO `event` VALUES ('1210', '942', '1', '？？？', '1', '0', '7', '2018-09-29 18:55:00', '2018-09-30 19:55:00', '8', '62', '644', '哈尔滨工程大学图书馆(南通大街145号)', '126.6883', '45.77721', '10002', null, '100', '1', '0', '1', 'b317184f640a7b793e03d22e309ad00d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 18:55:58', '0', '1', '1', '3', '青石', '18846140810');
INSERT INTO `event` VALUES ('1211', '950', '1', '对对对', '1', '0', '4', '2018-09-28 20:59:00', '2018-09-30 20:59:00', '1', '0', '0', 'IN北京(北京市通州区兴贸一街12号院)', '116.57784', '39.76628', '10', null, '1', '1', '0', '1', '87a8f7087f3daee398f2383325f0be54.gif', '哈哈', '2018-09-28 21:00:44', '0', '1', '0', '1', '徐海涛', '18519196546');
INSERT INTO `event` VALUES ('1212', '939', '1', '好', '1', '0', '0', '2018-09-28 09:07:00', '2018-09-29 10:07:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街115号(文化公园大门对面,临近欧亚男科医院)', '126.66802883148', '45.772839246743', '2', null, '2', '1', '0', '1', 'f1487c16133f41547447b98cbb455565.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 21:12:40', '0', '0', '0', '1', '周一', '18846140510');
INSERT INTO `event` VALUES ('1213', '939', '1', '这', '1', '0', '4', '2018-09-25 19:15:00', '2018-09-28 21:15:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街115号(文化公园大门对面,临近欧亚男科医院)', '126.66802883148', '45.772839246743', '80', null, '8', '2', '200', '1', '78a452bb908589844905abbac902ccdc.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 21:16:47', '0', '0', '0', '0', '周一', '18846140510');
INSERT INTO `event` VALUES ('1214', '939', '1', '是羁绊', '1', '0', '3', '2018-09-25 21:17:00', '2018-09-29 21:17:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区东大直街1号(哈尔滨工程大学对面)', '126.66802883148', '45.772839246743', '500', null, '25', '2', '2', '1', '00365de4b00efde10b158c350c955f5c.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-28 21:18:00', '0', '0', '0', '4', '周一', '18846140510');
INSERT INTO `event` VALUES ('1215', '942', '1', '最新的测试', '1', '0', '4', '2018-09-29 08:20:00', '2018-09-30 09:20:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68827', '45.777203', '1000', null, '102', '1', '0', '1', '16c294e66a350278e5c89535a3dacd19.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 08:20:52', '0', '1', '0', '5', '青石', '18846140810');
INSERT INTO `event` VALUES ('1216', '942', '1', '测试花钱', '1', '0', '8', '2018-09-30 08:30:00', '2018-09-30 08:30:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.688286', '45.777184', '1000', null, '10', '1', '0', '1', '08e9b5b663931bb243ec00b58c353e28.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 08:30:44', '0', '1', '1', '2', '青石', '18846140810');
INSERT INTO `event` VALUES ('1217', '942', '1', '你花钱了吗', '1', '0', '7', '2018-09-30 08:30:00', '2018-09-30 08:30:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68753', '45.77601', '1000', null, '10', '1', '0.1', '1', '64d86023cad401c269ea2e10747b276f.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 08:31:22', '0', '1', '1', '25', '青石', '18846140810');
INSERT INTO `event` VALUES ('1218', '948', '1', '啦啦啦', '1', '0', '0', '2018-09-29 08:33:00', '2018-09-29 08:33:00', '8', '62', '643', '哈尔滨工程大学国际交流中心(南岗区)', '126.68796', '45.77291', '555', null, '5', '2', '0', '1', '19de0946b1f420f6a1beb091c03bec8a.jpg,7427b8819494b0e76f9a92b1a84e88f6.jpg', '哈哈哈哈', '2018-09-29 08:34:54', '0', '1', '0', '0', '233', '13047495186');
INSERT INTO `event` VALUES ('1219', '948', '1', '啦啦啦', '1', '0', '3', '2018-09-29 08:35:00', '2018-09-29 08:35:00', '8', '62', '643', '哈尔滨工程大学国际交流中心(南岗区)', '126.68792', '45.772903', '55', null, '5', '2', '0.01', '1', '6ab0a86a1adb09fe62dc760ef16d9082.jpg,c84d83e18f200c41fb89439885243b6f.jpg,2b7e563256bb67531d7c92ec02b2d7de.jpg', '哈哈哈哈', '2018-09-29 08:36:36', '0', '1', '0', '0', '栾正琨', '13047495186');
INSERT INTO `event` VALUES ('1220', '948', '1', '卡路里', '1', '0', '4', '2018-09-29 08:37:00', '2018-09-30 08:37:00', '8', '62', '643', '哈尔滨工程大学国际交流中心(南岗区)', '126.68792', '45.772926', '55', null, '5', '2', '0.01', '1', '74e946a2484706aab4ca298a4f8ff073.jpg', '哈哈哈哈', '2018-09-29 08:38:10', '0', '1', '0', '7', '栾正琨', '13047495186');
INSERT INTO `event` VALUES ('1221', '947', '1', '练完放假！！！', '1', '0', '19', '2018-10-01 18:40:00', '2018-10-01 18:40:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学16栋哈尔滨工程大学16公寓附近', '126.685875', '45.7714', '20', null, '5', '2', '0.1', '1', 'ab6826b481a706075d5ffaa638e93750.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 08:43:39', '0', '1', '1', '15', '杨毅', '18846046148');
INSERT INTO `event` VALUES ('1222', '945', '0', '吃鸡', '1', '0', '8', '2018-10-01 09:28:00', '2018-10-04 09:28:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区松鹤路', '126.68069', '45.77151', '33', null, '1', '1', '0.01', '1', 'a61d4ab4f2778b5d44b61cdb0fd02706.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 09:30:57', '0', '1', '1', '6', 'Man', '18846079302');
INSERT INTO `event` VALUES ('1223', '942', '1', '时间测试', '1', '0', '5', '2018-09-30 10:54:00', '2018-09-30 10:54:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68753', '45.77601', '1000', null, '10', '1', '0', '1', 'db03af54a1a1768fb362c0b903e84df3.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 10:55:44', '0', '1', '1', '6', '青石', '18846140810');
INSERT INTO `event` VALUES ('1224', '942', '0', '时间', '1', '0', '7', '2018-09-30 10:59:00', '2018-10-30 10:59:00', '8', '62', '644', '黑龙江省哈尔滨市南岗区南通大街145号', '126.68753', '45.77601', '1000', null, '10', '1', '0', '1', '3dd0666aa3b3ad6f97b3f23adec2c54f.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 10:59:55', '0', '1', '1', '12', '青石', '18846140810');
INSERT INTO `event` VALUES ('1226', '942', '1', '测试', '1', '0', '0', '2018-09-30 14:27:00', '2018-10-01 14:27:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街97号(哈尔滨鸟语林动物园)', '126.67254', '45.77881', '1000', null, '10', '1', '0', '1', '75b80ba7e4fdf8b09505e8e15f2e530d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 14:27:39', '0', '1', '0', '3', '青石', '18846140810');
INSERT INTO `event` VALUES ('1227', '942', '1', '收费测试', '1', '0', '0', '2018-09-29 14:29:00', '2018-09-29 15:29:00', '8', '62', '643', '哈尔滨文化公园(哈尔滨市南岗区)', '126.67337', '45.778202', '1000', null, '100', '1', '0', '1', '6ad0972a92ba321b64339ca13db59d2f.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 14:29:37', '0', '1', '0', '1', '青石', '18846140810');
INSERT INTO `event` VALUES ('1228', '942', '1', '收费', '1', '0', '0', '2018-09-29 14:29:00', '2018-09-30 14:29:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区东大直街1号(哈尔滨工程大学对面)', '126.66883', '45.78021', '1000', null, '10', '1', '0.1', '1', '6c976ada3e022893997edd21950c1759.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 14:30:12', '0', '1', '0', '7', '青石', '18846140810');
INSERT INTO `event` VALUES ('1229', '945', '1', '回忆', '1', '0', '7', '2018-09-29 14:39:00', '2018-09-29 14:39:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈西西城红场7楼', '126.59106', '45.70265', '200', null, '3', '1', '0.01', '1', '06fb4e9f746900091e929630f1dcb4f8.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 14:43:45', '0', '1', '0', '0', 'Man', '18846079302');
INSERT INTO `event` VALUES ('1230', '945', '1', '吃饭吗', '1', '0', '7', '2018-09-29 14:44:00', '2018-09-30 14:44:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈西西城红场7楼', '126.59106', '45.70265', '33', null, '1', '1', '0.01', '1', '1327e326eb83a2c534fa2ea07023bf00.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 14:45:09', '0', '1', '0', '1', 'Man', '18846079302');
INSERT INTO `event` VALUES ('1231', '943', '0', '你是谁在一起玩游戏玩手机游戏网易游戏', '1', '0', '1', '2018-09-30 14:50:00', '2018-10-30 14:50:00', '8', '62', '643', '哈尔滨市哈尔滨工程大学(南岗区南通大街145号)', '126.67435616255', '45.777371206059', '8', null, '2', '1', '0.1', '1', '65ab53b0a1484e2e181aa5ab0f6e5d72.jpg', '我是', '2018-09-29 14:51:43', '0', '1', '1', '5', '你', '17603602906');
INSERT INTO `event` VALUES ('1232', '937', '0', '测试测', '1', '0', '3', '2018-09-30 15:32:00', '2018-10-05 15:32:00', '6', '44', '512', '辽宁省丹东市东港市育才街8', '124.14562', '39.884644', '50', null, '5', '1', '0.01', '1', 'a82ba74d897e5940ccf1c19879390089.jpg,9638f96202977d88b8e08e72cb355f2b.jpg,7a3ec896ce3d8b8e93a6110375176f2e.jpg', '【比赛时间】\n【比赛地点】四等奖的军事基地\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 15:35:40', '0', '0', '0', '39', 'skdk', '13384255905');
INSERT INTO `event` VALUES ('1233', '0', '0', '这是个赛事', '0', '0', '0', '2018-10-06 00:00:00', '2018-10-06 15:00:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区哈尔滨工程大学', '126.681632', '45.776638', '1000', '1,1,1,1,-1,-1,-1,-1,-1', null, '2', '0.1', '1', 'events/1233_img1.jpg', '<p>测一下赛事</p>', '2018-09-29 15:51:29', '0', '0', '0', '7', null, '18846140810');
INSERT INTO `event` VALUES ('1234', '942', '0', '花钱', '1', '0', '0', '2018-10-29 17:28:00', '2018-10-29 17:28:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区东大直街1号(哈尔滨工程大学对面)', '126.66883', '45.78021', '1000', null, '10', '1', '12', '1', '49bf34c1faea50cfad05e61c5ea873d5.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-29 17:29:15', '0', '1', '0', '8', '青石', '18846140810');
INSERT INTO `event` VALUES ('1235', '946', '0', 'rua仓鼠', '1', '0', '32', '2018-09-29 22:54:00', '2018-10-29 22:54:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区世昌路与灵水路交叉口南50米', '126.6839', '45.77126', '5', null, '1', '1', '1', '1', 'aeaeb589a611017b50e17aa57a7b289a.jpg', '这是一个和学校相关的', '2018-09-29 22:55:47', '0', '0', '0', '4', '舒瑶', '17745165119');
INSERT INTO `event` VALUES ('1236', '939', '1', '在', '1', '0', '3', '2018-09-30 08:15:00', '2018-09-30 23:15:00', '8', '62', '643', '黑龙江省哈尔滨市南岗区南通大街97号(哈尔滨鸟语林动物园)', '126.66802883148', '45.772839246743', '50', null, '5', '2', '1', '1', '165d21bf6a381c9fcac8fcfce05d4103.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-09-30 07:15:59', '0', '0', '0', '7', '周一', '18846140510');
INSERT INTO `event` VALUES ('1237', '942', '0', '花钱测试', '1', '0', '10', '2018-10-02 07:15:00', '2018-10-04 07:15:00', '1', '0', '0', '柳芳北里西区(北京市朝阳区柳芳街)', '116.43437', '39.95658', '1000', null, '10', '1', '5', '1', '2dc8948b46ebb4dd13338a945e06669e.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-10-01 07:16:42', '0', '1', '0', '8', '青石', '18846140810');
INSERT INTO `event` VALUES ('1238', '939', '1', '活动', '1', '0', '5', '2018-10-01 08:06:00', '2018-10-01 08:06:00', '1', '0', '0', '北京市朝阳区天达路15号院', '126.66802883148', '45.772839246743', '500', null, '10', '2', '1', '1', '4dc956d411ecdfa56276daed622675ec.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-10-01 08:07:29', '0', '0', '0', '0', '周一', '18846140510');
INSERT INTO `event` VALUES ('1239', '939', '0', '活动', '1', '0', '7', '2018-10-01 08:09:00', '2018-11-01 08:09:00', '1', '62', '643', '北京市朝阳区天达路15号院', '126.66802883148', '45.772839246743', '50', null, '2', '2', '1', '1', 'ce040f75e00af4aeb6677e4ea822e9d4.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-10-01 08:09:52', '0', '0', '0', '11', '周一', '18846140510');
INSERT INTO `event` VALUES ('1240', '942', '0', '大懒猫', '1', '0', '0', '2018-10-03 12:09:00', '2018-10-05 12:09:00', '1', '0', '0', '安华西里三区18号院(朝阳区安华路附近)', '116.401436', '39.966274', '1000', null, '10', '2', '0.1', '1', '2d0fbecb1fe7be03c725d8f0afc4995d.jpg', '【比赛时间】\n【比赛地点】\n【对手】\n【球衣颜色】\n【备注】', '2018-10-01 12:10:45', '0', '1', '0', '19', '青石', '18846140810');

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
) ENGINE=InnoDB AUTO_INCREMENT=2227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_share
-- ----------------------------
INSERT INTO `event_share` VALUES ('2190', '937', '1053', '1', null);
INSERT INTO `event_share` VALUES ('2191', '937', '1056', '1', null);
INSERT INTO `event_share` VALUES ('2192', '939', '1063', '1', null);
INSERT INTO `event_share` VALUES ('2193', '942', '1064', '2', null);
INSERT INTO `event_share` VALUES ('2194', '939', '1064', '1', null);
INSERT INTO `event_share` VALUES ('2195', '942', '1068', '2', null);
INSERT INTO `event_share` VALUES ('2196', '942', '1098', '1', null);
INSERT INTO `event_share` VALUES ('2197', '942', '1106', '1', null);
INSERT INTO `event_share` VALUES ('2198', '942', '1075', '1', null);
INSERT INTO `event_share` VALUES ('2199', '942', '1100', '1', null);
INSERT INTO `event_share` VALUES ('2200', '947', '1075', '1', null);
INSERT INTO `event_share` VALUES ('2201', '947', '1114', '1', null);
INSERT INTO `event_share` VALUES ('2202', '946', '1110', '1', null);
INSERT INTO `event_share` VALUES ('2203', '942', '1113', '1', null);
INSERT INTO `event_share` VALUES ('2204', '943', '1116', '1', null);
INSERT INTO `event_share` VALUES ('2205', '946', '1116', '1', null);
INSERT INTO `event_share` VALUES ('2206', '937', '1066', '2', null);
INSERT INTO `event_share` VALUES ('2207', '942', '1118', '1', null);
INSERT INTO `event_share` VALUES ('2208', '945', '1119', '1', null);
INSERT INTO `event_share` VALUES ('2209', '946', '1123', '1', null);
INSERT INTO `event_share` VALUES ('2210', '942', '1151', '1', null);
INSERT INTO `event_share` VALUES ('2211', '942', '1175', '1', null);
INSERT INTO `event_share` VALUES ('2212', '942', '1168', '1', null);
INSERT INTO `event_share` VALUES ('2213', '942', '1180', '1', null);
INSERT INTO `event_share` VALUES ('2214', '946', '1183', '1', null);
INSERT INTO `event_share` VALUES ('2215', '939', '1187', '1', null);
INSERT INTO `event_share` VALUES ('2216', '950', '1193', '2', null);
INSERT INTO `event_share` VALUES ('2217', '945', '1192', '1', null);
INSERT INTO `event_share` VALUES ('2218', '942', '1196', '1', null);
INSERT INTO `event_share` VALUES ('2219', '950', '1198', '1', null);
INSERT INTO `event_share` VALUES ('2220', '942', '1205', '1', null);
INSERT INTO `event_share` VALUES ('2221', '942', '1217', '1', null);
INSERT INTO `event_share` VALUES ('2222', '947', '1221', '1', null);
INSERT INTO `event_share` VALUES ('2223', '942', '1223', '1', null);
INSERT INTO `event_share` VALUES ('2224', '942', '1224', '1', null);
INSERT INTO `event_share` VALUES ('2225', '942', '1237', '1', null);
INSERT INTO `event_share` VALUES ('2226', '942', '1240', '2', null);

-- ----------------------------
-- Table structure for event_type
-- ----------------------------
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exchange
-- ----------------------------

-- ----------------------------
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `boss_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES ('494', '935', '935');
INSERT INTO `favourite` VALUES ('503', '946', '939');
INSERT INTO `favourite` VALUES ('506', '947', '946');
INSERT INTO `favourite` VALUES ('507', '947', '939');
INSERT INTO `favourite` VALUES ('508', '943', '946');
INSERT INTO `favourite` VALUES ('510', '946', '946');
INSERT INTO `favourite` VALUES ('513', '942', '939');
INSERT INTO `favourite` VALUES ('514', '942', '946');
INSERT INTO `favourite` VALUES ('515', '950', '939');
INSERT INTO `favourite` VALUES ('516', '951', '939');
INSERT INTO `favourite` VALUES ('523', '939', '939');
INSERT INTO `favourite` VALUES ('524', '945', '939');
INSERT INTO `favourite` VALUES ('525', '945', '946');

-- ----------------------------
-- Table structure for favourite_event
-- ----------------------------
DROP TABLE IF EXISTS `favourite_event`;
CREATE TABLE `favourite_event` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite_event
-- ----------------------------
INSERT INTO `favourite_event` VALUES ('697', '937', '1056');
INSERT INTO `favourite_event` VALUES ('700', '937', '1059');
INSERT INTO `favourite_event` VALUES ('705', '937', '1053');
INSERT INTO `favourite_event` VALUES ('706', '939', '1063');
INSERT INTO `favourite_event` VALUES ('707', '942', '1064');
INSERT INTO `favourite_event` VALUES ('708', '939', '1064');
INSERT INTO `favourite_event` VALUES ('709', '942', '1067');
INSERT INTO `favourite_event` VALUES ('710', '942', '1068');
INSERT INTO `favourite_event` VALUES ('711', '942', '1069');
INSERT INTO `favourite_event` VALUES ('712', '939', '1069');
INSERT INTO `favourite_event` VALUES ('713', '935', '1078');
INSERT INTO `favourite_event` VALUES ('716', '942', '1106');
INSERT INTO `favourite_event` VALUES ('717', '942', '1107');
INSERT INTO `favourite_event` VALUES ('718', '942', '1075');
INSERT INTO `favourite_event` VALUES ('719', '942', '1111');
INSERT INTO `favourite_event` VALUES ('720', '942', '1113');
INSERT INTO `favourite_event` VALUES ('721', '947', '1075');
INSERT INTO `favourite_event` VALUES ('722', '942', '1114');
INSERT INTO `favourite_event` VALUES ('723', '946', '1075');
INSERT INTO `favourite_event` VALUES ('724', '946', '1110');
INSERT INTO `favourite_event` VALUES ('725', '939', '1113');
INSERT INTO `favourite_event` VALUES ('726', '943', '1106');
INSERT INTO `favourite_event` VALUES ('727', '942', '1116');
INSERT INTO `favourite_event` VALUES ('728', '942', '1119');
INSERT INTO `favourite_event` VALUES ('729', '942', '1118');
INSERT INTO `favourite_event` VALUES ('730', '942', '1152');
INSERT INTO `favourite_event` VALUES ('731', '942', '1151');
INSERT INTO `favourite_event` VALUES ('732', '942', '1158');
INSERT INTO `favourite_event` VALUES ('733', '942', '1171');
INSERT INTO `favourite_event` VALUES ('734', '942', '1168');
INSERT INTO `favourite_event` VALUES ('735', '942', '1175');
INSERT INTO `favourite_event` VALUES ('736', '942', '1180');
INSERT INTO `favourite_event` VALUES ('737', '942', '1187');
INSERT INTO `favourite_event` VALUES ('738', '939', '1209');
INSERT INTO `favourite_event` VALUES ('739', '942', '1217');
INSERT INTO `favourite_event` VALUES ('740', '942', '1233');
INSERT INTO `favourite_event` VALUES ('741', '939', '1236');
INSERT INTO `favourite_event` VALUES ('742', '939', '1240');

-- ----------------------------
-- Table structure for favourite_feedback
-- ----------------------------
DROP TABLE IF EXISTS `favourite_feedback`;
CREATE TABLE `favourite_feedback` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `feedback_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite_feedback
-- ----------------------------
INSERT INTO `favourite_feedback` VALUES ('721', '937', '175');
INSERT INTO `favourite_feedback` VALUES ('724', '942', '178');
INSERT INTO `favourite_feedback` VALUES ('725', '943', '182');
INSERT INTO `favourite_feedback` VALUES ('731', '946', '182');
INSERT INTO `favourite_feedback` VALUES ('734', '939', '184');
INSERT INTO `favourite_feedback` VALUES ('747', '947', '184');
INSERT INTO `favourite_feedback` VALUES ('748', '947', '187');
INSERT INTO `favourite_feedback` VALUES ('750', '947', '186');
INSERT INTO `favourite_feedback` VALUES ('752', '942', '191');
INSERT INTO `favourite_feedback` VALUES ('753', '948', '191');
INSERT INTO `favourite_feedback` VALUES ('759', '942', '184');
INSERT INTO `favourite_feedback` VALUES ('762', '939', '191');
INSERT INTO `favourite_feedback` VALUES ('763', '947', '195');
INSERT INTO `favourite_feedback` VALUES ('764', '942', '198');
INSERT INTO `favourite_feedback` VALUES ('765', '950', '200');

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
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('175', '1056', '937', 'nihao', '2018-09-15 01:03:01', '0', '0', null);
INSERT INTO `feedback` VALUES ('176', '1056', '935', '只能说你是', '2018-09-15 01:03:21', '1', '0', '175');
INSERT INTO `feedback` VALUES ('177', '1056', '937', 'haode', '2018-09-15 01:03:29', '1', '0', '175');
INSERT INTO `feedback` VALUES ('178', '1064', '942', '这是什么活动？', '2018-09-18 12:34:37', '0', '0', null);
INSERT INTO `feedback` VALUES ('179', '1064', '942', '什么活动？', '2018-09-18 12:34:51', '1', '0', '178');
INSERT INTO `feedback` VALUES ('180', '1064', '939', '什么', '2018-09-18 12:50:56', '0', '0', null);
INSERT INTO `feedback` VALUES ('181', '1064', '939', '什么', '2018-09-18 12:51:06', '1', '0', '178');
INSERT INTO `feedback` VALUES ('182', '1068', '943', '不错', '2018-09-21 10:29:45', '0', '0', null);
INSERT INTO `feedback` VALUES ('183', '1068', '943', '留言', '2018-09-21 10:30:01', '1', '0', '182');
INSERT INTO `feedback` VALUES ('184', '1075', '939', '来呀', '2018-09-21 21:30:49', '0', '0', null);
INSERT INTO `feedback` VALUES ('185', '1075', '939', '万物哦呀', '2018-09-21 21:31:06', '1', '0', '184');
INSERT INTO `feedback` VALUES ('186', '1111', '946', '٩( \'ω\' )و ', '2018-09-25 09:28:37', '0', '0', null);
INSERT INTO `feedback` VALUES ('187', '1075', '947', '带带我', '2018-09-25 10:22:41', '0', '0', null);
INSERT INTO `feedback` VALUES ('188', '1075', '947', 'ok', '2018-09-25 10:23:52', '1', '0', '184');
INSERT INTO `feedback` VALUES ('189', '1075', '947', '嗯', '2018-09-25 10:24:05', '1', '0', '187');
INSERT INTO `feedback` VALUES ('190', '1111', '942', '嗨', '2018-09-25 10:25:57', '1', '0', '186');
INSERT INTO `feedback` VALUES ('191', '1116', '942', '杀', '2018-09-25 15:20:26', '0', '0', null);
INSERT INTO `feedback` VALUES ('192', '1116', '948', '杀', '2018-09-25 15:23:59', '0', '0', null);
INSERT INTO `feedback` VALUES ('193', '1075', '942', '你自己你自己你是个好人噢你嘻嘻猪你一句闺蜜照你一天一追寻牛骨', '2018-09-25 15:25:29', '0', '0', null);
INSERT INTO `feedback` VALUES ('194', '1116', '939', ' Biu ~', '2018-09-25 22:46:48', '1', '0', '191');
INSERT INTO `feedback` VALUES ('195', '1106', '947', '1', '2018-09-27 20:44:34', '0', '0', null);
INSERT INTO `feedback` VALUES ('196', '1106', '947', '1', '2018-09-27 20:44:47', '0', '0', null);
INSERT INTO `feedback` VALUES ('197', '1106', '947', '2', '2018-09-27 20:44:52', '1', '0', '196');
INSERT INTO `feedback` VALUES ('198', '1181', '939', '是', '2018-09-27 21:09:26', '0', '0', null);
INSERT INTO `feedback` VALUES ('199', '1181', '939', '是', '2018-09-27 21:09:32', '1', '0', '198');
INSERT INTO `feedback` VALUES ('200', '1193', '950', '可以的', '2018-09-28 12:08:06', '0', '0', null);
INSERT INTO `feedback` VALUES ('201', '1193', '950', '', '2018-09-28 12:08:28', '0', '0', null);
INSERT INTO `feedback` VALUES ('202', '1193', '950', '吆吆吆', '2018-09-28 12:08:43', '0', '0', null);
INSERT INTO `feedback` VALUES ('203', null, '942', '', '2018-09-28 12:10:16', '0', '0', null);
INSERT INTO `feedback` VALUES ('204', '1193', '942', '', '2018-09-28 12:10:23', '0', '0', null);
INSERT INTO `feedback` VALUES ('205', '1230', '946', '不吃了', '2018-09-29 22:56:24', '0', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('45', 'cbff ', '1000000000', '0', '2018-05-13 10:49:41', '0', '<p><strong>sdf</strong></p><p><strong><em>dfg df &nbsp;</em></strong></p>', '15261797687228.jpg', '15261797789543.jpg', '0');
INSERT INTO `goods` VALUES ('47', '测试', '100000', '0', '2018-05-13 20:36:22', '0', '<p><strong><span style=\"color: rgb(26, 188, 156);\"><em><u><s>测试</s></u></em></span></strong></p><p><strong><span style=\"color: rgb(26, 188, 156);\"><em><u><s><img src=\"https://www.fengteam.cn/backend/uploads/4ac96c4bf7156a14683114593d5a3019098b38ed.jpg\" style=\"width: 343px;\" class=\"fr-fic fr-dib\"></s></u></em></span></strong><br></p><p><br></p>', '15262149677515.jpg', '15262149806332.jpg', '0');
INSERT INTO `goods` VALUES ('48', 'artert', '100', '0', '2018-05-14 00:17:26', '0', '<p>as</p>', '15262282374853.jpg', '15262282449395.jpg', '0');
INSERT INTO `goods` VALUES ('49', '华为P20手机', '100000000', '6', '2018-05-14 09:30:26', '0', '<p><img src=\"https://www.fengteam.cn/backend/uploads/3ca20709440a697dc97067b008bb5bb0f3aae630.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/5cb33b5b87743a02382cdb575e5547a0218c72b2.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/7426c3f1486ba61d87a5b8f4255d1011709f226c.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/87154f7c05a5b18626383a72852770c434354ef0.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263019073749.jpg', '', '0');
INSERT INTO `goods` VALUES ('50', '商品同天', '50', '6', '2018-05-14 16:39:53', '0', '<p>吃吃吃吃</p><p><img src=\"https://www.fengteam.cn/backend/uploads/343158f5d57951a762dea184302058170ac7eafb.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263019073749.jpg', '', '0');
INSERT INTO `goods` VALUES ('51', '1211', '1', '81', '2018-07-18 00:56:43', '0', '<p><span style=\"color: rgb(251, 160, 38);\"><strong><em><u><s>温热</s></u></em></strong></span><span style=\"color: rgb(251, 160, 38);\"><strong><em><u><s><img src=\"https://www.fengteam.cn/backend/uploads/5f711b339e38a05078b19ee8fdfedd16f7b3d81d.jpg\" style=\"width: 347px;\" class=\"fr-fic fr-dib\"></s></u></em></strong></span></p>', '', '', '0');
INSERT INTO `goods` VALUES ('53', 'IPhoneX', '3600000', '8', '2018-05-15 21:10:43', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/dd654e9169586b6c3d1f5f3d84c32b0af139c4d2.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263897656529.jpg', '15263898407056.jpg', '0');
INSERT INTO `goods` VALUES ('54', '华为手机P20', '2000000', '19', '2018-05-15 21:12:21', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/73ed15bb2dd25f0bbad9b5171a962c63f46040ce.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/367debf149684316b8bcf3e737c46fb99ba78dff.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"><img src=\"https://www.fengteam.cn/backend/uploads/3aa50723fcdd715b5e00705f58b480e92c7508bd.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/c697a74d068ad8cf9e9b66cfbfba17f760888526.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263899278206.jpg', '15263899384562.jpg', '0');
INSERT INTO `goods` VALUES ('55', '迪卡侬帐篷', '1000000', '30', '2018-05-15 21:05:06', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/c9d45a94b588a9c03764028beae448f3015fd1b8.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/f7bb1b75d03493ef9afad89cbcfdce55ac983943.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/899189a881ba9b94ec6fb14638250f032f3ec8c6.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/1c17abba0a56fe88afc0befcdc21baa621f644bc.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/0cf0a0a81a3c4a858cdcaa35d6478a7571bec8f7.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263894655019.jpg', '15263894798476.jpg', '0');
INSERT INTO `goods` VALUES ('56', '小米运动耳机', '900000', '9', '2018-05-15 21:16:31', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/a97e11c58694eae8402c99fbda8d97dba126361f.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/e88d07aa3229d31a8fc3f69eec0d505e1bf1f87a.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p>', '15263901712975.jpg', '15263901885344.jpg', '0');
INSERT INTO `goods` VALUES ('57', '印花瑜伽垫', '800000', '20', '2018-05-15 21:21:01', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/499b4483cf2432824597dca55a77990cfd94e3ab.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/93888711641ac6e430fb9e4992a589fcf561bf57.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/482413d510b81cc881afaaadaffa34f09024beed.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/95be89d7c92546258f613dd399505d20b3661549.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/11821ee0600f2ea9196f9599f7f4c459f4a125b4.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263904381454.jpg', '15263904583606.jpg', '0');
INSERT INTO `goods` VALUES ('58', '骆驼速干衣', '400000', '40', '2018-05-15 21:25:52', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/817f690942c17b6d9056c116f73f8bfe87e4a14c.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/4f5ae9d138b555a34d959f3e3cddf461e4034243.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/48d6e32fa9775dfad324015bd50d44a3fa0e6d48.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/12aaa2edcfa113e64d4b6266711cdf543af21b84.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263907321423.jpg', '15263907478967.jpg', '0');
INSERT INTO `goods` VALUES ('59', '运动水杯', '300000', '49', '2018-05-15 21:28:34', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/a47fd701ec0e221e97589b5298a6b5c26133888a.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/549e1361752f315beb5af1e2d9b05cdbe07494de.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/696f4e3c4cb9301c428bdea4c606c19f60fdd863.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/f1b689879d1050bae4ceaa4cdd901f8c4cae6b0f.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263909007516.jpg', '15263909117807.jpg', '0');
INSERT INTO `goods` VALUES ('60', '冷感运动毛巾', '250000', '45', '2018-05-15 21:31:19', '1', '<p><img src=\"https://www.fengteam.cn/backend/uploads/5ce848d2d804146ebeba6adbf47253afc9ebfa06.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/b908976e8471713edc38346115a8879a82a6b174.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/cc4850047fdf32379ef8c26bdf64192cd417e3c4.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/304926f7462f3aa4e0008293a68f3b4907076787.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><br></p>', '15263910284641.jpg', '15263910472633.jpg', '0');
INSERT INTO `goods` VALUES ('61', '运动手机臂包', '200000', '25', '2018-05-15 21:35:12', '0', '<p><img src=\"https://www.fengteam.cn/backend/uploads/c9fb3f669ea9eb2cf1802f01cd15a16e6af8ca15.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/6772be01f623638dffb569b1c308f8ecdb904829.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/a7b96da8ce3b0dc3d0f44b20ce1c7e5f18012c55.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/11ab4f12d0fc142cdd863c3c789f7e55b4226078.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/71c49ac07396ad6550b6dfbe56a7961108d7f6af.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/7b4daa8b86327bacc3fdc2b22cf21a08aa94da77.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://www.fengteam.cn/backend/uploads/8fa239fc12f2f008530f6673c4036fbee92b373b.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '15263912901421.jpg', '15263913097987.jpg', '0');
INSERT INTO `goods` VALUES ('66', '234', '234', '0', '2018-09-05 20:52:51', '1', '<p><img src=\"https://www.fengteam.cn/backend_test/uploads/64537b155e89dbad6cd8ce370182381186b2b145.png\" style=\"width: 195px;\" class=\"fr-fic fr-dib\"><em>werwerwerwertest</em></p><p><em><img src=\"https://www.fengteam.cn/backend_test/uploads/ad8aa662e4f6dd67946c502c248f9cde9e9e9fd4.png\" style=\"width: 152px;\" class=\"fr-fic fr-dib\"></em></p><p><em>wewerw5674563453</em></p>', '15361519546467.png', '', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=1580 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honey_backyard
-- ----------------------------
INSERT INTO `honey_backyard` VALUES ('1573', '949', '91', '4', '1', '2018-10-01 07:00:03', '0');
INSERT INTO `honey_backyard` VALUES ('1576', '937', '32', '1', '0', '2018-10-01 08:48:43', '0');
INSERT INTO `honey_backyard` VALUES ('1572', '949', '5', '2', '1', '2018-09-30 22:07:32', '0');
INSERT INTO `honey_backyard` VALUES ('1578', '951', '3996', '3', '2', '2018-10-01 15:31:01', '0');
INSERT INTO `honey_backyard` VALUES ('1571', '937', '4', '6', '2', '2018-09-30 18:42:18', '0');
INSERT INTO `honey_backyard` VALUES ('1579', '935', '3960', '5', '1', '2018-10-01 19:48:28', '0');
INSERT INTO `honey_backyard` VALUES ('1570', '943', '3501', '1', '1', '2018-09-30 10:10:59', '942');

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
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honey_friend
-- ----------------------------
INSERT INTO `honey_friend` VALUES ('1231', '935', '937', '1');
INSERT INTO `honey_friend` VALUES ('1240', '937', '935', '1');
INSERT INTO `honey_friend` VALUES ('1242', '939', '942', '1');
INSERT INTO `honey_friend` VALUES ('1243', '942', '943', '1');
INSERT INTO `honey_friend` VALUES ('1244', '942', '946', '1');
INSERT INTO `honey_friend` VALUES ('1245', '942', '942', '1');
INSERT INTO `honey_friend` VALUES ('1246', '945', '942', '1');
INSERT INTO `honey_friend` VALUES ('1247', '942', '945', '1');
INSERT INTO `honey_friend` VALUES ('1248', '943', '942', '1');
INSERT INTO `honey_friend` VALUES ('1249', '946', '942', '1');
INSERT INTO `honey_friend` VALUES ('1250', '942', '939', '1');
INSERT INTO `honey_friend` VALUES ('1252', '948', '942', '1');
INSERT INTO `honey_friend` VALUES ('1253', '939', '947', '1');
INSERT INTO `honey_friend` VALUES ('1256', '948', '946', '1');
INSERT INTO `honey_friend` VALUES ('1259', '947', '939', '1');
INSERT INTO `honey_friend` VALUES ('1260', '942', '948', '1');
INSERT INTO `honey_friend` VALUES ('1261', '946', '948', '1');
INSERT INTO `honey_friend` VALUES ('1263', '942', '940', '1');
INSERT INTO `honey_friend` VALUES ('1264', '940', '942', '1');
INSERT INTO `honey_friend` VALUES ('1267', '943', '945', '1');
INSERT INTO `honey_friend` VALUES ('1268', '937', '949', '1');
INSERT INTO `honey_friend` VALUES ('1273', '945', '943', '1');
INSERT INTO `honey_friend` VALUES ('1274', '942', '950', '1');
INSERT INTO `honey_friend` VALUES ('1275', '946', '939', '1');
INSERT INTO `honey_friend` VALUES ('1276', '948', '939', '0');
INSERT INTO `honey_friend` VALUES ('1277', '950', '942', '1');
INSERT INTO `honey_friend` VALUES ('1278', '942', '947', '1');
INSERT INTO `honey_friend` VALUES ('1279', '947', '942', '1');
INSERT INTO `honey_friend` VALUES ('1280', '937', '942', '1');
INSERT INTO `honey_friend` VALUES ('1281', '937', '947', '1');
INSERT INTO `honey_friend` VALUES ('1282', '937', '950', '1');
INSERT INTO `honey_friend` VALUES ('1283', '937', '939', '1');
INSERT INTO `honey_friend` VALUES ('1284', '937', '946', '1');
INSERT INTO `honey_friend` VALUES ('1285', '937', '945', '1');
INSERT INTO `honey_friend` VALUES ('1286', '937', '943', '1');
INSERT INTO `honey_friend` VALUES ('1287', '949', '948', '1');
INSERT INTO `honey_friend` VALUES ('1288', '939', '946', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_state
-- ----------------------------
INSERT INTO `member_state` VALUES ('3', '942', '9.9', '2018-10-21', '2018-09-21 10:22:06', '15002200621537496516408');

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
) ENGINE=InnoDB AUTO_INCREMENT=1487 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_history
-- ----------------------------
INSERT INTO `payment_history` VALUES ('872', '935', '3', '0.11', null, '935', '2018-09-15 00:56:11');
INSERT INTO `payment_history` VALUES ('873', '935', '1', '0.11', null, '935', '2018-09-15 00:56:11');
INSERT INTO `payment_history` VALUES ('876', '0', '3', '1.60', '1059', null, '2018-09-16 10:05:20');
INSERT INTO `payment_history` VALUES ('878', '935', '3', '0.01', '1065', null, '2018-09-18 12:59:34');
INSERT INTO `payment_history` VALUES ('879', '935', '1', '0.01', '1065', null, '2018-09-18 12:59:34');
INSERT INTO `payment_history` VALUES ('882', '942', '3', '0.20', '1069', null, '2018-09-21 10:42:19');
INSERT INTO `payment_history` VALUES ('883', '942', '1', '0.20', '1069', null, '2018-09-21 10:42:19');
INSERT INTO `payment_history` VALUES ('884', '942', '3', '0.10', '1069', null, '2018-09-21 10:53:11');
INSERT INTO `payment_history` VALUES ('885', '945', '1', '0.10', '1069', null, '2018-09-21 10:53:11');
INSERT INTO `payment_history` VALUES ('886', '939', '3', '10.00', null, '939', '2018-09-21 21:20:55');
INSERT INTO `payment_history` VALUES ('887', '942', '1', '10.00', null, '939', '2018-09-21 21:20:55');
INSERT INTO `payment_history` VALUES ('888', '942', '3', '0.10', '1069', null, '2018-09-21 21:32:20');
INSERT INTO `payment_history` VALUES ('889', '939', '1', '0.10', '1069', null, '2018-09-21 21:32:20');
INSERT INTO `payment_history` VALUES ('890', '939', '3', '10.00', null, '939', '2018-09-21 21:34:36');
INSERT INTO `payment_history` VALUES ('891', '942', '1', '10.00', null, '939', '2018-09-21 21:34:36');
INSERT INTO `payment_history` VALUES ('892', '939', '3', '0.10', '1075', null, '2018-09-21 21:35:44');
INSERT INTO `payment_history` VALUES ('893', '942', '1', '0.10', '1075', null, '2018-09-21 21:35:44');
INSERT INTO `payment_history` VALUES ('894', '939', '3', '10.00', null, '939', '2018-09-21 21:39:37');
INSERT INTO `payment_history` VALUES ('895', '942', '1', '10.00', null, '939', '2018-09-21 21:39:37');
INSERT INTO `payment_history` VALUES ('1016', '0', '13', '20.00', '1101', null, '2018-09-23 20:02:25');
INSERT INTO `payment_history` VALUES ('1017', '937', '12', '20.00', '1101', null, '2018-09-23 20:02:25');
INSERT INTO `payment_history` VALUES ('1018', '937', '3', '0.10', '1102', null, '2018-09-23 20:16:32');
INSERT INTO `payment_history` VALUES ('1019', '937', '1', '0.20', '1102', null, '2018-09-23 20:16:32');
INSERT INTO `payment_history` VALUES ('1020', '937', '3', '0.10', '1104', null, '2018-09-23 20:33:59');
INSERT INTO `payment_history` VALUES ('1021', '937', '1', '0.20', '1104', null, '2018-09-23 20:33:59');
INSERT INTO `payment_history` VALUES ('1022', '942', '3', '0.10', '1106', null, '2018-09-24 09:47:56');
INSERT INTO `payment_history` VALUES ('1023', '942', '1', '0.10', '1106', null, '2018-09-24 09:47:56');
INSERT INTO `payment_history` VALUES ('1024', '939', '10', '10.00', null, '939', '2018-09-24 10:24:28');
INSERT INTO `payment_history` VALUES ('1025', '942', '9', '0.00', null, '939', '2018-09-24 10:24:28');
INSERT INTO `payment_history` VALUES ('1026', '942', '3', '0.10', '1099', null, '2018-09-24 12:23:01');
INSERT INTO `payment_history` VALUES ('1027', '942', '1', '0.10', '1099', null, '2018-09-24 12:23:01');
INSERT INTO `payment_history` VALUES ('1028', '939', '4', '0.10', '1075', null, '2018-09-24 12:34:22');
INSERT INTO `payment_history` VALUES ('1029', '939', '4', '0.10', '1075', null, '2018-09-24 12:34:24');
INSERT INTO `payment_history` VALUES ('1035', '937', '9', '1.60', null, '938', '2018-09-25 08:53:19');
INSERT INTO `payment_history` VALUES ('1037', '937', '9', '1.00', null, '938', '2018-09-25 08:53:36');
INSERT INTO `payment_history` VALUES ('1038', '939', '10', '10.00', null, '939', '2018-09-25 09:17:11');
INSERT INTO `payment_history` VALUES ('1039', '945', '9', '0.00', null, '939', '2018-09-25 09:17:11');
INSERT INTO `payment_history` VALUES ('1040', '0', '13', '0.10', '1113', null, '2018-09-25 09:27:01');
INSERT INTO `payment_history` VALUES ('1041', '942', '12', '0.00', '1113', null, '2018-09-25 09:27:01');
INSERT INTO `payment_history` VALUES ('1042', '946', '10', '1.00', null, '946', '2018-09-25 09:55:52');
INSERT INTO `payment_history` VALUES ('1043', '942', '9', '0.00', null, '946', '2018-09-25 09:55:52');
INSERT INTO `payment_history` VALUES ('1046', '942', '3', '1.00', '1100', null, '2018-09-25 10:31:44');
INSERT INTO `payment_history` VALUES ('1047', '947', '1', '0.00', '1100', null, '2018-09-25 10:31:44');
INSERT INTO `payment_history` VALUES ('1048', '946', '10', '1.00', null, '946', '2018-09-25 10:37:40');
INSERT INTO `payment_history` VALUES ('1049', '942', '9', '0.00', null, '946', '2018-09-25 10:37:40');
INSERT INTO `payment_history` VALUES ('1050', '946', '10', '1.00', null, '946', '2018-09-25 10:38:12');
INSERT INTO `payment_history` VALUES ('1051', '942', '9', '0.00', null, '946', '2018-09-25 10:38:12');
INSERT INTO `payment_history` VALUES ('1052', '939', '10', '10.00', null, '939', '2018-09-25 10:41:34');
INSERT INTO `payment_history` VALUES ('1053', '947', '9', '0.00', null, '939', '2018-09-25 10:41:34');
INSERT INTO `payment_history` VALUES ('1054', '942', '3', '0.10', '1100', null, '2018-09-25 10:58:39');
INSERT INTO `payment_history` VALUES ('1055', '942', '1', '0.20', '1100', null, '2018-09-25 10:58:39');
INSERT INTO `payment_history` VALUES ('1056', '946', '10', '1.00', null, '946', '2018-09-25 11:06:39');
INSERT INTO `payment_history` VALUES ('1057', '946', '9', '1.00', null, '946', '2018-09-25 11:06:39');
INSERT INTO `payment_history` VALUES ('1059', '937', '9', '0.10', null, '938', '2018-09-25 11:31:12');
INSERT INTO `payment_history` VALUES ('1061', '937', '9', '0.10', null, '938', '2018-09-25 11:32:43');
INSERT INTO `payment_history` VALUES ('1062', '946', '10', '1.00', null, '946', '2018-09-25 11:35:34');
INSERT INTO `payment_history` VALUES ('1063', '942', '9', '0.00', null, '946', '2018-09-25 11:35:34');
INSERT INTO `payment_history` VALUES ('1064', '946', '10', '1.00', null, '946', '2018-09-25 12:18:11');
INSERT INTO `payment_history` VALUES ('1065', '940', '9', '0.00', null, '946', '2018-09-25 12:18:11');
INSERT INTO `payment_history` VALUES ('1066', '942', '3', '0.10', '1106', null, '2018-09-25 12:19:28');
INSERT INTO `payment_history` VALUES ('1067', '940', '1', '0.00', '1106', null, '2018-09-25 12:19:28');
INSERT INTO `payment_history` VALUES ('1068', '943', '3', '0.01', '1116', null, '2018-09-25 15:19:11');
INSERT INTO `payment_history` VALUES ('1069', '942', '1', '0.01', '1116', null, '2018-09-25 15:19:11');
INSERT INTO `payment_history` VALUES ('1070', '943', '4', '0.01', '1116', null, '2018-09-25 15:19:22');
INSERT INTO `payment_history` VALUES ('1071', '943', '4', '0.01', '1116', null, '2018-09-25 15:19:26');
INSERT INTO `payment_history` VALUES ('1072', '943', '3', '0.01', '1116', null, '2018-09-25 15:23:49');
INSERT INTO `payment_history` VALUES ('1073', '948', '1', '0.00', '1116', null, '2018-09-25 15:23:49');
INSERT INTO `payment_history` VALUES ('1074', '0', '13', '20.00', '1101', null, '2018-09-25 16:28:09');
INSERT INTO `payment_history` VALUES ('1077', '937', '9', '1.50', null, '938', '2018-09-25 19:53:16');
INSERT INTO `payment_history` VALUES ('1079', '937', '9', '-0.40', null, '938', '2018-09-25 19:54:00');
INSERT INTO `payment_history` VALUES ('1081', '937', '9', '1.50', null, '938', '2018-09-25 20:49:46');
INSERT INTO `payment_history` VALUES ('1083', '937', '9', '1.10', null, '938', '2018-09-25 20:52:36');
INSERT INTO `payment_history` VALUES ('1085', '937', '9', '0.10', null, '938', '2018-09-25 21:01:24');
INSERT INTO `payment_history` VALUES ('1087', '937', '9', '0.10', null, '938', '2018-09-25 22:01:28');
INSERT INTO `payment_history` VALUES ('1089', '937', '9', '1.50', null, '938', '2018-09-25 22:04:27');
INSERT INTO `payment_history` VALUES ('1091', '937', '9', '1.10', null, '938', '2018-09-26 00:39:37');
INSERT INTO `payment_history` VALUES ('1093', '937', '9', '1.50', null, '938', '2018-09-26 01:17:39');
INSERT INTO `payment_history` VALUES ('1095', '937', '9', '1.10', null, '938', '2018-09-26 01:33:08');
INSERT INTO `payment_history` VALUES ('1097', '937', '9', '0.40', null, '938', '2018-09-26 01:34:57');
INSERT INTO `payment_history` VALUES ('1099', '937', '9', '0.10', null, '938', '2018-09-26 01:35:37');
INSERT INTO `payment_history` VALUES ('1101', '937', '9', '0.60', null, '938', '2018-09-26 01:35:56');
INSERT INTO `payment_history` VALUES ('1103', '937', '9', '0.10', null, '938', '2018-09-26 01:38:51');
INSERT INTO `payment_history` VALUES ('1105', '937', '9', '0.00', null, '938', '2018-09-26 01:39:30');
INSERT INTO `payment_history` VALUES ('1106', '946', '10', '1.00', null, '946', '2018-09-26 08:30:29');
INSERT INTO `payment_history` VALUES ('1107', '942', '9', '0.00', null, '946', '2018-09-26 08:30:29');
INSERT INTO `payment_history` VALUES ('1108', '946', '10', '1.00', null, '946', '2018-09-26 08:31:27');
INSERT INTO `payment_history` VALUES ('1109', '939', '9', '1.00', null, '946', '2018-09-26 08:31:27');
INSERT INTO `payment_history` VALUES ('1110', '0', '13', '0.10', '1119', null, '2018-09-26 08:52:58');
INSERT INTO `payment_history` VALUES ('1111', '942', '12', '0.10', '1119', null, '2018-09-26 08:52:58');
INSERT INTO `payment_history` VALUES ('1112', '0', '13', '0.10', '1119', null, '2018-09-26 09:03:03');
INSERT INTO `payment_history` VALUES ('1113', '945', '12', '0.00', '1119', null, '2018-09-26 09:03:03');
INSERT INTO `payment_history` VALUES ('1115', '937', '9', '1.50', null, '938', '2018-09-26 09:04:12');
INSERT INTO `payment_history` VALUES ('1116', '946', '10', '1.00', null, '946', '2018-09-26 09:06:28');
INSERT INTO `payment_history` VALUES ('1117', '945', '9', '0.00', null, '946', '2018-09-26 09:06:28');
INSERT INTO `payment_history` VALUES ('1119', '937', '9', '0.10', null, '938', '2018-09-26 09:07:10');
INSERT INTO `payment_history` VALUES ('1120', '946', '10', '1.00', null, '946', '2018-09-26 09:09:10');
INSERT INTO `payment_history` VALUES ('1121', '942', '9', '0.00', null, '946', '2018-09-26 09:09:10');
INSERT INTO `payment_history` VALUES ('1122', '0', '13', '1.10', '1078', null, '2018-09-26 10:13:27');
INSERT INTO `payment_history` VALUES ('1123', '937', '12', '1.10', '1078', null, '2018-09-26 10:13:27');
INSERT INTO `payment_history` VALUES ('1124', '0', '13', '1.10', '1078', null, '2018-09-26 10:19:20');
INSERT INTO `payment_history` VALUES ('1125', '937', '12', '1.10', '1078', null, '2018-09-26 10:19:20');
INSERT INTO `payment_history` VALUES ('1126', '0', '13', '0.10', '1151', null, '2018-09-26 10:19:24');
INSERT INTO `payment_history` VALUES ('1127', '942', '12', '0.00', '1151', null, '2018-09-26 10:19:24');
INSERT INTO `payment_history` VALUES ('1128', '942', '3', '0.10', '1152', null, '2018-09-26 12:08:34');
INSERT INTO `payment_history` VALUES ('1129', '942', '1', '0.20', '1152', null, '2018-09-26 12:08:34');
INSERT INTO `payment_history` VALUES ('1130', '0', '13', '1.10', '1078', null, '2018-09-26 12:10:01');
INSERT INTO `payment_history` VALUES ('1131', '937', '12', '1.10', '1078', null, '2018-09-26 12:10:01');
INSERT INTO `payment_history` VALUES ('1132', '946', '10', '1.00', null, '946', '2018-09-26 14:05:50');
INSERT INTO `payment_history` VALUES ('1133', '942', '9', '0.00', null, '946', '2018-09-26 14:05:50');
INSERT INTO `payment_history` VALUES ('1134', '946', '10', '1.00', null, '946', '2018-09-26 15:55:57');
INSERT INTO `payment_history` VALUES ('1135', '942', '9', '0.00', null, '946', '2018-09-26 15:55:57');
INSERT INTO `payment_history` VALUES ('1136', '0', '13', '1.10', '1078', null, '2018-09-26 16:02:43');
INSERT INTO `payment_history` VALUES ('1138', '937', '10', '0.07', null, '937', '2018-09-26 21:20:28');
INSERT INTO `payment_history` VALUES ('1140', '946', '10', '1.00', null, '946', '2018-09-27 11:00:17');
INSERT INTO `payment_history` VALUES ('1141', '945', '9', '0.00', null, '946', '2018-09-27 11:00:17');
INSERT INTO `payment_history` VALUES ('1142', '937', '10', '0.11', null, '937', '2018-09-27 16:13:18');
INSERT INTO `payment_history` VALUES ('1143', '949', '9', '0.11', null, '937', '2018-09-27 16:13:18');
INSERT INTO `payment_history` VALUES ('1144', '937', '10', '0.02', null, '937', '2018-09-27 16:19:21');
INSERT INTO `payment_history` VALUES ('1145', '949', '9', '0.02', null, '937', '2018-09-27 16:19:21');
INSERT INTO `payment_history` VALUES ('1146', '937', '10', '0.01', null, '937', '2018-09-27 16:41:43');
INSERT INTO `payment_history` VALUES ('1147', '949', '9', '0.01', null, '937', '2018-09-27 16:41:43');
INSERT INTO `payment_history` VALUES ('1148', '937', '10', '0.05', null, '937', '2018-09-27 16:42:23');
INSERT INTO `payment_history` VALUES ('1149', '949', '9', '0.05', null, '937', '2018-09-27 16:42:23');
INSERT INTO `payment_history` VALUES ('1150', '937', '10', '0.01', null, '937', '2018-09-27 16:44:12');
INSERT INTO `payment_history` VALUES ('1151', '949', '9', '0.01', null, '937', '2018-09-27 16:44:12');
INSERT INTO `payment_history` VALUES ('1152', '946', '10', '1.00', null, '946', '2018-09-27 17:15:14');
INSERT INTO `payment_history` VALUES ('1153', '942', '9', '0.00', null, '946', '2018-09-27 17:15:14');
INSERT INTO `payment_history` VALUES ('1154', '946', '10', '1.00', null, '946', '2018-09-27 18:56:54');
INSERT INTO `payment_history` VALUES ('1155', '946', '9', '2.00', null, '946', '2018-09-27 18:56:54');
INSERT INTO `payment_history` VALUES ('1156', '939', '10', '0.01', null, '939', '2018-09-27 20:42:36');
INSERT INTO `payment_history` VALUES ('1157', '947', '9', '0.00', null, '939', '2018-09-27 20:42:36');
INSERT INTO `payment_history` VALUES ('1158', '939', '10', '0.02', null, '939', '2018-09-27 20:43:06');
INSERT INTO `payment_history` VALUES ('1159', '947', '9', '0.00', null, '939', '2018-09-27 20:43:06');
INSERT INTO `payment_history` VALUES ('1160', '939', '10', '0.02', null, '939', '2018-09-27 20:49:57');
INSERT INTO `payment_history` VALUES ('1161', '942', '9', '0.02', null, '939', '2018-09-27 20:49:57');
INSERT INTO `payment_history` VALUES ('1162', '939', '10', '0.02', null, '939', '2018-09-27 20:50:04');
INSERT INTO `payment_history` VALUES ('1163', '942', '9', '0.00', null, '939', '2018-09-27 20:50:04');
INSERT INTO `payment_history` VALUES ('1164', '939', '10', '0.02', null, '939', '2018-09-27 20:50:40');
INSERT INTO `payment_history` VALUES ('1165', '942', '9', '0.02', null, '939', '2018-09-27 20:50:40');
INSERT INTO `payment_history` VALUES ('1166', '939', '10', '0.02', null, '939', '2018-09-27 20:50:47');
INSERT INTO `payment_history` VALUES ('1167', '942', '9', '0.00', null, '939', '2018-09-27 20:50:47');
INSERT INTO `payment_history` VALUES ('1168', '937', '10', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1169', '949', '9', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1170', '937', '10', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1171', '949', '9', '0.00', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1172', '937', '10', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1173', '949', '9', '0.00', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1174', '937', '10', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1175', '949', '9', '0.00', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1176', '937', '10', '0.01', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1177', '949', '9', '0.00', null, '937', '2018-09-27 21:14:23');
INSERT INTO `payment_history` VALUES ('1178', '937', '10', '0.01', null, '937', '2018-09-27 21:15:25');
INSERT INTO `payment_history` VALUES ('1179', '949', '9', '0.00', null, '937', '2018-09-27 21:15:25');
INSERT INTO `payment_history` VALUES ('1180', '939', '10', '0.02', null, '939', '2018-09-27 21:25:31');
INSERT INTO `payment_history` VALUES ('1181', '942', '9', '0.02', null, '939', '2018-09-27 21:25:31');
INSERT INTO `payment_history` VALUES ('1182', '939', '10', '0.02', null, '939', '2018-09-27 21:32:32');
INSERT INTO `payment_history` VALUES ('1183', '942', '9', '0.02', null, '939', '2018-09-27 21:32:32');
INSERT INTO `payment_history` VALUES ('1184', '939', '10', '0.02', null, '939', '2018-09-27 21:34:09');
INSERT INTO `payment_history` VALUES ('1185', '942', '9', '0.02', null, '939', '2018-09-27 21:34:09');
INSERT INTO `payment_history` VALUES ('1186', '939', '10', '0.02', null, '939', '2018-09-27 21:37:24');
INSERT INTO `payment_history` VALUES ('1187', '942', '9', '0.02', null, '939', '2018-09-27 21:37:24');
INSERT INTO `payment_history` VALUES ('1188', '939', '10', '0.02', null, '939', '2018-09-27 21:37:25');
INSERT INTO `payment_history` VALUES ('1189', '942', '9', '0.00', null, '939', '2018-09-27 21:37:25');
INSERT INTO `payment_history` VALUES ('1190', '939', '10', '0.01', null, '939', '2018-09-27 21:39:20');
INSERT INTO `payment_history` VALUES ('1191', '942', '9', '0.01', null, '939', '2018-09-27 21:39:20');
INSERT INTO `payment_history` VALUES ('1192', '939', '10', '0.02', null, '939', '2018-09-27 21:39:49');
INSERT INTO `payment_history` VALUES ('1193', '942', '9', '0.02', null, '939', '2018-09-27 21:39:49');
INSERT INTO `payment_history` VALUES ('1194', '939', '10', '0.02', null, '939', '2018-09-27 21:48:39');
INSERT INTO `payment_history` VALUES ('1195', '942', '9', '0.02', null, '939', '2018-09-27 21:48:39');
INSERT INTO `payment_history` VALUES ('1196', '939', '10', '0.04', null, '939', '2018-09-28 06:48:54');
INSERT INTO `payment_history` VALUES ('1197', '942', '9', '0.04', null, '939', '2018-09-28 06:48:54');
INSERT INTO `payment_history` VALUES ('1198', '946', '10', '1.00', null, '946', '2018-09-28 07:19:00');
INSERT INTO `payment_history` VALUES ('1199', '939', '9', '1.00', null, '946', '2018-09-28 07:19:00');
INSERT INTO `payment_history` VALUES ('1200', '937', '10', '0.07', null, '937', '2018-09-28 08:06:41');
INSERT INTO `payment_history` VALUES ('1201', '949', '9', '0.07', null, '937', '2018-09-28 08:06:41');
INSERT INTO `payment_history` VALUES ('1202', '939', '10', '0.02', null, '939', '2018-09-28 08:37:07');
INSERT INTO `payment_history` VALUES ('1203', '942', '9', '0.00', null, '939', '2018-09-28 08:37:07');
INSERT INTO `payment_history` VALUES ('1204', '939', '10', '0.02', null, '939', '2018-09-28 08:38:34');
INSERT INTO `payment_history` VALUES ('1205', '942', '9', '0.00', null, '939', '2018-09-28 08:38:34');
INSERT INTO `payment_history` VALUES ('1206', '937', '3', '0.50', '1184', null, '2018-09-28 09:27:35');
INSERT INTO `payment_history` VALUES ('1207', '949', '1', '0.50', '1184', null, '2018-09-28 09:27:35');
INSERT INTO `payment_history` VALUES ('1208', '937', '11', '0.05', null, '1233', '2018-09-28 09:57:32');
INSERT INTO `payment_history` VALUES ('1209', '949', '14', '0.05', null, '1233', '2018-09-28 09:57:32');
INSERT INTO `payment_history` VALUES ('1210', '937', '10', '0.13', null, '937', '2018-09-28 10:20:09');
INSERT INTO `payment_history` VALUES ('1211', '949', '9', '0.13', null, '937', '2018-09-28 10:20:09');
INSERT INTO `payment_history` VALUES ('1212', '937', '11', '0.01', null, '1239', '2018-09-28 10:20:43');
INSERT INTO `payment_history` VALUES ('1213', '949', '14', '0.01', null, '1239', '2018-09-28 10:20:43');
INSERT INTO `payment_history` VALUES ('1214', '937', '10', '0.07', null, '1206', '2018-09-28 10:32:32');
INSERT INTO `payment_history` VALUES ('1215', '949', '9', '0.07', null, '1206', '2018-09-28 10:32:32');
INSERT INTO `payment_history` VALUES ('1216', '937', '11', '0.05', null, '1238', '2018-09-28 10:43:31');
INSERT INTO `payment_history` VALUES ('1217', '949', '14', '0.05', null, '1238', '2018-09-28 10:43:31');
INSERT INTO `payment_history` VALUES ('1218', '937', '11', '0.01', null, '1241', '2018-09-28 10:44:04');
INSERT INTO `payment_history` VALUES ('1219', '949', '14', '0.01', null, '1241', '2018-09-28 10:44:04');
INSERT INTO `payment_history` VALUES ('1220', '937', '11', '0.01', null, '1242', '2018-09-28 10:45:00');
INSERT INTO `payment_history` VALUES ('1221', '949', '14', '0.01', null, '1242', '2018-09-28 10:45:00');
INSERT INTO `payment_history` VALUES ('1222', '939', '10', '0.02', null, '1125', '2018-09-28 10:50:25');
INSERT INTO `payment_history` VALUES ('1223', '942', '9', '0.00', null, '1125', '2018-09-28 10:50:25');
INSERT INTO `payment_history` VALUES ('1224', '939', '11', '0.02', null, '1236', '2018-09-28 10:51:14');
INSERT INTO `payment_history` VALUES ('1225', '942', '14', '0.02', null, '1236', '2018-09-28 10:51:14');
INSERT INTO `payment_history` VALUES ('1226', '939', '10', '0.02', null, '1125', '2018-09-28 10:53:15');
INSERT INTO `payment_history` VALUES ('1227', '942', '9', '0.00', null, '1125', '2018-09-28 10:53:15');
INSERT INTO `payment_history` VALUES ('1228', '937', '11', '0.05', null, '1240', '2018-09-28 10:53:15');
INSERT INTO `payment_history` VALUES ('1229', '949', '14', '0.05', null, '1240', '2018-09-28 10:53:15');
INSERT INTO `payment_history` VALUES ('1230', '939', '11', '0.02', null, '1236', '2018-09-28 10:53:32');
INSERT INTO `payment_history` VALUES ('1231', '942', '14', '0.02', null, '1236', '2018-09-28 10:53:32');
INSERT INTO `payment_history` VALUES ('1232', '937', '11', '0.05', null, '1243', '2018-09-28 10:54:36');
INSERT INTO `payment_history` VALUES ('1233', '949', '14', '0.05', null, '1243', '2018-09-28 10:54:36');
INSERT INTO `payment_history` VALUES ('1234', '937', '10', '0.19', null, '1206', '2018-09-28 10:55:03');
INSERT INTO `payment_history` VALUES ('1235', '949', '9', '0.19', null, '1206', '2018-09-28 10:55:03');
INSERT INTO `payment_history` VALUES ('1236', '939', '10', '0.02', null, '1125', '2018-09-28 10:55:45');
INSERT INTO `payment_history` VALUES ('1237', '942', '9', '0.02', null, '1125', '2018-09-28 10:55:45');
INSERT INTO `payment_history` VALUES ('1238', '939', '11', '0.02', null, '1249', '2018-09-28 10:56:04');
INSERT INTO `payment_history` VALUES ('1239', '942', '14', '0.02', null, '1249', '2018-09-28 10:56:04');
INSERT INTO `payment_history` VALUES ('1240', '942', '3', '0.10', '1188', null, '2018-09-28 11:00:15');
INSERT INTO `payment_history` VALUES ('1241', '942', '1', '0.10', '1188', null, '2018-09-28 11:00:15');
INSERT INTO `payment_history` VALUES ('1242', '942', '4', '0.10', '1188', null, '2018-09-28 11:02:16');
INSERT INTO `payment_history` VALUES ('1243', '942', '3', '0.50', '1188', null, '2018-09-28 11:18:53');
INSERT INTO `payment_history` VALUES ('1244', '946', '1', '0.50', '1188', null, '2018-09-28 11:18:53');
INSERT INTO `payment_history` VALUES ('1245', '942', '3', '0.50', '1188', null, '2018-09-28 11:21:18');
INSERT INTO `payment_history` VALUES ('1246', '947', '1', '0.00', '1188', null, '2018-09-28 11:21:18');
INSERT INTO `payment_history` VALUES ('1247', '942', '4', '0.50', '1188', null, '2018-09-28 11:21:34');
INSERT INTO `payment_history` VALUES ('1248', '942', '4', '0.50', '1188', null, '2018-09-28 11:22:41');
INSERT INTO `payment_history` VALUES ('1249', '942', '3', '0.50', '1188', null, '2018-09-28 11:23:55');
INSERT INTO `payment_history` VALUES ('1250', '947', '1', '0.00', '1188', null, '2018-09-28 11:23:55');
INSERT INTO `payment_history` VALUES ('1251', '943', '3', '0.10', '1191', null, '2018-09-28 11:32:59');
INSERT INTO `payment_history` VALUES ('1252', '943', '1', '0.10', '1191', null, '2018-09-28 11:32:59');
INSERT INTO `payment_history` VALUES ('1253', '943', '4', '0.10', '1191', null, '2018-09-28 11:33:09');
INSERT INTO `payment_history` VALUES ('1254', '943', '3', '0.10', '1191', null, '2018-09-28 12:02:10');
INSERT INTO `payment_history` VALUES ('1255', '945', '1', '0.00', '1191', null, '2018-09-28 12:02:10');
INSERT INTO `payment_history` VALUES ('1256', '947', '3', '0.10', '1190', null, '2018-09-28 12:32:21');
INSERT INTO `payment_history` VALUES ('1257', '947', '4', '0.10', '1190', null, '2018-09-28 12:32:46');
INSERT INTO `payment_history` VALUES ('1258', '937', '4', '0.50', '1184', null, '2018-09-28 13:03:30');
INSERT INTO `payment_history` VALUES ('1259', '949', '6', '0.50', '1184', null, '2018-09-28 13:03:30');
INSERT INTO `payment_history` VALUES ('1260', '937', '3', '1.00', '1184', null, '2018-09-28 13:04:13');
INSERT INTO `payment_history` VALUES ('1261', '949', '1', '1.00', '1184', null, '2018-09-28 13:04:13');
INSERT INTO `payment_history` VALUES ('1262', '937', '4', '1.00', '1184', null, '2018-09-28 13:04:42');
INSERT INTO `payment_history` VALUES ('1263', '949', '6', '1.00', '1184', null, '2018-09-28 13:04:42');
INSERT INTO `payment_history` VALUES ('1264', '945', '3', '0.01', '1192', null, '2018-09-28 14:12:19');
INSERT INTO `payment_history` VALUES ('1265', '945', '4', '0.01', '1192', null, '2018-09-28 14:12:40');
INSERT INTO `payment_history` VALUES ('1266', '939', '10', '0.02', null, '1125', '2018-09-28 14:13:24');
INSERT INTO `payment_history` VALUES ('1267', '942', '9', '0.00', null, '1125', '2018-09-28 14:13:24');
INSERT INTO `payment_history` VALUES ('1268', '939', '11', '0.02', null, '1225', '2018-09-28 14:13:40');
INSERT INTO `payment_history` VALUES ('1269', '942', '14', '0.02', null, '1225', '2018-09-28 14:13:40');
INSERT INTO `payment_history` VALUES ('1270', '943', '3', '0.10', '1191', null, '2018-09-28 14:15:02');
INSERT INTO `payment_history` VALUES ('1271', '942', '1', '0.10', '1191', null, '2018-09-28 14:15:02');
INSERT INTO `payment_history` VALUES ('1272', '949', '3', '1.00', '1194', null, '2018-09-28 14:30:02');
INSERT INTO `payment_history` VALUES ('1273', '949', '1', '2.00', '1194', null, '2018-09-28 14:30:02');
INSERT INTO `payment_history` VALUES ('1274', '0', '13', '0.10', '1203', null, '2018-09-28 16:42:26');
INSERT INTO `payment_history` VALUES ('1275', '942', '12', '0.10', '1203', null, '2018-09-28 16:42:26');
INSERT INTO `payment_history` VALUES ('1276', '937', '3', '0.50', '1184', null, '2018-09-29 02:23:47');
INSERT INTO `payment_history` VALUES ('1277', '949', '1', '0.50', '1184', null, '2018-09-29 02:23:47');
INSERT INTO `payment_history` VALUES ('1278', '0', '13', '1.00', '1167', null, '2018-09-29 02:24:07');
INSERT INTO `payment_history` VALUES ('1279', '949', '12', '1.00', '1167', null, '2018-09-29 02:24:07');
INSERT INTO `payment_history` VALUES ('1280', '937', '10', '0.07', null, '1206', '2018-09-29 02:24:28');
INSERT INTO `payment_history` VALUES ('1281', '949', '9', '0.07', null, '1206', '2018-09-29 02:24:28');
INSERT INTO `payment_history` VALUES ('1282', '939', '3', '2.00', '1214', null, '2018-09-29 08:19:55');
INSERT INTO `payment_history` VALUES ('1283', '942', '1', '0.50', '1214', null, '2018-09-29 08:19:55');
INSERT INTO `payment_history` VALUES ('1284', '939', '10', '0.02', null, '1', '2018-09-29 08:24:05');
INSERT INTO `payment_history` VALUES ('1285', '942', '9', '0.00', null, '1', '2018-09-29 08:24:05');
INSERT INTO `payment_history` VALUES ('1286', '939', '10', '0.02', null, '1', '2018-09-29 08:25:37');
INSERT INTO `payment_history` VALUES ('1287', '942', '9', '0.02', null, '1', '2018-09-29 08:25:37');
INSERT INTO `payment_history` VALUES ('1288', '942', '3', '0.10', '1217', null, '2018-09-29 08:31:45');
INSERT INTO `payment_history` VALUES ('1289', '942', '1', '0.10', '1217', null, '2018-09-29 08:31:45');
INSERT INTO `payment_history` VALUES ('1290', '942', '4', '0.10', '1217', null, '2018-09-29 08:32:30');
INSERT INTO `payment_history` VALUES ('1291', '942', '3', '0.10', '1217', null, '2018-09-29 08:33:15');
INSERT INTO `payment_history` VALUES ('1292', '939', '10', '0.02', null, '1', '2018-09-29 08:38:15');
INSERT INTO `payment_history` VALUES ('1293', '942', '9', '0.00', null, '1', '2018-09-29 08:38:15');
INSERT INTO `payment_history` VALUES ('1294', '948', '3', '0.01', '1220', null, '2018-09-29 08:39:04');
INSERT INTO `payment_history` VALUES ('1295', '942', '4', '0.50', '1188', null, '2018-09-29 08:39:21');
INSERT INTO `payment_history` VALUES ('1296', '942', '3', '0.50', '1217', null, '2018-09-29 08:45:26');
INSERT INTO `payment_history` VALUES ('1297', '939', '10', '0.02', null, '1', '2018-09-29 08:46:04');
INSERT INTO `payment_history` VALUES ('1298', '947', '9', '0.00', null, '1', '2018-09-29 08:46:04');
INSERT INTO `payment_history` VALUES ('1299', '947', '3', '0.10', '1221', null, '2018-09-29 08:46:15');
INSERT INTO `payment_history` VALUES ('1300', '942', '1', '0.10', '1221', null, '2018-09-29 08:46:15');
INSERT INTO `payment_history` VALUES ('1301', '942', '4', '0.50', '1217', null, '2018-09-29 08:48:41');
INSERT INTO `payment_history` VALUES ('1302', '947', '3', '0.50', '1221', null, '2018-09-29 08:49:47');
INSERT INTO `payment_history` VALUES ('1303', '947', '1', '0.50', '1221', null, '2018-09-29 08:49:47');
INSERT INTO `payment_history` VALUES ('1304', '942', '3', '0.10', '1217', null, '2018-09-29 09:28:16');
INSERT INTO `payment_history` VALUES ('1305', '942', '4', '0.10', '1217', null, '2018-09-29 09:28:23');
INSERT INTO `payment_history` VALUES ('1306', '939', '11', '0.02', null, '1253', '2018-09-29 10:58:52');
INSERT INTO `payment_history` VALUES ('1307', '942', '14', '0.02', null, '1253', '2018-09-29 10:58:52');
INSERT INTO `payment_history` VALUES ('1308', '945', '3', '0.01', '1222', null, '2018-09-29 11:02:51');
INSERT INTO `payment_history` VALUES ('1309', '939', '10', '0.02', null, '1', '2018-09-29 11:29:35');
INSERT INTO `payment_history` VALUES ('1310', '945', '9', '0.00', null, '1', '2018-09-29 11:29:35');
INSERT INTO `payment_history` VALUES ('1311', '949', '3', '5.00', '1172', null, '2018-09-29 12:43:19');
INSERT INTO `payment_history` VALUES ('1312', '949', '1', '10.00', '1172', null, '2018-09-29 12:43:19');
INSERT INTO `payment_history` VALUES ('1313', '949', '3', '5.00', '1172', null, '2018-09-29 12:57:55');
INSERT INTO `payment_history` VALUES ('1314', '949', '1', '5.00', '1172', null, '2018-09-29 12:57:55');
INSERT INTO `payment_history` VALUES ('1315', '937', '10', '0.20', null, '1', '2018-09-29 13:15:29');
INSERT INTO `payment_history` VALUES ('1316', '949', '9', '0.20', null, '1', '2018-09-29 13:15:29');
INSERT INTO `payment_history` VALUES ('1317', '937', '11', '0.01', null, '1250', '2018-09-29 13:55:16');
INSERT INTO `payment_history` VALUES ('1318', '949', '14', '0.01', null, '1250', '2018-09-29 13:55:16');
INSERT INTO `payment_history` VALUES ('1319', '937', '11', '0.01', null, '1250', '2018-09-29 13:55:19');
INSERT INTO `payment_history` VALUES ('1320', '949', '14', '0.01', null, '1250', '2018-09-29 13:55:19');
INSERT INTO `payment_history` VALUES ('1321', '937', '11', '0.05', null, '1251', '2018-09-29 13:55:56');
INSERT INTO `payment_history` VALUES ('1322', '949', '14', '0.05', null, '1251', '2018-09-29 13:55:56');
INSERT INTO `payment_history` VALUES ('1323', '939', '10', '0.02', null, '1', '2018-09-29 14:04:21');
INSERT INTO `payment_history` VALUES ('1324', '942', '9', '0.02', null, '1', '2018-09-29 14:04:21');
INSERT INTO `payment_history` VALUES ('1325', '939', '10', '0.02', null, '1', '2018-09-29 14:28:29');
INSERT INTO `payment_history` VALUES ('1326', '942', '9', '0.00', null, '1', '2018-09-29 14:28:29');
INSERT INTO `payment_history` VALUES ('1327', '939', '11', '0.02', null, '1254', '2018-09-29 14:28:51');
INSERT INTO `payment_history` VALUES ('1328', '942', '14', '0.02', null, '1254', '2018-09-29 14:28:51');
INSERT INTO `payment_history` VALUES ('1329', '942', '3', '0.10', '1228', null, '2018-09-29 14:30:28');
INSERT INTO `payment_history` VALUES ('1330', '942', '3', '0.20', '1228', null, '2018-09-29 14:45:52');
INSERT INTO `payment_history` VALUES ('1331', '942', '3', '0.10', '1217', null, '2018-09-29 14:47:27');
INSERT INTO `payment_history` VALUES ('1332', '945', '1', '0.01', '1217', null, '2018-09-29 14:47:27');
INSERT INTO `payment_history` VALUES ('1333', '942', '4', '0.10', '1217', null, '2018-09-29 14:47:31');
INSERT INTO `payment_history` VALUES ('1334', '945', '6', '0.01', '1217', null, '2018-09-29 14:47:31');
INSERT INTO `payment_history` VALUES ('1335', '942', '3', '0.10', '1217', null, '2018-09-29 14:49:08');
INSERT INTO `payment_history` VALUES ('1336', '942', '4', '0.10', '1217', null, '2018-09-29 14:49:15');
INSERT INTO `payment_history` VALUES ('1337', '942', '3', '0.10', '1217', null, '2018-09-29 14:49:45');
INSERT INTO `payment_history` VALUES ('1338', '945', '1', '0.01', '1217', null, '2018-09-29 14:49:45');
INSERT INTO `payment_history` VALUES ('1339', '942', '4', '0.10', '1217', null, '2018-09-29 14:49:50');
INSERT INTO `payment_history` VALUES ('1340', '945', '6', '0.01', '1217', null, '2018-09-29 14:49:50');
INSERT INTO `payment_history` VALUES ('1341', '943', '3', '0.10', '1231', null, '2018-09-29 14:52:31');
INSERT INTO `payment_history` VALUES ('1342', '943', '4', '0.10', '1231', null, '2018-09-29 14:52:51');
INSERT INTO `payment_history` VALUES ('1343', '942', '3', '0.10', '1217', null, '2018-09-29 14:54:30');
INSERT INTO `payment_history` VALUES ('1344', '945', '1', '0.01', '1217', null, '2018-09-29 14:54:30');
INSERT INTO `payment_history` VALUES ('1345', '943', '3', '0.10', '1231', null, '2018-09-29 14:54:48');
INSERT INTO `payment_history` VALUES ('1346', '942', '1', '0.10', '1231', null, '2018-09-29 14:54:48');
INSERT INTO `payment_history` VALUES ('1347', '942', '4', '0.10', '1217', null, '2018-09-29 14:55:47');
INSERT INTO `payment_history` VALUES ('1348', '945', '6', '0.01', '1217', null, '2018-09-29 14:55:47');
INSERT INTO `payment_history` VALUES ('1349', '939', '10', '0.02', null, '1', '2018-09-29 14:56:59');
INSERT INTO `payment_history` VALUES ('1350', '945', '9', '0.00', null, '1', '2018-09-29 14:56:59');
INSERT INTO `payment_history` VALUES ('1351', '939', '11', '0.02', null, '1264', '2018-09-29 14:57:31');
INSERT INTO `payment_history` VALUES ('1352', '945', '14', '0.02', null, '1264', '2018-09-29 14:57:31');
INSERT INTO `payment_history` VALUES ('1353', '939', '10', '0.03', null, '1', '2018-09-29 14:59:20');
INSERT INTO `payment_history` VALUES ('1354', '942', '9', '0.03', null, '1', '2018-09-29 14:59:20');
INSERT INTO `payment_history` VALUES ('1355', '939', '10', '0.04', null, '1', '2018-09-29 14:59:26');
INSERT INTO `payment_history` VALUES ('1356', '945', '9', '0.00', null, '1', '2018-09-29 14:59:26');
INSERT INTO `payment_history` VALUES ('1357', '939', '11', '0.02', null, '1257', '2018-09-29 14:59:51');
INSERT INTO `payment_history` VALUES ('1358', '945', '14', '0.02', null, '1257', '2018-09-29 14:59:51');
INSERT INTO `payment_history` VALUES ('1359', '939', '11', '0.02', null, '1268', '2018-09-29 15:00:02');
INSERT INTO `payment_history` VALUES ('1360', '945', '14', '0.02', null, '1268', '2018-09-29 15:00:02');
INSERT INTO `payment_history` VALUES ('1361', '946', '10', '1.00', null, '1', '2018-09-29 15:00:14');
INSERT INTO `payment_history` VALUES ('1362', '942', '9', '0.00', null, '1', '2018-09-29 15:00:14');
INSERT INTO `payment_history` VALUES ('1363', '946', '10', '10.00', null, '1', '2018-09-29 15:20:12');
INSERT INTO `payment_history` VALUES ('1364', '942', '9', '0.00', null, '1', '2018-09-29 15:20:12');
INSERT INTO `payment_history` VALUES ('1365', '946', '11', '10.00', null, '1270', '2018-09-29 15:20:56');
INSERT INTO `payment_history` VALUES ('1366', '942', '14', '10.00', null, '1270', '2018-09-29 15:20:56');
INSERT INTO `payment_history` VALUES ('1367', '939', '10', '0.01', null, '1', '2018-09-29 15:27:32');
INSERT INTO `payment_history` VALUES ('1368', '947', '9', '0.01', null, '1', '2018-09-29 15:27:32');
INSERT INTO `payment_history` VALUES ('1369', '939', '11', '0.02', null, '1256', '2018-09-29 15:28:12');
INSERT INTO `payment_history` VALUES ('1370', '947', '14', '0.02', null, '1256', '2018-09-29 15:28:12');
INSERT INTO `payment_history` VALUES ('1371', '939', '11', '0.01', null, '1271', '2018-09-29 15:28:17');
INSERT INTO `payment_history` VALUES ('1372', '947', '14', '0.01', null, '1271', '2018-09-29 15:28:17');
INSERT INTO `payment_history` VALUES ('1373', '937', '3', '0.05', '1232', null, '2018-09-29 15:36:14');
INSERT INTO `payment_history` VALUES ('1374', '937', '1', '0.05', '1232', null, '2018-09-29 15:36:14');
INSERT INTO `payment_history` VALUES ('1375', '937', '5', '0.05', null, null, '2018-09-29 15:39:01');
INSERT INTO `payment_history` VALUES ('1376', '937', '3', '0.05', '1232', null, '2018-09-29 15:51:22');
INSERT INTO `payment_history` VALUES ('1377', '937', '1', '0.05', '1232', null, '2018-09-29 15:51:22');
INSERT INTO `payment_history` VALUES ('1378', '937', '4', '0.05', '1232', null, '2018-09-29 15:51:42');
INSERT INTO `payment_history` VALUES ('1379', '937', '6', '0.05', '1232', null, '2018-09-29 15:51:42');
INSERT INTO `payment_history` VALUES ('1380', '0', '13', '0.10', '1233', null, '2018-09-29 15:52:37');
INSERT INTO `payment_history` VALUES ('1381', '0', '4', '0.10', '1233', null, '2018-09-29 15:52:49');
INSERT INTO `payment_history` VALUES ('1382', '937', '3', '0.02', '1232', null, '2018-09-29 15:55:42');
INSERT INTO `payment_history` VALUES ('1383', '937', '1', '0.02', '1232', null, '2018-09-29 15:55:42');
INSERT INTO `payment_history` VALUES ('1384', '937', '4', '0.02', '1232', null, '2018-09-29 15:57:17');
INSERT INTO `payment_history` VALUES ('1385', '937', '6', '0.02', '1232', null, '2018-09-29 15:57:17');
INSERT INTO `payment_history` VALUES ('1386', '937', '3', '0.05', '1232', null, '2018-09-29 16:00:52');
INSERT INTO `payment_history` VALUES ('1387', '937', '1', '0.04', '1232', null, '2018-09-29 16:00:52');
INSERT INTO `payment_history` VALUES ('1388', '937', '4', '0.05', '1232', null, '2018-09-29 16:03:36');
INSERT INTO `payment_history` VALUES ('1389', '937', '6', '0.04', '1232', null, '2018-09-29 16:03:36');
INSERT INTO `payment_history` VALUES ('1390', '937', '3', '0.05', '1232', null, '2018-09-29 16:09:35');
INSERT INTO `payment_history` VALUES ('1391', '937', '1', '0.04', '1232', null, '2018-09-29 16:09:35');
INSERT INTO `payment_history` VALUES ('1392', '937', '4', '0.05', '1232', null, '2018-09-29 16:10:13');
INSERT INTO `payment_history` VALUES ('1393', '937', '6', '0.04', '1232', null, '2018-09-29 16:10:13');
INSERT INTO `payment_history` VALUES ('1394', '937', '3', '0.01', '1232', null, '2018-09-29 16:12:35');
INSERT INTO `payment_history` VALUES ('1395', '937', '1', '0.01', '1232', null, '2018-09-29 16:12:35');
INSERT INTO `payment_history` VALUES ('1396', '937', '3', '0.05', '1232', null, '2018-09-29 16:25:11');
INSERT INTO `payment_history` VALUES ('1397', '937', '1', '0.04', '1232', null, '2018-09-29 16:25:11');
INSERT INTO `payment_history` VALUES ('1398', '937', '4', '0.05', '1232', null, '2018-09-29 16:26:03');
INSERT INTO `payment_history` VALUES ('1399', '937', '6', '0.04', '1232', null, '2018-09-29 16:26:03');
INSERT INTO `payment_history` VALUES ('1400', '937', '3', '0.05', '1232', null, '2018-09-29 16:27:31');
INSERT INTO `payment_history` VALUES ('1401', '937', '1', '0.04', '1232', null, '2018-09-29 16:27:31');
INSERT INTO `payment_history` VALUES ('1402', '937', '4', '0.05', '1232', null, '2018-09-29 16:35:49');
INSERT INTO `payment_history` VALUES ('1403', '937', '6', '0.04', '1232', null, '2018-09-29 16:35:49');
INSERT INTO `payment_history` VALUES ('1404', '937', '4', '0.05', '1232', null, '2018-09-29 16:39:57');
INSERT INTO `payment_history` VALUES ('1405', '937', '6', '0.04', '1232', null, '2018-09-29 16:39:57');
INSERT INTO `payment_history` VALUES ('1406', '937', '4', '0.05', '1232', null, '2018-09-29 17:02:46');
INSERT INTO `payment_history` VALUES ('1407', '937', '6', '0.04', '1232', null, '2018-09-29 17:02:46');
INSERT INTO `payment_history` VALUES ('1408', '937', '3', '0.05', '1232', null, '2018-09-29 17:04:29');
INSERT INTO `payment_history` VALUES ('1409', '937', '1', '0.04', '1232', null, '2018-09-29 17:04:29');
INSERT INTO `payment_history` VALUES ('1410', '937', '5', '0.05', null, null, '2018-09-29 17:05:39');
INSERT INTO `payment_history` VALUES ('1411', '937', '10', '0.04', null, '1', '2018-09-29 17:25:26');
INSERT INTO `payment_history` VALUES ('1412', '937', '9', '0.00', null, '1', '2018-09-29 17:25:26');
INSERT INTO `payment_history` VALUES ('1413', '942', '3', '12.00', '1234', null, '2018-09-29 17:29:33');
INSERT INTO `payment_history` VALUES ('1414', '942', '1', '10.47', '1234', null, '2018-09-29 17:29:33');
INSERT INTO `payment_history` VALUES ('1415', '942', '4', '12.00', '1234', null, '2018-09-29 17:29:58');
INSERT INTO `payment_history` VALUES ('1416', '942', '6', '10.47', '1234', null, '2018-09-29 17:29:58');
INSERT INTO `payment_history` VALUES ('1417', '0', '13', '0.01', '1195', null, '2018-09-29 18:39:41');
INSERT INTO `payment_history` VALUES ('1418', '937', '12', '0.01', '1195', null, '2018-09-29 18:39:41');
INSERT INTO `payment_history` VALUES ('1419', '0', '4', '0.01', '1195', null, '2018-09-29 18:40:02');
INSERT INTO `payment_history` VALUES ('1420', '937', '6', '0.01', '1195', null, '2018-09-29 18:40:02');
INSERT INTO `payment_history` VALUES ('1421', '0', '13', '0.01', '1195', null, '2018-09-29 18:41:19');
INSERT INTO `payment_history` VALUES ('1422', '937', '12', '0.01', '1195', null, '2018-09-29 18:41:19');
INSERT INTO `payment_history` VALUES ('1423', '0', '4', '0.01', '1195', null, '2018-09-29 18:41:39');
INSERT INTO `payment_history` VALUES ('1424', '937', '6', '0.01', '1195', null, '2018-09-29 18:41:39');
INSERT INTO `payment_history` VALUES ('1425', '0', '13', '0.01', '1195', null, '2018-09-29 18:44:52');
INSERT INTO `payment_history` VALUES ('1426', '0', '4', '0.01', '1195', null, '2018-09-29 18:50:39');
INSERT INTO `payment_history` VALUES ('1427', '0', '4', '0.01', '1195', null, '2018-09-29 18:52:33');
INSERT INTO `payment_history` VALUES ('1428', '937', '10', '0.01', null, '1', '2018-09-29 21:18:11');
INSERT INTO `payment_history` VALUES ('1429', '937', '9', '0.00', null, '1', '2018-09-29 21:18:11');
INSERT INTO `payment_history` VALUES ('1430', '937', '11', '0.01', null, '1275', '2018-09-29 21:21:58');
INSERT INTO `payment_history` VALUES ('1431', '937', '14', '0.01', null, '1275', '2018-09-29 21:21:58');
INSERT INTO `payment_history` VALUES ('1432', '937', '11', '0.01', null, '1276', '2018-09-29 21:40:09');
INSERT INTO `payment_history` VALUES ('1433', '937', '14', '0.01', null, '1276', '2018-09-29 21:40:09');
INSERT INTO `payment_history` VALUES ('1434', '937', '11', '0.01', null, '1274', '2018-09-29 21:41:13');
INSERT INTO `payment_history` VALUES ('1435', '937', '14', '0.01', null, '1274', '2018-09-29 21:41:13');
INSERT INTO `payment_history` VALUES ('1436', '937', '11', '0.01', null, '1273', '2018-09-29 21:41:37');
INSERT INTO `payment_history` VALUES ('1437', '937', '14', '0.01', null, '1273', '2018-09-29 21:41:37');
INSERT INTO `payment_history` VALUES ('1438', '946', '10', '20.00', null, '1', '2018-09-29 21:57:32');
INSERT INTO `payment_history` VALUES ('1439', '942', '9', '0.00', null, '1', '2018-09-29 21:57:32');
INSERT INTO `payment_history` VALUES ('1440', '946', '11', '10.00', null, '1277', '2018-09-29 21:57:50');
INSERT INTO `payment_history` VALUES ('1441', '942', '14', '10.00', null, '1277', '2018-09-29 21:57:50');
INSERT INTO `payment_history` VALUES ('1442', '946', '11', '10.00', null, '1270', '2018-09-29 21:58:00');
INSERT INTO `payment_history` VALUES ('1443', '942', '14', '10.00', null, '1270', '2018-09-29 21:58:00');
INSERT INTO `payment_history` VALUES ('1444', '0', '13', '0.10', '1233', null, '2018-09-29 22:06:29');
INSERT INTO `payment_history` VALUES ('1445', '0', '4', '0.10', '1233', null, '2018-09-29 22:07:32');
INSERT INTO `payment_history` VALUES ('1446', '0', '4', '0.10', '1233', null, '2018-09-29 22:07:37');
INSERT INTO `payment_history` VALUES ('1447', '937', '11', '0.01', null, '1272', '2018-09-29 22:08:27');
INSERT INTO `payment_history` VALUES ('1448', '937', '14', '0.01', null, '1272', '2018-09-29 22:08:27');
INSERT INTO `payment_history` VALUES ('1449', '937', '10', '1.00', null, '1', '2018-09-29 22:39:14');
INSERT INTO `payment_history` VALUES ('1450', '937', '9', '0.00', null, '1', '2018-09-29 22:39:14');
INSERT INTO `payment_history` VALUES ('1451', '937', '11', '0.05', null, '1310', '2018-09-29 22:40:02');
INSERT INTO `payment_history` VALUES ('1452', '937', '14', '0.05', null, '1310', '2018-09-29 22:40:02');
INSERT INTO `payment_history` VALUES ('1453', '948', '3', '0.01', '1220', null, '2018-09-29 22:58:40');
INSERT INTO `payment_history` VALUES ('1454', '0', '13', '0.01', '1195', null, '2018-09-30 01:05:47');
INSERT INTO `payment_history` VALUES ('1455', '937', '12', '0.01', '1195', null, '2018-09-30 01:05:47');
INSERT INTO `payment_history` VALUES ('1456', '0', '4', '0.01', '1195', null, '2018-09-30 01:06:03');
INSERT INTO `payment_history` VALUES ('1457', '937', '6', '0.01', '1195', null, '2018-09-30 01:06:03');
INSERT INTO `payment_history` VALUES ('1458', '946', '10', '10.00', null, '1314', '2018-09-30 06:51:10');
INSERT INTO `payment_history` VALUES ('1459', '942', '9', '8.50', null, '1314', '2018-09-30 06:51:10');
INSERT INTO `payment_history` VALUES ('1460', '945', '3', '0.01', '1222', null, '2018-09-30 07:16:45');
INSERT INTO `payment_history` VALUES ('1461', '939', '1', '0.01', '1222', null, '2018-09-30 07:16:45');
INSERT INTO `payment_history` VALUES ('1462', '945', '4', '0.01', '1222', null, '2018-09-30 07:16:52');
INSERT INTO `payment_history` VALUES ('1463', '939', '6', '0.01', '1222', null, '2018-09-30 07:16:52');
INSERT INTO `payment_history` VALUES ('1464', '939', '10', '0.02', null, '1315', '2018-09-30 10:19:28');
INSERT INTO `payment_history` VALUES ('1465', '939', '9', '0.02', null, '1315', '2018-09-30 10:19:28');
INSERT INTO `payment_history` VALUES ('1466', '937', '11', '0.05', null, '1312', '2018-09-30 22:21:09');
INSERT INTO `payment_history` VALUES ('1467', '937', '14', '0.00', null, '1312', '2018-09-30 22:21:09');
INSERT INTO `payment_history` VALUES ('1468', '937', '11', '0.01', null, '1313', '2018-09-30 22:22:27');
INSERT INTO `payment_history` VALUES ('1469', '937', '14', '0.01', null, '1313', '2018-09-30 22:22:27');
INSERT INTO `payment_history` VALUES ('1470', '937', '11', '0.05', null, '1260', '2018-09-30 22:25:24');
INSERT INTO `payment_history` VALUES ('1471', '949', '14', '0.05', null, '1260', '2018-09-30 22:25:24');
INSERT INTO `payment_history` VALUES ('1472', '939', '11', '0.02', null, '1255', '2018-10-01 03:41:37');
INSERT INTO `payment_history` VALUES ('1473', '942', '14', '0.02', null, '1255', '2018-10-01 03:41:37');
INSERT INTO `payment_history` VALUES ('1474', '946', '11', '10.00', null, '1314', '2018-10-01 03:42:03');
INSERT INTO `payment_history` VALUES ('1475', '942', '14', '1.50', null, '1314', '2018-10-01 03:42:03');
INSERT INTO `payment_history` VALUES ('1476', '939', '11', '0.02', null, '1263', '2018-10-01 07:14:43');
INSERT INTO `payment_history` VALUES ('1477', '942', '14', '0.02', null, '1263', '2018-10-01 07:14:43');
INSERT INTO `payment_history` VALUES ('1478', '942', '3', '5.00', '1237', null, '2018-10-01 07:17:01');
INSERT INTO `payment_history` VALUES ('1479', '942', '4', '5.00', '1237', null, '2018-10-01 07:17:23');
INSERT INTO `payment_history` VALUES ('1480', '942', '3', '5.00', '1237', null, '2018-10-01 07:43:33');
INSERT INTO `payment_history` VALUES ('1481', '939', '1', '5.00', '1237', null, '2018-10-01 07:43:33');
INSERT INTO `payment_history` VALUES ('1482', '939', '3', '1.00', '1239', null, '2018-10-01 10:45:13');
INSERT INTO `payment_history` VALUES ('1483', '942', '3', '0.10', '1240', null, '2018-10-01 12:11:07');
INSERT INTO `payment_history` VALUES ('1484', '942', '1', '0.10', '1240', null, '2018-10-01 12:11:07');
INSERT INTO `payment_history` VALUES ('1485', '942', '3', '0.10', '1240', null, '2018-10-01 14:40:57');
INSERT INTO `payment_history` VALUES ('1486', '939', '1', '0.10', '1240', null, '2018-10-01 14:40:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rating
-- ----------------------------
INSERT INTO `rating` VALUES ('103', '935', null, '1117', '5', '刚回家就好', '2018-09-21 09:14:16');
INSERT INTO `rating` VALUES ('105', '942', null, '1162', '5', '这家场馆真的很不错\n是的很不错', '2018-09-26 08:35:19');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1016', '934', '地方放发的', '5.00');
INSERT INTO `room` VALUES ('1017', '934', '大概发发发', '3.00');
INSERT INTO `room` VALUES ('1018', '934', '徐打广告', '2.00');
INSERT INTO `room` VALUES ('1089', '935', 'VHS', '2.00');
INSERT INTO `room` VALUES ('1090', '935', 'VB你', '0.01');
INSERT INTO `room` VALUES ('1101', '937', '1号场', '0.01');
INSERT INTO `room` VALUES ('1102', '937', '2号', '0.05');
INSERT INTO `room` VALUES ('1103', '937', '3号场', '0.01');
INSERT INTO `room` VALUES ('1108', '946', '睡觉', '1.00');
INSERT INTO `room` VALUES ('1109', '946', '吃饭', '1.00');
INSERT INTO `room` VALUES ('1110', '946', '玩耍', '10.00');
INSERT INTO `room` VALUES ('1111', '939', '1号场', '0.01');
INSERT INTO `room` VALUES ('1112', '939', '2号场', '0.02');

-- ----------------------------
-- Table structure for room_booking
-- ----------------------------
DROP TABLE IF EXISTS `room_booking`;
CREATE TABLE `room_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_num` varchar(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_id` int(10) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `paid_price` decimal(10,2) DEFAULT '0.00',
  `state` int(2) DEFAULT '0' COMMENT 'state of booking',
  `submit_time` datetime DEFAULT NULL,
  `out_trade_no` varchar(40) DEFAULT NULL,
  `out_refund_no` char(40) DEFAULT NULL,
  `pay_cost` decimal(10,2) DEFAULT NULL,
  `pay_honey` decimal(10,2) DEFAULT NULL,
  `pay_online` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1316 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of room_booking
-- ----------------------------
INSERT INTO `room_booking` VALUES ('1125', null, '942', '1031', '2018-09-22 10:30:00', '2018-09-22 11:00:00', '10.00', '2', '2018-09-21 21:20:55', null, null, '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1126', null, '942', '1031', '2018-09-24 09:00:00', '2018-09-24 09:30:00', '10.00', '3', '2018-09-21 21:39:37', null, '15002200621537537264989', '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1162', null, '942', '1031', '2018-09-24 10:30:00', '2018-09-24 11:00:00', '10.00', '2', '2018-09-24 10:24:28', null, null, '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1171', null, '945', '1031', '2018-09-25 10:00:00', '2018-09-25 10:30:00', '10.00', '2', '2018-09-25 09:17:11', null, null, '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1172', null, '942', '1057', '2018-09-29 08:00:00', '2018-09-29 12:00:00', '1.00', '2', '2018-09-26 15:55:57', null, '15002200621537866134543', '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1174', null, '942', '1057', '2018-09-28 08:00:00', '2018-09-28 12:00:00', '1.00', '2', '2018-09-26 14:05:50', null, '15002200621537922088954', '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1175', null, '942', '1057', '2018-10-01 08:00:00', '2018-10-01 12:00:00', '1.00', '2', '2018-09-25 10:38:12', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1176', null, '947', '1031', '2018-09-25 11:00:00', '2018-09-25 11:30:00', '10.00', '2', '2018-09-25 10:41:34', null, null, '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1177', null, '946', '1057', '2018-09-26 08:00:00', '2018-09-26 12:00:00', '1.00', '2', '2018-09-25 11:06:39', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1180', null, '942', '1056', '2018-09-28 08:00:00', '2018-09-28 12:00:00', '1.00', '2', '2018-09-25 11:35:34', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1181', null, '940', '1056', '2018-09-27 08:00:00', '2018-09-27 12:00:00', '1.00', '3', '2018-09-25 12:18:11', null, '15002200621537849136097', '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1196', null, '942', '1057', '2018-09-26 14:00:00', '2018-09-26 18:00:00', '1.00', '2', '2018-09-26 08:30:29', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1197', null, '939', '1056', '2018-09-26 14:00:00', '2018-09-26 18:00:00', '1.00', '2', '2018-09-26 08:31:27', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1199', null, '945', '1056', '2018-09-27 08:00:00', '2018-09-27 12:00:00', '1.00', '2', '2018-09-26 09:06:28', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1201', null, '942', '1057', '2018-09-27 08:00:00', '2018-09-27 12:00:00', '1.00', '2', '2018-09-26 09:09:10', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1205', null, '945', '1056', '2018-09-30 08:00:00', '2018-09-30 12:00:00', '1.00', '2', '2018-09-27 11:00:17', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1206', null, '949', '1086', '2018-09-28 09:00:00', '2018-09-28 09:30:00', '0.01', '3', '2018-09-27 14:07:06', null, '15002200621538054884929', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1207', null, '949', '1087', '2018-09-28 10:30:00', '2018-09-28 11:00:00', '0.05', '3', '2018-09-27 14:07:06', null, '15002200621538093229504', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1208', null, '949', '1088', '2018-09-28 11:30:00', '2018-09-28 12:00:00', '0.01', '3', '2018-09-27 14:07:06', null, '15002200621538054892147', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1209', null, '949', '1087', '2018-09-28 09:30:00', '2018-09-28 10:00:00', '0.05', '2', '2018-09-27 16:13:18', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1210', null, '949', '1088', '2018-09-28 10:30:00', '2018-09-28 11:00:00', '0.01', '2', '2018-09-27 16:13:18', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1211', null, '949', '1087', '2018-09-28 11:30:00', '2018-09-28 12:00:00', '0.05', '2', '2018-09-27 16:13:18', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1212', null, '949', '1088', '2018-09-28 09:30:00', '2018-09-28 10:00:00', '0.01', '2', '2018-09-27 16:19:21', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1213', null, '949', '1086', '2018-09-28 11:00:00', '2018-09-28 11:30:00', '0.01', '2', '2018-09-27 16:19:21', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1214', null, '949', '1086', '2018-09-28 10:00:00', '2018-09-28 10:30:00', '0.01', '2', '2018-09-27 16:41:43', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1215', null, '949', '1087', '2018-09-28 09:00:00', '2018-09-28 09:30:00', '0.05', '2', '2018-09-27 16:42:23', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1216', null, '949', '1086', '2018-09-28 09:30:00', '2018-09-28 10:00:00', '0.01', '2', '2018-09-27 16:44:12', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1217', null, '942', '1057', '2018-09-30 08:00:00', '2018-09-30 12:00:00', '1.00', '2', '2018-09-27 17:15:14', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1218', null, '946', '1057', '2018-10-02 08:00:00', '2018-10-02 12:00:00', '1.00', '0', '2018-09-27 18:56:54', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1219', null, '947', '1093', '2018-09-28 14:00:00', '2018-09-28 16:00:00', '0.01', '3', '2018-09-27 20:42:36', null, '15002200621538052209067', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1220', null, '947', '1094', '2018-09-30 10:00:00', '2018-09-30 12:00:00', '0.02', '3', '2018-09-27 20:43:06', null, '15002200621538052217901', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1221', null, '942', '1094', '2018-09-28 08:00:00', '2018-09-28 10:00:00', '0.02', '3', '2018-09-27 20:50:04', null, '15002200621538055270318', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1222', null, '942', '1094', '2018-09-28 10:00:00', '2018-09-28 12:00:00', '0.02', '3', '2018-09-27 20:50:47', null, '15002200621538052697286', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1223', null, '949', '1088', '2018-09-28 09:00:00', '2018-09-28 09:30:00', '0.01', '2', '2018-09-27 21:14:23', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1224', null, '949', '1088', '2018-09-28 10:00:00', '2018-09-28 10:30:00', '0.01', '2', '2018-09-27 21:15:25', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1225', null, '942', '1094', '2018-09-29 08:00:00', '2018-09-29 10:00:00', '0.02', '3', '2018-09-27 21:37:25', null, '15002200621538115217984', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1226', null, '942', '1094', '2018-10-02 08:00:00', '2018-10-02 10:00:00', '0.02', '0', '2018-09-27 21:34:09', null, '15002200621538055178003', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1227', null, '942', '1093', '2018-09-30 10:00:00', '2018-09-30 12:00:00', '0.01', '3', '2018-09-27 21:39:20', null, '15002200621538056436684', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1228', null, '942', '1094', '2018-09-29 10:00:00', '2018-09-29 12:00:00', '0.02', '3', '2018-09-27 21:48:39', null, '15002200621538056139684', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1229', null, '942', '1094', '2018-10-01 08:00:00', '2018-10-01 10:00:00', '0.02', '2', '2018-09-28 06:48:54', null, null, '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1230', null, '942', '1094', '2018-10-01 10:00:00', '2018-10-01 12:00:00', '0.02', '2', '2018-09-28 10:50:25', null, '15002200621538088577634', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1231', null, '939', '1056', '2018-09-30 14:00:00', '2018-09-30 18:00:00', '1.00', '3', '2018-09-28 07:19:00', null, '15002200621538090366651', '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1232', null, '949', '1086', '2018-09-28 14:30:00', '2018-09-28 15:00:00', '0.01', '3', '2018-09-28 08:06:41', null, '15002200621538093741418', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1233', null, '949', '1087', '2018-09-28 15:00:00', '2018-09-28 15:30:00', '0.05', '3', '2018-09-28 08:06:41', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1234', null, '949', '1088', '2018-09-28 15:30:00', '2018-09-28 16:00:00', '0.01', '3', '2018-09-28 08:06:41', null, '15002200621538093749269', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1235', null, '942', '1094', '2018-09-30 08:00:00', '2018-09-30 10:00:00', '0.02', '3', '2018-09-28 08:37:07', null, '15002200621538095056545', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1236', null, '942', '1094', '2018-10-01 14:00:00', '2018-10-01 16:00:00', '0.02', '2', '2018-09-28 14:13:24', null, '15002200621538103209905', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1237', null, '949', '1088', '2018-10-02 08:30:00', '2018-10-02 09:00:00', '0.01', '0', '2018-09-28 10:20:09', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1238', null, '949', '1087', '2018-10-02 09:00:00', '2018-10-02 09:30:00', '0.05', '0', '2018-09-28 10:55:03', null, '15002200621538102611672', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1239', null, '949', '1086', '2018-10-02 10:00:00', '2018-10-02 10:30:00', '0.01', '0', '2018-09-28 10:32:32', null, '15002200621538101247107', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1240', null, '949', '1087', '2018-10-02 10:30:00', '2018-10-02 11:00:00', '0.05', '3', '2018-09-28 10:20:09', null, '15002200621538103195596', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1241', null, '949', '1088', '2018-10-02 11:30:00', '2018-10-02 12:00:00', '0.01', '3', '2018-09-28 10:20:09', null, '15002200621538102643855', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1242', null, '949', '1086', '2018-10-02 09:00:00', '2018-10-02 09:30:00', '0.01', '3', '2018-09-28 10:32:32', null, '15002200621538102700695', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1243', null, '949', '1087', '2018-10-02 10:00:00', '2018-10-02 10:30:00', '0.05', '0', '2018-09-28 10:55:03', null, '15002200621538103276584', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1244', null, '949', '1086', '2018-10-02 08:30:00', '2018-10-02 09:00:00', '0.01', '0', '2018-09-28 10:55:03', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1245', null, '949', '1087', '2018-10-02 09:30:00', '2018-10-02 10:00:00', '0.05', '0', '2018-09-28 10:55:03', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1246', null, '949', '1088', '2018-10-02 10:00:00', '2018-10-02 10:30:00', '0.01', '0', '2018-09-28 10:55:03', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1247', null, '949', '1086', '2018-10-02 11:00:00', '2018-10-02 11:30:00', '0.01', '0', '2018-09-28 10:55:03', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1248', null, '949', '1088', '2018-10-02 11:00:00', '2018-10-02 11:30:00', '0.01', '0', '2018-09-28 10:55:03', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1249', null, '942', '1094', '2018-10-01 22:00:00', '2018-10-01 23:00:00', '0.02', '3', '2018-09-28 10:55:45', null, '15002200621538103361004', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1250', null, '949', '1101', '2018-10-02 09:00:00', '2018-10-02 09:30:00', '0.01', '3', '2018-09-29 02:24:28', null, '15002200621538200518006', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1251', null, '949', '1102', '2018-10-02 09:30:00', '2018-10-02 10:00:00', '0.05', '3', '2018-09-29 02:24:28', null, '15002200621538200555072', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1252', null, '949', '1103', '2018-10-02 11:00:00', '2018-10-02 11:30:00', '0.01', '0', '2018-09-29 02:24:28', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1253', null, '942', '1107', '2018-10-01 08:00:00', '2018-10-01 10:00:00', '0.02', '3', '2018-09-29 08:24:05', null, '15002200621538189929829', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1254', null, '942', '1107', '2018-10-01 10:00:00', '2018-10-01 12:00:00', '0.02', '3', '2018-09-29 08:25:37', null, '15002200621538202528281', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1255', null, '942', '1107', '2018-10-03 14:00:00', '2018-10-03 16:00:00', '0.02', '3', '2018-09-29 08:38:15', null, '15002200621538336494443', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1256', null, '947', '1107', '2018-10-01 18:00:00', '2018-10-01 20:00:00', '0.02', '3', '2018-09-29 08:46:04', null, '15002200621538206091729', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1257', null, '945', '1107', '2018-10-01 20:00:00', '2018-10-01 22:00:00', '0.02', '3', '2018-09-29 11:29:35', null, '15002200621538204390672', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1258', null, '949', '1102', '2018-10-02 08:00:00', '2018-10-02 08:30:00', '0.05', '0', '2018-09-29 13:15:29', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1259', null, '949', '1102', '2018-10-02 08:30:00', '2018-10-02 09:00:00', '0.05', '0', '2018-09-29 13:15:29', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1260', null, '949', '1102', '2018-10-02 10:00:00', '2018-10-02 10:30:00', '0.05', '3', '2018-09-29 13:15:29', null, '15002200621538317524449', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1261', null, '949', '1102', '2018-10-02 10:30:00', '2018-10-02 11:00:00', '0.05', '0', '2018-09-29 13:15:29', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1262', null, '942', '1107', '2018-10-01 14:00:00', '2018-10-01 16:00:00', '0.02', '2', '2018-09-29 14:04:21', null, null, '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1263', null, '942', '1107', '2018-10-01 16:00:00', '2018-10-01 18:00:00', '0.02', '3', '2018-09-29 14:28:29', null, '15002200621538349280055', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1264', null, '945', '1107', '2018-09-29 18:00:00', '2018-09-29 20:00:00', '0.02', '3', '2018-09-29 14:56:59', null, '15002200621538204249975', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1265', null, '942', '1106', '2018-09-29 20:00:00', '2018-09-29 22:00:00', '0.01', '2', '2018-09-29 14:59:20', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1266', null, '942', '1107', '2018-09-29 20:00:00', '2018-09-29 22:00:00', '0.02', '2', '2018-09-29 14:59:20', null, null, '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1267', null, '945', '1107', '2018-09-30 18:00:00', '2018-09-30 20:00:00', '0.02', '2', '2018-09-29 14:59:26', null, null, '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1268', null, '945', '1107', '2018-09-30 20:00:00', '2018-09-30 22:00:00', '0.02', '3', '2018-09-29 14:59:26', null, '15002200621538204401698', '0.02', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1269', null, '942', '1099', '2018-10-01 08:00:00', '2018-10-01 12:00:00', '1.00', '2', '2018-09-29 15:00:14', null, null, '1.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1270', null, '942', '1100', '2018-10-02 08:00:00', '2018-10-02 12:00:00', '10.00', '3', '2018-09-29 21:57:32', null, '15002200621538229477533', '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1271', null, '947', '1106', '2018-10-01 18:00:00', '2018-10-01 20:00:00', '0.01', '3', '2018-09-29 15:27:32', null, '15002200621538206097188', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1272', null, '937', '1103', '2018-10-02 08:00:00', '2018-10-02 08:30:00', '0.01', '3', '2018-09-29 17:25:26', null, '15002200621538230106982', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1273', null, '937', '1103', '2018-10-02 08:30:00', '2018-10-02 09:00:00', '0.01', '3', '2018-09-29 17:25:26', null, '15002200621538228497347', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1274', null, '937', '1103', '2018-10-02 09:00:00', '2018-10-02 09:30:00', '0.01', '3', '2018-09-29 17:25:26', null, '15002200621538228473447', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1275', null, '937', '1103', '2018-10-02 09:30:00', '2018-10-02 10:00:00', '0.01', '3', '2018-09-29 17:25:26', null, '15002200621538227318339', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1276', null, '937', '1101', '2018-10-02 10:30:00', '2018-10-02 11:00:00', '0.01', '3', '2018-09-29 21:18:11', null, '15002200621538228412068', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1277', null, '942', '1100', '2018-10-02 14:00:00', '2018-10-02 18:00:00', '10.00', '3', '2018-09-29 21:57:32', null, '15002200621538229468019', '10.00', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1278', null, '937', '1101', '2018-10-03 08:00:00', '2018-10-03 08:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1279', null, '937', '1102', '2018-10-03 08:00:00', '2018-10-03 08:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1280', null, '937', '1103', '2018-10-03 08:00:00', '2018-10-03 08:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1281', null, '937', '1101', '2018-10-03 08:30:00', '2018-10-03 09:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1282', null, '937', '1102', '2018-10-03 08:30:00', '2018-10-03 09:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1283', null, '937', '1103', '2018-10-03 08:30:00', '2018-10-03 09:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1284', null, '937', '1101', '2018-10-03 09:00:00', '2018-10-03 09:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1285', null, '937', '1102', '2018-10-03 09:00:00', '2018-10-03 09:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1286', null, '937', '1103', '2018-10-03 09:00:00', '2018-10-03 09:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1287', null, '937', '1101', '2018-10-03 09:30:00', '2018-10-03 10:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1288', null, '937', '1102', '2018-10-03 09:30:00', '2018-10-03 10:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1289', null, '937', '1103', '2018-10-03 09:30:00', '2018-10-03 10:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1290', null, '937', '1102', '2018-10-03 10:00:00', '2018-10-03 10:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1291', null, '937', '1103', '2018-10-03 10:00:00', '2018-10-03 10:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1292', null, '937', '1102', '2018-10-03 10:30:00', '2018-10-03 11:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1293', null, '937', '1103', '2018-10-03 10:30:00', '2018-10-03 11:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1294', null, '937', '1102', '2018-10-03 11:00:00', '2018-10-03 11:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1295', null, '937', '1103', '2018-10-03 11:00:00', '2018-10-03 11:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1296', null, '937', '1102', '2018-10-03 11:30:00', '2018-10-03 12:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1297', null, '937', '1103', '2018-10-03 11:30:00', '2018-10-03 12:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1298', null, '937', '1102', '2018-10-03 14:00:00', '2018-10-03 14:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1299', null, '937', '1103', '2018-10-03 14:00:00', '2018-10-03 14:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1300', null, '937', '1102', '2018-10-03 14:30:00', '2018-10-03 15:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1301', null, '937', '1103', '2018-10-03 14:30:00', '2018-10-03 15:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1302', null, '937', '1102', '2018-10-03 15:00:00', '2018-10-03 15:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1303', null, '937', '1103', '2018-10-03 15:00:00', '2018-10-03 15:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1304', null, '937', '1102', '2018-10-03 15:30:00', '2018-10-03 16:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1305', null, '937', '1103', '2018-10-03 15:30:00', '2018-10-03 16:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1306', null, '937', '1102', '2018-10-03 16:00:00', '2018-10-03 16:30:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1307', null, '937', '1103', '2018-10-03 16:00:00', '2018-10-03 16:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1308', null, '937', '1102', '2018-10-03 16:30:00', '2018-10-03 17:00:00', '0.05', '0', '2018-09-29 22:39:14', null, null, '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1309', null, '937', '1103', '2018-10-03 16:30:00', '2018-10-03 17:00:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1310', null, '937', '1102', '2018-10-03 17:00:00', '2018-10-03 17:30:00', '0.05', '3', '2018-09-29 22:39:14', null, '15002200621538232002105', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1311', null, '937', '1103', '2018-10-03 17:00:00', '2018-10-03 17:30:00', '0.01', '0', '2018-09-29 22:39:14', null, null, '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1312', null, '937', '1102', '2018-10-03 17:30:00', '2018-10-03 18:00:00', '0.05', '3', '2018-09-29 22:39:14', null, '15002200621538317271222', '0.05', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1313', null, '937', '1103', '2018-10-03 17:30:00', '2018-10-03 18:00:00', '0.01', '3', '2018-09-29 22:39:14', null, '15002200621538317348490', '0.01', '0.00', '0.00');
INSERT INTO `room_booking` VALUES ('1314', null, '942', '1110', '2018-10-02 14:00:00', '2018-10-02 18:00:00', '10.00', '3', '2018-09-30 06:51:10', '', '15002200621538336520596', '10.00', '8.50', '0.00');
INSERT INTO `room_booking` VALUES ('1315', null, '939', '1107', '2018-10-02 22:00:00', '2018-10-02 23:00:00', '0.02', '0', '2018-09-30 10:19:28', '', null, '0.02', '0.02', '0.00');

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
INSERT INTO `rule` VALUES ('1', '200');
INSERT INTO `rule` VALUES ('2', '50');
INSERT INTO `rule` VALUES ('3', '50');
INSERT INTO `rule` VALUES ('4', '0.5');
INSERT INTO `rule` VALUES ('5', '3');
INSERT INTO `rule` VALUES ('6', '200');
INSERT INTO `rule` VALUES ('7', '50000');
INSERT INTO `rule` VALUES ('8', '9.9');
INSERT INTO `rule` VALUES ('9', '10000');
INSERT INTO `rule` VALUES ('10', '1');
INSERT INTO `rule` VALUES ('11', '15000');
INSERT INTO `rule` VALUES ('12', '1.5');
INSERT INTO `rule` VALUES ('13', '14000');
INSERT INTO `rule` VALUES ('14', '1.5');

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
) ENGINE=InnoDB AUTO_INCREMENT=2235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share_data
-- ----------------------------
INSERT INTO `share_data` VALUES ('2187', '935', '935', '3', '{\"book_date\":\"2018-9-19\",\"book_info\":[{\"cost\":0.1,\"status\":1,\"room_id\":\"1019\",\"book_id\":\"\",\"user_id\":\"935\",\"room_name\":\"VHS\",\"start\":\"13:00\",\"end\":\"15:00\",\"start_time\":1537333200000,\"end_time\":1537340400000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1020\",\"book_id\":\"\",\"user_id\":\"935\",\"room_name\":\"VB\\u4f60\",\"start\":\"13:00\",\"end\":\"15:00\",\"start_time\":1537333200000,\"end_time\":1537340400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2190', '942', '939', '6', '{\"book_date\":\"2018-9-29\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1106\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"20:00\",\"end\":\"22:00\",\"start_time\":1538222400000,\"end_time\":1538229600000,\"state\":0},{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"20:00\",\"end\":\"22:00\",\"start_time\":1538222400000,\"end_time\":1538229600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2191', '942', '939', '1', '{\"book_date\":\"2018-10-1\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"1107\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"16:00\",\"end\":\"18:00\",\"start_time\":1538380800000,\"end_time\":1538388000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2193', '937', '937', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1101\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"10:30\",\"end\":\"11:00\",\"start_time\":1538447400000,\"end_time\":1538449200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2194', '937', '937', '3', '{\"book_date\":\"2018-10-3\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1101\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"08:00\",\"end\":\"08:30\",\"start_time\":1538524800000,\"end_time\":1538526600000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"08:00\",\"end\":\"08:30\",\"start_time\":1538524800000,\"end_time\":1538526600000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"08:00\",\"end\":\"08:30\",\"start_time\":1538524800000,\"end_time\":1538526600000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1101\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"08:30\",\"end\":\"09:00\",\"start_time\":1538526600000,\"end_time\":1538528400000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"08:30\",\"end\":\"09:00\",\"start_time\":1538526600000,\"end_time\":1538528400000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"08:30\",\"end\":\"09:00\",\"start_time\":1538526600000,\"end_time\":1538528400000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1101\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"09:00\",\"end\":\"09:30\",\"start_time\":1538528400000,\"end_time\":1538530200000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"09:00\",\"end\":\"09:30\",\"start_time\":1538528400000,\"end_time\":1538530200000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"09:00\",\"end\":\"09:30\",\"start_time\":1538528400000,\"end_time\":1538530200000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1101\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"09:30\",\"end\":\"10:00\",\"start_time\":1538530200000,\"end_time\":1538532000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"09:30\",\"end\":\"10:00\",\"start_time\":1538530200000,\"end_time\":1538532000000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"09:30\",\"end\":\"10:00\",\"start_time\":1538530200000,\"end_time\":1538532000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"10:00\",\"end\":\"10:30\",\"start_time\":1538532000000,\"end_time\":1538533800000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"10:00\",\"end\":\"10:30\",\"start_time\":1538532000000,\"end_time\":1538533800000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"10:30\",\"end\":\"11:00\",\"start_time\":1538533800000,\"end_time\":1538535600000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"10:30\",\"end\":\"11:00\",\"start_time\":1538533800000,\"end_time\":1538535600000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"11:00\",\"end\":\"11:30\",\"start_time\":1538535600000,\"end_time\":1538537400000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"11:00\",\"end\":\"11:30\",\"start_time\":1538535600000,\"end_time\":1538537400000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"11:30\",\"end\":\"12:00\",\"start_time\":1538537400000,\"end_time\":1538539200000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"11:30\",\"end\":\"12:00\",\"start_time\":1538537400000,\"end_time\":1538539200000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"14:00\",\"end\":\"14:30\",\"start_time\":1538546400000,\"end_time\":1538548200000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"14:00\",\"end\":\"14:30\",\"start_time\":1538546400000,\"end_time\":1538548200000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"14:30\",\"end\":\"15:00\",\"start_time\":1538548200000,\"end_time\":1538550000000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"14:30\",\"end\":\"15:00\",\"start_time\":1538548200000,\"end_time\":1538550000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"15:00\",\"end\":\"15:30\",\"start_time\":1538550000000,\"end_time\":1538551800000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"15:00\",\"end\":\"15:30\",\"start_time\":1538550000000,\"end_time\":1538551800000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"15:30\",\"end\":\"16:00\",\"start_time\":1538551800000,\"end_time\":1538553600000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"15:30\",\"end\":\"16:00\",\"start_time\":1538551800000,\"end_time\":1538553600000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"16:00\",\"end\":\"16:30\",\"start_time\":1538553600000,\"end_time\":1538555400000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"16:00\",\"end\":\"16:30\",\"start_time\":1538553600000,\"end_time\":1538555400000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"16:30\",\"end\":\"17:00\",\"start_time\":1538555400000,\"end_time\":1538557200000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"16:30\",\"end\":\"17:00\",\"start_time\":1538555400000,\"end_time\":1538557200000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"17:00\",\"end\":\"17:30\",\"start_time\":1538557200000,\"end_time\":1538559000000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"17:00\",\"end\":\"17:30\",\"start_time\":1538557200000,\"end_time\":1538559000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"2\\u53f7\",\"start\":\"17:30\",\"end\":\"18:00\",\"start_time\":1538559000000,\"end_time\":1538560800000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1103\",\"book_id\":\"\",\"user_id\":\"937\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"17:30\",\"end\":\"18:00\",\"start_time\":1538559000000,\"end_time\":1538560800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2198', '939', '939', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"1107\",\"user_id\":\"939\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"22:00\",\"end\":\"23:00\",\"start_time\":1538488800000,\"end_time\":1538492400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2199', '946', '946', '6', '{\"book_date\":\"2018-9-29\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538179200000,\"end_time\":1538193600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2201', '946', '946', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538092800000,\"end_time\":1538107200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2202', '946', '946', '1', '{\"book_date\":\"2018-10-1\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538352000000,\"end_time\":1538366400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2203', '939', '939', '2', '{\"book_date\":\"2018-9-25\",\"book_info\":[{\"cost\":10,\"status\":1,\"room_id\":\"1031\",\"book_id\":\"\",\"user_id\":\"947\",\"room_name\":\"2\",\"start\":\"11:00\",\"end\":\"11:30\",\"start_time\":1537844400000,\"end_time\":1537846200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2204', '946', '946', '3', '{\"book_date\":\"2018-9-26\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"\",\"user_id\":\"946\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1537920000000,\"end_time\":1537934400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2205', '946', '946', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538092800000,\"end_time\":1538107200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2206', '946', '946', '4', '{\"book_date\":\"2018-9-27\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"\",\"user_id\":\"940\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538006400000,\"end_time\":1538020800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2210', '942', '946', '3', '{\"book_date\":\"2018-9-26\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"14:00\",\"end\":\"18:00\",\"start_time\":1537941600000,\"end_time\":1537956000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2211', '939', '946', '3', '{\"book_date\":\"2018-9-26\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"\",\"user_id\":\"939\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"14:00\",\"end\":\"18:00\",\"start_time\":1537941600000,\"end_time\":1537956000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2212', '945', '946', '4', '{\"book_date\":\"2018-9-27\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"1056\",\"user_id\":\"945\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538006400000,\"end_time\":1538020800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2213', '942', '946', '4', '{\"book_date\":\"2018-9-27\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538006400000,\"end_time\":1538020800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2214', '942', '946', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538092800000,\"end_time\":1538107200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2215', '942', '946', '6', '{\"book_date\":\"2018-9-29\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538179200000,\"end_time\":1538193600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2217', '945', '946', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"1056\",\"user_id\":\"945\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538265600000,\"end_time\":1538280000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2218', '949', '937', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1086\",\"book_id\":\"1086\",\"user_id\":\"949\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"14:30\",\"end\":\"15:00\",\"start_time\":1538116200000,\"end_time\":1538118000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1087\",\"book_id\":\"1087\",\"user_id\":\"949\",\"room_name\":\"2\\u53f7\",\"start\":\"15:00\",\"end\":\"15:30\",\"start_time\":1538118000000,\"end_time\":1538119800000,\"state\":0},{\"cost\":0.01,\"status\":1,\"room_id\":\"1088\",\"book_id\":\"1088\",\"user_id\":\"949\",\"room_name\":\"3\\u53f7\\u573a\",\"start\":\"15:30\",\"end\":\"16:00\",\"start_time\":1538119800000,\"end_time\":1538121600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2219', '942', '946', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538265600000,\"end_time\":1538280000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2220', '946', '946', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1057\",\"book_id\":\"1057\",\"user_id\":\"946\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538438400000,\"end_time\":1538452800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2221', '947', '939', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1093\",\"book_id\":\"\",\"user_id\":\"947\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"14:00\",\"end\":\"16:00\",\"start_time\":1538114400000,\"end_time\":1538121600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2222', '947', '939', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1094\",\"book_id\":\"\",\"user_id\":\"947\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"10:00\",\"end\":\"12:00\",\"start_time\":1538272800000,\"end_time\":1538280000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2223', '942', '939', '5', '{\"book_date\":\"2018-9-28\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1094\",\"book_id\":\"1094\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"10:00\",\"end\":\"12:00\",\"start_time\":1538100000000,\"end_time\":1538107200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2224', '942', '939', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1094\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"08:00\",\"end\":\"10:00\",\"start_time\":1538438400000,\"end_time\":1538445600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2225', '942', '939', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1094\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"08:00\",\"end\":\"10:00\",\"start_time\":1538265600000,\"end_time\":1538272800000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2226', '939', '946', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1056\",\"book_id\":\"1056\",\"user_id\":\"939\",\"room_name\":\"\\u7761\\u89c9\",\"start\":\"14:00\",\"end\":\"18:00\",\"start_time\":1538287200000,\"end_time\":1538301600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2227', '949', '937', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"949\",\"room_name\":\"2\\u53f7\",\"start\":\"08:00\",\"end\":\"08:30\",\"start_time\":1538438400000,\"end_time\":1538440200000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"\",\"user_id\":\"949\",\"room_name\":\"2\\u53f7\",\"start\":\"08:30\",\"end\":\"09:00\",\"start_time\":1538440200000,\"end_time\":1538442000000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"1102\",\"user_id\":\"949\",\"room_name\":\"2\\u53f7\",\"start\":\"10:00\",\"end\":\"10:30\",\"start_time\":1538445600000,\"end_time\":1538447400000,\"state\":0},{\"cost\":0.05,\"status\":1,\"room_id\":\"1102\",\"book_id\":\"1102\",\"user_id\":\"949\",\"room_name\":\"2\\u53f7\",\"start\":\"10:30\",\"end\":\"11:00\",\"start_time\":1538447400000,\"end_time\":1538449200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2228', '942', '939', '3', '{\"book_date\":\"2018-10-3\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"14:00\",\"end\":\"16:00\",\"start_time\":1538546400000,\"end_time\":1538553600000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2229', '947', '939', '1', '{\"book_date\":\"2018-10-1\",\"book_info\":[{\"cost\":0.01,\"status\":1,\"room_id\":\"1106\",\"book_id\":\"1106\",\"user_id\":\"947\",\"room_name\":\"1\\u53f7\\u573a\",\"start\":\"18:00\",\"end\":\"20:00\",\"start_time\":1538388000000,\"end_time\":1538395200000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2230', '945', '939', '1', '{\"book_date\":\"2018-10-1\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"1107\",\"user_id\":\"945\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"20:00\",\"end\":\"22:00\",\"start_time\":1538395200000,\"end_time\":1538402400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2231', '945', '939', '6', '{\"book_date\":\"2018-9-29\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"\",\"user_id\":\"945\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"18:00\",\"end\":\"20:00\",\"start_time\":1538215200000,\"end_time\":1538222400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2232', '945', '939', '0', '{\"book_date\":\"2018-9-30\",\"book_info\":[{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"1107\",\"user_id\":\"945\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"18:00\",\"end\":\"20:00\",\"start_time\":1538301600000,\"end_time\":1538308800000,\"state\":0},{\"cost\":0.02,\"status\":1,\"room_id\":\"1107\",\"book_id\":\"1107\",\"user_id\":\"945\",\"room_name\":\"2\\u53f7\\u573a\",\"start\":\"20:00\",\"end\":\"22:00\",\"start_time\":1538308800000,\"end_time\":1538316000000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2233', '942', '946', '1', '{\"book_date\":\"2018-10-1\",\"book_info\":[{\"cost\":1,\"status\":1,\"room_id\":\"1099\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u5403\\u996d\",\"start\":\"08:00\",\"end\":\"12:00\",\"start_time\":1538352000000,\"end_time\":1538366400000,\"state\":0}]}');
INSERT INTO `share_data` VALUES ('2234', '942', '946', '2', '{\"book_date\":\"2018-10-2\",\"book_info\":[{\"cost\":10,\"status\":1,\"room_id\":\"1110\",\"book_id\":\"\",\"user_id\":\"942\",\"room_name\":\"\\u73a9\\u800d\",\"start\":\"14:00\",\"end\":\"18:00\",\"start_time\":1538460000000,\"end_time\":1538474400000,\"state\":0}]}');

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
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_picture
-- ----------------------------
INSERT INTO `site_picture` VALUES ('2255', '934', '25a07fe085879cc01e6f7138f13e5f79.jpg', '0');
INSERT INTO `site_picture` VALUES ('2256', '934', 'e4031640979d23a9bad57ace71fc51d5.jpg', '1');
INSERT INTO `site_picture` VALUES ('2426', '935', '88e1c87c29a929be411310cbe99b1ba0.jpg', '0');
INSERT INTO `site_picture` VALUES ('2427', '935', '0581fc9e6c3a238f570d0e3ddb0c7f28.jpg', '1');
INSERT INTO `site_picture` VALUES ('2428', '935', '578bb0502725b8261ab368550ea806a7.jpg', '4');
INSERT INTO `site_picture` VALUES ('2429', '935', '611e31e5a46740bfc9fb8279757945b6.jpg', '2');
INSERT INTO `site_picture` VALUES ('2430', '935', 'f9635a82ec088dea6b929894ca4cc9f9.jpg', '3');
INSERT INTO `site_picture` VALUES ('2447', '937', '00b7d9c8174120528df060b6e0d65f60.png', '1');
INSERT INTO `site_picture` VALUES ('2448', '937', '5f7d9d77ccbbd61b12a53c361bf73829.png', '3');
INSERT INTO `site_picture` VALUES ('2449', '937', '5b069b187ec9d38326a959c0017376b7.png', '2');
INSERT INTO `site_picture` VALUES ('2450', '937', '3e9c11c6adfaae674aef8a52199ff3d8.gif', '0');
INSERT INTO `site_picture` VALUES ('2457', '946', '87e40b4fc2e006d7ac1a49893aef17c8.jpg', '1');
INSERT INTO `site_picture` VALUES ('2458', '946', '5b54f85b3bda78ce4a9dbed80e3ad801.jpg', '3');
INSERT INTO `site_picture` VALUES ('2459', '946', '2b4a2ffb7f0cbab878173de123ddb912.jpg', '0');
INSERT INTO `site_picture` VALUES ('2460', '946', '3fa0f8e1ff2b58c6cc31bd2f7aec9c25.jpg', '2');
INSERT INTO `site_picture` VALUES ('2461', '939', 'b5778d5f40e5491e33822d29977226ef.jpg', '0');
INSERT INTO `site_picture` VALUES ('2462', '939', '80164caffcd25551dfdfc1591e359071.jpg', '1');
INSERT INTO `site_picture` VALUES ('2463', '939', '7cd57d8c30feda13f29e07db67f9f1fa.jpg', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', null, '', '', '1', '1', '1', '18846140510', '0', '3,5,6', '20', null, '0', null, null, null, '2753', '2018-09-23 21:04:33', '0', null, '26', '', '[0,0]');
INSERT INTO `user` VALUES ('935', 'https://wx.qlogo.cn/mmopen/vi_32/LCtAfCKVQfKUWhbVQicuXfsaU1pCa5LvXGPZ2T2o1jiaBiaRJicKOHibnJaVAv3ibPVwrjZ7v1c0tgWRDKuT0vLBIXHw/132', '高富志', '没啥', '1', '2', '0', '18641502372', '1', '4', '19', '怎么怎么这么早', '0', null, null, null, '55366', '2018-09-15 00:39:42', '0', 'oMH3D5A80NRBLcizdY3ALWMoKEhA', '1', '', '[0,0]');
INSERT INTO `user` VALUES ('937', 'https://wx.qlogo.cn/mmopen/vi_32/lnicx9Gwd7jjuVtDp0eMWFFUiaTWMrNyPdmibWS8n84fibxK3c7hom7wsJ5wcNqpePKico6JicAVSHOkRB7h7MPWmfrg/132', 'adrian', 'skdk', '1', '2', '1', '13384255905', '0', '4,19,10', '37', 'wjfnfjekdifjfjk', '0', null, null, null, '34675', '2018-09-15 00:56:46', '0', 'oMH3D5DjR7NT_QQD1FAsbN3w0lK4', '1', '', '[0,0]');
INSERT INTO `user` VALUES ('939', 'https://wx.qlogo.cn/mmopen/vi_32/ib7ymR5sdB4ETAzTnsXErmfDZDIXiaXliaBjmA1xHG7jVOZtmukyYh51tSggDuyETJ5cTP8jpGyrctAhwN9LaicHaA/132', '立一默', '周一', '1', '2', '1', '18846140510', '0', '6,9,21', '25', '体重不过百…', '0', null, null, null, '13482', '2018-09-17 12:13:13', '0', 'oMH3D5EDsoa0wKd6f3thTyT_X76Y', '1', '', '[0,1843]');
INSERT INTO `user` VALUES ('940', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er6ibTlLmxgKHTTKuBrFN3jtBOvOGIDZGD2YEP5hW8AMxAwKnSRGxPcQo6Lew3v93vQUctJslezic3A/132', '水', '水', '2', '2', '0', '18045623295', '0', null, '0', '', '0', null, null, null, '11124', '2018-09-17 10:52:08', '0', 'oMH3D5JTbt5U034HF6V5f_cf8pRU', '26', '', '[0,11112]');
INSERT INTO `user` VALUES ('941', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYapdebHjVR3Wfib4nQp2xicqMUA5oLKfVsTeEqsjLucNm9DShVk4y9u6XoCvoMFIrGIjgbHX7hAUg/132', 'Teller', '好', '0', '0', '0', '18846134925', '0', '2,1,5', '23', 'ice', '0', null, null, null, '500', '2018-09-17 10:58:02', '0', 'oMH3D5Dk2Gfldv0isUKZq7Eiuv7E', '17', '', '[0,500]');
INSERT INTO `user` VALUES ('942', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISMS5EOf3z4RrJmItptJpbQxkNySeGzhFxKLD1KAD7lMpXfZehFLBLr00iawOpMWGVu1mnBVIoFUA/132', '青石', '青石', '2', '2', '0', '18846140810', '0', '0,3,16', '18', '这是个签名', '0', null, null, null, '3732', '2018-09-18 12:32:16', '0', 'oMH3D5IYmW7nLzra0OuJ2C_yY8DI', '1', '', '[0,6194]');
INSERT INTO `user` VALUES ('943', 'https://wx.qlogo.cn/mmopen/vi_32/0jbPhPmB3uXkQBaiaBskYFbwTAyI9lrSWOTrgAWibFUhu5p7A9mYOW247uGgBdIvTlZkAkWBXVpYnoFUibo64MtUQ/132', '化龙', '', '2', '2', '0', '17603602906', '0', null, '0', '', '0', null, null, null, '11950', '2018-09-25 15:14:26', '0', 'oMH3D5GXHzJJ-gUVQaqgW7H_3DIU', '30', '', '[0,0]');
INSERT INTO `user` VALUES ('944', 'https://wx.qlogo.cn/mmopen/vi_32/Q4uAeNibqiaHSHqjeYicsskTF4lA4YvHzvbz7sjfZZ5Y72z9SMqW8ztEic3eSTtO5xWLA6YhogYAc7OK30IDqvOe1A/132', '浅浅', '浅浅', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-09-21 10:29:47', '0', 'oMH3D5Cp22i_uEmHZ0mcIFHKbPO0', '21', '', '[0,0]');
INSERT INTO `user` VALUES ('945', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK2AXeKBY0iatMdtrQgKgMhFBfKXZ7BnrATEVJeOKYQBC8aia0GCMlnY6lIhE16RRGYlicEP4ibC1mibcQ/132', '杨德全', 'Man', '2', '2', '0', '18846079302', '0', '3', '24', 'Bug', '0', null, null, null, '34185', '2018-09-25 09:07:57', '0', 'oMH3D5Cz5MdobK228P4qD-QWMf60', '29', '', '[0,9157]');
INSERT INTO `user` VALUES ('946', 'https://wx.qlogo.cn/mmopen/vi_32/N8M1CGTicRctK5dP0nZM99g0QiaBPFiccIkVyuxibfFMws8UzODsmkIMPBuL1gicoDvDJPT8c4nqH4IboGneJHmqFtA/132', '@，@   @_@', '舒瑶', '1', '2', '1', '17745165119', '0', '10', '18', '签名', '0', null, null, null, '27185', '2018-09-25 09:04:36', '0', 'oMH3D5NW6Vg2DQEw_X0nU4ur0q5M', '29', '', '[0,5065]');
INSERT INTO `user` VALUES ('947', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoOCMicuYx93gW3WxIdkibssW2hXI80t9zU5Lr27AjV8cQCvwK8iaAIhiawqhl3VCJergwviaIS4NHZ4icA/132', 'Y。Y', 'Y。Y', '2', '2', '0', '18846046148', '0', '19', '18', '…………', '0', null, null, null, '15557', '2018-09-25 10:13:18', '0', 'oMH3D5DA6kNCVNuWP_Na5e4zH2wE', '29', '', '[0,1710]');
INSERT INTO `user` VALUES ('948', 'https://wx.qlogo.cn/mmopen/vi_32/nUYFrDawI8bPgdOkQiayletfC5icP5BVeqW0BtyArIOqsMpIVDt8KNKTzHPPojooewlU0wYORoCewGGWWO8TgEqg/132', '北海。', '', '2', '2', '0', '13047495186', '0', null, '0', '', '0', null, null, null, '19615', '2018-09-25 09:14:32', '0', 'oMH3D5DQyjjsK_jrueBa-BI26ERE', '29', '', '[0,0]');
INSERT INTO `user` VALUES ('949', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJT1O3iaPWQ9byC5gNU6Kst80QicG181UhxZE8THfHADCgyj1J4zbjujMH6gFKXFPDchyW8AxXot0eg/132', 'Yin', '我名字', '2', '2', '1', '13384255905', '0', '0,2,1', '20', '手机放弧度倒计时', '0', null, null, null, '9830', '2018-09-27 13:55:49', '0', 'oMH3D5N1owMs7lqspoYn6mg-lpIg', '1', '', '[0,0]');
INSERT INTO `user` VALUES ('950', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGckDibnbSYEbYk46Y3FkYIgHeKiamHKhLEkOptJZM7ZWj88ogMmpgymcdT0zwkKmSOv1SKLwQuBEQ/132', ' 天天割麦子', '', '2', '2', '0', '18519196546', '0', '16', '18', '自律使我自由', '0', null, null, null, '11445', '2018-09-27 20:49:59', '0', 'oMH3D5GF4BUbGeYV7c29qdjjU2Ec', '29', '', '[0,3972]');
INSERT INTO `user` VALUES ('951', 'https://wx.qlogo.cn/mmopen/vi_32/7FzsUK4ZGwTaXibK9er5FYkf7oCPr0Zbkicgy5xjxGV5ZqOOj9763vSJ6BSawVwyazj0RHzC4GiciagicmIaBXSs7JQ/132', '匆匆那年', '匆匆那年', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-09-27 22:44:17', '0', 'oMH3D5Eg56Z4jJ1YNzurx2w4js_c', '1', '', '[0,0]');
INSERT INTO `user` VALUES ('952', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI5HeSC8CZAaUeZdQKcktaJPonrxXEhgQliczfIicTFIK9IySFahia6EgBMplLxBVgzIDqFtdqoZFXVw/132', '夏大雨（Summer big rain）', '夏大雨（Summer big rain）', '0', '0', '0', '', '0', null, '0', '', '0', null, null, null, '0', '2018-10-01 12:11:51', '0', 'oMH3D5JaL62BvT_3qhsChzvUCEso', '1', '', '[0,0]');
