from psycopg2 import connect, DatabaseError
from contextlib import contextmanager


@contextmanager
def connection():
    conn = None
    try:
        conn = connect(host='localhost', user='postgres', database='postgres', password='qwerty')
        yield conn
    except DatabaseError as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()


t_groups = """CREATE TABLE IF NOT EXISTS groups (
                    id SERIAL PRIMARY KEY,
                    group_name VARCHAR(100)
                    );"""

t_students = """CREATE TABLE IF NOT EXISTS students (
                    id SERIAL PRIMARY KEY,
                    student_name VARCHAR(100),
                    group_id int,
                    FOREIGN KEY (group_id) REFERENCES groups (id)
                    ON DELETE SET NULL
                    ON UPDATE CASCADE
                    );"""

t_teachers = """CREATE TABLE IF NOT EXISTS teachers (
                    id SERIAL PRIMARY KEY,
                    teacher_name VARCHAR(100)
                    );"""

t_subjects = """CREATE TABLE IF NOT EXISTS subjects (
                    id SERIAL PRIMARY KEY,
                    subject_name VARCHAR(100) UNIQUE,
                    teacher_id int NOT NULL,
                    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
                    ON DELETE SET NULL
                    ON UPDATE CASCADE
                    );"""

t_grades = """CREATE TABLE IF NOT EXISTS grades (
                    id SERIAL PRIMARY KEY,
                    student_id int NOT NULL,
                    subject_id int NOT NULL,
                    grade NUMERIC CHECK (grade >= 1 AND grade <= 12),
                    grade_date DATE NOT NULL,
                    FOREIGN KEY (student_id) REFERENCES students (id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE
                    );"""

def create_table(conn, sql):
    try:
        c = conn.cursor()
        c.execute(sql)
        c.close()
        conn.commit()
    except DatabaseError as error:
        print(error)


if __name__ == '__main__':
    with connection() as conn:
        if conn is not None:
            create_table(conn, t_groups)
            create_table(conn, t_students)
            create_table(conn, t_teachers)
            create_table(conn, t_subjects)
            create_table(conn, t_grades)