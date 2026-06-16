import duckdb

def run_load(df_payment, df_customer, df_address, df_city, df_country, df_store, df_staff):
    print("Loading into DuckDB...")

    db_path = "C:/Users/stijn/OneDrive/Documenten/GitHub/DataEngineering_M_S/dvdrental/dvdrental.duckdb"
    with duckdb.connect(db_path) as con:
        con.register("df_payment", df_payment)
        con.execute("CREATE OR REPLACE TABLE payment AS SELECT * FROM df_payment")

        con.register("df_customer", df_customer)
        con.execute("CREATE OR REPLACE TABLE customer AS SELECT * FROM df_customer")

        con.register("df_city", df_city)
        con.execute("CREATE OR REPLACE TABLE city AS SELECT * FROM df_city")

        con.register("df_country", df_country)
        con.execute("CREATE OR REPLACE TABLE country AS SELECT * FROM df_country")
    
        con.register("df_store", df_store)
        con.execute("CREATE OR REPLACE TABLE store AS SELECT * FROM df_store")

        con.register("df_address", df_address)
        con.execute("CREATE OR REPLACE TABLE address AS SELECT * FROM df_address")

        con.register("df_staff", df_staff)
        con.execute("CREATE OR REPLACE TABLE staff AS SELECT * FROM df_address")
    print("✅ Data loaded into DuckDB.")