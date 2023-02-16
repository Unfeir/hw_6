-- Оцінки студентів у певній групі з певного предмета на останньому занятті.

WITH 
max_sub_date AS (
select subject_id, max(grade_date) as max_sub_date  --row_number() OVER(partition by g.grade_date, g.subject_id order by g.grade_date desc)
from grades 
group by subject_id
)

,student_in_lastday as (
select m.*, g.student_id, g.grade 
from max_sub_date m
join grades g on m.subject_id = g.subject_id and m.max_sub_date = g.grade_date 
)



SELECT sub.subject_name, s.student_name, sld.max_sub_date, sld.grade
FROM student_in_lastday sld
join students s on s.id = sld.student_id
join groups g on g.id = s.group_id 
join subjects sub on sub.id = sld.subject_id
order by sld.max_sub_date desc, sub.subject_name, sld.grade desc
;

