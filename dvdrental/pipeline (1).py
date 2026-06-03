from extract import run_extract
from load import run_load
from dbt.cli.main import dbtRunner, dbtRunnerResult
import os

def run_dbt():
    print("🏗️  Running dbt transformations...")

    # Your dbt project is in the same folder as this script
    project_path = os.path.abspath(".")

    # Default dbt profile path (~/.dbt/profiles.yml)
    profiles_path = os.path.expanduser("~/.dbt")

    dbt = dbtRunner()
    result: dbtRunnerResult = dbt.invoke([
        "run",
        "--project-dir", project_path,
        "--profiles-dir", profiles_path
    ])

    if result.success:
        print("✅ dbt run successful.")
    else:
        print("❌ dbt run failed. Printing stderr:")
        print(result.exception)
        raise RuntimeError("❌ dbt run failed.")

def main():
    print("🚀 Starting ETL pipeline...")

    df_payment, df_customer, df_film, df_country, df_city, df_store = run_extract()
    run_load(df_payment, df_customer, df_film, df_store, df_country, df_city)
    run_dbt()

    print("🏁 Pipeline complete.")

if __name__ == "__main__":
    main()