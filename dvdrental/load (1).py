import duckdb

def run_load(df_payment, df_customer, df_film, df_city, df_country, df_store):
    print("Loading into DuckDB...")

    db_path = "C:/Users/rickm/.vscode/DEMO/demo/dvdrental.duckdb"
    with duckdb.connect(db_path) as con:
        con.register("df_payment", df_payment)
        con.execute("CREATE OR REPLACE TABLE payment AS SELECT * FROM df_payment")

        con.register("df_customer", df_customer)
        con.execute("CREATE OR REPLACE TABLE customer AS SELECT * FROM df_customer")

        con.register("df_city", df_city)
        con.execute("CREATE OR REPLACE TABLE film AS SELECT * FROM df_film")

        con.register("df_country", df_country)
        con.execute("CREATE OR REPLACE TABLE film AS SELECT * FROM df_film")
    
        con.register("df_store", df_store)
        con.execute("CREATE OR REPLACE TABLE film AS SELECT * FROM df_film")

    print("✅ Data loaded into DuckDB.")
