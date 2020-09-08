/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : sshshopping

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/09/2020 13:23:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES (1, 'admin', '222222');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '女装男装');
INSERT INTO `category` VALUES (2, '鞋靴箱包');
INSERT INTO `category` VALUES (3, '燊哥珍藏');
INSERT INTO `category` VALUES (4, '珠宝配饰');
INSERT INTO `category` VALUES (5, '手机数码');
INSERT INTO `category` VALUES (6, '家电办公');
INSERT INTO `category` VALUES (7, '护肤彩妆');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `csid` int(0) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `FK936FCAF21DB1FD15`(`cid`) USING BTREE,
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (1, '潮流女装', 1);
INSERT INTO `categorysecond` VALUES (2, '初冬羽绒', 1);
INSERT INTO `categorysecond` VALUES (3, '毛呢大衣', 1);
INSERT INTO `categorysecond` VALUES (4, '温暖毛衣', 1);
INSERT INTO `categorysecond` VALUES (5, '精选男装', 1);
INSERT INTO `categorysecond` VALUES (6, '冬季外套', 1);
INSERT INTO `categorysecond` VALUES (7, '羽绒服', 1);
INSERT INTO `categorysecond` VALUES (9, '女鞋', 2);
INSERT INTO `categorysecond` VALUES (10, '短靴', 2);
INSERT INTO `categorysecond` VALUES (11, '男鞋', 2);
INSERT INTO `categorysecond` VALUES (12, '女包', 2);
INSERT INTO `categorysecond` VALUES (13, '男包', 2);
INSERT INTO `categorysecond` VALUES (14, '服饰配件', 2);
INSERT INTO `categorysecond` VALUES (15, '电视剧资源', 3);
INSERT INTO `categorysecond` VALUES (16, '电影资源', 3);
INSERT INTO `categorysecond` VALUES (17, '音乐资源', 3);
INSERT INTO `categorysecond` VALUES (18, '软件资源', 3);
INSERT INTO `categorysecond` VALUES (19, '精彩资源', 3);
INSERT INTO `categorysecond` VALUES (20, '珠宝首饰', 4);
INSERT INTO `categorysecond` VALUES (21, '时尚饰品', 4);
INSERT INTO `categorysecond` VALUES (22, '品质手表', 4);
INSERT INTO `categorysecond` VALUES (23, '眼镜配饰', 4);
INSERT INTO `categorysecond` VALUES (24, '手机', 5);
INSERT INTO `categorysecond` VALUES (25, '平板', 5);
INSERT INTO `categorysecond` VALUES (26, '电脑', 5);
INSERT INTO `categorysecond` VALUES (27, '相机', 5);
INSERT INTO `categorysecond` VALUES (28, '大家电', 6);
INSERT INTO `categorysecond` VALUES (29, '厨房电器', 6);
INSERT INTO `categorysecond` VALUES (30, '生活电器', 6);
INSERT INTO `categorysecond` VALUES (31, '个户电器', 6);
INSERT INTO `categorysecond` VALUES (32, '办公耗材', 6);
INSERT INTO `categorysecond` VALUES (33, '美容护肤', 7);
INSERT INTO `categorysecond` VALUES (34, '强效保养', 7);
INSERT INTO `categorysecond` VALUES (35, '超值彩妆', 7);
INSERT INTO `categorysecond` VALUES (36, '换季保养', 7);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` int(0) NOT NULL AUTO_INCREMENT,
  `count` int(0) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  `oid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `FKE8B2AB6171DB7AE4`(`pid`) USING BTREE,
  INDEX `FKE8B2AB6140ACF87A`(`oid`) USING BTREE,
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (17, 1, 299, 57, 9004);
INSERT INTO `orderitem` VALUES (18, 1, 358, 51, 9006);
INSERT INTO `orderitem` VALUES (19, 1, 299, 57, 9007);
INSERT INTO `orderitem` VALUES (20, 1, 172, 2, 9007);
INSERT INTO `orderitem` VALUES (21, 1, 358, 51, 9008);
INSERT INTO `orderitem` VALUES (22, 1, 119, 3, 9009);
INSERT INTO `orderitem` VALUES (23, 1, 198, 21, 9010);
INSERT INTO `orderitem` VALUES (24, 1, 119, 4, 9011);
INSERT INTO `orderitem` VALUES (25, 1, 330, 72, 9011);
INSERT INTO `orderitem` VALUES (26, 1, 127, 82, 9011);
INSERT INTO `orderitem` VALUES (27, 1, 172, 2, 9011);
INSERT INTO `orderitem` VALUES (28, 2, 30, 82, 9012);
INSERT INTO `orderitem` VALUES (29, 1, 10, 82, 9013);
INSERT INTO `orderitem` VALUES (30, 1, 0.1, 57, 9014);
INSERT INTO `orderitem` VALUES (31, 1, 0.1, 57, 9015);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(0) NOT NULL AUTO_INCREMENT,
  `total` double NULL DEFAULT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FKC3DF62E5AA3D9C7`(`uid`) USING BTREE,
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9016 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9004, 299, '2020-09-03 06:57:05', 1, NULL, NULL, NULL, 35);
INSERT INTO `orders` VALUES (9005, 0, '2020-09-03 06:57:58', 1, NULL, NULL, NULL, 35);
INSERT INTO `orders` VALUES (9006, 358, '2020-09-03 06:58:04', 1, NULL, NULL, NULL, 35);
INSERT INTO `orders` VALUES (9007, 471, '2020-09-03 07:07:17', 1, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9008, 358, '2020-09-03 07:52:33', 2, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9009, 119, '2020-09-03 07:52:40', 3, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9010, 198, '2020-09-03 07:52:44', 3, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9011, 788, '2020-09-06 08:23:03', 4, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9012, 20, '2020-09-07 02:53:08', 1, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9013, 10, '2020-09-07 08:41:35', 1, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9014, 0.1, '2020-09-07 08:43:23', 2, 'grosen', '15766677925', 'maoming', 35);
INSERT INTO `orders` VALUES (9015, 0.1, '2020-09-07 13:58:45', 2, 'grosen', '15766677925', 'maoming', 35);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(0) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` int(0) NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `csid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FKED8DCCEFB9B74E02`(`csid`) USING BTREE,
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '韩版连帽加厚毛衣女外套', 558, 228, 'products/1/cs10001.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', 1, '2014-11-02 20:18:00', 1);
INSERT INTO `product` VALUES (2, '女装立领长袖拼接PU皮毛呢外套', 436, 172, 'products/1/cs10002.jpg', '【现在拍下并支付定金，即可获得双12当天10元无门槛优惠券一张。注：只限有预付定金款~优惠券统一在12月11号发放】 毛呢外套 整洁干练的长款版型 整个肩部给予皮绒拼接 与毛呢一起撑起品质感 立领 长袖 肩部往下做流行加层拼接 一粒扣收合门襟 特意做的夹棉里层（袖里无） 不必再畏惧冷冽寒风', 0, '2014-11-04 20:18:00', 1);
INSERT INTO `product` VALUES (3, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10003.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-10-01 20:18:00', 1);
INSERT INTO `product` VALUES (4, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10004.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-12-07 20:18:00', 1);
INSERT INTO `product` VALUES (5, '韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10005.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-11-02 20:18:00', 1);
INSERT INTO `product` VALUES (6, '冬装韩版女装翻领羔绒夹棉格子毛呢外套', 238, 119, 'products/1/cs10006.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', 0, '2014-11-10 15:18:00', 1);
INSERT INTO `product` VALUES (7, '新款优雅奢华毛领白鸭绒轻薄羽绒服', 1120, 590, 'products/1/cs10007.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', 0, '2014-11-03 20:18:00', 1);
INSERT INTO `product` VALUES (8, '秋冬季毛呢外套女中长款圆领小香风呢子大衣', 672, 336, 'products/1/cs10008.jpg', '【双12预售】双12提前开抢，11月24日—12月11日抢先付预付款33.6元，12月12日付剩余尾款，先付先发货，提前引爆双12！！！买就【送】双十二10元无门槛优惠券！！！商家【赠】运费险！！！', 0, '2014-11-03 20:18:00', 1);
INSERT INTO `product` VALUES (9, '女装貉子毛大衣 时尚修身长袖淑女毛呢外套', 238, 119, 'products/1/cs10009.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', 0, '2014-11-03 20:18:00', 1);
INSERT INTO `product` VALUES (10, '修身显瘦淑女针织长袖打底连衣裙女', 356, 158, 'products/1/cs10010.jpg', '【1212万能盛典预售抢先购,早买早便宜！】定金15.80元，预售价158.00元，双12价涨价至178.00元!', 0, '2014-11-03 20:18:00', 1);
INSERT INTO `product` VALUES (11, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20001.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (12, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20002.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (13, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20003.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (14, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20004.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (15, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20005.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (16, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20006.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (17, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20007.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (18, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20008.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (19, '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', 19800, 9900, 'products/1/cs20009.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', 0, '2014-10-01 20:18:00', 2);
INSERT INTO `product` VALUES (20, '中长款貂皮大衣整貂女装', 17900, 7290, 'products/1/cs20010.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】【售后保障】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货', 0, '2014-11-03 20:18:00', 2);
INSERT INTO `product` VALUES (21, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30001.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 1, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (22, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30002.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (23, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30003.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (24, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30004.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (25, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30005.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (26, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30006.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (27, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30007.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (28, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30008.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (29, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30009.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-03 20:18:00', 3);
INSERT INTO `product` VALUES (30, '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', 598, 198, 'products/1/cs30010.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', 0, '2014-11-10 20:18:00', 3);
INSERT INTO `product` VALUES (31, '打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40001.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (32, '打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40002.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (33, '打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40003.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (34, '性感时尚 酷感黑色小圆领露肩修身长袖针织衫', 387, 186, 'products/1/cs40004.jpg', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (35, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40005.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 1, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (36, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40006.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (37, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40007.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (38, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40008.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (39, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40009.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (40, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40010.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 0, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (41, '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', 387, 186, 'products/1/cs40011.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', 1, '2014-11-03 20:18:00', 4);
INSERT INTO `product` VALUES (42, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50001.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (43, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50002.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (44, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50003.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (45, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50004.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-12-07 20:18:00', 5);
INSERT INTO `product` VALUES (46, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50005.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (47, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50006.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (48, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50007.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (49, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50008.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (50, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50009.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 0, '2014-11-03 20:18:00', 5);
INSERT INTO `product` VALUES (51, '冬装外套棉衣立领修身商务大码男装潮牌上衣', 899, 358, 'products/1/cs50010.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', 1, '2014-12-07 20:18:00', 5);
INSERT INTO `product` VALUES (52, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60001.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (53, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60002.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (54, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60003.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (55, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60004.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (56, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60005.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (57, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 0.1, 'products/1/cs60006.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2020-09-07 08:43:11', 6);
INSERT INTO `product` VALUES (58, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60007.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (59, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60008.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (60, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60009.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 1, '2014-12-02 20:18:00', 6);
INSERT INTO `product` VALUES (61, '商务修身羊毛呢子风衣 中长款呢大衣外套', 997, 299, 'products/1/cs60010.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', 0, '2014-11-03 20:18:00', 6);
INSERT INTO `product` VALUES (62, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70001.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (63, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70002.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (64, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70003.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (65, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70004.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (66, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70005.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (67, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70006.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (68, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70007.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-12-04 20:18:00', 7);
INSERT INTO `product` VALUES (69, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70008.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (70, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70009.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 0, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (71, '韩版修身羽绒服加厚保暖可脱卸帽', 198, 83, 'products/1/cs70010.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', 1, '2014-11-03 20:18:00', 7);
INSERT INTO `product` VALUES (72, '裸色尖头高跟鞋女细跟浅口性感秋季新款猫跟软皮单鞋女中跟', 1000, 330, 'products/1/nvxie.jpg', '裸色尖头高跟鞋女细跟浅口性感2020年秋季新款猫跟软皮单鞋女中跟', 0, '2015-02-10 12:02:54', 9);
INSERT INTO `product` VALUES (73, '新款百搭裸色高跟鞋女细跟浅口性感气质名媛尖头漆皮单鞋', 688, 168, 'products/1/nvxie2.jpg', '新款百搭裸色高跟鞋女细跟浅口性感气质名媛尖头漆皮单鞋', 0, '2020-09-02 15:02:39', 9);
INSERT INTO `product` VALUES (82, '1唐酷双肩包男士时尚潮流背包男大容量电脑包大学生书包休闲旅行包', 258, 10, 'products/manbag.jpg', '唐酷双肩包男士时尚潮流背包男大容量电脑包大学生书包休闲旅行包', 1, '2020-09-07 08:39:40', 13);
INSERT INTO `product` VALUES (83, '(C88) [AKKAN-Bi37 JC-3 (Gundam Buighters Tr人漢化]', 999, 0.1, 'products/jingcai.jpg', '精彩！', 0, '2020-09-07 15:42:30', 19);
INSERT INTO `product` VALUES (84, '(C88) [FAC )] 5minutese -艦これ-)', 258, 0.1, 'products/jingcai.jpg', '(C88) [FAC )] 5minutese -艦これ-)', 0, '2020-09-07 15:43:37', 19);
INSERT INTO `product` VALUES (85, '(C88) [第8基地 (キチロク)] コユクエ (ラブラ) [漢化]', 999, 0.1, 'products/jingcai.jpg', '(C88) [第8基地 (キチロク)] コユクエ (ラブラ) [漢化]', 0, '2020-09-07 15:44:17', 19);
INSERT INTO `product` VALUES (86, '(C91) [孤独  サンシャイン!!)组]', 999, 0.1, 'products/jingcai.jpg', '(C91) [孤独  サンシャイン!!)组]', 0, '2020-09-07 15:45:06', 19);
INSERT INTO `product` VALUES (87, '(C92) [CurrenT968]', 999, 0.5, 'products/jingcai.jpg', '(C92) [CurrenT968]', 1, '2020-09-07 15:45:42', 19);
INSERT INTO `product` VALUES (88, '(C93) [ReDropT880]', 999, 0.5, 'products/jingcai.jpg', '(C93) [ReDropT880]', 0, '2020-09-07 15:46:11', 19);
INSERT INTO `product` VALUES (89, 'Adobe AE', 999, 0.1, 'products/ae.jpg', 'Adobe AE', 0, '2020-09-07 16:12:37', 18);
INSERT INTO `product` VALUES (90, 'Adobe PR', 999, 0.1, 'products/pr.jpg', 'Adobe PR', 0, '2020-09-07 16:13:02', 18);
INSERT INTO `product` VALUES (91, 'Adobe PS', 999, 0.1, 'products/ps.jpg', 'Adobe PS', 1, '2020-09-07 16:13:33', 18);
INSERT INTO `product` VALUES (92, 'eclipse', 999, 0.1, 'products/eclipse.jpg', 'eclipse', 0, '2020-09-07 16:14:00', 18);
INSERT INTO `product` VALUES (93, 'IDEA ', 999, 0.1, 'products/idae.jpg', 'IDEA ', 0, '2020-09-07 16:14:34', 18);
INSERT INTO `product` VALUES (94, '《人生海海》', 999, 0.5, 'products/5yuetian1.jpg', '五月天专辑！！！', 1, '2020-09-07 16:15:46', 17);
INSERT INTO `product` VALUES (95, '《Flamingo》', 999, 0.5, 'products/flamingo.jpg', '米津玄师《flamingo》', 1, '2020-09-08 04:57:17', 17);
INSERT INTO `product` VALUES (96, '《后青春的诗》', 999, 0.5, 'products/houqingchundeshi.jpg', '五月天《后青春的诗》', 1, '2020-09-08 04:56:40', 17);
INSERT INTO `product` VALUES (97, '《时光机》', 999, 0.5, 'products/shiguangji.jpg', '五月天《时光机》', 0, '2020-09-08 05:00:25', 17);
INSERT INTO `product` VALUES (98, '天气之子OST', 999, 0.5, 'products/tianqizhizhi.jpg', '天气之子OST', 1, '2020-09-08 05:00:48', 17);
INSERT INTO `product` VALUES (99, '《蝙蝠侠三部曲》', 999, 0.1, 'products/bianfuxia.jpg', '《蝙蝠侠三部曲》123', 1, '2020-09-08 05:03:38', 16);
INSERT INTO `product` VALUES (100, '《盗梦空间》', 999, 0.1, 'products/daomeng.jpg', '诺兰《盗梦空间》', 1, '2020-09-08 05:04:13', 16);
INSERT INTO `product` VALUES (101, '《敦刻尔克》', 999, 0.1, 'products/dunkeerke.jpg', '诺兰《敦刻尔克》', 0, '2020-09-08 05:04:39', 16);
INSERT INTO `product` VALUES (102, '《星际穿越》', 999, 0.5, 'products/xingjichuanyue.jpg', '诺兰《星际穿越》', 1, '2020-09-08 05:05:12', 16);
INSERT INTO `product` VALUES (103, '《致命魔术》', 999, 0.1, 'products/zhimingmoshu.jpg', '诺兰《致命魔术》', 0, '2020-09-08 05:05:50', 16);
INSERT INTO `product` VALUES (104, '《信条》', 999, 0.1, 'products/xintiao.jpg', '我只能发预告片给你哈哈哈哈哈哈哈哈哈哈哈', 1, '2020-09-08 05:06:32', 16);
INSERT INTO `product` VALUES (105, '《寄生兽》', 999, 0.1, 'products/jishengshou.jpg', '番剧《寄生兽》', 0, '2020-09-08 05:08:05', 15);
INSERT INTO `product` VALUES (106, '《权利的游戏》第1、2季', 999, 0.5, 'products/quanyou1.jpg', '《权利的游戏》第1、2季', 1, '2020-09-08 05:08:49', 15);
INSERT INTO `product` VALUES (107, '《权利的游戏》第3-5季', 999, 1, 'products/quanyou2.jpg', '权游也就只能看到第五季，后面没有书籍做改编拍的是个锤子东西', 1, '2020-09-08 05:09:44', 1);
INSERT INTO `product` VALUES (108, '《闪电侠》', 999, 0.1, 'products/shandianxia.jpg', '爷青回', 0, '2020-09-08 05:10:24', 15);
INSERT INTO `product` VALUES (109, '《神探夏洛克》', 999, 0.1, 'products/xialuoke.jpg', '英剧《神探夏洛克》', 1, '2020-09-08 05:10:51', 15);
INSERT INTO `product` VALUES (110, '《西部世界》', 999, 0.1, 'products/xibushijie.jpg', '好看就完事了', 1, '2020-09-08 05:11:18', 15);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (35, 'test1', '111111', 'grosen', '151865933@qq.com', '15766677925', 'maoming', 1, 'c038d9812d1346488322a698d0522548fbdc607832944bf48f057e9db417eeb9', NULL);
INSERT INTO `user` VALUES (36, 'test2', '111111', 'grosen', '151865933@qq.com', '15766677925', 'maoming', 1, '443b255de1c840c6907d7e1861adb899583eb9dc712840ea94a4cfcb52bf8869', NULL);
INSERT INTO `user` VALUES (37, 'test11', '111111', 'Liang Grosen', '151865933@qq.com', '15766677925', 'maoming', 0, 'ef0de00ed37a44ee992557c14784bfe3c715194225ec4970a8ba1a997233deae', NULL);
INSERT INTO `user` VALUES (38, 'test1111', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 0, 'e16e406427094a06983ad8be0330c5d91a99d175dd3840eab8abbbfc221d7661', NULL);
INSERT INTO `user` VALUES (39, 'dfwaf', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 0, '7b840acf9cc244cabc9a2c00e287dc6de969ee101eea40dcb4a7bf820e989b91', NULL);
INSERT INTO `user` VALUES (40, 'fdasfg', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 0, '31b4d789dd0c41f188350602a6ecded97828264676d84cb282c764ad908babbc', NULL);
INSERT INTO `user` VALUES (41, 'cxszc', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 0, 'a5d07c8099ea4d408227377a4447c78f6d2066db439d4d62a1c923e4d008614c', NULL);
INSERT INTO `user` VALUES (42, 'wqerqfg', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 0, '2d3fb9332f5a4ebdae7ecc21c667d66307d45ee779c54abc8fe8116152a9b8f0', NULL);
INSERT INTO `user` VALUES (43, 'fdasf', '111111', 'Liang Grosen', 'lgs15766677925@163.com', '15766677925', 'maoming', 1, 'b4f609be7d6f41bd9cec234040eed854cc3814cb4c0242dd948530b13397d454', NULL);

SET FOREIGN_KEY_CHECKS = 1;
