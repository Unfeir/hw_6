--Знайти список курсів, які відвідує студент.

select distinct s.student_name , sub.subject_name 
from students s 
join grades g on s.id = g.student_id 
join subjects sub on sub.id = g.subject_id 
order by 1, 2;

select t.student_name,  STRING_AGG('"' || t.subject_name || '"', ', ') as sub_list
from(
	select distinct s.student_name, sub.subject_name 
	from students s 
	join grades g on s.id = g.student_id 
	join subjects sub on sub.id = g.subject_id 
	order by 1
	) t
group by t.student_name;