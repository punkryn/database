-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: gunpladb
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `armament`
--

DROP TABLE IF EXISTS `armament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armament`
--

LOCK TABLES `armament` WRITE;
/*!40000 ALTER TABLE `armament` DISABLE KEYS */;
/*!40000 ALTER TABLE `armament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boarding`
--

DROP TABLE IF EXISTS `boarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boarding` (
  `mechanic_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL,
  PRIMARY KEY (`mechanic_id`,`pilot_id`),
  KEY `pilot_id` (`pilot_id`),
  CONSTRAINT `boarding_ibfk_1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boarding_ibfk_2` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boarding`
--

LOCK TABLES `boarding` WRITE;
/*!40000 ALTER TABLE `boarding` DISABLE KEYS */;
/*!40000 ALTER TABLE `boarding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `mechanic_id` int(11) NOT NULL,
  `armaments_id` int(11) NOT NULL,
  PRIMARY KEY (`mechanic_id`,`armaments_id`),
  KEY `armaments_id` (`armaments_id`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`armaments_id`) REFERENCES `armament` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gunpla`
--

DROP TABLE IF EXISTS `gunpla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gunpla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mechanic_id` int(11) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `boxart` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mechanic_id` (`mechanic_id`),
  CONSTRAINT `gunpla_ibfk_1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gunpla`
--

LOCK TABLES `gunpla` WRITE;
/*!40000 ALTER TABLE `gunpla` DISABLE KEYS */;
INSERT INTO `gunpla` VALUES (1,1,'MG','2005-03-01',3200,'RX-78-2 Gundam ver. O.Y.W 0079 (PS2 soft)','http://ipsumimage.appspot.com/200x150,dfdfdf?s=24&l=RX-78-2%20Gundam%7Cver.%20O.Y.W%200079%7C(PS2%20soft)'),(2,2,'SD','2001-11-01',500,'Gun Cannon','http://ipsumimage.appspot.com/200x150,ffff3f?s=24&l=Gun%20Cannon'),(3,3,'SD','2001-08-01',500,'Gun Tank','http://ipsumimage.appspot.com/200x150,ffff72?s=24&l=Gun%20Tank'),(4,4,'SD','2001-04-01',700,'GM','http://ipsumimage.appspot.com/200x150,ffffd7?s=24&l=GM'),(5,5,'MG','2002-09-01',3000,'MS-06F2Zaku II F2 : EFSF 연방군형','http://ipsumimage.appspot.com/200x150,3fef3f?s=24&l=%7CMS-06F2%7CZaku%20II%20F2%7CEFSF%20%EC%97%B0%EB%B0%A9%EA%B5%B0%ED%98%95'),(6,6,'RG','2010-11-01',2500,'MS-06S Char\'s Zaku II','http://ipsumimage.appspot.com/200x150,7f7fff?s=24&l=MS-06S%7CChar%27s%20Zaku%20II'),(7,7,'HGUC','2006-01-01',1700,'MS-09/MS-09R Dom/Rick-Dom','http://ipsumimage.appspot.com/200x150,9f7fd2?s=24&l=MS-09%7CMS-09R%20Dom%7CRick-Dom'),(8,8,'MG','1999-10-01',4000,'MS-09R Rick-Dom','http://ipsumimage.appspot.com/200x150,ff7fd2?s=24&l=MS-09R%7CRick-Dom'),(9,9,'HGUC','2003-08-01',1200,'MSM-07E Z\'gok Experiment','http://ipsumimage.appspot.com/200x150,6f7fff?s=24&l=MSM-07E%7CZ%27gok%20Experiment'),(10,10,'SEED HG','2004-04-01',1200,'ZGMF-515 Mobile Cgue','http://ipsumimage.appspot.com/200x150,afafaf?s=24&l=ZGMF-515%7CMobile%20Cgue'),(11,11,'SEED 1/100','2005-03-01',2300,'ZGMF-1000/A1 Gunner Zaku Warrior - 루나마리아 전용','http://ipsumimage.appspot.com/200x150,ff4f4f?s=24&l=ZGMF-1000/A1%7CGunner%20Zaku%7CWarrior%7C%EB%A3%A8%EB%82%98%EB%A7%88%EB%A6%AC%EC%95%84%7C%EC%A0%84%EC%9A%A9'),(12,12,'MG','2003-08-01',2800,'RX-78-5 Gundam 5호기','http://ipsumimage.appspot.com/200x150,ffff4f?s=24&l=RX-78-5%7CGundam%205%ED%98%B8%EA%B8%B0'),(13,13,'MG','2005-10-01',4000,'RX-178 Gundam Mk-II v2.0','http://ipsumimage.appspot.com/200x150,8f8fff?s=24&l=RX-178%7CGundam%20Mk-II%7Cv2.0'),(14,14,'HGUC','2007-03-01',1600,'MS-14A/C Gelgoog/Gelgoog Cannon','http://ipsumimage.appspot.com/200x150,8f8f2f?s=24&l=MS-14A/C%7CGelgoog/%7CGelgoog%20Cannon'),(15,15,'HGUC','2004-04-01',1200,'MS-14JGGelgoog J','http://ipsumimage.appspot.com/200x150,ff8f2f?s=24&l=MS-14JG%7CGelgoog%20J'),(16,16,'SD','2000-02-01',500,'Gogg/Acguy/Zock','http://ipsumimage.appspot.com/200x150,8f7fff?s=24&l=Gogg%7CAcguy%7CZock'),(17,17,'MG','2006-02-01',2800,'MSA-003 Nemo','http://ipsumimage.appspot.com/200x150,7fff8f?s=24&l=MSA-003%20Nemo'),(18,18,'SD','2000-08-01',500,'Nu Gundam','http://ipsumimage.appspot.com/200x150,ffffaf?s=24&l=Nu%20Gundam'),(19,19,'SEED 1/100','2006-06-01',2600,'ZGMF-X666S Legend Gundam','http://ipsumimage.appspot.com/200x150,dfdfef?s=24&l=ZGMF-X666S%7CLegend%20Gundam'),(20,20,'HGUC','2002-08-01',1200,'RMS-099 Rick Dias - 샤아전용','http://ipsumimage.appspot.com/200x150,df2f3f?s=24&l=RMS-099%7CRick%20Dias%20%EC%83%A4%EC%95%84%EC%A0%84%EC%9A%A9'),(21,21,'HGUC','2005-01-01',1400,'RMS-108 Marasai','http://ipsumimage.appspot.com/200x150,ff5f5f?s=24&l=RMS-108%7CMarasai'),(22,22,'SEED HG','2006-08-01',1600,'GAT-X103AP Verde Buster Gundam','http://ipsumimage.appspot.com/200x150,7fffaf?s=24&l=GAT-X103AP%7CVerde%20Buster%7CGundam'),(23,23,'SEED 1/100','2005-06-01',2600,'ZGMF-1001/M Blaze Zaku Phantom - 하이네 전용기','http://ipsumimage.appspot.com/200x150,dfdf3f?s=24&l=%7CZGMF-1001/M%7CBlaze%20Zaku%7CPhantom%7C%ED%95%98%EC%9D%B4%EB%84%A4%20%EC%A0%84%EC%9A%A9%EA%B8%B0'),(24,24,'SD','2003-02-01',500,'Strike Gundam','http://ipsumimage.appspot.com/200x150,dfdfdf?s=24&l=Strike%20Gundam'),(25,25,'SD','2003-04-01',500,'Gundam Astray - Red Frame','http://ipsumimage.appspot.com/200x150,df6f4f?s=24&l=Gundam%20Astray%7CRed%20Frame'),(26,26,'SD','2004-11-01',500,'Gundam NT-1','http://ipsumimage.appspot.com/200x150,4f4fdf?s=24&l=Gundam%20NT-1'),(27,27,'HGUC','2006-06-01',1400,'EMS-10 Zudah','http://ipsumimage.appspot.com/200x150,bfbfef?s=24&l=EMS-10%7CZudah'),(28,28,'MG','2001-01-01',4000,'MS-18E Kämpfer','http://ipsumimage.appspot.com/200x150,3f3fef?s=24&l=EMS-18E%7CK%C3%A4mpfer'),(29,29,'HGUC','2006-08-01',1200,'RGM-79 Powered GM','http://ipsumimage.appspot.com/200x150,ff8f4f?s=24&l=RGM-79%7CPowered%20GM'),(30,30,'SD','2003-11-01',500,'Freedom Gundam','http://ipsumimage.appspot.com/200x150,dfdfff?s=24&l=Freedom%20Gundam'),(31,1,'SD','1999-10-01',500,'RX-78 Gundam','http://ipsumimage.appspot.com/200x150,dfdfdf?s=24&l=RX-78%7CGundam'),(32,5,'HGUC','2003-09-01',1000,'MS-06 Zaku II - 양산형','http://ipsumimage.appspot.com/200x150,3fef3f?s=24&l=%7CMS-06%7CZaku%20II%7C%EC%96%91%EC%82%B0%ED%98%95g'),(33,5,'SD','2001-07-01',500,'MS-06F Zaku II','http://ipsumimage.appspot.com/200x150,2fff2f?s=24&l=MS-06F%7CZaku%20II'),(34,6,'SD','2002-03-01',500,'MS-06S Zaku II 샤아전용','http://ipsumimage.appspot.com/200x150,ff2f2f?s=24&l=%7CMS-06S%7CZaku%20II%7C%EC%83%A4%EC%95%84%EC%A0%84%EC%9A%A9'),(35,7,'SD','2000-05-01',400,'Dom','http://ipsumimage.appspot.com/200x150,3f3f3f?s=24&l=Dom'),(36,11,'SD','2005-07-01',600,'Gunner Zaku Warrior','http://ipsumimage.appspot.com/200x150,ff3f3f?s=24&l=Gunner%20Zaku%7CWarrior'),(37,13,'SD','2001-06-01',500,'Gundam Mk-II Titans','http://ipsumimage.appspot.com/200x150,3f3fff?s=24&l=Gundam%20Mk-II%7CTitans'),(38,18,'HGUC','2008-03-01',2500,'RX-93 υ Gundam','http://ipsumimage.appspot.com/200x150,dfdf33?s=24&l=RX-93%7C%CF%85%20Gundam'),(39,22,'SD','2007-04-01',600,'Verde Buster Gundam','http://ipsumimage.appspot.com/200x150,7fff6f?s=24&l=Verde%20Buster%7CGundam'),(40,23,'SD','2007-07-01',600,'Blaze Zaku Phantom (Heine Custom)','http://ipsumimage.appspot.com/200x150,ffff2f?s=24&l=Blaze%20Zaku%7CPhantom%7C(Heine%20Custom)'),(41,25,'SEED HG','2003-11-01',1200,'MBF-P02 Gundam Astray Red Frame','http://ipsumimage.appspot.com/200x150,ff4f2f?s=24&l=MBF-P02%7CGundam%20Astray%7CRed%20Frame');
/*!40000 ALTER TABLE `gunpla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gunpla_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `gunpla_id` (`gunpla_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`gunpla_id`) REFERENCES `gunpla` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'gundam.png','세로로 긴 이미지'),(2,31,'건담.jpg','귀여운 SD'),(3,1,'건담mg.jpg','파스텔 톤 좋아'),(4,1,'건담mg2.jpg','옆 모습도 멋지군'),(5,1,'건담mg3.jpg','멋있는 MG'),(6,1,'건담mg4.jpg','mg3 파일을 세로로 길게 crop'),(7,2,'건캐논.jpg','SD의 위용'),(8,2,'건캐논2.jpg','앙증맞은 SD'),(9,3,'건탱크.jpg','SD에 투명 파츠까지'),(10,3,'건탱크2.jpg','SD 위화감이 없어'),(11,4,'짐mini.jpg','어 이거 SD 아닌데'),(12,5,'자쿠IImg.jpg','육중한 위압감'),(13,5,'자쿠IImg2.jpg','구 버전이라도 멋지다'),(14,5,'자쿠IImg3.jpg','역시 모노아이'),(15,32,'자쿠II.jpg','HGUC 자쿠II'),(16,33,'자쿠IIsd.jpg','SD지만 육중함은 그대로'),(17,6,'자쿠II샤아전용.jpg','3배 빠른 자쿠'),(18,34,'자쿠II샤아전용sd.jpg','귀엽고 3배 빠른 자쿠'),(19,7,'돔.jpg','튼튼한 돔'),(20,35,'릭돔sd.jpg','이거 릭돔이 아니고 돔이었구나'),(21,8,'릭돔.jpg','릭돔은 볼륨감이 좋아서 전체 샷이 멋진데'),(22,9,'즈고크E.jpg','카리스마 짱'),(23,9,'즈고크E.jpg','숨겨진 보물같은 킷'),(24,10,'모빌씨그.jpg','전설의 야수와 같은 모습'),(25,11,'건너자쿠워리어.jpg','독일군 헬멧'),(26,36,'건너자쿠워리어sd.jpg','SD가 더 근엄한 듯'),(27,36,'건너자쿠워리어sd2.jpg','SD지만 전투력이 높을 듯'),(28,36,'건너자쿠워리어sd3.jpg','의기 양양'),(29,12,'건담5호기.jpg','알록달록 이쁘다'),(30,12,'건담5호기2.jpg','기대하지 않았는데 만족도가 높았던 킷'),(31,12,'건담5호기3.jpg','얼굴도 알록달록'),(32,12,'건담5호기4.jpg','너무 멋져~'),(33,13,'건담Mk-II에우고.jpg','강렬한 눈빛'),(34,13,'건담Mk-II에우고2.jpg','헤드폰 착용샷'),(35,37,'건담Mk-II티탄즈.jpg','SD에서 박력이 느껴져'),(36,37,'건담Mk-II티탄즈2.jpg','흔치 않은 컬러'),(37,37,'건담Mk-II티탄즈미니.jpg','이건 SD 아닌데'),(38,14,'겔구그.jpg','멧돼지'),(39,15,'겔구그예거.jpg','울퉁불퉁 멋진 킷'),(40,15,'겔구그예거2.jpg','전투력 높을 것 같아'),(41,16,'고그.jpg','해산물 3종 세트 중 하나. 너무 귀여워'),(42,17,'네모.jpg','만족도 엄청 높았던 킷. 또 하나의 숨겨진 보물'),(43,18,'뉴건담sd.jpg','인기 높은 뉴건담. 뉴건담이야 누 건담이야'),(44,18,'뉴건담sd2.jpg','체구에 비해 큰 백팩'),(45,38,'뉴건담.jpg','먹선을 너무 흐리게 넣었나'),(46,19,'레전드건담.jpg','무등급이지만 박력있는 백팩'),(47,20,'릭디아스샤아전용.jpg','사진빨 안받네'),(48,21,'마라사이.jpg','이 킷도 좋았음'),(49,22,'베르데버스터건담.jpg','그저 그런'),(50,39,'베르데버스터건담sd.jpg','SD가 HGUC보다 박력있다'),(51,23,'블레이즈자쿠팬텀.jpg','무등급이지만 좋다'),(52,40,'블레이즈자쿠팬텀sd.jpg','먹선 안 넣어도 멋져'),(53,40,'블레이즈자쿠팬텀sd2.jpg','쌍도끼. 어쎄신 크리드 발할라 찍냐'),(54,24,'스트라이크건담.jpg','스트라이크 건담은 모든 등급이 다 잘 뽑힌듯'),(55,24,'스트라이크건담2.jpg','너무 가까워'),(56,24,'스트라이크건담3.jpg','SD치고는 롱다리'),(57,25,'아스트레이레드sd.jpg','SD 얼굴 귀여워'),(58,41,'아스트레이레드.jpg','독특한 근육 몸매. 가동률 좋음'),(59,26,'알렉스.jpg','주머니 속의 전쟁 주인공 기체'),(60,26,'알렉스2.jpg','개틀링 건도 장착 가능'),(61,27,'주다.jpg','개성 만점. 강추'),(62,28,'캠퍼.jpg','건담이 아닌 다른 애니메이션에 등장할 법한 특이한 외형이지만 좋다. 버니어 색분할 압권'),(63,29,'파워드짐.jpg','폭죽이라 놀리지 마라'),(64,29,'파워드짐2.jpg','심플한 매력'),(65,30,'프리덤건담.jpg','인기 많은 기체'),(66,30,'프리덤건담2.jpg','MG의 화려함을 따라가기엔 부족'),(67,30,'프리덤건담3.jpg','인기 많은 기체 답게 뭐가 많이 달려있다');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mechanic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `model` varchar(100) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `armor` varchar(255) DEFAULT NULL,
  `height` decimal(7,2) DEFAULT NULL,
  `weight` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (1,'건담','RX-78-2','Earth Federation','Luna Titanium',18.00,43.40),(2,'건캐논','RX-77-2','Earth Federation','Luna Titanium',17.50,51.00),(3,'건탱크','RX-75','Earth Federation','Luna Titanium',15.00,56.00),(4,'짐','RGM-79','Earth Federation Forces','Titanium Alloy',18.00,41.20),(5,'자쿠 II','MS-06F','Zeonic Company','Super Hard Steel Alloy',17.50,58.10),(6,'샤아 전용 자쿠 II','MS-06S','Zeonic Company','Super Hard Steel Alloy',17.50,56.50),(7,'돔','MS-09B','Zimmad Company','Super Hard Steel Alloy',18.60,62.60),(8,'릭 돔','MS-09R','Zimmad Company','Super Hard Steel Alloy',18.60,43.80),(9,'즈고크 E','MSM-07E','MIP Company','Titanium Alloy Ceramic Composite',18.40,69.50),(10,'씨그','ZGMF-515','Zodiac Alliance of Freedom Treaty',NULL,21.43,80.22),(11,'거너 자쿠 워리어','ZGMF-1000/A1','Integrated Design Bureau',NULL,20.50,91.11),(12,'건담 5호기','RX-78-5','Earth Federation','Luna Titanium',18.00,42.90),(13,'건담 Mk-II','RX-178','Titans','Titanium Alloy Ceramic Composite',18.50,33.40),(14,'겔구그','MS-14A/C','Zeonic Company','Super Hard Steel Alloy',19.20,42.10),(15,'겔구그 예거','MS-14Jg','Zeonic Company','Titanium Alloy Ceramic Composite',19.20,40.50),(16,'고그','MSM-03','Zimmad Company','Super High Tensile Steel',18.30,82.40),(17,'네모','MSA-003','Anaheim Electronics','Gundarium α Alloy',18.50,36.20),(18,'뉴건담','RX-93','Anaheim Electronics','Gundarium α Alloy',18.50,36.20),(19,'레전드 건담','ZGMF-X666S','Zodiac Alliance of Freedom Treaty','Variable Phase Shift armor',18.66,86.02),(20,'릭디아스','RMS-099','Anaheim Electronics','Gundarium γ Alloy',18.00,32.20),(21,'마라사이','RMS-108','Anaheim Electronics','Gundarium Alloy',17.50,33.10),(22,'베르데 버스터 건담','GAT-X103AP','Actaeon Industries','Variable Phase Shift Armor',18.46,99.36),(23,'블레이즈 자쿠 팬텀','ZGMF-1001/M','Integrated Design Bureau',NULL,20.40,91.20),(24,'스트라이크 건담','GAT-X105','Earth Alliance','Phase Shift Armor',17.72,64.80),(25,'건담 아스트레이 레드 프레임','MBF-P02','Morgenroete, Inc.','Foaming metal',17.53,49.80),(26,'알렉스','RX-78NT-1','Earth Federation','Luna Titanium',18.00,40.00),(27,'주다','EMS-10','Zimmad Company','Hardened Steel',17.30,61.00),(28,'캠퍼','MS-18E','Zeonic Company','Titanium Alloy Ceramic Composite',17.70,43.50),(29,'파워드 짐','RGM-79','Earth Federation','Titanium Ceramic Composite',18.00,46.60),(30,'프리덤 건담','ZGMF-X10A','Integrated Design Bureau','Phase Shift Armor',18.03,71.50);
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `image` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-17  3:29:29
