import cx_Oracle
import pandas as pd
from datetime import datetime
import os

# 1. Oracle Connection details
dsn = cx_Oracle.makedsn("localhost", 1521, service_name="xe")  
conn = cx_Oracle.connect(user="HR", password="hr", dsn=dsn)

# 2. Query the OLTP view
query = "SELECT * FROM RETAIL_SALES_VW"
df = pd.read_sql(query, con=conn)

# 3. Generate filename with timestamp
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
filename = f"retail_sales_export_{timestamp}.csv"

# 4. Define custom output path
output_dir = r"C:\Users\Muthulingam\OneDrive\Documents\07092025_Demo\03_Excel_Extract"   
os.makedirs(output_dir, exist_ok=True)  # create folder if not exists
filepath = os.path.join(output_dir, filename)

# 5. Save to CSV
df.to_csv(filepath, index=False)

# 6. Close connection
conn.close()

print(f"Data extracted successfully to {filepath}")
