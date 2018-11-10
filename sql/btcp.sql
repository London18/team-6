-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: btcp
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE=''+00:00'' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chatbot`
--

DROP TABLE IF EXISTS `chatbot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intent` varchar(250) DEFAULT NULL,
  `response` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatbot`
--

LOCK TABLES `chatbot` WRITE;
/*!40000 ALTER TABLE `chatbot` DISABLE KEYS */;
INSERT INTO `chatbot` VALUES (1,''rephrase'',''Could you please rephrase that?''),(2,''unknown'',''Unfortunately I am not able to answer that. Please see our site for FAQs: https://www.thebraintumourcharity.org/frequently-asked-questions/''),(3,''symptoms'',''Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.''),(4,''tumour_info_carer'',''It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/child-brain-tumour-symptoms''),(5,''tumour_info'',''It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour: https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/adult-brain-tumour-symptoms/.''),(6,''bye'',''Thank you for contacting the Brain Tumour Charity. Goodbye!'');
/*!40000 ALTER TABLE `chatbot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `iddepartments` int(11) NOT NULL AUTO_INCREMENT,
  `departmentsname` varchar(45) NOT NULL,
  PRIMARY KEY (`iddepartments`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `question_score` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,''What are the symptoms of a brain tumor?'',''Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.'',''symptoms,brain,tumor'',NULL,NULL,NULL),(2,''What do I do if I think I have a brain tumour?'',''It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour.'',''brain,tumor'',NULL,NULL,1),(3,''What do I do if I think my child has a brain tumour?'',''It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages, or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms, or find more information on our HeadSmart campaign.'',NULL,NULL,NULL,NULL),(4,''Are your support services free?'',''All of our support services are free of charge. We never expect any money, but we do rely 100% on voluntary donations. You can donate here if you would like to.'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-10  4:47:13
