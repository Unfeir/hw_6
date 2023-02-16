--Список курсів, які певному студенту читає певний викладач.

select t.teacher_name, s.student_name, sub.subject_name 
from students s 
join grades g on g.student_id = s.id 
join subjects sub on sub.id = g.subject_id 
left join teachers t on t.id = sub.teacher_id 
group by t.teacher_name, s.student_name, sub.subject_name 
order by 1,2,3;