--Знайти середній бал, який ставить певний викладач зі своїх предметів.

select t.teacher_name, sub.subject_name, round(avg(g.grade), 2) as avg_grade 
from grades g 
join subjects sub on g.subject_id = sub.id 
join teachers t on sub.teacher_id = t.id 
group by t.teacher_name, sub.subject_name
order by 1;