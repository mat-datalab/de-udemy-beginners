-- Przykładowe zapytanie
SELECT
  id,
  UPPER(name) AS name_upper,
  value * 2 AS value_times_two
FROM example_table
WHERE value IS NOT NULL;
