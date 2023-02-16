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


