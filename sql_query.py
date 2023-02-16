from psycopg2 import connect, DatabaseError, Error
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

def execute_query(sql: str) -> list:
    with connection() as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()

if __name__ == '__main__':
    with connection() as conn:
        if conn is not None:
            c = conn.cursor()
            with open('query_add_2.sql', 'r') as sql:
                query = sql.read()
                # print(query)
            print(execute_query(query))