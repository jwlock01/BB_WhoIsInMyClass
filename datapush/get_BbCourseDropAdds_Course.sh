#!/bin/sh


pw="remoteserverpw_forcoursefile"

sqlfile=/var/www/html/course_dropadds/datapush/get_CourseAdds_Courses.sql
#psqlscript=/var/www/html/course_dropadds/datapush/psql.sh
#outputfile=course_BbCourseSize.txt

# Gte the course file from the Integration server using scp
datadir=/var/www/html/course_dropadds/datapush/
cd $datadir

sshpass -p "$pw" scp  remoteuser@remoteserver:/opt/blackboard/newSnapshotData/bb_course.dat /var/www/html/course_dropadds/datapush/



