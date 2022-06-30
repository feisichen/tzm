/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : course_choose

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/06/2022 21:42:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
                            `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `teacher_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `limit_num` int(11) NULL DEFAULT NULL,
                            `current_num` int(11) NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('2001', '19年秋', '08305138', '面向对象程序设计', '101', '大司马', '一1-2', 50, 2);
INSERT INTO `classes` VALUES ('2002', '19年秋', '08305138', '面向对象程序设计', '101', '大司马', '一7-8', 50, 0);
INSERT INTO `classes` VALUES ('2003', '19年秋', '08305139', '数字逻辑', '122', '王十六', '二3-4', 50, 2);
INSERT INTO `classes` VALUES ('2004', '19年秋', '08305139', '数字逻辑', '122', '王十六', '四3-4', 50, 0);
INSERT INTO `classes` VALUES ('2005', '19年秋', '08305072', '数字逻辑实验', '126', 'UZI', '三9-10', 50, 0);
INSERT INTO `classes` VALUES ('2006', '19年秋', '08305072', '数字逻辑实验', '126', 'UZI', '五9-10', 50, 2);
INSERT INTO `classes` VALUES ('2007', '19年秋', '08305072', '数字逻辑实验', '122', '王十六', '三9-10', 50, 0);
INSERT INTO `classes` VALUES ('2008', '19年秋', '08305072', '数字逻辑实验', '122', '王十六', '五9-10', 50, 0);
INSERT INTO `classes` VALUES ('2009', '19年冬', '08305140', '离散数学', '130', '王二十三', '一1-2', 50, 0);
INSERT INTO `classes` VALUES ('2010', '19年冬', '08305140', '离散数学', '130', '王二十三', '三1-2', 50, 1);
INSERT INTO `classes` VALUES ('2011', '19年冬', '08305140', '离散数学', '101', '大司马', '一1-2', 50, 1);
INSERT INTO `classes` VALUES ('2012', '19年冬', '08305140', '离散数学', '101', '大司马', '三1-2', 50, 0);
INSERT INTO `classes` VALUES ('2013', '19年冬', '08305009', '数据结构', '151', '动力小子', '二7-8', 50, 1);
INSERT INTO `classes` VALUES ('2014', '19年冬', '08305009', '数据结构', '151', '动力小子', '四7-8', 50, 0);
INSERT INTO `classes` VALUES ('2015', '19年春', '08305073', '计算机组成原理', '105', '毕导THU', '一5-6', 50, 0);
INSERT INTO `classes` VALUES ('2016', '19年春', '08305073', '计算机组成原理', '105', '毕导THU', '三5-6', 50, 1);
INSERT INTO `classes` VALUES ('2017', '19年春', '08305073', '计算机组成原理', '126', 'UZI', '一5-6', 50, 0);
INSERT INTO `classes` VALUES ('2018', '19年春', '08305073', '计算机组成原理', '126', 'UZI', '三5-6', 50, 0);
INSERT INTO `classes` VALUES ('2019', '19年春', '08305075', '计算机组成原理实验', '106', '宋浩', '一1-2', 50, 0);
INSERT INTO `classes` VALUES ('2020', '19年秋', '02075052', '文学概论', '102', '毕导SHU', '一1-2', 5, 5);
INSERT INTO `classes` VALUES ('2022', '19年春', '08305075', '计算机组成原理实验', '106', '宋浩', '一3-4', 50, 1);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课号',
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课名',
                           `credit` int(11) NULL DEFAULT NULL COMMENT '学分',
                           `department` int(11) NULL DEFAULT NULL COMMENT '院系号',
                           `Weight` double NULL DEFAULT 0.6,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('01013010', '线性代数', 3, 3, 0.6);
INSERT INTO `course` VALUES ('01014017', '概率论与数理统计', 3, 3, 0.6);
INSERT INTO `course` VALUES ('02075003', '现代汉语', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02075032', '中国文学批评史', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02075052', '文学概论', 3, 2, 0.6);
INSERT INTO `course` VALUES ('02075053', '语言学概论', 3, 2, 0.6);
INSERT INTO `course` VALUES ('02075133', '中国古典文献学', 3, 2, 0.6);
INSERT INTO `course` VALUES ('02075271', '中国当代文学', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02075363', '比较文学', 3, 2, 0.6);
INSERT INTO `course` VALUES ('02075432', '中国古代文学A', 9, 2, 0.6);
INSERT INTO `course` VALUES ('02075435', '中国古代文学B', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02075437', '中国现代文学', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02075439', '外国文学', 9, 2, 0.6);
INSERT INTO `course` VALUES ('02075442', '古代汉语', 9, 2, 0.6);
INSERT INTO `course` VALUES ('02076273', '西方文论', 6, 2, 0.6);
INSERT INTO `course` VALUES ('02076331', '创意写作', 3, 2, 0.6);
INSERT INTO `course` VALUES ('04105083', '经管文献检索', 3, 3, 0.6);
INSERT INTO `course` VALUES ('04135004', '经济法', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04135025', '世界经济', 3, 3, 0.6);
INSERT INTO `course` VALUES ('04135061', '公共经济学', 3, 3, 0.6);
INSERT INTO `course` VALUES ('04136012', '产业经济学', 3, 3, 0.6);
INSERT INTO `course` VALUES ('04145001', '货币银行学', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04145002', '国际金融', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04145003', '统计学', 5, 3, 0.6);
INSERT INTO `course` VALUES ('04145011', '计量经济学', 3, 3, 0.6);
INSERT INTO `course` VALUES ('04155001', '国际贸易原理', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04156003', '国际贸易实务', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04165002', '税收学', 4, 3, 0.6);
INSERT INTO `course` VALUES ('04205018', '基础会计', 4, 3, 0.6);
INSERT INTO `course` VALUES ('06265051', '民事诉讼法', 6, 5, 0.6);
INSERT INTO `course` VALUES ('06265072', '行政法与行政诉讼法', 6, 5, 0.6);
INSERT INTO `course` VALUES ('06265136', '法理学', 8, 5, 0.6);
INSERT INTO `course` VALUES ('06265171', '中国法律史', 5, 5, 0.6);
INSERT INTO `course` VALUES ('06265172', '宪法学', 5, 5, 0.6);
INSERT INTO `course` VALUES ('06265173', '民法', 13, 5, 0.6);
INSERT INTO `course` VALUES ('06265176', '刑法', 13, 5, 0.6);
INSERT INTO `course` VALUES ('06265178', '刑事诉讼法', 6, 5, 0.6);
INSERT INTO `course` VALUES ('06265179', '国际法', 5, 5, 0.6);
INSERT INTO `course` VALUES ('06265194', '习近平法治思想概论', 2, 5, 0.6);
INSERT INTO `course` VALUES ('06266170', '法律职业伦理', 2, 5, 0.6);
INSERT INTO `course` VALUES ('08305009', '数据结构', 8, 1, 0.6);
INSERT INTO `course` VALUES ('08305011', '操作系统', 8, 1, 0.6);
INSERT INTO `course` VALUES ('08305014', '数据库原理', 7, 1, 0.6);
INSERT INTO `course` VALUES ('08305016', '软件工程', 4, 1, 0.6);
INSERT INTO `course` VALUES ('08305072', '数字逻辑实验', 1, 1, 0.6);
INSERT INTO `course` VALUES ('08305073', '计算机组成原理', 6, 1, 0.6);
INSERT INTO `course` VALUES ('08305075', '计算机组成原理实验', 2, 1, 0.6);
INSERT INTO `course` VALUES ('08305138', '面向对象程序设计', 4, 1, 0.6);
INSERT INTO `course` VALUES ('08305139', '数字逻辑', 4, 1, 0.6);
INSERT INTO `course` VALUES ('08305140', '离散数学', 6, 1, 0.6);
INSERT INTO `course` VALUES ('08305142', '计算机网络', 5, 1, 0.6);
INSERT INTO `course` VALUES ('08305144', '编译原理', 4, 1, 0.6);
INSERT INTO `course` VALUES ('14765010', '原动画设计', 8, 4, 0.6);
INSERT INTO `course` VALUES ('14765015', '剪辑艺术与实践', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765017', '定格动画基础', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765018', '数字合成技术基础', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765024', '动画表演', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765038', '艺术概论', 2, 4, 0.6);
INSERT INTO `course` VALUES ('14765039', '动画概论', 3, 4, 0.6);
INSERT INTO `course` VALUES ('14765041', '动画导演', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765042', '分镜头脚本设计', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765043', '动画角色设计', 6, 4, 0.6);
INSERT INTO `course` VALUES ('14765045', '动画场景设计', 6, 4, 0.6);
INSERT INTO `course` VALUES ('14765064', '视听语言基础', 2, 4, 0.6);
INSERT INTO `course` VALUES ('14765065', '设计构成基础', 2, 4, 0.6);
INSERT INTO `course` VALUES ('14765066', '动画数字技术基础', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765068', '动画原理与规律', 2, 4, 0.6);
INSERT INTO `course` VALUES ('14765069', '数字三维动画基础', 8, 4, 0.6);
INSERT INTO `course` VALUES ('14765071', '电影声音设计与制作', 4, 4, 0.6);
INSERT INTO `course` VALUES ('14765072', '游戏设计基础', 2, 4, 0.6);
INSERT INTO `course` VALUES ('14765073', '动画故事写作基础', 2, 4, 0.6);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
                               `department` int(11) NOT NULL COMMENT '院系号',
                               `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '院名',
                               PRIMARY KEY (`department`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '计算机学院');
INSERT INTO `department` VALUES (2, '文学院');
INSERT INTO `department` VALUES (3, '经济学院');
INSERT INTO `department` VALUES (4, '电影学院');
INSERT INTO `department` VALUES (5, '法学院');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `student_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `teacher_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `usual_grade` int(11) NULL DEFAULT NULL,
                          `final_grade` int(11) NULL DEFAULT NULL,
                          `total_grade` int(11) NULL DEFAULT NULL,
                          `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (106, '19122002', '19年秋', '08305139', '122', 89, 76, 81, '二3-4');
INSERT INTO `grade` VALUES (107, '19122002', '19年秋', '08305072', '126', 93, 86, 89, '五9-10');
INSERT INTO `grade` VALUES (109, '19122002', '19年冬', '08305009', '151', 90, 76, 80, '二7-8');
INSERT INTO `grade` VALUES (110, '19122002', '19年春', '08305073', '105', 91, 82, 85, '三5-6');
INSERT INTO `grade` VALUES (111, '19122002', '19年春', '08305075', '106', 81, 67, 71, '一3-4');
INSERT INTO `grade` VALUES (112, '19122002', '19年秋', '08305138', '101', 92, 95, 94, '一1-2');
INSERT INTO `grade` VALUES (113, '19122017', '19年秋', '08305138', '101', 67, 78, 74, '一1-2');
INSERT INTO `grade` VALUES (114, '19122017', '19年秋', '08305139', '122', 78, 60, 67, '二3-4');
INSERT INTO `grade` VALUES (115, '19122017', '19年秋', '08305072', '126', 90, 98, 95, '五9-10');
INSERT INTO `grade` VALUES (128, '19122017', '19年冬', '08305140', '130', 80, 89, 85, '三1-2');
INSERT INTO `grade` VALUES (131, '19122175', '19年秋', '02075052', '102', 98, 84, 88, '一1-2');
INSERT INTO `grade` VALUES (132, '19122184', '19年秋', '02075052', '102', 96, 88, 90, '一1-2');
INSERT INTO `grade` VALUES (133, '19122185', '19年秋', '02075052', '102', 97, 80, 85, '一1-2');
INSERT INTO `grade` VALUES (135, '19122193', '19年秋', '02075052', '102', 92, 75, 80, '一1-2');
INSERT INTO `grade` VALUES (136, '19122196', '19年秋', '02075052', '102', 95, 69, 77, '一1-2');
INSERT INTO `grade` VALUES (137, '19122002', '19年冬', '08305140', '101', 91, 69, 76, '一1-2');
INSERT INTO `grade` VALUES (138, '19122175', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (139, '19122184', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (140, '19122185', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (141, '19122193', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (142, '19122196', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (143, '1912', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (144, '19122171', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (145, '19122172', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (146, '19122173', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (147, '19122174', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (148, '19122176', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (149, '19122177', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (150, '19122178', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (151, '19122179', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (152, '19122180', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (153, '19122181', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (154, '19122182', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (155, '19122183', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (156, '19122186', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (157, '19122187', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (158, '19122188', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (159, '19122189', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (160, '19122190', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (161, '19122191', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (162, '19122192', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (163, '19122194', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (164, '19122195', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (165, '19122197', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (166, '19122198', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (167, '19122199', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');
INSERT INTO `grade` VALUES (168, '19122200', '19年秋', '08305138', '101', NULL, NULL, NULL, '一1-2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
                            `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学号',
                            `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
                            `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
                            `department` int(11) NULL DEFAULT NULL COMMENT '院系号',
                            `gpa` double NULL DEFAULT NULL COMMENT '绩点',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('19122002', '19122002', '孙义洋', '男', 1, 3.16);
INSERT INTO `student` VALUES ('19122017', '19122017', '吴泽铭', '男', 1, 3.81);
INSERT INTO `student` VALUES ('19122171', '19122171', '张一', '男', 4, 0);
INSERT INTO `student` VALUES ('19122172', '19122172', '张二', '女', 3, 0);
INSERT INTO `student` VALUES ('19122173', '19122173', '张三', '男', 3, 0);
INSERT INTO `student` VALUES ('19122174', '19122174', '张四', '男', 4, 0);
INSERT INTO `student` VALUES ('19122175', '19122175', '张五', '男', 2, 3.7);
INSERT INTO `student` VALUES ('19122176', '19122176', '张六', '女', 1, 0);
INSERT INTO `student` VALUES ('19122177', '19122177', '张七', '男', 4, 0);
INSERT INTO `student` VALUES ('19122178', '19122178', '张八', '女', 5, 0);
INSERT INTO `student` VALUES ('19122179', '19122179', '张九', '女', 4, 0);
INSERT INTO `student` VALUES ('19122180', '19122180', '关注嘉然今天吃什么', '女', 1, 0);
INSERT INTO `student` VALUES ('19122181', '19122181', '李一', '男', 5, 0);
INSERT INTO `student` VALUES ('19122182', '19122182', '李二', '男', 4, 0);
INSERT INTO `student` VALUES ('19122183', '19122183', '李三', '女', 5, 0);
INSERT INTO `student` VALUES ('19122184', '19122184', '李四', '女', 2, 4);
INSERT INTO `student` VALUES ('19122185', '19122185', '不认识', '女', 2, 3.7);
INSERT INTO `student` VALUES ('19122186', '19122186', '徐一凡', '男', 4, 0);
INSERT INTO `student` VALUES ('19122187', '19122187', '徐一凡二号机', '男', 3, 0);
INSERT INTO `student` VALUES ('19122188', '19122188', '哦哦哦', '女', 1, 0);
INSERT INTO `student` VALUES ('19122189', '19122189', '伢伢gagako', '女', 1, 0);
INSERT INTO `student` VALUES ('19122190', '19122190', '老番茄', '男', 3, 0);
INSERT INTO `student` VALUES ('19122191', '19122191', '耶耶耶', '男', 2, 0);
INSERT INTO `student` VALUES ('19122192', '19122192', '上大王俊凯', '男', 5, 0);
INSERT INTO `student` VALUES ('19122193', '19122193', '七海Nana7mi', '女', 2, 3);
INSERT INTO `student` VALUES ('19122194', '19122194', '刘庸干净又卫生', '男', 4, 0);
INSERT INTO `student` VALUES ('19122195', '19122195', '李令羽', '女', 5, 0);
INSERT INTO `student` VALUES ('19122196', '19122196', '杨颜同学', '男', 2, 2.7);
INSERT INTO `student` VALUES ('19122197', '19122197', '原神', '女', 5, 0);
INSERT INTO `student` VALUES ('19122198', '19122198', '一拳超人', '男', 3, 0);
INSERT INTO `student` VALUES ('19122199', '19122199', '动力节点', '男', 1, 0);
INSERT INTO `student` VALUES ('19122200', '19122200', '哔哩哔哩番剧', '女', 2, 0);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
                            `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `department` int(11) NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('101', '101', '大司马', '女', 1);
INSERT INTO `teacher` VALUES ('102', '102', '毕导SHU', '女', 2);
INSERT INTO `teacher` VALUES ('103', '103', 'LCF', '男', 3);
INSERT INTO `teacher` VALUES ('104', '104', '阿狸', '女', 5);
INSERT INTO `teacher` VALUES ('105', '105', '毕导THU', '男', 1);
INSERT INTO `teacher` VALUES ('106', '106', '宋浩', '男', 1);
INSERT INTO `teacher` VALUES ('107', '107', '王一', '男', 3);
INSERT INTO `teacher` VALUES ('108', '108', '王二', '女', 4);
INSERT INTO `teacher` VALUES ('109', '109', '王三', '男', 3);
INSERT INTO `teacher` VALUES ('110', '110', '王四', '男', 5);
INSERT INTO `teacher` VALUES ('111', '111', '王五', '男', 1);
INSERT INTO `teacher` VALUES ('112', '112', '王六', '女', 5);
INSERT INTO `teacher` VALUES ('113', '113', '王七', '男', 4);
INSERT INTO `teacher` VALUES ('114', '114', '王八', '男', 2);
INSERT INTO `teacher` VALUES ('115', '115', '王九', '女', 5);
INSERT INTO `teacher` VALUES ('116', '116', '王十', '男', 4);
INSERT INTO `teacher` VALUES ('117', '117', '王十一', '男', 2);
INSERT INTO `teacher` VALUES ('118', '118', '王十二', '男', 3);
INSERT INTO `teacher` VALUES ('119', '119', '王十三', '女', 2);
INSERT INTO `teacher` VALUES ('120', '120', '王十四', '女', 1);
INSERT INTO `teacher` VALUES ('121', '121', '王十五', '男', 5);
INSERT INTO `teacher` VALUES ('122', '122', '王十六', '女', 1);
INSERT INTO `teacher` VALUES ('123', '123', '王十七', '女', 3);
INSERT INTO `teacher` VALUES ('124', '124', '王十八', '男', 3);
INSERT INTO `teacher` VALUES ('125', '125', '王十九', '男', 2);
INSERT INTO `teacher` VALUES ('126', '126', 'UZI', '男', 1);
INSERT INTO `teacher` VALUES ('127', '127', '王二十丶', '男', 5);
INSERT INTO `teacher` VALUES ('128', '128', '王二十一', '男', 4);
INSERT INTO `teacher` VALUES ('129', '129', '王二十二', '男', 4);
INSERT INTO `teacher` VALUES ('130', '130', '王二十三', '男', 1);
INSERT INTO `teacher` VALUES ('131', '131', '王二十四', '女', 3);
INSERT INTO `teacher` VALUES ('132', '132', '王二十五', '女', 4);
INSERT INTO `teacher` VALUES ('133', '133', '王二十六', '男', 1);
INSERT INTO `teacher` VALUES ('134', '134', '王二十七', '女', 4);
INSERT INTO `teacher` VALUES ('135', '135', '王二十八', '男', 4);
INSERT INTO `teacher` VALUES ('136', '136', '王二十九', '男', 5);
INSERT INTO `teacher` VALUES ('137', '137', '王三十', '男', 1);
INSERT INTO `teacher` VALUES ('138', '138', '王三十一', '男', 3);
INSERT INTO `teacher` VALUES ('139', '139', '王三十二', '女', 2);
INSERT INTO `teacher` VALUES ('140', '140', '王三十三', '男', 1);
INSERT INTO `teacher` VALUES ('141', '141', '王三十四', '男', 2);
INSERT INTO `teacher` VALUES ('142', '142', '王三十五', '女', 3);
INSERT INTO `teacher` VALUES ('143', '143', '自由大野猪', '男', 3);
INSERT INTO `teacher` VALUES ('144', '144', '王三十六', '男', 3);
INSERT INTO `teacher` VALUES ('145', '145', '赫萝的苹果', '男', 2);
INSERT INTO `teacher` VALUES ('146', '146', '王三十七', '男', 5);
INSERT INTO `teacher` VALUES ('147', '147', '猫猫人', '女', 2);
INSERT INTO `teacher` VALUES ('148', '148', '恐怖喷火人', '女', 2);
INSERT INTO `teacher` VALUES ('149', '149', '王道论坛', '男', 1);
INSERT INTO `teacher` VALUES ('150', '150', '恶灵', '女', 2);
INSERT INTO `teacher` VALUES ('151', '151', '动力小子', '男', 1);
INSERT INTO `teacher` VALUES ('152', '152', '专爱眼睛', '男', 4);
INSERT INTO `teacher` VALUES ('153', '153', '布罗特亨德尔', '女', 2);
INSERT INTO `teacher` VALUES ('154', '154', '罗八', '女', 3);
INSERT INTO `teacher` VALUES ('155', '155', '直布罗陀', '女', 4);
INSERT INTO `teacher` VALUES ('156', '156', '瓦尔基里', '男', 2);
INSERT INTO `teacher` VALUES ('157', '157', '地平线', '男', 4);
INSERT INTO `teacher` VALUES ('158', '158', '暴雷', '男', 5);
INSERT INTO `teacher` VALUES ('159', '159', '幻象', '男', 2);
INSERT INTO `teacher` VALUES ('160', '160', '华森', '女', 5);
INSERT INTO `teacher` VALUES ('sys', 'sys', 'SystemAdministrator', NULL, NULL);

-- ----------------------------
-- Table structure for time
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time`  (
                         `Term` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
                         `Select_begin` date NULL DEFAULT NULL,
                         `Select_end` date NULL DEFAULT NULL,
                         `Usual_grade_begin` date NULL DEFAULT NULL,
                         `Usual_grade_end` date NULL DEFAULT NULL,
                         `Final_grade_begin` date NULL DEFAULT NULL,
                         `Final_grade_end` date NULL DEFAULT NULL,
                         PRIMARY KEY (`Term`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time
-- ----------------------------
INSERT INTO `time` VALUES ('19年秋', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `time` VALUES ('19年冬', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `time` VALUES ('19年春', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Procedure structure for getDepInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `getDepInfo`;
delimiter ;;
CREATE PROCEDURE `getDepInfo`(in dep int, out depStudentNum integer, out depTeacherNum integer, out depCourseNum integer)
begin
    select count(*) into depStudentNum from student where department = dep;
    select count(*) into depTeacherNum from teacher where department = dep;
    select count(*) into depCourseNum from course where department = dep;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table classes
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_classes`;
delimiter ;;
CREATE TRIGGER `after_delete_classes` AFTER DELETE ON `classes` FOR EACH ROW begin
    delete from grade where term = old.term
                        and time = old.time
                        and course_id = old.course_id
                        and teacher_id = old.teacher_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_course`;
delimiter ;;
CREATE TRIGGER `after_delete_course` AFTER DELETE ON `course` FOR EACH ROW begin
    delete from grade where course_id = old.id;
    delete from classes where course_id = old.id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table department
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_department`;
delimiter ;;
CREATE TRIGGER `after_delete_department` AFTER DELETE ON `department` FOR EACH ROW begin
    delete from grade where student_id in (select id from student where department = old.department)
                         or teacher_id in (select id from teacher where department = old.department)
                         or course_id in (select id from course where department = old.department);
    delete from classes
    where teacher_id in (select id from teacher where department = old.department)
       or course_id in (select id from course where department = old.department);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `after_delete_student`;
delimiter ;;
CREATE TRIGGER `after_delete_student` AFTER DELETE ON `student` FOR EACH ROW begin
    delete from grade where student_id = old.id;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
