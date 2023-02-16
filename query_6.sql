--Знайти список студентів у певній групі.

select g.group_name, s.student_name  
from students s 
join groups g on g.id = s.group_id 
order by 1, 2;