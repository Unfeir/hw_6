--Знайти середній бал на потоці (по всій таблиці оцінок).

select round(avg(grade), 2) as avg_grade
from grades g;