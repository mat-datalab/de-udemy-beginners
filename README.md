# Data Engineering

Repo zawiera moje rozwiązania z kursu "Data Engineering for Beginners: Learn SQL, Python & Spark".


## Struktura
.
├─ sql/
│ ├─ queries/ # pliki .sql (ex1…ex5 itd.)
│ └─ run_sql.py # runner: rejestruje CSV → uruchamia zapytania → zapisuje wyniki
├─ data/
│ ├─ retail_db/ # surowe dane (CSV), śledzone w Git
│ └─ _outputs/sql/ # wyniki (CSV/Parquet/HTML), pomijane w Git
├─ src/ # (na przyszłe skrypty Pythona)
└─ notebooks/ # (na notatniki)


Zadania SQL:
Exercise 1 — Customer order count (2014-01)

Exercise 2 — Dormant customers (2014-01)

Exercise 3 — Revenue per customer (2014-01)

Exercise 4 — Revenue per category (2014-01)

Exercise 5 — Product count per department


Każdy plik SQL zaczyna się od:
-- title: Exercise N - Krótki opis
-- description: co liczymy + zakres dat (np. 2014-01)


Notatki
CSV są w data/retail_db/