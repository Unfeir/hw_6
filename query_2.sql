--Знайти студента із найвищим середнім балом з певного предмета.

select sub.subject_name, s.student_name, t.AVG_grade
from (
	  select student_id, subject_id, round(avg(grade), 2) as AVG_grade, row_number() over(partition by subject_id order by avg(grade) desc) as RN
	  from grades g 
	  group by student_id, subject_id
	  ) t
join students s on s.id = t.student_id 
join subjects sub on sub.id = t.subject_id 
where t.RN = 1;
