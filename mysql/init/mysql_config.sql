CREATE USER 'server_1'@'%' identified by '1111';
CREATE USER 'server_2'@'%' identified by '2222';
CREATE DATABASE AliasApp;
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES ON AliasApp.* TO 'server_1'@'%' WITH GRANT OPTION;
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES ON AliasApp.* TO 'server_2'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE AliasApp;

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(40) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `num_of_wins` int DEFAULT '0',
  `num_of_losses` int DEFAULT '0',
  `points` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'AAA','','',3,0,0),(2,'BBB','','',4,1,0),(3,'CCC','','',2,0,0),(4,'DDD','','',5,0,0),(102,'ivan','','pass1',13,3,0),(103,'vlad','','pass2',12,2,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `word` varchar(30) NOT NULL,
  `stem` varchar(30) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`word`),
  CONSTRAINT `level_constraint` CHECK ((`level` in (1,2,3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES ('acsension','ascen',3),('ajar','jar',3),('antiseptic','sept',3),('arcane','arcan',3),('area','area',1),('book','book',1),('brandish','brand',3),('competition','compet',2),('conduit','cond',3),('country','countr',1),('definition','defin',2),('defunct','func',3),('disease','dis',2),('extortion','extort',3),('family','fam',1),('instance','inst',2),('investment','invest',2),('knowledge','know',2),('management','manag',2),('money','money',1),('nefarious','nefar',3),('paradigm','paradigm',3),('performance','form',2),('problem','problem',1),('seat','seat',1),('security','secur',2),('student','stud',1),('university','uni',2),('value','value',1),('world','world',1);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 13:35:28
