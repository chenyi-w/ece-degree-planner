/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50732 (5.7.32-log)
 Source Host           : mysql.yaphp.net:3306
 Source Schema         : teachcourse

 Target Server Type    : MySQL
 Target Server Version : 50732 (5.7.32-log)
 File Encoding         : 65001

 Date: 26/10/2022 13:58:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for degrees
-- ----------------------------
DROP TABLE IF EXISTS `degrees`;
CREATE TABLE `degrees`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of degrees
-- ----------------------------
INSERT INTO `degrees` VALUES (1, 'Electrical Engineering');
INSERT INTO `degrees` VALUES (2, 'Computer Engineering');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int(4) NULL DEFAULT NULL,
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passscore` int(255) NULL DEFAULT NULL,
  `offered` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credits` int(11) NULL DEFAULT NULL,
  `pre_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Computer Engineering', 'Networking & Cybersecurity', 'General Chemistry', 'CHEM 1035', 0, 'fall', 9, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (2, 'Computer Engineering', 'Networking & Cybersecurity', 'General Chemistry Lab', 'CHEM 1045', 0, 'fall', 9, 'spring,fall', 1, '');
INSERT INTO `course` VALUES (3, 'Computer Engineering', 'Networking & Cybersecurity', 'First Year Writing', 'ENGL 1105', 0, 'fall', 9, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (4, 'Computer Engineering', 'Networking & Cybersecurity', 'Calculus of a Single Variable', 'MATH 1225', 0, 'fall', 6, 'spring,fall', 4, NULL);
INSERT INTO `course` VALUES (5, 'Computer Engineering', 'Networking & Cybersecurity', 'First Year Writing', 'ENGL 1106', 0, 'spring', 9, 'spring,fall', 3, '4');
INSERT INTO `course` VALUES (6, 'Computer Engineering', 'Networking & Cybersecurity', 'Calculus of a Single Variable ', 'MATH 1226', 0, 'spring', 9, 'spring,fall', 4, '4');
INSERT INTO `course` VALUES (7, 'Computer Engineering', 'Networking & Cybersecurity', 'Foundations of Physics', 'PHYS 2305', 0, 'spring', 9, 'spring,fall', 4, '4');
INSERT INTO `course` VALUES (8, 'Computer Engineering', 'Networking & Cybersecurity', 'Foundations of Engineering', 'ENGE 1215', 0, 'fall', 6, 'spring,fall', 2, NULL);
INSERT INTO `course` VALUES (9, 'Computer Engineering', 'Networking & Cybersecurity', 'Foundations of Engineering', 'ENGE 1216', 0, 'spring', 6, 'spring,fall', 2, '8');
INSERT INTO `course` VALUES (10, 'Computer Engineering', 'Networking & Cybersecurity', 'Introduction to ECE Concepts', 'ECE 1004', 0, 'spring', 6, 'spring,fall', 3, '8');
INSERT INTO `course` VALUES (11, 'Computer Engineering', 'Networking & Cybersecurity', 'Introduction  to  Linear  Algebra', 'MATH  2114', 0, 'fall', 7, 'spring,fall', 3, '6');
INSERT INTO `course` VALUES (12, 'Computer Engineering', 'Networking & Cybersecurity', 'Introduction to Differential Equations', 'MATH 2214', 1, 'fall', 7, 'spring,fall', 3, '6');
INSERT INTO `course` VALUES (13, 'Computer Engineering', 'Networking & Cybersecurity', 'Foundations of Physics I', 'PHYS 2306', 1, 'fall', 10, 'spring,fall', 4, '7');
INSERT INTO `course` VALUES (14, 'Computer Engineering', 'Networking & Cybersecurity', 'Circuits and Devices', 'ECE 2024', 1, 'fall', 6, 'spring,fall', 3, '13');
INSERT INTO `course` VALUES (15, 'Computer Engineering', 'Networking & Cybersecurity', 'Fundamentals of Digital Systems (C)', 'ECE 2544', 1, 'fall', 6, 'spring,fall', 3, '5');
INSERT INTO `course` VALUES (16, 'Computer Engineering', 'Networking & Cybersecurity', 'Introduction  to  Multivariable  Calculus', 'MATH  2204', 1, 'spring', 10, 'spring,fall', 3, '6');
INSERT INTO `course` VALUES (17, 'Computer Engineering', 'Networking & Cybersecurity', 'Physical Electronics (C)', 'ECE 2214', 1, 'spring', 6, 'spring,fall', 3, '14');
INSERT INTO `course` VALUES (18, 'Computer Engineering', 'Networking & Cybersecurity', 'Embedded Systems (C)', 'ECE 2564', 1, 'spring', 6, 'spring,fall', 3, '15');
INSERT INTO `course` VALUES (19, 'Computer Engineering', 'Networking & Cybersecurity', 'Signals and Systems(C)', 'ECE 2714', 1, 'spring', 6, 'spring,fall', 3, '15');
INSERT INTO `course` VALUES (21, 'Computer Engineering', 'Networking & Cybersecurity', 'Integrated  Design  Project  (C)', 'ECE  2804', 1, 'spring', 6, 'spring,fall', 2, '14');
INSERT INTO `course` VALUES (22, 'Computer Engineering', 'Networking & Cybersecurity', 'Computer Organization and Architecture', 'ECE 3504', 2, 'fall', 7, 'spring,fall', 3, '21');
INSERT INTO `course` VALUES (23, 'Computer Engineering', 'Networking & Cybersecurity', 'Data Structure and Algorithms', 'ECE 3514', 2, 'fall', 7, 'spring,fall', 3, '21');
INSERT INTO `course` VALUES (24, 'Computer Engineering', 'Networking & Cybersecurity', 'Probability and Statistics for Electrical Engineers', 'STAT 4714', 2, 'fall', 7, 'spring,fall', 3, '16');
INSERT INTO `course` VALUES (25, 'Computer Engineering', 'Networking & Cybersecurity', 'Applied Software Design', 'ECE 3574', 2, 'spring', 7, 'spring,fall', 3, '23');
INSERT INTO `course` VALUES (26, 'Computer Engineering', 'Networking & Cybersecurity', 'Intro  to  Computer  Networking', 'ECE  3564', 2, 'spring', 7, 'spring,fall', 3, '24');
INSERT INTO `course` VALUES (27, 'Computer Engineering', 'Networking & Cybersecurity', 'Senior Design Project', 'ECE 4805', 3, 'fall', 7, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (28, 'Computer Engineering', 'Networking & Cybersecurity', 'Network  Application  Design', 'ECE  4564', 3, 'fall', 10, 'spring,fall', 3, '23');
INSERT INTO `course` VALUES (29, 'Computer Engineering', 'Networking & Cybersecurity', 'Introduction to Discrete Math', 'MATH 2534', 3, 'fall', 10, 'spring,fall', 3, '10');
INSERT INTO `course` VALUES (30, 'Computer Engineering', 'Networking & Cybersecurity', 'Senior Design Project', 'ECE 4806', 3, 'spring', 10, 'spring,fall', 3, '27');
INSERT INTO `course` VALUES (31, 'Computer Engineering', 'Networking & Cybersecurity', 'Computer and Network Security Fundamentals', 'ECE 4560', 3, 'spring', 10, 'spring', 3, '26');
INSERT INTO `course` VALUES (32, 'Computer Engineering', 'Networking & Cybersecurity', 'Principles Computer Security', 'CS 4264', 3, 'spring', 10, 'spring,fall', 3, '25');
INSERT INTO `course` VALUES (33, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways 2 or 3 or 6a', '', 0, 'fall', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (34, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways 2 or 3 or 6a', '', 1, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (35, 'Computer Engineering', 'Networking & Cybersecurity', 'Secondary Focus Area course ', '', 2, 'fall', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (36, 'Computer Engineering', 'Networking & Cybersecurity', 'Free Elective', '', 2, 'fall', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (37, 'Computer Engineering', 'Networking & Cybersecurity', 'Secondary Focus Area course (see list)', '', 2, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (38, 'Computer Engineering', 'Networking & Cybersecurity', 'Secondary Focus Area course (see list)', '', 2, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (39, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways 2 or 3 or 6a', '', 2, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (40, 'Computer Engineering', 'Networking & Cybersecurity', 'Free Elective', '', 2, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (41, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways 2 or 3 or 6a', '', 3, 'fall', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (42, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways 2 or 3 or 6a', '', 3, 'fall', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (43, 'Computer Engineering', 'Networking & Cybersecurity', 'Pathways  7  or  Free  Elective', '', 3, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (44, 'Computer Engineering', 'Networking & Cybersecurity', 'Free Elective', '', 3, 'spring', 10, 'spring,fall', 3, NULL);
INSERT INTO `course` VALUES (46, 'Computer Engineering', 'Networking & Cybersecurity', ' Computational Engineering', 'ECE 2514', 2, 'fall', 6, 'spring,fall', 3, '14,15');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `d_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_major_degrees_idx` (`d_id` ASC) VISIBLE,
  CONSTRAINT `fk_major_degrees`
    FOREIGN KEY (`d_id`)
    REFERENCES `degrees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 'test', 2);
INSERT INTO `major` VALUES (2, 'Networking & Cybersecurity', 2);

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `season` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passlevel` int(1) NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES (1, 2, 1, 0, 'fall', -1);
INSERT INTO `plans` VALUES (2, 2, 2, 0, 'fall', -1);
INSERT INTO `plans` VALUES (3, 2, 3, 0, 'fall', -1);
INSERT INTO `plans` VALUES (4, 2, 4, 0, 'spring', -1);
INSERT INTO `plans` VALUES (5, 2, 5, 0, 'spring', -1);
INSERT INTO `plans` VALUES (6, 2, 6, 0, 'spring', -1);
INSERT INTO `plans` VALUES (7, 2, 7, 0, 'spring', -1);
INSERT INTO `plans` VALUES (8, 2, 8, 0, 'fall', -1);
INSERT INTO `plans` VALUES (9, 2, 9, 0, 'spring', -1);
INSERT INTO `plans` VALUES (10, 2, 10, 0, 'spring', -1);
INSERT INTO `plans` VALUES (11, 2, 11, 0, 'fall', -1);
INSERT INTO `plans` VALUES (12, 2, 12, 1, 'fall', -1);
INSERT INTO `plans` VALUES (13, 2, 13, 1, 'fall', -1);
INSERT INTO `plans` VALUES (14, 2, 14, 1, 'fall', -1);
INSERT INTO `plans` VALUES (15, 2, 15, 1, 'fall', -1);
INSERT INTO `plans` VALUES (16, 2, 16, 1, 'spring', -1);
INSERT INTO `plans` VALUES (17, 2, 17, 1, 'spring', -1);
INSERT INTO `plans` VALUES (18, 2, 18, 1, 'spring', -1);
INSERT INTO `plans` VALUES (19, 2, 19, 1, 'spring', -1);
INSERT INTO `plans` VALUES (20, 2, 21, 1, 'spring', -1);
INSERT INTO `plans` VALUES (21, 2, 22, 2, 'fall', -1);
INSERT INTO `plans` VALUES (22, 2, 23, 2, 'fall', -1);
INSERT INTO `plans` VALUES (23, 2, 24, 2, 'fall', -1);
INSERT INTO `plans` VALUES (24, 2, 25, 2, 'spring', -1);
INSERT INTO `plans` VALUES (25, 2, 26, 2, 'spring', -1);
INSERT INTO `plans` VALUES (26, 2, 27, 3, 'fall', -1);
INSERT INTO `plans` VALUES (27, 2, 28, 3, 'fall', -1);
INSERT INTO `plans` VALUES (28, 2, 29, 3, 'fall', -1);
INSERT INTO `plans` VALUES (29, 2, 30, 3, 'spring', -1);
INSERT INTO `plans` VALUES (30, 2, 31, 3, 'spring', -1);
INSERT INTO `plans` VALUES (31, 2, 32, 3, 'spring', -1);
INSERT INTO `plans` VALUES (32, 2, 33, 0, 'fall', -1);
INSERT INTO `plans` VALUES (33, 2, 34, 1, 'spring', -1);
INSERT INTO `plans` VALUES (34, 2, 35, 2, 'fall', -1);
INSERT INTO `plans` VALUES (35, 2, 36, 2, 'fall', -1);
INSERT INTO `plans` VALUES (36, 2, 37, 2, 'spring', -1);
INSERT INTO `plans` VALUES (37, 2, 38, 2, 'spring', -1);
INSERT INTO `plans` VALUES (38, 2, 39, 2, 'spring', -1);
INSERT INTO `plans` VALUES (39, 2, 40, 2, 'spring', -1);
INSERT INTO `plans` VALUES (40, 2, 41, 3, 'fall', -1);
INSERT INTO `plans` VALUES (41, 2, 42, 3, 'fall', -1);
INSERT INTO `plans` VALUES (42, 2, 43, 3, 'spring', -1);
INSERT INTO `plans` VALUES (43, 2, 44, 3, 'spring', -1);
INSERT INTO `plans` VALUES (44, 2, 46, 2, 'fall', -1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  `plan` int(1) NULL DEFAULT 0,
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 't123', NULL, 0, 0, 'e84599cbc45c4f3eef10ab2fd216d668');
INSERT INTO `users` VALUES (2, 's123', NULL, 1, 1, '325a36d31e95e1c944a57815417872a8');

