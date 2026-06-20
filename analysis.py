import os
import pandas as pd
from sqlalchemy import create_engine

# Load Excel file
df = pd.read_excel("retail_sales_data.xlsx")

print("Original Data:")
print(df.head())

# Convert date
df['OrderDate'] = pd.to_datetime(df['OrderDate'])

# Remove duplicates
df.drop_duplicates(inplace=True)

# Create Month column
df['Month'] = df['OrderDate'].dt.month_name()

# Save cleaned data
df.to_excel("cleaned_retail_sales.xlsx", index=False)

print("Cleaning completed. New file created: cleaned_retail_sales.xlsx")

# ------------------ LOAD INTO MYSQL ------------------
# Credentials are read from environment variables, never hardcoded.
# Set these before running, e.g.:
#   export DB_USER=root
#   export DB_PASSWORD=your_password
#   export DB_HOST=localhost
#   export DB_NAME=retail_project

db_user = os.environ["DB_USER"]
db_password = os.environ["DB_PASSWORD"]
db_host = os.environ.get("DB_HOST", "localhost")
db_name = os.environ.get("DB_NAME", "retail_project")

engine = create_engine(f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}/{db_name}")

df = pd.read_excel("cleaned_retail_sales.xlsx")
df.to_sql('sales', engine, if_exists='replace', index=False)

print("Data loaded into MySQL successfully.")

# ------------------ EXPORT FOR POWER BI ------------------

final_df = pd.read_sql("SELECT * FROM sales", engine)
final_df.to_excel("final_report.xlsx", index=False)

print("final_report.xlsx created for Power BI.")
