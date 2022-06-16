--
-- Create the DB - bb_dropadds, then create the tables 
--

--
-- Table structure for table `course_dropadds`
--

CREATE TABLE IF NOT EXISTS `course_dropadds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COURSE_ROLE` text,
  `USER` text,
  `BB_USER` text,
  `STATUS` text,
  `COURSE_NUMBER` text,
  `COURSE_ADDED_DATE` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65535 ;


--
-- Table structure for table `course_lookup`
--

CREATE TABLE IF NOT EXISTS `course_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COURSE_ID` text,
  `EXTERNAL_COURSE_KEY` text,
  `COURSE_NAME` text,
  `DESCRIPTION` text,
  `START_DATE` text,
  `END_DATE` text,
  `AVAILABLE_IND` text,
  `PRIMARY_EXTERNAL_NODE_KEY` text,
  `EXTERNAL_ASSOCIATION_KEY` text,
  `TEMPLATE_COURSE_KEY` text,
  `ALLOW_GUEST_IND` text,
  `DURATION` text,
  `TERM_KEY` text,
  `DATA_SOURCE_KEY` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65536 ;