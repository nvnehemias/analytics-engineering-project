import pandas as pd 
from sqlalchemy import text 
import sys
from src.utils.database import engine 

def profile_tables(table_name):
    
    df = pd.read_sql(f"select * from {table_name}", engine)

    print("=" * 60)
    print(f"Table: {table_name}")
    print(f"Rows: {len(df):,}")
    print(f"Columns: {len(df.columns):,}")
    print("\nData Types:")
    print(df.dtypes)
    print("\nMissing Values:")
    print(df.isnull().sum())



if __name__ == "__main__":
    # Uses the argument passed in terminal, or defaults to 'olist_customers_dataset'
    table = sys.argv[1] if len(sys.argv) > 1 else "olist_customers_dataset"
    profile_tables(table)