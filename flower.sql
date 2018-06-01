/*
Navicat MySQL Data Transfer

Source Server         : con
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : flower

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-06-01 15:36:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型表',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '浪漫爱情');
INSERT INTO `category` VALUES ('2', '生日礼物');
INSERT INTO `category` VALUES ('3', '节日祝福');
INSERT INTO `category` VALUES ('4', '慰问探望');
INSERT INTO `category` VALUES ('5', '致谢致歉');
INSERT INTO `category` VALUES ('6', '婚礼庆典');
INSERT INTO `category` VALUES ('7', '商务用花');
INSERT INTO `category` VALUES ('8', '家居生活');
INSERT INTO `category` VALUES ('9', '盆栽绿植');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'lyz', '1', '1234', '王锦福');
INSERT INTO `customer` VALUES ('2', 'lyz123', 'lyz123', '123', '123');
INSERT INTO `customer` VALUES ('3', 'xxx', '123', '123', '123');
INSERT INTO `customer` VALUES ('4', 'wjf', '444', '213412', '432142');
INSERT INTO `customer` VALUES ('17', 'lyzlyz', '123', '123', 'dasfas');
INSERT INTO `customer` VALUES ('18', 'qwer', '1234', 'asdf', 'zxcv');
INSERT INTO `customer` VALUES ('19', 'oHCKP4gJYgd4SxBJkrIfIqYaZfoc', 'weixin', '18587377005', '昆明经济开发区浦新路2号昆明学院');
INSERT INTO `customer` VALUES ('20', 'lmy', '123456', '18487167851', '昆明学院');

-- ----------------------------
-- Table structure for customerclass
-- ----------------------------
DROP TABLE IF EXISTS `customerclass`;
CREATE TABLE `customerclass` (
  `userclassId` int(11) NOT NULL AUTO_INCREMENT,
  `userclassname` varchar(255) NOT NULL,
  `userinfomax` int(255) NOT NULL,
  `userinfomin` int(255) NOT NULL,
  PRIMARY KEY (`userclassId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customerclass
-- ----------------------------
INSERT INTO `customerclass` VALUES ('2', 'vip', '3000', '1000');
INSERT INTO `customerclass` VALUES ('3', 'supvip', '10000', '5000');
INSERT INTO `customerclass` VALUES ('4', 'vvip', '20000', '10000');

-- ----------------------------
-- Table structure for flower
-- ----------------------------
DROP TABLE IF EXISTS `flower`;
CREATE TABLE `flower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `photo` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `hot` bit(1) DEFAULT b'0' COMMENT '是否首页展示',
  `category_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flower
-- ----------------------------
INSERT INTO `flower` VALUES ('1', '心上人', '395', 'photo/1.jpg', '那是谁的目光，凝望着云端你的方向，你问我世上哪朵花最美？', '0', '', '1');
INSERT INTO `flower` VALUES ('2', '不变的心', '398', 'photo/2.jpg', '爱上你是我今生最大的幸福，想你是我最甜蜜的痛苦，和你在一起是我的骄傲。', '-5', '', '1');
INSERT INTO `flower` VALUES ('3', '致青春', '229', 'photo/3.jpg', '我爱你，胜过爱爱情，更胜过爱自己！', '0', '', '2');
INSERT INTO `flower` VALUES ('4', '午后阳光', '238', 'photo/4.jpg', '生活的节奏越来越快，我们需要给自己一个释放的空间。', '0', '', '2');
INSERT INTO `flower` VALUES ('5', '你的笑靥', '169', 'photo/5.jpg', '你的笑脸是天下最好看的风景，一次次温暖我的心。', '0', '', '3');
INSERT INTO `flower` VALUES ('6', '春暖花开', '180', 'photo/6.jpg', '暖暖的风，暖暖的阳光，春暖花开的日子，捎上我暖暖的爱', '-1', '', '3');
INSERT INTO `flower` VALUES ('7', '爱的思念', '188', 'photo/7.jpg', '爱的思念绵延不绝，终于和天在地平线上交汇...', '-2', '', '4');
INSERT INTO `flower` VALUES ('8', '关怀', '288', 'photo/8.jpg', '一句淡淡的寒暄，一份浓浓的关怀，一声轻轻的问候，一片深深的情意……', '0', '', '4');
INSERT INTO `flower` VALUES ('9', '爱你百分百', '566', 'photo/9.jpg', '炫丽的玫瑰100朵，象征我对你百分之百的爱恋；浪漫的炫丽的玫瑰100朵，象征我对你百分之百的爱恋...', '-7', '', '5');
INSERT INTO `flower` VALUES ('10', '宝贝，我错了', '156', 'photo/10.jpg', '有的人说时间是一把刀，任何东西都会被它斩断，包括情丝...', '-7', '', '5');
INSERT INTO `flower` VALUES ('11', '浪漫满屋', '199', 'photo/11.jpg', '“以后别提冰激凌，再也不吃。以后给我买玫瑰吧，就要玫瑰。', '-6', '', '6');
INSERT INTO `flower` VALUES ('12', '粉黛', '188', 'photo/12.jpg', '粉黛，意指年轻貌美的女子，不期而遇往往再也无法忘怀。', '90', '', '6');
INSERT INTO `flower` VALUES ('13', '前程似锦', '456', 'photo/13.jpg', '前程如精致的锦绣一样，未来势必十分美好。', '0', '\0', '7');
INSERT INTO `flower` VALUES ('14', '富贵吉祥', '689', 'photo/14.jpg', '豪华开业花篮，适合开业庆典，乔迁，祝贺', '0', '\0', '7');
INSERT INTO `flower` VALUES ('15', '紫为你动馨', '152', 'photo/15.jpg', '把美丽的紫色汇成最美的花，用最美的花诉说最温馨的话。', '0', '\0', '8');
INSERT INTO `flower` VALUES ('16', '馨情缤纷', '169', 'photo/16.jpg', '这一天是专属您的节日，跟终年付出的妈妈说声我爱您，再献上贴心的康乃馨花束，让妈妈开心一整年。', '0', '\0', '8');
INSERT INTO `flower` VALUES ('17', '幸福时光', '325', 'photo/17.jpg', '寓意一心一意。纵然途中万般风景，我的眼里只有你！', '0', '\0', '9');
INSERT INTO `flower` VALUES ('18', '圆满', '206', 'photo/18.jpg', '载着寓意希望的鲜花驶向快乐幸福的彼岸', '0', '\0', '9');
INSERT INTO `flower` VALUES ('19', '恋恋不忘', '598', 'photo/19.jpg', '有一种幸福，叫美梦成真；有一种幸福，叫终成眷属；有一种幸福，叫恋恋不忘！', '0', '\0', '1');
INSERT INTO `flower` VALUES ('20', '为爱相随', '162', 'photo/20.jpg', '你若不离，我必不弃。爱情是历经风雨的双手紧握；是一路同行的相濡以沫。', '0', '\0', '1');
INSERT INTO `flower` VALUES ('21', '忘情巴黎', '296', 'photo/21.jpg', '只想和你忘掉一切烦恼，尽情沉醉在最浪漫的气氛中。', '0', '\0', '1');
INSERT INTO `flower` VALUES ('22', '恋香', '368', 'photo/22.jpg', '微风伴着花香，吹来爱的气息。用一颗真心轻轻爱你，温柔的话只说给你听。', '0', '\0', '1');
INSERT INTO `flower` VALUES ('23', '致美丽的你', '128', 'photo/23.jpg', '很爱你，想把你捧在手心，放在心里...', '0', '\0', '1');
INSERT INTO `flower` VALUES ('24', '眷念', '292', 'photo/24.jpg', '怒放的生命中，缘分让我们相守，万花丛中，只为寻到你那惊艳万芳的容颜...', '0', '\0', '1');
INSERT INTO `flower` VALUES ('25', '金风玉露', '116', 'photo/25.jpg', '金风玉露一相逢，便胜却人间无数。爱对了人，七夕情人节每天都过。', '0', '\0', '1');
INSERT INTO `flower` VALUES ('26', '拥抱', '318', 'photo/26.jpg', '来熊熊熊熊熊抱一个吧，不管什么尽管燃烧吧', '0', '\0', '1');
INSERT INTO `flower` VALUES ('27', '夏之物语', '386', 'photo/27.jpg', '爱你的心如夏日骄阳般炽热滚烫，唯有你的柔情，如同清凉的泉水让我获得平静。', '0', '\0', '1');
INSERT INTO `flower` VALUES ('28', '热恋', '356', 'photo/28.jpg', '最醇的酒，最美的诗，最动听的歌，最好看的风景', '15', '\0', '1');

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logisticsName` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics
-- ----------------------------
INSERT INTO `logistics` VALUES ('1', '顺风', '25');
INSERT INTO `logistics` VALUES ('4', '同城配送', '15');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for offlinestore
-- ----------------------------
DROP TABLE IF EXISTS `offlinestore`;
CREATE TABLE `offlinestore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offlinestore
-- ----------------------------
INSERT INTO `offlinestore` VALUES ('3', '一枝花拉', '昆明学院');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flower_id` int(11) DEFAULT NULL COMMENT '鲜花id',
  `total` int(11) DEFAULT NULL COMMENT '数量',
  `price` int(11) DEFAULT NULL COMMENT '总价',
  `customer_id` int(11) DEFAULT NULL COMMENT '顾客id',
  `dispose` bit(1) DEFAULT b'0' COMMENT '是否已处理(0未处理/1已处理)',
  `systime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '11', '1', '199', '2', '', '2018-03-05 23:19:07');
INSERT INTO `orders` VALUES ('2', '9', '1', '566', '2', '', '2018-03-05 23:19:07');
INSERT INTO `orders` VALUES ('3', '10', '1', '156', '2', '', '2018-03-06 13:46:11');
INSERT INTO `orders` VALUES ('4', '5', '1', '169', '2', '', '2018-03-06 13:46:11');
INSERT INTO `orders` VALUES ('5', '11', '1', '199', '1', '', '2018-04-20 16:38:00');
INSERT INTO `orders` VALUES ('6', '9', '1', '566', '1', '', '2018-04-20 16:38:23');
INSERT INTO `orders` VALUES ('7', '6', '1', '180', '1', '', '2018-04-20 16:38:23');
INSERT INTO `orders` VALUES ('8', '9', '2', '1132', '1', '', '2018-04-24 14:22:04');
INSERT INTO `orders` VALUES ('9', '11', '1', '199', '1', '', '2018-04-24 14:22:04');
INSERT INTO `orders` VALUES ('10', '9', '20', '11320', '1', '', '2018-04-24 14:54:44');
INSERT INTO `orders` VALUES ('11', '10', '1', '156', '1', '', '2018-04-24 14:54:44');
INSERT INTO `orders` VALUES ('12', '10', '4', '624', '16', '\0', '2018-05-08 00:00:09');
INSERT INTO `orders` VALUES ('13', '11', '5', '995', '16', '\0', '2018-05-08 00:00:09');
INSERT INTO `orders` VALUES ('14', '9', '2', '1132', '16', '\0', '2018-05-08 00:00:09');
INSERT INTO `orders` VALUES ('15', '12', '1', '188', '16', '\0', '2018-05-08 00:15:57');
INSERT INTO `orders` VALUES ('16', '8', '1', '288', '16', '\0', '2018-05-08 00:15:57');
INSERT INTO `orders` VALUES ('17', '12', '1', '188', '1', '', '2018-05-09 09:28:33');
INSERT INTO `orders` VALUES ('18', '6', '1', '180', '1', '\0', '2018-05-09 09:29:26');
INSERT INTO `orders` VALUES ('19', '28', '3', '1068', '19', '\0', '2018-05-09 20:15:32');
INSERT INTO `orders` VALUES ('20', '11', '4', '796', '19', '\0', '2018-05-09 20:15:32');
INSERT INTO `orders` VALUES ('21', '12', '2', '376', '20', '\0', '2018-05-11 12:29:47');
INSERT INTO `orders` VALUES ('22', '28', '1', '356', '20', '\0', '2018-05-11 12:30:00');
INSERT INTO `orders` VALUES ('23', '12', '3', '564', '19', '\0', '2018-05-11 18:07:20');
INSERT INTO `orders` VALUES ('24', '2', '4', '1592', '19', '\0', '2018-05-11 18:07:20');
INSERT INTO `orders` VALUES ('25', '12', '3', '564', '19', '\0', '2018-05-11 18:07:20');

-- ----------------------------
-- Table structure for repertory
-- ----------------------------
DROP TABLE IF EXISTS `repertory`;
CREATE TABLE `repertory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `offlinestoreId` int(11) NOT NULL,
  `flowerID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repertory
-- ----------------------------
INSERT INTO `repertory` VALUES ('8', '100', '3', '12');
INSERT INTO `repertory` VALUES ('9', '23', '3', '28');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flower_id` int(11) DEFAULT NULL COMMENT '鲜花id',
  `total` int(11) DEFAULT NULL COMMENT '数量',
  `price` int(11) DEFAULT NULL COMMENT '总价',
  `customer_id` int(11) DEFAULT NULL COMMENT '顾客id',
  `systime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('8', '11', '3', '796', '7', '2018-05-07 01:39:56');
INSERT INTO `shopcart` VALUES ('9', '8', '5', '1728', '7', '2018-05-07 01:39:54');
INSERT INTO `shopcart` VALUES ('10', '28', '4', '1424', '7', '2018-05-07 14:07:30');
INSERT INTO `shopcart` VALUES ('11', '12', '11', '2256', '15', '2018-05-07 16:22:34');
INSERT INTO `shopcart` VALUES ('12', '10', '2', '624', '15', '2018-05-07 16:22:51');
INSERT INTO `shopcart` VALUES ('13', '7', '2', '752', '15', '2018-05-07 16:22:49');
INSERT INTO `shopcart` VALUES ('29', '28', '4', '1424', '1', '2018-05-09 09:57:04');
INSERT INTO `shopcart` VALUES ('30', '10', '6', '936', '1', '2018-05-09 09:57:51');
