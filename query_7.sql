--Знайти оцінки студентів у окремій групі з певного предмета.

select gr.group_name, sub.subject_name, s.student_name, g.grade_date , g.grade 
from grades g 
join students s on g.student_id = s.id 
join "groups" gr on s.group_id = gr.id 
join subjects sub on g.subject_id = sub.id 
where gr.group_name = 'First group'
and sub.subject_name = 'факультет - Марокко знавства'
order by g.grade_date;