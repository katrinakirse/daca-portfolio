# Week 8 | Supabase Sales Analytics Pipeline

## Business Problem

Sales analysis often requires repeatable retrieval, cleaning, aggregation, and reporting rather than one-off queries. This project demonstrates a Python pipeline that summarizes Supabase sales into weekly revenue and order trends.

## Approach

Fetch paginated sales and customer records from Supabase, clean required sales fields, calculate weekly revenue and order counts, compute KPIs, join customer data, and export a CSV plus an interactive Plotly chart.

The implementation is available as a [Python script](Week%208.py) and [Jupyter notebook](Week%208%20jupyter.ipynb).

## Key Findings

- The recorded run retrieved **5,140 sales** and **3,150 customer records** for **2024-01-01 through 2024-12-31**.
- The notebook reports **€1,318,246.08 total revenue** across **2,109 unique customers**.
- The reported average order value is **€283.37**.
- The customer join returned **4,652 rows** in the recorded run; the project does not include a static chart screenshot.

## Technical Stack

Python, pandas, Supabase Python client, python-dotenv, Plotly, Jupyter Notebook.

## Screenshots

No static screenshots are included. Running the script creates an interactive revenue chart at `output/weekly_revenue.html`.

## How to Run

1. Install Python and the required packages: `pandas`, `python-dotenv`, `supabase`, and `plotly`.
2. Create a local `.env` file beside the script with `SUPABASE_URL` and `SUPABASE_KEY`; never commit credentials.
3. Confirm that the Supabase project exposes the required `sales` and `customers` tables and that the key has appropriate read access.
4. Run `python "Week 8.py"` from this folder.
5. Review the generated CSV and `output/weekly_revenue.html`.

## Lessons Learned and Challenges

The script pages through API results in batches of **1,000**, which supports tables larger than a single response. The run is tied to a hard-coded 2024 date range, and generated output files are intentionally excluded from version control; parameterizing the period and documenting automated checks would improve reuse.

## AI Use

AI assistance was used to structure and edit this README. Execution figures are taken from the saved notebook output.
