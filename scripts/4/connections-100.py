import psycopg2 as pg_driver

# Инкапсулирует обращения к БД
class Researcher:
    def __init__(self, id, university_id):
        self.db = pg_driver.connect(user="postgres", host="localhost")
        self.id = id
        self.university_id = university_id

    def getUniversity(self):
        cur = self.db.cursor()
        cur.execute('''
SELECT name FROM University WHERE university_id={0}
'''.format(self.university_id))
        return cur.fetchone()[0]

researchers = []
### Шаг 1: получаем из базы всех исследователей
cur = pg_driver.connect(user="postgres", password="1212", host="localhost").cursor()
cur.execute("SELECT researcher_id, university_id FROM Researcher")

### Шаг 2: создаем объекты доступа к данным
for r in cur.fetchall():
    researchers.append(Researcher(r[0], r[1]))

### Шаг 3: печатаем университет, в котором работает каждый исследователь
for r in researchers:
    print(r.getUniversity())
