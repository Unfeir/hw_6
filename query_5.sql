--Знайти які курси читає певний викладач.

select t.teacher_name,  STRING_AGG(s.subject_name, ', ')
from subjects s 
join teachers t on s.teacher_id = t.id 
group by t.teacher_name;

