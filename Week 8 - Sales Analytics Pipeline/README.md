# Week 8: Sales Analytics Pipeline

## Overview

This project demonstrates an end-to-end sales analytics workflow using Python and Supabase. It retrieves sales and customer records, cleans and aggregates sales data, calculates key performance indicators, and creates a weekly revenue chart and CSV export.

## Project files

- [Python pipeline](Week%208.py) — reusable functions for data retrieval, cleaning, aggregation, KPI calculation, visualization, and export.
- [Jupyter notebook](Week%208%20jupyter.ipynb) — notebook version of the workflow, including an example run.

## Workflow

1. Retrieve sales and customer data from Supabase, with pagination for larger result sets.
2. Remove duplicate sales records, parse sale dates, and exclude rows missing required fields.
3. Aggregate weekly revenue and order counts; calculate total revenue, unique customers, and average order value.
4. Create a weekly revenue chart and export the aggregated results as CSV.

The script currently requests sales from January 1 through December 31, 2024. Product retrieval and customer merging are also included as reusable functions.

## Setup

Install the Python packages used by the project: `pandas`, `python-dotenv`, `supabase`, and `plotly`. Set `SUPABASE_URL` and `SUPABASE_KEY` in a local `.env` file before running the pipeline. Keep credentials out of notebooks, source control, and public files.

Run the script with:

```bash
python "Week 8.py"
```

The pipeline writes a timestamped weekly-results CSV and an HTML revenue chart to an `output` folder.
