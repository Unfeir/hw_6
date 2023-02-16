--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

select s.*, sum(g.grade) as sum_grade
from students s 
join grades g on s.id = g.student_id 
group by s.id 
order by sum(g.grade) desc 
limit 5;