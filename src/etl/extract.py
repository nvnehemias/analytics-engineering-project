from pathlib import Path 
import pandas as pd 

def load_csv_files(data_folder = "data"):
    data = {}

    csv_files = Path(data_folder).glob("*.csv")

    for file in csv_files:
        table_name = file.stem.replace("olist_", "").replace("_dataset", "")
        data[table_name] = pd.read_csv(file)

    return data