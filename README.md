# Retail Sales Analytics Dashboard

End-to-end retail sales analysis project: raw sales data is cleaned in Python, loaded into MySQL, queried with SQL for key business metrics, and visualised in a Power BI dashboard.

## My Contribution
[Fill this in once your role is confirmed with your collaborator — e.g. "Wrote the SQL analysis queries (revenue by category/state/city, top customers, monthly trend) and built the Power BI dashboard visuals." Be specific; this is what you'll speak to in interviews.]

## Tech Stack
- **Python** (pandas, SQLAlchemy) — data cleaning and loading
- **MySQL** — data storage and querying
- **SQL** — business metric extraction
- **Power BI** — dashboard and visualisation

## What It Does
1. `analysis.py` loads raw sales data from Excel, cleans it (removes duplicates, parses dates, derives month), and loads it into a MySQL database
2. `retail_project.sql` contains the analytical queries: total revenue, revenue by category/state/city, top 5 customers, monthly sales trend, payment method breakdown, most-sold products, average order value, and high-value order detection
3. `Sales.pbix` is the Power BI dashboard built on the cleaned data

## Key Insight
[Add one specific number/finding once you've reviewed the output — e.g. "Electronics accounted for X% of total revenue, with Y as the top-performing state."]

## How to Run
1. Install dependencies: `pip install -r requirements.txt`
2. Set up a local MySQL database named `retail_project`
3. Set environment variables for your DB credentials:
   ```
   export DB_USER=your_username
   export DB_PASSWORD=your_password
   export DB_HOST=localhost
   export DB_NAME=retail_project
   ```
4. Run `python analysis.py` to clean the data and load it into MySQL
5. Run the queries in `retail_project.sql` to reproduce the analysis
6. Open `Sales.pbix` in Power BI Desktop to view the dashboard

## Files
| File | Description |
|---|---|
| `retail_sales_data.xlsx` | Raw input data |
| `analysis.py` | Data cleaning and MySQL load script |
| `cleaned_retail_sales.xlsx` | Cleaned dataset |
| `retail_project.sql` | SQL analysis queries |
| `final_report.xlsx` | Query output, exported for Power BI |
| `Sales.pbix` | Power BI dashboard file |
