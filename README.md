# Data Engineering — SQL (DuckDB)

Zbiór rozwiązań zadań SQL na danych **retail_db** + lekki runner w Pythonie (DuckDB).
Repo pokazuje: joins, agregacje, filtrowanie po datach, CTE i raportowanie wyników.

---

## 🏁 Szybki start

```bash
python -m venv .venv
# Windows:
.\.venv\Scripts\Activate.ps1
pip install duckdb pandas pyarrow
python sql/run_sql.py --all

.
├─ sql/
│  ├─ queries/         # pliki .sql (Exercise 1–5 i kolejne)
│  └─ run_sql.py       # runner: rejestruje CSV → uruchamia zapytania → zapisuje wyniki
├─ data/
│  ├─ retail_db/       # surowe dane (CSV) – śledzone w Git
│  └─ _outputs/sql/    # wyniki (CSV/Parquet/HTML) – pomijane w Git
├─ src/                # (na przyszłe skrypty Pythona)
└─ notebooks/          # (na notatniki)

✅ Zadania (wycinek)

Exercise 1 – Customer order count (2014-01)

Exercise 2 – Dormant customers (2014-01)

Exercise 3 – Revenue per customer (2014-01)

Exercise 4 – Revenue per category (2014-01)

Exercise 5 – Product count per department

Każdy plik SQL zaczyna się od nagłówka:
-- title: Exercise N - Krótki opis
-- description: co liczymy + zakres dat (np. 2014-01)

ℹ️ Uwagi

Dane demo: data/retail_db/ (małe próbki).

Jeśli pole daty jest tekstowe, w razie potrzeby rzutuj: CAST(order_date AS DATE).

Wyniki i artefakty nie są commitowane (trafiają do data/_outputs/sql/).

🧩 Techniki i narzędzia

SQL: JOIN, GROUP BY, agregacje, CTE, filtrowanie po datach.

Python + DuckDB do uruchamiania kwerend i eksportu wyników.