/*
 Navicat Premium Data Transfer

 Source Server         : MySQLTest1
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : jsp_petmall

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 10/07/2023 14:13:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `cover` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `intro` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `type_id` int(0) NULL DEFAULT NULL COMMENT '种类id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id`) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (181, '泰迪', '/picture/1572099738355.jpg', '/picture/1572099738356.jpg', '/picture/1572099738356.jpg', 1000, '是一个可爱的小狗', 3, 1);
INSERT INTO `goods` VALUES (182, '藏獒', '/picture/1572100040028.jpg', '/picture/1572100040029.jpg', '/picture/1572100040029.jpg', 15000, '凶猛巨兽', 4, 1);
INSERT INTO `goods` VALUES (183, '兔子', '/picture/1572100084526.jpg', '/picture/1572100084527.jpg', '/picture/1572100084528.png', 60, '可爱', 20, 3);
INSERT INTO `goods` VALUES (184, '蜥蜴', '/picture/1572100133092.jpg', '/picture/1572100133092.jpg', '/picture/1572100133093.jpg', 3000, '挺硬的，不错！', 5, 3);
INSERT INTO `goods` VALUES (185, '马', '/picture/1572100197486.jpg', '/picture/1572100197487.jpg', '/picture/1572100197488.jpg', 150000, '汗血宝马！日行千里不是梦！', 1, 4);
INSERT INTO `goods` VALUES (187, '波斯猫', '/picture/1572100298743.jpg', '/picture/1572100298743.jpg', '/picture/1572100298744.jpg', 8000, '高贵！', 3, 2);
INSERT INTO `goods` VALUES (188, '无毛猫', '/picture/1572100372252.jpg', '/picture/1572100372253.jpg', '/picture/1572100372253.jpg', 12000, '洁癖猫毛过敏者！！必要', 4, 2);
INSERT INTO `goods` VALUES (189, '胡萝卜', '/picture/1572100519248.jpg', '/picture/1572100519249.jpg', '/picture/1572100519249.jpg', 5, '兔子的最爱', 100, 5);
INSERT INTO `goods` VALUES (190, '猫罐头、猫粮', '/picture/1572100570001.jpg', '/picture/1572100570001.jpg', '/picture/1572100570001.jpg', 20, '好吃不贵', 100, 5);
INSERT INTO `goods` VALUES (191, '马鞍', '/picture/1572100619889.jpg', '/picture/1572100619889.jpg', '/picture/1572100619890.jpg', 200, '带上马鞍骑马对身体好！', 12, 5);
INSERT INTO `goods` VALUES (192, '牵引绳', '/picture/1572100669669.jpg', '/picture/1572100669669.jpg', '/picture/1572100669669.jpg', 13, '防止走丢神器', 30, 5);
INSERT INTO `goods` VALUES (193, '猫窝', '/picture/1572100716813.jpg', '/picture/1572100716813.jpg', '/picture/1572100716813.jpg', 20, '给猫猫一个温暖的家', 20, 5);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` date NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (49, 1000, 1, 2, 3, '张三', '19853411787', '江苏省南京市', '2023-06-08', 33);
INSERT INTO `order` VALUES (51, 150000, 1, 3, 1, '白云祥', '13022502404', '山东济南', '2023-06-25', 6);
INSERT INTO `order` VALUES (52, 60, 1, 2, 1, '白云祥', '13022502404', '山东省济南市', '2023-06-26', 6);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `price` float NULL DEFAULT NULL COMMENT '订单价格',
  `amount` int(0) NULL DEFAULT NULL COMMENT '订单数量',
  `goods_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `order_id` int(0) NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_id_idx`(`order_id`) USING BTREE,
  INDEX `fk_orderitem_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (45, 1000, 1, 181, 49);
INSERT INTO `orderitem` VALUES (47, 150000, 1, 185, 51);
INSERT INTO `orderitem` VALUES (48, 60, 1, 183, 52);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '推荐id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '推荐类型',
  `goods_id` int(0) NULL DEFAULT NULL COMMENT '推荐商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (31, 3, 181);
INSERT INTO `recommend` VALUES (32, 2, 183);
INSERT INTO `recommend` VALUES (33, 3, 183);
INSERT INTO `recommend` VALUES (36, 3, 184);
INSERT INTO `recommend` VALUES (37, 2, 185);
INSERT INTO `recommend` VALUES (45, 2, 181);
INSERT INTO `recommend` VALUES (51, 1, 181);
INSERT INTO `recommend` VALUES (53, 1, 182);
INSERT INTO `recommend` VALUES (54, 1, 185);
INSERT INTO `recommend` VALUES (55, 1, 184);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '类型',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '宠物狗系列');
INSERT INTO `type` VALUES (2, '宠物猫系列');
INSERT INTO `type` VALUES (3, '爬行类宠物');
INSERT INTO `type` VALUES (4, '奇珍异兽');
INSERT INTO `type` VALUES (5, '宠物用品');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `isadmin` bit(1) NULL DEFAULT NULL COMMENT '是否是管理员',
  `isvalidate` bit(1) NULL DEFAULT NULL COMMENT '是否验证',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (6, 'admin', '1347845688@qq.com', 'admin', '白云祥', '13022502404', '山东省济南市', b'1', b'0');
INSERT INTO `user` VALUES (24, '王磊', '1357845688@qq.com', 'wl1997', '王磊', '13022502404', '山东省德州市', b'0', b'0');
INSERT INTO `user` VALUES (32, 'xiaoli', '12456@qq.com', '123456', '可爱精灵', '13022502404', '可爱精灵大厦', b'0', b'0');
INSERT INTO `user` VALUES (33, 'user', 'test@126.com', '123456', '张三', '12345678901', '山东省德州市', b'0', b'0');
INSERT INTO `user` VALUES (34, 'zhangsan', '1544286680@qq.com', '123456', '白云祥', '19853411787', '山东省德州市', b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
