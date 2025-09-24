import argparse
from pathlib import Path
from pyspark.sql import SparkSession, functions as F

def ensure_input(path: Path):
    if not path.exists():
        path.parent.mkdir(parents=True, exist_ok=True)
        # create a tiny sample CSV
        sample = "id,name,value\n1,Alice,10\n2,Bob,20\n3,Charlie,\n"
        path.write_text(sample, encoding="utf-8")

def main(input_path: str, output_path: str):
    spark = (
        SparkSession.builder
        .appName("de-course-example")
        .master("local[*]")
        .config("spark.sql.shuffle.partitions", "1")
        .getOrCreate()
    )

    in_path = Path(input_path)
    ensure_input(in_path)

    df = spark.read.option("header", True).csv(str(in_path))
    df = df.withColumn("value", F.col("value").cast("double"))
    # simple transform: fill nulls, add new column
    df_tr = (
        df.fillna({"value": 0.0})
          .withColumn("value_plus_one", F.col("value") + F.lit(1.0))
    )

    out_path = Path(output_path)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    df_tr.write.mode("overwrite").parquet(str(out_path))

    print(f"Wrote parquet to: {out_path}")
    spark.stop()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="Ścieżka do CSV (wejście)")
    parser.add_argument("--output", required=True, help="Ścieżka do parquet (wyjście)")
    args = parser.parse_args()
    main(args.input, args.output)
