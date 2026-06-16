import duckdb
import pandas

# verbinding met de data base
con = duckdb.connect("C:/Users/stijn/OneDrive/Documenten/GitHub\DataEngineering_M_S/dvdrental/dvdrental.duckdb")
# Sql query
query = """ SELECT * FROM  payment"""


df = con.execute(query).fetchdf()
con.close()
print(df)

payment_id = duckdb.sql(query).df()
