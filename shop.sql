/*
 Navicat Premium Data Transfer

 Source Server         : wjj
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : graduation_project

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/05/2023 15:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect_goods
-- ----------------------------
DROP TABLE IF EXISTS `collect_goods`;
CREATE TABLE `collect_goods`  (
  `collect_id` int(0) NOT NULL AUTO_INCREMENT,
  `collect_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `collect_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `collect_create_time` datetime(0) DEFAULT NULL,
  `goods_present_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_title_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1、有效，2、失效',
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_delgoods` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`collect_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect_goods
-- ----------------------------
INSERT INTO `collect_goods` VALUES (131, '20', 'test2', '122', '2023-04-12 17:00:31', '28', '/api/my/uploads/goods_pic/1678416277360.png', '微信:test', '2', '沙宣洗发水自己用不了那么多，便宜出!全新!', '因是液体物品不退不换的!介意慎拍', '0');
INSERT INTO `collect_goods` VALUES (132, '20', 'test2', '83', '2023-04-12 17:01:49', '10', '/api/my/uploads/goods_pic/1678352255530.png', '微信:test', '1', '全新东野圭吾小说全套[精装硬壳]全套书籍系列任选侦探小说白夜', '精装硬壳 精装硬壳!!!请不要拿平装版的价格来对比哦书籍为线下书店直发.正版全新未拆封', '0');
INSERT INTO `collect_goods` VALUES (133, '20', 'test2', '102', '2023-04-12 17:02:06', '110', '/api/my/uploads/goods_pic/1678355255183.png', '微信:test', '1', ']Nike 阿甘子弹头跑鞋', 'Nike 阿甘子弹头跑鞋 皮面材质 黑白码数size:36~44码(偏小一码按大一码拍)', '0');
INSERT INTO `collect_goods` VALUES (134, '20', 'test2', '104', '2023-04-12 17:02:10', '65', '/api/my/uploads/goods_pic/1678355479789.png', '微信:test', '1', 'Nike Air Huarache Run 黑武士', '0鞋子很新，没穿过几次看成色也可以，转给需要的朋友', '0');
INSERT INTO `collect_goods` VALUES (135, '20', 'test2', '129', '2023-04-12 17:02:17', '15.9', '/api/my/uploads/goods_pic/1678417505000.png', '微信:test', '1', '720ml舒肤佳沐浴露', '特价处理，有需要的可以购买，日期好，全新未开封，放心使用!', '0');
INSERT INTO `collect_goods` VALUES (136, '20', 'test2', '138', '2023-04-12 17:02:25', '35.9', '/api/my/uploads/goods_pic/1678419242537.png', '微信:test', '1', '统一阿萨姆原味奶茶整箱统一芝士煎茶即饮奶茶饮料奶茶', '450ML*15瓶/10瓶 阿萨姆原味 (500ML) ，岩盐芝士，煎茶奶绿 ，青提茉莉，白桃观音，多口味混装', '0');
INSERT INTO `collect_goods` VALUES (137, '20', 'test2', '127', '2023-04-12 17:03:12', '10', '/api/my/uploads/goods_pic/1678416975232.png', '微信:test', '1', '六神花露水180ml', '全新仅喷过两次，购于京东六神旗舰店。25年12月22日到期。', '0');
INSERT INTO `collect_goods` VALUES (138, '20', 'test2', '81', '2023-04-12 17:03:15', '10', '/api/my/uploads/goods_pic/1678351896356.png', '微信：test', '2', '活着兄弟文成第七天许三观卖血记在细雨中精装余华经典作品', '平装没有外封，是软皮，精装是硬壳。精装好处主要体现在纸张和封皮上，印刷质量稍好一些，影响不大!', '0');
INSERT INTO `collect_goods` VALUES (139, '20', 'test2', '128', '2023-04-12 17:03:19', '10', '/api/my/uploads/goods_pic/1678417295619.png', '微信:test', '1', '小米最生活毛巾', '小米最生活品牌毛巾，独立密封包装，不掉毛不掉色。新疆阿瓦提长绒棉，有抑菌效果', '0');
INSERT INTO `collect_goods` VALUES (140, '20', 'test2', '95', '2023-04-12 17:07:37', '60', '/api/my/uploads/goods_pic/1678354269148.png', '微信:test', '1', '108键二手雷柏V700RGB机械键盘全键无冲，RGB灯光', 'RGB灯光(注意:彩色灯光并不代表就是RGB灯光RGB灯光是灯光颜色模式都可以变的，可以自己编辑设置，文案图片有展示', '0');

-- ----------------------------
-- Table structure for goods_kind
-- ----------------------------
DROP TABLE IF EXISTS `goods_kind`;
CREATE TABLE `goods_kind`  (
  `kind_id` int(0) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`kind_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_kind
-- ----------------------------
INSERT INTO `goods_kind` VALUES (0, '衣服鞋帽', '2');
INSERT INTO `goods_kind` VALUES (1, '日常用品', '1');
INSERT INTO `goods_kind` VALUES (2, '运动健身', '3');
INSERT INTO `goods_kind` VALUES (3, '电子产品', '4');
INSERT INTO `goods_kind` VALUES (4, '零食饮料', '5');
INSERT INTO `goods_kind` VALUES (5, '书籍资料', '6');
INSERT INTO `goods_kind` VALUES (17, '其它', '7');

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT,
  `buy_user_id` int(0) DEFAULT NULL,
  `buy_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_delorder` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '0:未删除，1:删除',
  `order_create_time` datetime(6) DEFAULT NULL,
  `goods_id` int(0) DEFAULT NULL,
  `goods_present_price` decimal(10, 2) DEFAULT NULL,
  `goods_title_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (100, 32, 'test3', '1', '2023-03-13 17:56:24.517000', 99, 500.00, '/api/my/uploads/goods_pic/1678354782597.png', '微信:test', '4', '索尼相机，810w像素，支持变焦', '拍照比手机清晰放家里很久很久很久很久了，久到都忘了存在，电池很新，功能完好');
INSERT INTO `goods_order` VALUES (101, 32, 'test3', '1', '2023-03-13 18:01:19.061000', 101, 439.00, '/api/my/uploads/goods_pic/1678355094172.png', '微信:test', '4', 'AJ1 棕色高帮倒钩1.0 44码', '图片全部是在室内灯光下细节实拍 所见所得 懂的自然懂全新无试穿喜欢的朋友不要错过');
INSERT INTO `goods_order` VALUES (102, 32, 'test3', '1', '2023-03-13 18:01:26.106000', 98, 300.00, '/api/my/uploads/goods_pic/1678354650702.png', '微信:test', '4', '奥林巴斯trip35相机', '，图片都是实拍拍，不要问那么多就是当配件机出，售出不退不换售出不退不换');
INSERT INTO `goods_order` VALUES (103, 20, 'test2', '1', '2023-03-16 10:30:17.796000', 119, 69.00, '/api/my/uploads/goods_pic/1678357005548.png', '微信:test', '4', '[专业滑板]滑板新手专业80cm双翘板王一博同款现货可发', '朋友跨境电商不做了，低价帮忙处理能拍就是有货');
INSERT INTO `goods_order` VALUES (109, 20, 'test2', '0', '2023-03-19 22:22:15.506000', 97, 485.00, '/api/my/uploads/goods_pic/1678354525638.png', '微信:test', '4', '卡西欧EX-Z1050数码相机1010万像素', '卡西欧复古相机 所有功能正常。相机成色不错。屏幕清晰，镜头通透，拍照非常清晰');
INSERT INTO `goods_order` VALUES (110, 20, 'test2', '0', '2023-03-19 22:36:17.721000', 130, 19.90, '/api/my/uploads/goods_pic/1678417671183.png', '微信:test', '2', '芙丽芳丝氨基酸洗面奶男女士温和洁面敏弱肌100g', '芙丽芳丝氨基酸洗面奶男女士温和洁面敏弱肌100g');
INSERT INTO `goods_order` VALUES (111, 20, 'test2', '0', '2023-03-19 22:36:22.911000', 137, 15.00, '/api/my/uploads/goods_pic/1678419133461.png', '微信:test', '3', '可口可乐[4罐装]日本进口可口可乐零度可乐大罐装无糖可乐0脂', '可口可乐[4罐装]日本进口可口可乐零度可乐大罐装无糖可乐0脂0卡碳酸饮料碳酸汽水500m*4');
INSERT INTO `goods_order` VALUES (112, 20, 'test2', '0', '2023-03-19 22:36:27.875000', 106, 69.00, '/api/my/uploads/goods_pic/1678355684806.png', '微信:test', '3', '新款三叶草透气男鞋', '新款三叶草透气男鞋三叶草轻便软底男女运动鞋休闲网面跑步鞋情侣女鞋');
INSERT INTO `goods_order` VALUES (113, 32, 'test3', '0', '2023-03-19 22:37:04.674000', 140, 25.50, '/api/my/uploads/goods_pic/1678419621826.png', '微信:test', '3', 'UGD速溶蓝山咖啡卡布奇诺三合一 16g*50条一袋800克', 'UGD速溶蓝山咖啡卡布奇诺三合一 16g*50条一袋800克');
INSERT INTO `goods_order` VALUES (114, 32, 'test3', '0', '2023-03-19 22:37:09.346000', 134, 19.90, '/api/my/uploads/goods_pic/1678418616457.png', '微信:test', '3', '鸡胸肉丸健身即食鸡肉丸独立包装解馋速食饱腹丸子', '代餐学生宿舍夜宵休闲小吃 鸡胸肉丸解馋速食饱腹丸子鸡肉丸即食独立包装小零食代餐学生宿舍');
INSERT INTO `goods_order` VALUES (115, 32, 'test3', '0', '2023-03-19 22:37:13.267000', 107, 120.00, '/api/my/uploads/goods_pic/1678355809900.png', '微信:test', '4', '高步女款登山鞋，防滑大底儿', '高步女款登山鞋，防滑大底儿，防水鞋面，只有一双，39码，亲测鞋子非常舒适，能穿的捡漏');
INSERT INTO `goods_order` VALUES (116, 32, 'test3', '0', '2023-03-19 22:37:18.141000', 94, 200.00, '/api/my/uploads/goods_pic/1678354145312.png', '微信:test', '2', '亚马逊电子阅读器入门版', '亚马逊电子阅读器入门版，保护套保护很好，只有轻微使用痕迹，自认95新。因工作以后很难静下心来看，故此出售。');
INSERT INTO `goods_order` VALUES (117, 32, 'test3', '0', '2023-03-19 22:37:22.622000', 132, 16.90, '/api/my/uploads/goods_pic/1678418188070.png', '微信:test', '2', '[4折]俄罗斯进口雀巢 玻璃瓶装醇品咖啡粉 速溶黑咖啡', '喜欢就尽快拍下，犹豫就没了!!');
INSERT INTO `goods_order` VALUES (119, 35, 'test6', '0', '2023-04-20 23:47:46.471000', 145, 100.00, '/api/my/uploads/goods_pic/1682005493003.png', '微信：123', '4', '测试132', '2222');
INSERT INTO `goods_order` VALUES (120, 35, 'test6', '0', '2023-04-22 01:16:55.567000', 146, 1200.00, '/api/my/uploads/goods_pic/1682097366632.png', 'wx：111111111', '4', 'Nikon/尼康f3', '定制改装方案可定制多种型号 徕卡 佳能 ');
INSERT INTO `goods_order` VALUES (121, 19, 'test', '0', '2023-04-22 14:39:41.391000', 147, 11.00, '/api/my/uploads/goods_pic/1682145528973.png', 'wx：111111111', '4', 'Nikon/尼康f3', '11111');
INSERT INTO `goods_order` VALUES (122, 20, 'test2', '0', '2023-05-13 16:53:28.796000', 122, 28.00, '/api/my/uploads/goods_pic/1678416277360.png', '微信:test', '3', '沙宣洗发水自己用不了那么多，便宜出!全新!', '因是液体物品不退不换的!介意慎拍');
INSERT INTO `goods_order` VALUES (123, 20, 'test2', '0', '2023-05-13 16:56:33.061000', 81, 10.00, '/api/my/uploads/goods_pic/1678351896356.png', '微信：test', '2', '活着兄弟文成第七天许三观卖血记在细雨中精装余华经典作品', '平装没有外封，是软皮，精装是硬壳。精装好处主要体现在纸张和封皮上，印刷质量稍好一些，影响不大!');

-- ----------------------------
-- Table structure for pub_goods
-- ----------------------------
DROP TABLE IF EXISTS `pub_goods`;
CREATE TABLE `pub_goods`  (
  `goods_id` int(0) NOT NULL AUTO_INCREMENT,
  `pub_user_id` int(0) DEFAULT NULL,
  `pub_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_origin_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_present_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_views` int(0) DEFAULT NULL,
  `is_delgoods` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0:未删除，1:删除',
  `goods_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0：商品下架状态，1:初始状态，2：下单，3：发货，4：收货，5：审核未通过',
  `goods_title_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goods_pub_time` datetime(6) DEFAULT NULL,
  `goods_swiper_img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_swiper_img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_swiper_img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_swiper_img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `user_id`(`pub_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_goods
-- ----------------------------
INSERT INTO `pub_goods` VALUES (81, 19, 'test', '活着兄弟文成第七天许三观卖血记在细雨中精装余华经典作品', '平装没有外封，是软皮，精装是硬壳。精装好处主要体现在纸张和封皮上，印刷质量稍好一些，影响不大!', '20', '10', '微信：test', '6', '书籍资料', 25, '0', '2', '/api/my/uploads/goods_pic/1678351896356.png', '2023-03-09 16:51:49.839000', '/api/my/uploads/goods_pic/1678351900454.png', '/api/my/uploads/goods_pic/1678351903218.png', '/api/my/uploads/goods_pic/1678351906053.png', '/api/my/uploads/goods_pic/1678351908681.png');
INSERT INTO `pub_goods` VALUES (82, 19, 'test', '全新精装在细雨中呼喊余华著现代文学小说作品书籍', '平装没有外封，是软皮，精装是硬壳。精装好处主要体现在纸', '16.8', '10', '微信:test', '6', '书籍资料', 10, '0', '1', '/api/my/uploads/goods_pic/1678352095911.png', '2023-03-09 16:55:08.138000', '/api/my/uploads/goods_pic/1678352098847.png', '/api/my/uploads/goods_pic/1678352101478.png', '/api/my/uploads/goods_pic/1678352104664.png', '/api/my/uploads/goods_pic/1678352107201.png');
INSERT INTO `pub_goods` VALUES (83, 19, 'test', '全新东野圭吾小说全套[精装硬壳]全套书籍系列任选侦探小说白夜', '精装硬壳 精装硬壳!!!请不要拿平装版的价格来对比哦书籍为线下书店直发.正版全新未拆封', '17', '10', '微信:test', '6', '书籍资料', 15, '0', '1', '/api/my/uploads/goods_pic/1678352255530.png', '2023-03-09 16:57:47.949000', '/api/my/uploads/goods_pic/1678352258082.png', '/api/my/uploads/goods_pic/1678352260531.png', '/api/my/uploads/goods_pic/1678352263919.png', '/api/my/uploads/goods_pic/1678352266960.png');
INSERT INTO `pub_goods` VALUES (84, 19, 'test', '围城 钱钟书著', '书]城 [出版社]人民文学出版社 [作者]钱钟书,著', '16.5', '12.5', '微信:test', '6', '书籍资料', 3, '0', '5', '/api/my/uploads/goods_pic/1678352471520.png', '2023-03-09 17:01:22.459000', '/api/my/uploads/goods_pic/1678352473850.png', '/api/my/uploads/goods_pic/1678352476458.png', '/api/my/uploads/goods_pic/1678352479014.png', '/api/my/uploads/goods_pic/1678352481372.png');
INSERT INTO `pub_goods` VALUES (85, 19, 'test', '狂飙小说 无删减，徐纪周导演 张译 张颂文 李一桐主演电视剧', '狂飙小说 无删减，徐纪周导演 张译 张颂文 李一桐主演电视剧狂飙全集原著 犯罪悬疑小说畅销书正品1现货点直接购买，活动促', '20.9', '12.9', '微信:test', '6', '书籍资料', 1, '0', '1', '/api/my/uploads/goods_pic/1678352797458.png', '2023-03-09 17:06:48.718000', '/api/my/uploads/goods_pic/1678352800381.png', '/api/my/uploads/goods_pic/1678352802909.png', '/api/my/uploads/goods_pic/1678352805575.png', '/api/my/uploads/goods_pic/1678352807874.png');
INSERT INTO `pub_goods` VALUES (86, 19, 'test', '解忧杂货店东野圭吾日著南海出版公司', '成色，新度决定价格。一定会让您买到安心的书。', '23', '13', '微信:test', '6', '书籍资料', 3, '0', '1', '/api/my/uploads/goods_pic/1678352966751.png', '2023-03-09 17:09:38.072000', '/api/my/uploads/goods_pic/1678352969229.png', '/api/my/uploads/goods_pic/1678352971539.png', '/api/my/uploads/goods_pic/1678352974175.png', '/api/my/uploads/goods_pic/1678352976778.png');
INSERT INTO `pub_goods` VALUES (87, 19, 'test', '正版百鬼夜行书全集彩图鸟山石燕著日本山海经妖怪大全书籍百鬼夜', '正版百鬼夜行书全集彩图鸟山石燕著日本山海经妖怪大全书籍百鬼夜行', '24', '14', '微信:test', '6', '书籍资料', 2, '0', '1', '/api/my/uploads/goods_pic/1678353086309.png', '2023-03-09 17:11:37.266000', '/api/my/uploads/goods_pic/1678353088629.png', '/api/my/uploads/goods_pic/1678353091068.png', '/api/my/uploads/goods_pic/1678353093420.png', '/api/my/uploads/goods_pic/1678353096200.png');
INSERT INTO `pub_goods` VALUES (88, 19, 'test', '三体典藏版完整未删减地球往事+黑暗森林+死神永生刘慈欣科幻小', '书本全新塑封，图片皆为实拍图，看上的可以拍，价格为全套3本价格哦', '32.9', '22.9', '微信:test', '6', '书籍资料', 1, '0', '1', '/api/my/uploads/goods_pic/1678353227404.png', '2023-03-09 17:13:59.092000', '/api/my/uploads/goods_pic/1678353229886.png', '/api/my/uploads/goods_pic/1678353232486.png', '/api/my/uploads/goods_pic/1678353235517.png', '/api/my/uploads/goods_pic/1678353238080.png');
INSERT INTO `pub_goods` VALUES (89, 19, 'test', '下沉年代精装美国新史历史纪实书籍', '下沉年代精装美国新史历史纪实书籍', '35.5', '25.5', '微信:test', '6', '书籍资料', 6, '0', '1', '/api/my/uploads/goods_pic/1678353344196.png', '2023-03-09 17:15:55.789000', '/api/my/uploads/goods_pic/1678353346771.png', '/api/my/uploads/goods_pic/1678353349070.png', '/api/my/uploads/goods_pic/1678353351877.png', '/api/my/uploads/goods_pic/1678353354481.png');
INSERT INTO `pub_goods` VALUES (90, 19, 'test', '杀死一只知更鸟', '杀死一只知更鸟+你当像鸟飞往你的山精装硬壳两册精装杀死一只知更鸟哈珀李关于勇气与正义的成长文学读物小说书籍', '27.9', '14.9', '微信:test', '6', '书籍资料', 2, '0', '1', '/api/my/uploads/goods_pic/1678353531673.png', '2023-03-09 17:19:03.794000', '/api/my/uploads/goods_pic/1678353534157.png', '/api/my/uploads/goods_pic/1678353537936.png', '/api/my/uploads/goods_pic/1678353540549.png', '/api/my/uploads/goods_pic/1678353543030.png');
INSERT INTO `pub_goods` VALUES (91, 19, 'test', '全新未拆封英菲克PM6无线可充电鼠标', '2.4G无线静音版本 反应灵敏 可充电 带侧键 支持dpi速度调节', '31.9', '21.9', '微信:test', '4', '电子产品', 2, '0', '1', '/api/my/uploads/goods_pic/1678353765509.png', '2023-03-09 17:22:57.612000', '/api/my/uploads/goods_pic/1678353768222.png', '/api/my/uploads/goods_pic/1678353770895.png', '/api/my/uploads/goods_pic/1678353773726.png', '/api/my/uploads/goods_pic/1678353776505.png');
INSERT INTO `pub_goods` VALUES (92, 19, 'test', 'g304 无线游戏鼠标 电竞鼠标 吃鸡鼠标绝地求生FPS鼠标', '无线、无界限，无宏和驱动，即插即用，不需要安装驱动，价比更高，办公作图流畅 热门游戏轻松驾驭，这款是罗技同款跨境版本现在', '60', '39.9', '微信:test', '4', '电子产品', 2, '0', '1', '/api/my/uploads/goods_pic/1678353913031.png', '2023-03-09 17:25:23.944000', '/api/my/uploads/goods_pic/1678353915369.png', '/api/my/uploads/goods_pic/1678353918021.png', '/api/my/uploads/goods_pic/1678353920559.png', '/api/my/uploads/goods_pic/1678353923202.png');
INSERT INTO `pub_goods` VALUES (93, 19, 'test', '四级耳机tb买的 用过一次', '四级耳机tb买的 用过一次', '30', '20', '微信:test', '4', '电子产品', 2, '0', '1', '/api/my/uploads/goods_pic/1678354021792.png', '2023-03-09 17:27:12.963000', '/api/my/uploads/goods_pic/1678354024235.png', '/api/my/uploads/goods_pic/1678354026671.png', '/api/my/uploads/goods_pic/1678354029421.png', '/api/my/uploads/goods_pic/1678354031801.png');
INSERT INTO `pub_goods` VALUES (94, 19, 'test', '亚马逊电子阅读器入门版', '亚马逊电子阅读器入门版，保护套保护很好，只有轻微使用痕迹，自认95新。因工作以后很难静下心来看，故此出售。', '600', '200', '微信:test', '4', '电子产品', 2, '0', '2', '/api/my/uploads/goods_pic/1678354145312.png', '2023-03-09 17:29:15.889000', '/api/my/uploads/goods_pic/1678354147670.png', '/api/my/uploads/goods_pic/1678354150169.png', '/api/my/uploads/goods_pic/1678354152504.png', '/api/my/uploads/goods_pic/1678354154912.png');
INSERT INTO `pub_goods` VALUES (95, 19, 'test', '108键二手雷柏V700RGB机械键盘全键无冲，RGB灯光', 'RGB灯光(注意:彩色灯光并不代表就是RGB灯光RGB灯光是灯光颜色模式都可以变的，可以自己编辑设置，文案图片有展示', '108', '60', '微信:test', '4', '电子产品', 5, '0', '1', '/api/my/uploads/goods_pic/1678354269148.png', '2023-03-09 17:31:20.227000', '/api/my/uploads/goods_pic/1678354271479.png', '/api/my/uploads/goods_pic/1678354273865.png', '/api/my/uploads/goods_pic/1678354276067.png', '/api/my/uploads/goods_pic/1678354278650.png');
INSERT INTO `pub_goods` VALUES (96, 19, 'test', '荣耀运动蓝牙耳机Honor xSport am61', '原装正品，七天无理由退货整理出来的没问题的产品，只有黑色，蓝色，，有些有点小花，功能没任何问题，配件齐全', '199', '59', '微信:test', '4', '电子产品', 5, '0', '1', '/api/my/uploads/goods_pic/1678354396063.png', '2023-03-09 17:33:26.328000', '/api/my/uploads/goods_pic/1678354398342.png', '/api/my/uploads/goods_pic/1678354400771.png', '/api/my/uploads/goods_pic/1678354403171.png', '/api/my/uploads/goods_pic/1678354405488.png');
INSERT INTO `pub_goods` VALUES (97, 19, 'test', '卡西欧EX-Z1050数码相机1010万像素', '卡西欧复古相机 所有功能正常。相机成色不错。屏幕清晰，镜头通透，拍照非常清晰', '900', '485', '微信:test', '4', '电子产品', 7, '0', '4', '/api/my/uploads/goods_pic/1678354525638.png', '2023-03-09 17:35:36.421000', '/api/my/uploads/goods_pic/1678354528001.png', '/api/my/uploads/goods_pic/1678354530299.png', '/api/my/uploads/goods_pic/1678354532600.png', '/api/my/uploads/goods_pic/1678354535187.png');
INSERT INTO `pub_goods` VALUES (98, 19, 'test', '奥林巴斯trip35相机', '，图片都是实拍拍，不要问那么多就是当配件机出，售出不退不换售出不退不换', '600', '300', '微信:test', '4', '电子产品', 3, '1', '4', '/api/my/uploads/goods_pic/1678354650702.png', '2023-03-09 17:37:45.578000', '/api/my/uploads/goods_pic/1678354652930.png', '/api/my/uploads/goods_pic/1678354655556.png', '/api/my/uploads/goods_pic/1678354657955.png', '/api/my/uploads/goods_pic/1678354663118.png');
INSERT INTO `pub_goods` VALUES (99, 19, 'test', '索尼相机，810w像素，支持变焦', '拍照比手机清晰放家里很久很久很久很久了，久到都忘了存在，电池很新，功能完好', '1000', '500', '微信:test', '4', '电子产品', 5, '1', '4', '/api/my/uploads/goods_pic/1678354782597.png', '2023-03-09 17:39:53.394000', '/api/my/uploads/goods_pic/1678354785135.png', '/api/my/uploads/goods_pic/1678354787721.png', '/api/my/uploads/goods_pic/1678354790164.png', '/api/my/uploads/goods_pic/1678354792579.png');
INSERT INTO `pub_goods` VALUES (100, 19, 'test', '机械键盘雷柏V530红外银轴', '九新左右新手感很好。送备用轴。基本无啥使用痕迹。。保证九新。质保一个月。非质量问题不接受退换。', '199', '69', '微信:test', '4', '电子产品', 4, '0', '1', '/api/my/uploads/goods_pic/1678354927305.png', '2023-03-09 17:42:18.439000', '/api/my/uploads/goods_pic/1678354929500.png', '/api/my/uploads/goods_pic/1678354932184.png', '/api/my/uploads/goods_pic/1678354934746.png', '/api/my/uploads/goods_pic/1678354937288.png');
INSERT INTO `pub_goods` VALUES (101, 19, 'test', 'AJ1 棕色高帮倒钩1.0 44码', '图片全部是在室内灯光下细节实拍 所见所得 懂的自然懂全新无试穿喜欢的朋友不要错过', '900', '439', '微信:test', '2', '衣服鞋帽', 2, '1', '4', '/api/my/uploads/goods_pic/1678355094172.png', '2023-03-09 17:45:04.194000', '/api/my/uploads/goods_pic/1678355096239.png', '/api/my/uploads/goods_pic/1678355098804.png', '/api/my/uploads/goods_pic/1678355101206.png', '/api/my/uploads/goods_pic/1678355103504.png');
INSERT INTO `pub_goods` VALUES (102, 19, 'test', ']Nike 阿甘子弹头跑鞋', 'Nike 阿甘子弹头跑鞋 皮面材质 黑白码数size:36~44码(偏小一码按大一码拍)', '260', '110', '微信:test', '2', '衣服鞋帽', 10, '0', '1', '/api/my/uploads/goods_pic/1678355255183.png', '2023-03-09 17:47:46.107000', '/api/my/uploads/goods_pic/1678355257688.png', '/api/my/uploads/goods_pic/1678355260094.png', '/api/my/uploads/goods_pic/1678355262570.png', '/api/my/uploads/goods_pic/1678355265035.png');
INSERT INTO `pub_goods` VALUES (103, 19, 'test', 'NIKE高f几百块买的，莆田鞋', 'NIKE高f几百块买的，莆田鞋，虽不正也很好 看不出，当时觉得好看就买啦 买啦以后鞋子太多穿不上 全新便宜出', '399', '100', '微信:test', '2', '衣服鞋帽', 11, '0', '1', '/api/my/uploads/goods_pic/1678355369516.png', '2023-03-09 17:49:39.415000', '/api/my/uploads/goods_pic/1678355371589.png', '/api/my/uploads/goods_pic/1678355373619.png', '/api/my/uploads/goods_pic/1678355375948.png', '/api/my/uploads/goods_pic/1678355378516.png');
INSERT INTO `pub_goods` VALUES (104, 19, 'test', 'Nike Air Huarache Run 黑武士', '0鞋子很新，没穿过几次看成色也可以，转给需要的朋友', '300', '65', '微信:test', '2', '衣服鞋帽', 3, '0', '1', '/api/my/uploads/goods_pic/1678355479789.png', '2023-03-09 17:51:31.161000', '/api/my/uploads/goods_pic/1678355481994.png', '/api/my/uploads/goods_pic/1678355484977.png', '/api/my/uploads/goods_pic/1678355487446.png', '/api/my/uploads/goods_pic/1678355490095.png');
INSERT INTO `pub_goods` VALUES (105, 19, 'test', '彪马Puma男鞋41码运动鞋休闲鞋', '轻微穿着痕迹，无原盒。 内外无破损，原装鞋垫 二手物品，不议价，不退换。', '300', '158', '微信:test', '2', '衣服鞋帽', 3, '0', '1', '/api/my/uploads/goods_pic/1678355580682.png', '2023-03-09 17:53:10.241000', '/api/my/uploads/goods_pic/1678355583019.png', '/api/my/uploads/goods_pic/1678355585229.png', '/api/my/uploads/goods_pic/1678355587345.png', '/api/my/uploads/goods_pic/1678355589599.png');
INSERT INTO `pub_goods` VALUES (106, 19, 'test', '新款三叶草透气男鞋', '新款三叶草透气男鞋三叶草轻便软底男女运动鞋休闲网面跑步鞋情侣女鞋', '199', '69', '微信:test', '2', '衣服鞋帽', 3, '0', '3', '/api/my/uploads/goods_pic/1678355684806.png', '2023-03-09 17:54:54.620000', '/api/my/uploads/goods_pic/1678355687027.png', '/api/my/uploads/goods_pic/1678355689177.png', '/api/my/uploads/goods_pic/1678355691526.png', '/api/my/uploads/goods_pic/1678355693965.png');
INSERT INTO `pub_goods` VALUES (107, 19, 'test', '高步女款登山鞋，防滑大底儿', '高步女款登山鞋，防滑大底儿，防水鞋面，只有一双，39码，亲测鞋子非常舒适，能穿的捡漏', '639', '120', '微信:test', '2', '衣服鞋帽', 3, '0', '4', '/api/my/uploads/goods_pic/1678355809900.png', '2023-03-09 17:57:00.170000', '/api/my/uploads/goods_pic/1678355812134.png', '/api/my/uploads/goods_pic/1678355814360.png', '/api/my/uploads/goods_pic/1678355816663.png', '/api/my/uploads/goods_pic/1678355818952.png');
INSERT INTO `pub_goods` VALUES (108, 19, 'test', 'PUMA彪马跑步鞋男士运动鞋全新', '颜色 蓝白 鞋码41 朋友送的礼物，全新没有穿过成色如图', '699', '180', '微信:test', '2', '衣服鞋帽', 2, '0', '1', '/api/my/uploads/goods_pic/1678355928128.png', '2023-03-09 17:58:58.673000', '/api/my/uploads/goods_pic/1678355930365.png', '/api/my/uploads/goods_pic/1678355932676.png', '/api/my/uploads/goods_pic/1678355935294.png', '/api/my/uploads/goods_pic/1678355937756.png');
INSERT INTO `pub_goods` VALUES (109, 19, 'test', '龙狮戴尔女士登山鞋', '龙狮戴尔女士登山鞋，全新正品，39码，尺码跟运动鞋一样，', '168', '69', '微信:test', '2', '衣服鞋帽', 4, '0', '1', '/api/my/uploads/goods_pic/1678356028493.png', '2023-03-09 18:00:38.983000', '/api/my/uploads/goods_pic/1678356030572.png', '/api/my/uploads/goods_pic/1678356032970.png', '/api/my/uploads/goods_pic/1678356035538.png', '/api/my/uploads/goods_pic/1678356037914.png');
INSERT INTO `pub_goods` VALUES (110, 19, 'test', 'Nike耐克Blazer滑板鞋休闲鞋', 'Nike耐克Blazer滑板鞋休闲鞋结构大勾黑白配色男鞋女ins同款', '320', '168', '微信:test', '2', '衣服鞋帽', 2, '0', '1', '/api/my/uploads/goods_pic/1678356146483.png', '2023-03-09 18:02:35.927000', '/api/my/uploads/goods_pic/1678356148686.png', '/api/my/uploads/goods_pic/1678356150936.png', '/api/my/uploads/goods_pic/1678356153076.png', '/api/my/uploads/goods_pic/1678356155364.png');
INSERT INTO `pub_goods` VALUES (111, 19, 'test', '迪卡侬哑铃1.0kg一对', '迪卡侬哑铃1.0kg一对', '49', '35', '微信:test', '3', '运动健身', 2, '0', '1', '/api/my/uploads/goods_pic/1678356241807.png', '2023-03-09 18:04:11.206000', '/api/my/uploads/goods_pic/1678356243971.png', '/api/my/uploads/goods_pic/1678356246487.png', '/api/my/uploads/goods_pic/1678356248611.png', '/api/my/uploads/goods_pic/1678356250629.png');
INSERT INTO `pub_goods` VALUES (112, 19, 'test', '雷克斯乒乓球拍', '没打几次 最好自体', '40', '20', '微信:test', '3', '运动健身', 2, '0', '1', '/api/my/uploads/goods_pic/1678356333262.png', '2023-03-09 18:05:44.000000', '/api/my/uploads/goods_pic/1678356335647.png', '/api/my/uploads/goods_pic/1678356338043.png', '/api/my/uploads/goods_pic/1678356340603.png', '/api/my/uploads/goods_pic/1678356343498.png');
INSERT INTO `pub_goods` VALUES (113, 19, 'test', '8星、7星省队训练拍', '原价三百多的省队乒乓球拍，8星、7星省队训练拍现便宜出售默认发横拍', '55', '22', '微信:test', '3', '运动健身', 0, '0', '1', '/api/my/uploads/goods_pic/1678356438064.png', '2023-03-09 18:07:27.423000', '/api/my/uploads/goods_pic/1678356439992.png', '/api/my/uploads/goods_pic/1678356442394.png', '/api/my/uploads/goods_pic/1678356444814.png', '/api/my/uploads/goods_pic/1678356446907.png');
INSERT INTO `pub_goods` VALUES (114, 19, 'test', '9.8成新，瑜伽垫便宜出30元。', '9.8成新，瑜伽垫便宜出30元。', '68', '30', '微信:test', '3', '运动健身', 2, '0', '1', '/api/my/uploads/goods_pic/1678356508054.png', '2023-03-09 18:08:38.161000', '/api/my/uploads/goods_pic/1678356510154.png', '/api/my/uploads/goods_pic/1678356512517.png', '/api/my/uploads/goods_pic/1678356514810.png', '/api/my/uploads/goods_pic/1678356517082.png');
INSERT INTO `pub_goods` VALUES (115, 19, 'test', 'Bonny网球拍 就去年刚买', '使用频率不高还八九成新的样子 免费赠送两个手胶 有意可联系', '100', '75', '微信:test', '3', '运动健身', 2, '0', '1', '/api/my/uploads/goods_pic/1678356602786.png', '2023-03-09 18:10:12.659000', '/api/my/uploads/goods_pic/1678356604790.png', '/api/my/uploads/goods_pic/1678356606969.png', '/api/my/uploads/goods_pic/1678356609419.png', '/api/my/uploads/goods_pic/1678356611864.png');
INSERT INTO `pub_goods` VALUES (116, 19, 'test', '网球拍一个，粉白色的，用过一学期', '手柄那里有一点脏。有袋子，会送几个网球，大学生体育课如果选网球课可以用', '160', '80', '微信:test', '3', '运动健身', 2, '0', '1', '/api/my/uploads/goods_pic/1678356684739.png', '2023-03-09 18:11:33.969000', '/api/my/uploads/goods_pic/1678356686844.png', '/api/my/uploads/goods_pic/1678356689320.png', '/api/my/uploads/goods_pic/1678356691571.png', '/api/my/uploads/goods_pic/1678356693562.png');
INSERT INTO `pub_goods` VALUES (117, 19, 'test', '心爱的李宁碳素超轻耐打羽毛球拍单拍', '全新未拆封的。体育批发店买的，当时买的252元-。', '252', '48', '微信:test', '3', '运动健身', 3, '0', '1', '/api/my/uploads/goods_pic/1678356775753.png', '2023-03-09 18:13:06.680000', '/api/my/uploads/goods_pic/1678356777810.png', '/api/my/uploads/goods_pic/1678356780737.png', '/api/my/uploads/goods_pic/1678356783153.png', '/api/my/uploads/goods_pic/1678356785730.png');
INSERT INTO `pub_goods` VALUES (118, 19, 'test', '省队尤尼克斯羽毛球拍原价一千超清全碳素', '转手原因:亲戚在省队当教练，帮教练转手捞点外快', '180', '55', '微信:test', '3', '运动健身', 3, '0', '1', '/api/my/uploads/goods_pic/1678356884631.png', '2023-03-09 18:14:54.208000', '/api/my/uploads/goods_pic/1678356886773.png', '/api/my/uploads/goods_pic/1678356889193.png', '/api/my/uploads/goods_pic/1678356891594.png', '/api/my/uploads/goods_pic/1678356893619.png');
INSERT INTO `pub_goods` VALUES (119, 19, 'test', '[专业滑板]滑板新手专业80cm双翘板王一博同款现货可发', '朋友跨境电商不做了，低价帮忙处理能拍就是有货', '168', '69', '微信:test', '3', '运动健身', 1, '1', '4', '/api/my/uploads/goods_pic/1678357005548.png', '2023-03-09 18:16:55.103000', '/api/my/uploads/goods_pic/1678357007793.png', '/api/my/uploads/goods_pic/1678357010131.png', '/api/my/uploads/goods_pic/1678357012367.png', '/api/my/uploads/goods_pic/1678357014543.png');
INSERT INTO `pub_goods` VALUES (120, 19, 'test', '39码轮滑鞋带包装，仅穿过两次', '39码轮滑鞋带包装，仅穿过两次', '168', '70', '微信:test', '3', '运动健身', 0, '0', '0', '/api/my/uploads/goods_pic/1678357111206.png', '2023-03-09 18:18:49.817000', '/api/my/uploads/goods_pic/1678357113096.png', '/api/my/uploads/goods_pic/1678357115349.png', '/api/my/uploads/goods_pic/1678357117913.png', '/api/my/uploads/goods_pic/1678357128802.png');
INSERT INTO `pub_goods` VALUES (121, 19, 'test', '垃圾袋加厚抽绳式自动收口袋手提式一次性穿绳塑料袋', '加厚手提款抽绳式垃圾袋，环保无异味，双向抽绳不脏手，不勒手，好抽拉，质量很好，结实耐用，', '20', '8.8', '微信:test', '1', '日常用品', 4, '0', '5', '/api/my/uploads/goods_pic/1678416093738.png', '2023-03-10 10:42:02.375000', '/api/my/uploads/goods_pic/1678416096363.png', '/api/my/uploads/goods_pic/1678416098632.png', '/api/my/uploads/goods_pic/1678416101464.png', '/api/my/uploads/goods_pic/1678416104200.png');
INSERT INTO `pub_goods` VALUES (122, 19, 'test', '沙宣洗发水自己用不了那么多，便宜出!全新!', '因是液体物品不退不换的!介意慎拍', '78', '28', '微信:test', '1', '日常用品', 14, '0', '3', '/api/my/uploads/goods_pic/1678416277360.png', '2023-03-10 10:44:48.016000', '/api/my/uploads/goods_pic/1678416279814.png', '/api/my/uploads/goods_pic/1678416282130.png', '/api/my/uploads/goods_pic/1678416284590.png', '/api/my/uploads/goods_pic/1678416286984.png');
INSERT INTO `pub_goods` VALUES (123, 19, 'test', '云南白药牙膏留兰香型', '24年8月到期，便宜出售，保证正品。', '30', '18', '微信:test', '1', '日常用品', 7, '0', '1', '/api/my/uploads/goods_pic/1678416416709.png', '2023-03-10 10:47:14.460000', '/api/my/uploads/goods_pic/1678416425343.png', '/api/my/uploads/goods_pic/1678416427888.png', '/api/my/uploads/goods_pic/1678416430393.png', '/api/my/uploads/goods_pic/1678416433808.png');
INSERT INTO `pub_goods` VALUES (124, 19, 'test', '威露士抑菌洗手液525ml，有效期到25年4月', '威露士抑菌洗手液525ml，有效期到25年4月', '20', '10', '微信:test', '1', '日常用品', 1, '0', '1', '/api/my/uploads/goods_pic/1678416526081.png', '2023-03-10 10:48:57.085000', '/api/my/uploads/goods_pic/1678416528285.png', '/api/my/uploads/goods_pic/1678416530956.png', '/api/my/uploads/goods_pic/1678416534064.png', '/api/my/uploads/goods_pic/1678416536377.png');
INSERT INTO `pub_goods` VALUES (125, 19, 'test', '维达纸巾', '买太多，用不完，便宜出', '12', '9.9', '微信:test', '1', '日常用品', 2, '0', '1', '/api/my/uploads/goods_pic/1678416658566.png', '2023-03-10 10:51:11.129000', '/api/my/uploads/goods_pic/1678416662454.png', '/api/my/uploads/goods_pic/1678416664912.png', '/api/my/uploads/goods_pic/1678416667341.png', '/api/my/uploads/goods_pic/1678416670070.png');
INSERT INTO `pub_goods` VALUES (126, 19, 'test', '超低价蓝月亮洗衣液1kg', '蓝月亮 深层洁净护理洗衣液 薰衣草香 强效去污省水电易漂洗', '25', '12.5', '微信:test', '1', '日常用品', 0, '0', '1', '/api/my/uploads/goods_pic/1678416805582.png', '2023-03-10 10:53:46.047000', '/api/my/uploads/goods_pic/1678416814235.png', '/api/my/uploads/goods_pic/1678416819625.png', '/api/my/uploads/goods_pic/1678416822474.png', '/api/my/uploads/goods_pic/1678416825153.png');
INSERT INTO `pub_goods` VALUES (127, 19, 'test', '六神花露水180ml', '全新仅喷过两次，购于京东六神旗舰店。25年12月22日到期。', '22', '10', '微信:test', '1', '日常用品', 7, '0', '1', '/api/my/uploads/goods_pic/1678416975232.png', '2023-03-10 10:56:27.742000', '/api/my/uploads/goods_pic/1678416978945.png', '/api/my/uploads/goods_pic/1678416981393.png', '/api/my/uploads/goods_pic/1678416984073.png', '/api/my/uploads/goods_pic/1678416986883.png');
INSERT INTO `pub_goods` VALUES (128, 19, 'test', '小米最生活毛巾', '小米最生活品牌毛巾，独立密封包装，不掉毛不掉色。新疆阿瓦提长绒棉，有抑菌效果', '22', '10', '微信:test', '1', '日常用品', 6, '0', '1', '/api/my/uploads/goods_pic/1678417295619.png', '2023-03-10 11:02:13.432000', '/api/my/uploads/goods_pic/1678417303820.png', '/api/my/uploads/goods_pic/1678417315622.png', '/api/my/uploads/goods_pic/1678417324210.png', '/api/my/uploads/goods_pic/1678417332331.png');
INSERT INTO `pub_goods` VALUES (129, 19, 'test', '720ml舒肤佳沐浴露', '特价处理，有需要的可以购买，日期好，全新未开封，放心使用!', '28.9', '15.9', '微信:test', '1', '日常用品', 5, '0', '1', '/api/my/uploads/goods_pic/1678417505000.png', '2023-03-10 11:05:29.644000', '/api/my/uploads/goods_pic/1678417507324.png', '/api/my/uploads/goods_pic/1678417515711.png', '/api/my/uploads/goods_pic/1678417525200.png', '/api/my/uploads/goods_pic/1678417528299.png');
INSERT INTO `pub_goods` VALUES (130, 19, 'test', '芙丽芳丝氨基酸洗面奶男女士温和洁面敏弱肌100g', '芙丽芳丝氨基酸洗面奶男女士温和洁面敏弱肌100g', '39.9', '19.9', '微信:test', '1', '日常用品', 4, '0', '2', '/api/my/uploads/goods_pic/1678417671183.png', '2023-03-10 11:08:03.557000', '/api/my/uploads/goods_pic/1678417673878.png', '/api/my/uploads/goods_pic/1678417677184.png', '/api/my/uploads/goods_pic/1678417679925.png', '/api/my/uploads/goods_pic/1678417682664.png');
INSERT INTO `pub_goods` VALUES (131, 19, 'test', '[2月产]特仑苏纯牛奶苗条装250mlx12盒营养早餐奶学生', '[2月产]特仑苏纯牛奶苗条装250mlx12盒营养早餐奶学生礼盒装', '70', '45.5', '微信:test', '5', '零食饮料', 4, '0', '1', '/api/my/uploads/goods_pic/1678418031874.png', '2023-03-10 11:14:02.789000', '/api/my/uploads/goods_pic/1678418034407.png', '/api/my/uploads/goods_pic/1678418036832.png', '/api/my/uploads/goods_pic/1678418039366.png', '/api/my/uploads/goods_pic/1678418041804.png');
INSERT INTO `pub_goods` VALUES (132, 19, 'test', '[4折]俄罗斯进口雀巢 玻璃瓶装醇品咖啡粉 速溶黑咖啡', '喜欢就尽快拍下，犹豫就没了!!', '29.9', '16.9', '微信:test', '5', '零食饮料', 2, '0', '2', '/api/my/uploads/goods_pic/1678418188070.png', '2023-03-10 11:16:39.037000', '/api/my/uploads/goods_pic/1678418190518.png', '/api/my/uploads/goods_pic/1678418192880.png', '/api/my/uploads/goods_pic/1678418195510.png', '/api/my/uploads/goods_pic/1678418197895.png');
INSERT INTO `pub_goods` VALUES (133, 19, 'test', '统一小当家掌心脆干吃面童年怀旧零食一整箱全新日期', '三种口味!!! D蜜汁猪排味 2香葱味 3香辣蟹味', '24', '18', '微信:test', '5', '零食饮料', 3, '0', '1', '/api/my/uploads/goods_pic/1678418461900.png', '2023-03-10 11:21:31.667000', '/api/my/uploads/goods_pic/1678418470275.png', '/api/my/uploads/goods_pic/1678418484009.png', '/api/my/uploads/goods_pic/1678418488014.png', '/api/my/uploads/goods_pic/1678418490697.png');
INSERT INTO `pub_goods` VALUES (134, 19, 'test', '鸡胸肉丸健身即食鸡肉丸独立包装解馋速食饱腹丸子', '代餐学生宿舍夜宵休闲小吃 鸡胸肉丸解馋速食饱腹丸子鸡肉丸即食独立包装小零食代餐学生宿舍', '39.9', '19.9', '微信:test', '5', '零食饮料', 4, '0', '3', '/api/my/uploads/goods_pic/1678418616457.png', '2023-03-10 11:23:54.338000', '/api/my/uploads/goods_pic/1678418618814.png', '/api/my/uploads/goods_pic/1678418621195.png', '/api/my/uploads/goods_pic/1678418630005.png', '/api/my/uploads/goods_pic/1678418633476.png');
INSERT INTO `pub_goods` VALUES (135, 19, 'test', '15瓶35元特价卡曼橘口味元气森林苏打气泡水', '480mI0糖0脂0卡饮料仓库清仓!', '75', '35', '微信:test', '5', '零食饮料', 0, '0', '1', '/api/my/uploads/goods_pic/1678418790902.png', '2023-03-10 11:27:14.228000', '/api/my/uploads/goods_pic/1678418799344.png', '/api/my/uploads/goods_pic/1678418803032.png', '/api/my/uploads/goods_pic/1678418805536.png', '/api/my/uploads/goods_pic/1678418813999.png');
INSERT INTO `pub_goods` VALUES (136, 19, 'test', '松露软黑巧克力纯可可脂无蔗糖休闲零食节日礼盒散装喜糖', '纯可可脂松露软黑巧克力零食无蔗糖添加0糖每日节日礼盒散装喜糖', '33', '18.9', '微信:test', '5', '零食饮料', 0, '0', '1', '/api/my/uploads/goods_pic/1678418994773.png', '2023-03-10 11:30:10.583000', '/api/my/uploads/goods_pic/1678418997919.png', '/api/my/uploads/goods_pic/1678419002176.png', '/api/my/uploads/goods_pic/1678419006755.png', '/api/my/uploads/goods_pic/1678419009616.png');
INSERT INTO `pub_goods` VALUES (137, 19, 'test', '可口可乐[4罐装]日本进口可口可乐零度可乐大罐装无糖可乐0脂', '可口可乐[4罐装]日本进口可口可乐零度可乐大罐装无糖可乐0脂0卡碳酸饮料碳酸汽水500m*4', '49', '15', '微信:test', '5', '零食饮料', 6, '0', '3', '/api/my/uploads/goods_pic/1678419133461.png', '2023-03-10 11:32:41.026000', '/api/my/uploads/goods_pic/1678419136374.png', '/api/my/uploads/goods_pic/1678419138754.png', '/api/my/uploads/goods_pic/1678419141401.png', '/api/my/uploads/goods_pic/1678419149703.png');
INSERT INTO `pub_goods` VALUES (138, 19, 'test', '统一阿萨姆原味奶茶整箱统一芝士煎茶即饮奶茶饮料奶茶', '450ML*15瓶/10瓶 阿萨姆原味 (500ML) ，岩盐芝士，煎茶奶绿 ，青提茉莉，白桃观音，多口味混装', '58', '35.9', '微信:test', '5', '零食饮料', 1, '0', '1', '/api/my/uploads/goods_pic/1678419242537.png', '2023-03-10 11:34:14.327000', '/api/my/uploads/goods_pic/1678419245474.png', '/api/my/uploads/goods_pic/1678419248089.png', '/api/my/uploads/goods_pic/1678419250913.png', '/api/my/uploads/goods_pic/1678419253784.png');
INSERT INTO `pub_goods` VALUES (139, 19, 'test', '2包9.9元网红辣条', '100克一包最近妥妥的大爆款 真正的零差评好物', '15.9', '9.9', '微信:test', '5', '零食饮料', 2, '0', '1', '/api/my/uploads/goods_pic/1678419395935.png', '2023-03-10 11:36:57.127000', '/api/my/uploads/goods_pic/1678419398448.png', '/api/my/uploads/goods_pic/1678419407124.png', '/api/my/uploads/goods_pic/1678419413994.png', '/api/my/uploads/goods_pic/1678419416401.png');
INSERT INTO `pub_goods` VALUES (140, 19, 'test', 'UGD速溶蓝山咖啡卡布奇诺三合一 16g*50条一袋800克', 'UGD速溶蓝山咖啡卡布奇诺三合一 16g*50条一袋800克', '60.9', '25.5', '微信:test', '5', '零食饮料', 4, '0', '3', '/api/my/uploads/goods_pic/1678419621826.png', '2023-03-10 11:40:39.407000', '/api/my/uploads/goods_pic/1678419624269.png', '/api/my/uploads/goods_pic/1678419626784.png', '/api/my/uploads/goods_pic/1678419635465.png', '/api/my/uploads/goods_pic/1678419638476.png');
INSERT INTO `pub_goods` VALUES (141, 19, 'test', '广州地铁日卡 供收藏', '随缘挂有缘收', '20', '0', '微信:test', '7', '其它', 9, '0', '1', '/api/my/uploads/goods_pic/1678420256525.png', '2023-03-10 11:51:06.575000', '/api/my/uploads/goods_pic/1678420258722.png', '/api/my/uploads/goods_pic/1678420261057.png', '/api/my/uploads/goods_pic/1678420263435.png', '/api/my/uploads/goods_pic/1678420265811.png');
INSERT INTO `pub_goods` VALUES (142, 19, 'test', '索尼a65 索尼微单', '一切正常无拆无修 买回来用没多久一直吃灰', '5888', '1888', '微信：test', '4', '电子产品', 12, '0', '1', '/api/my/uploads/goods_pic/1678699178876.png', '2023-03-13 17:20:03.504000', '/api/my/uploads/goods_pic/1678699183104.png', '/api/my/uploads/goods_pic/1678699185652.png', '/api/my/uploads/goods_pic/1678699188116.png', '/api/my/uploads/goods_pic/1678699190550.png');
INSERT INTO `pub_goods` VALUES (144, 19, 'test', '佳能60d+18-5', '轻微使用痕迹，无维修磕碰 cmos完好，', '6666', '1666', '微信：test', '4', '电子产品', 8, '0', '1', '/api/my/uploads/goods_pic/1683968153143.png', '2023-04-12 17:14:25.801000', '/api/my/uploads/goods_pic/1681290857875.png', '/api/my/uploads/goods_pic/1681290860021.png', '/api/my/uploads/goods_pic/1681290862305.png', '/api/my/uploads/goods_pic/1681290864716.png');
INSERT INTO `pub_goods` VALUES (145, 19, 'test', '测试132', '2222', '111', '100', '微信：123', '4', '电子产品', 6, '0', '4', '/api/my/uploads/goods_pic/1682005493003.png', '2023-04-20 23:43:09.681000', '/api/my/uploads/goods_pic/1682005503640.png', '/api/my/uploads/goods_pic/1682005496579.png', '/api/my/uploads/goods_pic/1682005501129.png', '/api/my/uploads/goods_pic/1682005527289.png');
INSERT INTO `pub_goods` VALUES (146, 34, 'test5', 'Nikon/尼康f3', '定制改装方案可定制多种型号 徕卡 佳能 ', '52012', '1200', 'wx：111111111', '4', '电子产品', 5, '0', '4', '/api/my/uploads/goods_pic/1682097366632.png', '2023-04-22 01:14:32.733000', '/api/my/uploads/goods_pic/1682097264615.png', '/api/my/uploads/goods_pic/1682097266813.png', '/api/my/uploads/goods_pic/1682097269061.png', '/api/my/uploads/goods_pic/1682097271560.png');
INSERT INTO `pub_goods` VALUES (147, 36, 'test7', 'Nikon/尼康f3', '11111', '123', '11', 'wx：111111111', '4', '电子产品', 3, '0', '4', '/api/my/uploads/goods_pic/1682145528973.png', '2023-04-22 14:38:24.006000', '/api/my/uploads/goods_pic/1682145493099.png', '/api/my/uploads/goods_pic/1682145526439.png', '/api/my/uploads/goods_pic/1682145500739.png', '/api/my/uploads/goods_pic/1682145503284.png');

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `swiper_id` int(0) NOT NULL AUTO_INCREMENT,
  `swiper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`swiper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (36, '/api/my/uploads/swiper/1683967926053.png');
INSERT INTO `swiper` VALUES (37, '/api/my/uploads/swiper/1678429576415.png');
INSERT INTO `swiper` VALUES (39, '/api/my/uploads/swiper/1678521160328.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作为备注使用',
  `is_admini` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1:是，0:否',
  `is_stop` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1:是，0:否',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$LDaTUhEODzJPYCTCHmuugerTJf2mJq6RcmcQZ/QfCRqvgRyyO2A5O', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '1', '0');
INSERT INTO `user` VALUES (19, 'test', '$2a$10$YDHkBqRY/RfE4ARizi3Y2ucW.wffP8/HILMZKpdoeZHC1dynYKX.6', '/api/my/uploads/goods_pic/1676622662779.jpeg', '全部商品上传账号', '0', '0');
INSERT INTO `user` VALUES (20, 'test2', '$2a$10$JyUQtJRYdpLDId.L1v4ze.31UN4qIYH1.UGDQPOKDKpsQQp5d5FBO', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '0', '0');
INSERT INTO `user` VALUES (32, 'test3', '$2a$10$OAgsHQugMEkZLqaZunenL.X8L4rvVlgy4wJ4wxOSF21D7mMtngLOW', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '0', '0');
INSERT INTO `user` VALUES (33, 'test4', '$2a$10$YT19YUGfqqdMGUKc0H0GseH9g7CV50MHS1wRWir6kj9BLrZpUQxLG', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '0', '0');
INSERT INTO `user` VALUES (34, 'test5', '$2a$10$UmrzeGpOtmLxGmv7NC3YEeMADvYSwwhVdNIepxqiQBYpO70Onh/iy', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '0', '0');
INSERT INTO `user` VALUES (35, 'test6', '$2a$10$Coc73ObV.oTXhy7HzK50we004ZcCUjXMX.dOQE8QVjiYYLekx.SuG', '/api/my/uploads/goods_pic/1682097582301.jpeg', '-', '0', '0');
INSERT INTO `user` VALUES (36, 'test7', '$2a$10$tt5kgfWreQFYl9QPQzGBmum/ePr1.OkbBZbA/rsZaK9J8KxypY2Fq', '/api/my/uploads/goods_pic/1676622662779.jpeg', '-', '0', '0');

SET FOREIGN_KEY_CHECKS = 1;
