# ROLE A - API QUERY
# Fetch sales, customers, and products as DataFrames with error handling.

# Write fetch_sales(start_date, end_date), fetch_customers(), and fetch_products().

import os
import pandas as pd
from dotenv import load_dotenv
from supabase import create_client

load_dotenv()
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")

def get_supabase_client():
    """Create a Supabase client when credentials are available."""
    if not SUPABASE_URL or not SUPABASE_KEY:
        raise RuntimeError("SUPABASE_URL and SUPABASE_KEY must be set")
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def fetch_all_rows(table, start_date=None, end_date=None):
    """Fetch all rows from a public table, paging past the API row limit."""
    rows = []
    start = 0
    page_size = 1000
    client = get_supabase_client().schema("public")

    while True:
        query = client.table(table).select("*")
        if start_date is not None:
            query = query.gte("sale_date", start_date)
        if end_date is not None:
            query = query.lte("sale_date", end_date)

        page = query.range(start, start + page_size - 1).execute().data
        rows.extend(page)
        if len(page) < page_size:
            break
        start += page_size

    return pd.DataFrame(rows)

def fetch_sales(start_date, end_date):
    """Fetch sales with date filters."""
    try:
        return fetch_all_rows("sales", start_date, end_date)
    except Exception as e:
        print(f"[ERROR] fetch_sales: {e}")
        return pd.DataFrame()

def fetch_customers():
    """Fetch customers."""
    try:
        return fetch_all_rows("customers")
    except Exception as e:
        print(f"[ERROR] fetch_customers: {e}")
        return pd.DataFrame()

def fetch_products():
    """Fetch products."""
    try:
        return fetch_all_rows("products")
    except Exception as e:
        print(f"[ERROR] fetch_products: {e}")
        return pd.DataFrame()


# ROLE B - DATA PROCESSING
# Clean and aggregate sales, calculate KPIs, and merge customer data.

import pandas as pd

def clean_data(df):
    """Remove duplicates, fix dates, drop NULLs."""
    df = df.drop_duplicates()
    df["sale_date"] = pd.to_datetime(df["sale_date"], errors="coerce")
    df = df.dropna(subset=["customer_id", "sale_date", "total_price"])
    return df

def calculate_weekly_aggregates(df):
    """Group by week → revenue + order count."""
    weekly = (
        df.resample("W", on="sale_date")
        .agg({"total_price": "sum", "sale_id": "count"})
        .rename(columns={"total_price": "revenue", "sale_id": "orders"})
        .reset_index()
    )
    return weekly

def calculate_kpis(df):
    """Return KPI dictionary."""
    return {
        "total_revenue": float(df["total_price"].sum()),
        "unique_customers": int(df["customer_id"].nunique()),
        "avg_order_value": float(df["total_price"].mean()),
    }

def merge_datasets(df_sales, df_customers):
    """Merge on customer_id."""
    return pd.merge(df_sales, df_customers, on="customer_id", how="left")


# ROLE C - VISUALIZATION + EXPORT
# Create Plotly charts and export results.

import os
from datetime import datetime
import plotly.express as px

def create_weekly_chart(df_weekly):
    """Plot weekly revenue trend."""
    fig = px.line(
        df_weekly,
        x="sale_date",
        y="revenue",
        title="Weekly Revenue Trend"
    )
    return fig

def create_kpi_summary(kpis):
    """Simple KPI bar chart."""
    fig = px.bar(
        x=list(kpis.keys()),
        y=list(kpis.values()),
        title="Key KPIs"
    )
    return fig

def export_results(df, output_dir="output"):
    """Save CSV + ensure folder exists."""
    os.makedirs(output_dir, exist_ok=True)
    ts = datetime.now().strftime("%Y%m%d_%H%M")
    csv_path = os.path.join(output_dir, f"results_{ts}.csv")
    df.to_csv(csv_path, index=False)
    return csv_path


# ROLE D - AUTOMATION SCRIPT
# Run the extraction, transformation, and export pipeline.

import logging
import time

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def run_pipeline():
    logging.info("Pipeline started")

    try:
        if not SUPABASE_URL or not SUPABASE_KEY:
            raise RuntimeError("Set SUPABASE_URL and SUPABASE_KEY to run the pipeline")

        # === EXTRACT ===
        sales = fetch_sales("2024-01-01", "2024-12-31")
        customers = fetch_customers()
        logging.info(f"Fetched {len(sales)} sales, {len(customers)} customers")
        if sales.empty:
            logging.info("No sales returned for the selected date range; skipping transforms and exports")
            return

        # === TRANSFORM ===
        sales_clean = clean_data(sales)
        weekly = calculate_weekly_aggregates(sales_clean)
        kpis = calculate_kpis(sales_clean)
        merged = merge_datasets(sales_clean, customers)
        logging.info("Transform stage complete")
        logging.info("KPIs: %s", kpis)
        logging.info("Merged dataset contains %s rows", len(merged))

        # === VISUALIZE + EXPORT ===
        csv_path = export_results(weekly)
        fig_weekly = create_weekly_chart(weekly)
        fig_weekly.write_html("output/weekly_revenue.html")

        logging.info(f"Exported CSV: {csv_path}")

        logging.info("Pipeline completed successfully")

    except Exception as e:
        logging.error(f"Pipeline failed: {e}")

if __name__ == "__main__":
    start = time.time()
    run_pipeline()
    print(f"Elapsed: {time.time() - start:.2f} seconds")

