import psycopg2 as pg_driver
import psycopg2.pool as pool

pg_pool = pool.SimpleConnectionPool(1, 4, user="postgres", host="localhost")
# Инкапсулирует обращения к БД
class Researcher:
    def __init__(self, id, university_id):
        self.id = id
        self.university_id = university_id

    def getUniversity(self, db):
        cur = db.cursor()
        cur.execute('''
        SELECT university_name FROM University WHERE university_id={0}
        '''.format(self.university_id))
        return cur.fetchone()[0]

researchers = []
### Шаг 1: получаем из базы всех исследователей
db = pg_pool.getconn()
cur = db.cursor()
cur.execute("SELECT researcher_id, university_id FROM Researcher")

### Шаг 2: создаем объекты доступа к данным
for r in cur.fetchall():
    researchers.append(Researcher(r[0], r[1]))

### Шаг 3: печатаем университет, в котором работает каждый исследователь
for r in researchers:
    print(r.getUniversity(db))

pg_pool.closeall()
cur.close()
