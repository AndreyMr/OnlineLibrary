CREATE SCHEMA `library` ;
USE library;
DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fio` varchar(300) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parent_idx` (`parent`),
  CONSTRAINT `fk_parent` FOREIGN KEY (`parent`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;


--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` longblob NOT NULL,
  `page_count` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `genre_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `publish_year` int(11) NOT NULL,
  `publisher_id` bigint(20) NOT NULL,
  `image` longblob,
  `descr` varchar(5000) DEFAULT NULL,
  `rating` int(5) DEFAULT '0',
  `vote_count` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `isbn_UNIQUE` (`isbn`),
  KEY `fk_author_idx` (`author_id`),
  KEY `fk_genre_idx` (`genre_id`),
  KEY `fk_publiher_idx` (`publisher_id`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` int(5) DEFAULT '0',
  `book_id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_book_id_idx` (`book_id`),
  KEY `fk_user_id_idx` (`username`),
  CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




