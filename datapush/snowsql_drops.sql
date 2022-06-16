/* TERM MEMBER DROPS */
select
distinct
 lpc.course_role,
 concat(lp.first_name,' ', lp.last_name) as User,
 lp.stage:user_id::string as Bb_user,
 'D' AS status,
 lc.COURSE_NUMBER as Course_Number,
 TO_DATE(lpc.row_inserted_time) as course_added_date
from cdm_lms.person lp
inner join cdm_lms.person_course lpc
 on lpc.person_id = lp.id
inner join cdm_lms.course lc
 on lc.id = lpc.course_id
left join (
 select
 person_course_id
 from cdm_lms.course_activity
 group by person_course_id
 ) lca
 on lca.person_course_id = lpc.id
where
  lpc.COURSE_ROLE_SOURCE_CODE in ('S') --Profesor & Student
  and (User not like '%PreviewUser')
  and (BB_USER not like '%_s')
  and (User not like 'Instructor TBA')
  and (BB_USER not like 'sys_%')
  and lpc.ENABLED_IND=0 /* comment out for adds */
  and ((lc.course_number LIKE '%4228%')
    OR (lc.course_number LIKE '%4222%')
    OR (lc.course_number LIKE '%4225%'))
ORDER BY lc.course_number DESC 
