# Data Engineering — SQL (DuckDB)

A compact collection of SQL exercises on **retail_db** data, plus a lightweight Python runner powered by DuckDB.  
Focus areas: joins, aggregations, date filtering, CTEs, and exporting results.

---

## 🏁 Quick start

```bash
python -m venv .venv
# Windows:
.\.venv\Scripts\Activate.ps1
pip install duckdb pandas pyarrow
python sql/run_sql.py --all


📂 Repository structure
.
├─ sql/
│  ├─ queries/         # SQL files (Exercise 1–5 and future tasks)
│  └─ run_sql.py       # registers CSVs → executes queries → saves outputs
├─ data/
│  ├─ retail_db/       # sample CSV data (tracked in Git)
│  └─ _outputs/sql/    # results (CSV/Parquet/HTML) — ignored by Git
├─ src/                # placeholder for upcoming Python code
└─ notebooks/          # Jupyter notebooks


✅ Exercises (sample)

Exercise 1 – Customer order count (2014-01)

Exercise 2 – Dormant customers (2014-01)

Exercise 3 – Revenue per customer (2014-01)

Exercise 4 – Revenue per category (2014-01)

Exercise 5 – Product count per department

Each SQL file starts with a short header:
-- title: Exercise N - Short description
-- description: what is computed + date scope (e.g., 2014-01)


ℹ️ Notes

Demo data lives in data/retail_db/ (small, self-contained samples).

If date fields are stored as text, cast when needed (e.g., CAST(order_date AS DATE)).

Outputs and artifacts are not committed (they go to data/_outputs/sql/).


🧩 Tech & concepts

SQL: JOIN, GROUP BY, aggregations, CTEs, date filtering.

Python + DuckDB for running queries and exporting results.