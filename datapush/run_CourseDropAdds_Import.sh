# Get the COURSE FILE from the snapshot Integration server: may be modified to obtain course data from a query 
# if you are storing the course start dates in BB, we use continous dates and is not stored in BB but is included 
# in our course flatfile
sh /var/www/html/course_dropadds/datapush/get_BbCourseDropAdds_Course.sh

# Delete the old files from drop add queries
rm course_adds.csv
rm course_drops.csv


# execute the api call here to get the requested data from snowflake, modify paths and config to point to your snowsql instance 
/home/jwlock01/bin/snowsql --config /home/jwlock01/.snowsql/config  -f "/var/www/html/course_dropadds/datapush/snowsql_adds.sql" -o output_file="/var/www/html/course_dropadds/datapush/course_adds.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv

# execute the api call here to get the requested data from snowflake, modify paths and config to point to your snowsql instance 
/home/jwlock01/bin/snowsql --config /home/jwlock01/.snowsql/config -f "/var/www/html/course_dropadds/datapush/snowsql_drops.sql" -o output_file="/var/www/html/course_dropadds/datapush/course_drops.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv

# change to the appropriate directory here and then call mysql and import the drops, adds, and course files
cd /var/www/html/course_dropadds/datapush/
mysql -uphpuser -p"phpuserpw" -hlocalhost < import_CourseData.sql
