-- Середній бал, який певний викладач ставить певному студентові.

select t.teacher_name, s.student_name, round(avg(g.grade)) as avg_grade
from grades g 
join subjects sub on sub.id = g.subject_id 
join teachers t on t.id = sub.teacher_id 
join students s on s.id = g.student_id 
group by t.teacher_name, s.student_name
order by 1, 3 desc;