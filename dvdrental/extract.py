import pandas as pd
import sqlalchemy

def run_extract():
    print("Extracting data from PostgreSQL...")

    engine = sqlalchemy.create_engine("postgresql+psycopg2://postgres:admin@localhost:5432/dvdrental")

    df_payment = pd.read_sql("SELECT * FROM payment;", engine)
    df_customer = pd.read_sql("SELECT * FROM customer;", engine)
    df_address = pd.read_sql("SELECT * FROM address;", engine)
    df_city= pd.read_sql("SELECT * FROM city; ", engine )
    df_country= pd.read_sql("SELECT * FROM country; ", engine )
    df_store= pd.read_sql("SELECT * FROM store;", engine)

    print("✅ Extracted all usefull data.")
    return df_payment, df_customer, df_address, df_city, df_country, df_store
