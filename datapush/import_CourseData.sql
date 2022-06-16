--
-- housekeeping - use the db, truncate tables
--
use bb_dropadds; 
truncate table course_lookup;
truncate table course_dropadds;

--
-- Load the course file, and do some sanitation due to file contents format
--
LOAD DATA INFILE '/var/www/html/course_dropadds/bb_course.dat'
       INTO TABLE course_lookup FIELDS TERMINATED BY '|'
       lines terminated by '.dat'
              IGNORE 1 LINES (
  COURSE_ID, 
  EXTERNAL_COURSE_KEY, 
  COURSE_NAME ,
  DESCRIPTION ,
  START_DATE ,
  END_DATE ,
  AVAILABLE_IND, 
  PRIMARY_EXTERNAL_NODE_KEY ,
  EXTERNAL_ASSOCIATION_KEY ,
  TEMPLATE_COURSE_KEY ,
  ALLOW_GUEST_IND ,
  DURATION ,
  TERM_KEY ,
  DATA_SOURCE_KEY 
  
);

--
-- course file sanitation
--
UPDATE course_lookup SET COURSE_ID = REPLACE(REPLACE(COURSE_ID, '\r', ''), '\n', '');
UPDATE course_lookup SET start_date =
    DATE_FORMAT(STR_TO_DATE(start_date, '%m/%d/%Y'), '%Y-%m-%d');

--
-- Load the course_adds csv file from resutls from query in snowflake
--
LOAD DATA INFILE '/var/www/html/course_dropadds/datapush/course_adds.csv'
       INTO TABLE course_dropadds FIELDS TERMINATED BY ','       
      OPTIONALLY ENCLOSED BY '"'
      IGNORE 1 LINES (
  COURSE_ROLE,
  USER ,
  BB_USER,
  STATUS ,
  COURSE_NUMBER,
  COURSE_ADDED_DATE 
  );  

--
-- Load the course_drops csv file from resutls from query in snowflake
--
 LOAD DATA INFILE '/var/www/html/course_dropadds/datapush/course_drops.csv'
       INTO TABLE course_dropadds FIELDS TERMINATED BY ','       
     OPTIONALLY ENCLOSED BY '"'  
     IGNORE 1 LINES (
  COURSE_ROLE,
  USER ,
  BB_USER,
  STATUS ,
  COURSE_NUMBER,
  COURSE_ADDED_DATE 
  );        
