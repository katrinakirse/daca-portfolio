# Week 8 | Sales Analytics Pipeline

## Overview

This project builds a Python ETL pipeline for sales analytics using data stored in Supabase. It retrieves sales and customer records, cleans and aggregates sales by week, calculates key business metrics, and creates a weekly revenue chart.

## Workflow

- Connects to Supabase using `SUPABASE_URL` and `SUPABASE_KEY` environment variables.
- Retrieves sales for 2024 with paginated API requests and fetches customer records.
- Removes duplicate sales, validates dates and required fields, and calculates weekly revenue and order counts.
- Computes total revenue, unique customers, and average order value, then joins sales to customer data.
- Exports weekly results as a CSV and saves an interactive Plotly revenue chart as HTML in the `output` directory.

## Project files

- [Python ETL pipeline](Week%208.py)
- [Jupyter notebook](Week%208%20jupyter.ipynb)