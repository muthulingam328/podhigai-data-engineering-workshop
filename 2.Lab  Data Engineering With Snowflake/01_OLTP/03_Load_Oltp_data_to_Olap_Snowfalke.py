import snowflake.connector
import glob
import os

# Latest file detection (from extract script output folder)
output_dir = r"C:\Users\Muthulingam\OneDrive\Documents\07092025_Demo\03_Excel_Extract"
latest_file = max(glob.glob(output_dir + "\\*.csv"), key=os.path.getctime)

# Snowflake connection
conn = snowflake.connector.connect(
    user="MUTHULINGAMLEARNING123456",
    password="mUTHULINGAMSESSION123456789",
    account="NSLDUDH-OL85977",   
    warehouse="RETAIL_WH",
    database="RETAIL_DB",
    schema="STAGING_SCHEMA"
)
cur = conn.cursor()

# Upload to stage
stage_name = "@my_stage"
put_sql = f"PUT file://{latest_file} {stage_name} AUTO_COMPRESS=TRUE"
cur.execute(put_sql)

print(f"Uploaded to Snowflake stage: {latest_file}")

cur.close()
conn.close()
