# bbd-regional-performance
Big Billion Days Regional Performance Review — SQL, Spreadsheet, Dashboard and AI-Verified Analysis
# Big Billion Days Regional Performance Review

**SQL, Spreadsheet, Dashboard and AI-Verified Analysis**

## Project Overview

This project analyzes Big Billion Days (BBD) sales performance across four regions—North, South, East, and West—using SQL, spreadsheet analysis, dashboard planning, and AI-assisted verification.

The goal is to identify revenue trends, compare regional and product performance, evaluate sales representatives against their monthly targets, and provide data-driven business recommendations.

## Business Objectives

- Analyze completed-order revenue across regions and months.
- Identify high-performing product categories and individual products.
- Compare sales representative performance against monthly targets.
- Identify customers who have never placed an order.
- Examine missing order amounts and data-quality issues.
- Validate AI-generated SQL and spreadsheet formulas before using them.

## Tools and Technologies

- **SQL:** MySQL
- **Spreadsheet:** Excel or Google Sheets
- **Dashboard:** Tableau Public or another compatible dashboard tool
- **AI assistance:** Used to support query review, formula debugging, and analysis verification
- **Version control:** Git and GitHub

## Repository Structure

```text
bbd-regional-performance/
├── data/
│   └── orders_enriched.csv
├── docs/
│   ├── ai_log.md
│   ├── dashboard_spec.md
│   └── spreadsheet_notes.md
├── results/
│   └── query_results.md
├── sql/
│   ├── 00_schema_and_seed.sql
│   ├── q01.sql
│   ├── q02.sql
│   ├── q03.sql
│   ├── q04.sql
│   ├── q05.sql
│   ├── q06.sql
│   ├── q07.sql
│   ├── q08.sql
│   ├── q09.sql
│   ├── q10.sql
│   ├── q11.sql
│   ├── q12.sql
│   ├── q13.sql
│   └── d1_corrected.sql
└── README.md
```

## Dataset

The project uses a sample BBD dataset containing:

- 4 sales representatives
- 9 products
- 24 customers
- 90 orders

The dataset covers September, October, and November 2026.

Data-quality issues include inconsistent customer-name capitalization and spacing, missing order amounts, and customers who have never placed an order.

## Revenue Definition

Unless a query explicitly states otherwise, revenue refers to the sum of `amount` for orders with status `completed`.

Pending and disputed orders are excluded from completed-sales revenue. Missing amounts are not treated as zero unless a query explicitly applies that rule.

## SQL Analysis

The 13 SQL queries cover data inspection, missing amounts, product-specific orders, customer demographics, revenue summaries, order-status analysis, product performance, regional analysis, enriched order-level data, customers without orders, monthly regional performance, product contribution tiers, and sales representative performance against targets.

The corrected AI-generated query is documented in `sql/d1_corrected.sql`.

## Key Findings

Based on the completed-order results:

- **Total completed-order revenue:** ₹346,200
- **Completed orders:** 63
- **Highest-revenue region overall:** North, with ₹119,300
- **Highest-revenue product:** Air Fryer, with ₹104,000
- **Highest-revenue month overall:** November 2026, with ₹154,800
- **Customers who never ordered:** 4

These results are based on the current SQL outputs and should be rechecked if the underlying data or query logic changes.

## Spreadsheet and Dashboard

Spreadsheet analysis supports data cleaning, product lookups, pivot tables, and revenue comparisons.

The dashboard requirements and proposed visualizations are documented in `docs/dashboard_spec.md`. Spreadsheet methods and formula checks are documented in `docs/spreadsheet_notes.md`.

## AI-Assisted Verification

AI assistance was used to support SQL review, spreadsheet formula debugging, and interpretation of analytical results.

AI-generated outputs were checked against the database schema, query results, and business rules. The AI usage record and verification notes are available in `docs/ai_log.md`.

AI-generated results are treated as suggestions until verified.

## How to Reproduce the Analysis

1. Open a MySQL-compatible SQL environment.
2. Run `sql/00_schema_and_seed.sql` to create and populate the sample database.
3. Execute `sql/q01.sql` through `sql/q13.sql`.
4. Compare the outputs with `results/query_results.md`.
5. Use `data/orders_enriched.csv` for spreadsheet analysis.
6. Refer to `docs/spreadsheet_notes.md` and `docs/dashboard_spec.md` for the spreadsheet and dashboard work.

Run the schema and seed script only in an environment where creating or replacing the project tables is safe.

## Project Limitations

This is a sample dataset for analytical practice. The findings describe the supplied data and should not be interpreted as actual official Flipkart sales results.

## Author

Business Analyst Project — SQL, Spreadsheet Analysis, Dashboard Planning, and AI Verification
