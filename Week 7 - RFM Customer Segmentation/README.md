# Week 7 | RFM Customer Segmentation

## Business Problem

Retail teams need to distinguish high-value and at-risk customers so that retention and engagement efforts can be prioritized. This project uses Recency, Frequency, and Monetary (RFM) measures to group UrbanStyle customers.

## Approach

The notebook cleans transaction records, computes customer-level RFM metrics, scores each metric in quintiles, assigns five segments, and visualizes customer counts and spending. Customer-level source data is not committed; the notebook reads a local `sales_clean.csv` file.

## Key Findings

- The supplied data contains **8,950 sales across 2,540 customers**, covering **2023-01-01 to 2026-06-28**.
- The notebook reports **0 duplicate invoices**, **0 unparseable dates**, and **0 non-positive totals** after validation.
- The dataset has **3,054 missing store locations** and **939 missing email values**; these non-critical fields were not used to drop transactions.
- The reproduced RFM summary assigns **455 customers (17.9%)** to VIP Champions, representing **42.8% of recorded revenue**.
- The other segments are **679 Loyal**, **759 Potential**, **529 At Risk**, and **118 Lost** customers.

## Technical Stack

Python, pandas, Plotly, Jupyter Notebook, RFM scoring and customer segmentation.

## Screenshots

No static chart screenshots are included. Running the notebook generates the segment-count chart, RFM scatter plot, and top-VIP revenue chart.

## How to Run

1. Install Python, Jupyter, pandas, and Plotly.
2. Obtain an authorized copy of the cleaned source dataset; customer-level data is intentionally excluded from this repository.
3. Place the file at `sales_clean.csv` beside the notebook, or at `Week 7 - RFM Customer Segmentation/sales_clean.csv` when running Jupyter from the repository root.
4. Open and run [the notebook](week7.ipynb) from top to bottom.

## Lessons Learned and Challenges

The cleaning checks preserve transactions with missing optional fields while requiring customer ID, date, and price for RFM analysis. The dataset contains personal contact fields, so the raw CSV and notebook outputs are excluded from the public repository. Segment thresholds are quantile-based and should be reviewed before using them to drive real customer campaigns.

## AI Use

AI assistance was used to structure this README and calculate the aggregate segment summary from the local dataset. No customer names, email addresses, or customer-level records are included in these findings.
