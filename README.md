# Data Engineering for Beginners – Repo z zadaniami

Repozytorium z rozwiązaniami zadań z kursu **"Data Engineering for Beginners: Learn SQL, Python & Spark" (Udemy)**.
Struktura i narzędzia zostały przygotowane tak, aby wygodnie dodawać kolejne zadania (SQL/Python/Spark) oraz utrzymywać porządek.

## Spis treści
- [Wymagania](#wymagania)
- [Szybki start](#szybki-start)
- [Struktura repozytorium](#struktura-repozytorium)
- [Konwencje i dobre praktyki](#konwencje-i-dobre-praktyki)
- [Dodawanie nowych zadań](#dodawanie-nowych-zadań)
- [CI / pre-commit](#ci--pre-commit)
- [Licencja](#licencja)

## Wymagania
- Python 3.10+ (rekomendowane 3.11)
- (Opcjonalnie) Java 8+ dla Spark lokalnie
- Pip + wirtualne środowisko (venv/conda)

## Szybki start
```bash
# 1) Klonuj repo (po utworzeniu go na GitHub/ GitLab)
git clone <URL_TWOJEGO_REPO>
cd <NAZWA_REPO>

# 2) Utwórz i aktywuj środowisko
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

# 3) Zainstaluj zależności
pip install -r requirements.txt

# 4) (Opc.) zainstaluj hooki pre-commit
pre-commit install

# 5) Uruchom przykładowy job Spark (wygeneruje przykładowe dane, jeśli brak)
python src/python/etl/example_spark_job.py --input data/raw/example.csv --output data/processed/example_output.parquet
```

Uruchom Jupyter (opcjonalnie):
```bash
python -m ipykernel install --user --name de-course
jupyter notebook  # lub jupyter lab
```

## Struktura repozytorium
```
.
├── src/
│   └── python/
│       └── etl/
│           └── example_spark_job.py      # przykładowy job Spark (CSV → transform → Parquet)
├── sql/
│   └── queries/
│       └── 01_example.sql                # przykładowe zapytanie SQL
├── notebooks/
│   └── 00_template.ipynb                 # szablon notatnika
├── tests/
│   └── test_example.py                   # przykładowy test
├── data/
│   ├── raw/                              # surowe dane (nie commituj dużych plików)
│   └── processed/                        # dane przetworzone
├── config/
│   └── settings.yaml                     # ustawienia/konfiguracje
├── docs/
│   └── img/
├── .github/workflows/ci.yml              # proste CI: lint + testy
├── .env.example                          # wzór pliku konfiguracyjnego środowiska
├── .gitignore
├── LICENSE
├── Makefile
├── requirements.txt
└── README.md
```

## Konwencje i dobre praktyki
- **Nazewnictwo zadań:** `week01_sql`, `week02_python`, `week03_spark` itd. (foldery lub prefiksy plików).
- **Gałęzie:** `feature/week01-sql`, `feature/week02-python`… → PR → `main`.
- **Commit messages:** [Conventional Commits](https://www.conventionalcommits.org/) np. `feat(sql): add filtering queries`.
- **Jakość kodu:** `black`, `isort`, `flake8` + testy `pytest`.
- **Dane:** Nie commituj dużych plików do Gita. Trzymaj próbki w `data/raw` (małe), resztę poza repo.

## Dodawanie nowych zadań
1. Utwórz gałąź: `git checkout -b feature/weekXX-topic`  
2. Dodaj pliki w odpowiednim miejscu (`sql/queries`, `src/python`, `notebooks`, `data/raw` itp.).  
3. Uruchom formatowanie/linty/testy:
   ```bash
   make format && make lint && make test
   ```
4. Commit + push + PR do `main`.

## CI / pre-commit
- **pre-commit:** automatyczne formatowanie i szybkie sprawdzenia przed commitem.
- **GitHub Actions (ci.yml):** na PR uruchamia się `black --check`, `isort --check-only`, `flake8`, `pytest`.

## Licencja
Kod na licencji MIT (patrz `LICENSE`).

---

> Tip: Ten szablon to punkt startowy—dostosuj pod siebie (nazwa kursu, struktura modułów, narzędzia).
