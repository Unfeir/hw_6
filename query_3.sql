--Знайти середній бал у групах з певного предмета.

select gr.group_name, sub.subject_name, round(avg(g.grade), 2) as avg_grade 
from grades g 
join students s on g.student_id = s.id 
join subjects sub on g.subject_id = sub.id 
join groups gr on s.group_id = gr.id 
group by gr.group_name, sub.subject_name
order by 1,2;