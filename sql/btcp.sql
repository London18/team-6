/*
 Navicat Premium Data Transfer

 Source Server         : ghj
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : btcp

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 10/11/2018 00:00:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `iddepartments` int(11) NOT NULL AUTO_INCREMENT,
  `departmentsname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`iddepartments`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword`  (
  `idkeyword` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idkeyword`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of keyword
-- ----------------------------
INSERT INTO `keyword` VALUES (1, 'tumour');
INSERT INTO `keyword` VALUES (2, 'child');
INSERT INTO `keyword` VALUES (3, 'free');
INSERT INTO `keyword` VALUES (4, 'symptoms');
INSERT INTO `keyword` VALUES (5, '');

-- ----------------------------
-- Table structure for pairingqk
-- ----------------------------
DROP TABLE IF EXISTS `pairingqk`;
CREATE TABLE `pairingqk`  (
  `idpairingQK` int(11) NOT NULL AUTO_INCREMENT,
  `idqna` int(11) NOT NULL,
  `idkeyword` int(11) NOT NULL,
  PRIMARY KEY (`idpairingQK`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pairingqk
-- ----------------------------
INSERT INTO `pairingqk` VALUES (1, 1, 1);
INSERT INTO `pairingqk` VALUES (2, 1, 4);
INSERT INTO `pairingqk` VALUES (3, 3, 2);
INSERT INTO `pairingqk` VALUES (4, 3, 1);

-- ----------------------------
-- Table structure for qna
-- ----------------------------
DROP TABLE IF EXISTS `qna`;
CREATE TABLE `qna`  (
  `idqna` int(11) NOT NULL AUTO_INCREMENT,
  `question` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmenID` int(11) NULL DEFAULT NULL,
  `authorID` int(11) NULL DEFAULT NULL,
  `questionScore` decimal(5, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`idqna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qna
-- ----------------------------
INSERT INTO `qna` VALUES (1, 'What are the symptoms of a brain tumor?', 'Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.', NULL, NULL, NULL);
INSERT INTO `qna` VALUES (2, 'What do I do if I think I have a brain tumour?', 'It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour.', NULL, NULL, 1);
INSERT INTO `qna` VALUES (3, 'What do I do if I think my child has a brain tumour?', 'It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages, or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms, or find more information on our HeadSmart campaign.', NULL, NULL, NULL);
INSERT INTO `qna` VALUES (4, 'Are your support services free?', 'All of our support services are free of charge. We never expect any money, but we do rely 100% on voluntary donations. You can donate here if you would like to.', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
