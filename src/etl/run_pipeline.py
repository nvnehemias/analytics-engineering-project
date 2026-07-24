from src.etl.extract import load_csv_files
from src.utils.database import engine


datasets = load_csv_files()

for table_name,df in datasets.items():
    
    print(f"Loading {table_name} into Postgres..")
    df.to_sql(
        name = table_name,
        con = engine,
        if_exists = "replace",
        index = False
    )

    print(f"Successfully loaded {table_name}!")
    
print("All datasets loaded successfully!")