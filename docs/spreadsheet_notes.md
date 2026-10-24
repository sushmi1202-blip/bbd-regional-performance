

 Setup

- Spreadsheet application: Google Sheets
- Tabs created: `orders`, `products`, `completed_orders`
- Rows imported into `orders`: 90 data rows
- Products tab range: `A1:C10`
- Filter applied: `status = completed`
- Sort applied before creating `completed_orders`: `amount` descending
- Missing-key XLOOKUP test: `Mystery Item` returned `UNKNOWN_ITEM`

Formulas

Formulas entered in the first data row of `orders`:

- `clean_first_name`: `=PROPER(TRIM(C2))`
- `clean_last_name`: `=PROPER(TRIM(D2))`
- `category`: Record the exact VLOOKUP formula used.
- `unit_price`: Record the exact XLOOKUP formula used.
- `revenue_calc`: Record the exact cell-reference multiplication formula used.

 Aggregate Results

Record the actual spreadsheet results for COUNT, SUM, AVERAGE, MIN and MAX of `amount`.
Metrics Summary
Metric,Spreadsheet result
total_count,63
total_revenue,346200
average_order_value,5495.24
max_order_value,15600
min_order_value,1100

2. Pivot Table 1 — Category by Region (category_by_region.csv)
category,East,North,South,West,Grand Total
Apparel,10600,19400,10000,37500,77500
Electronics,21400,73400,28700,18800,142300
Home,37500,26500,43800,18600,126400
Grand Total,69500,119300,82500,74900,346200

3. Pivot Table 2 — Monthly Performance (monthly_performance.csv)
order_month,SUM of amount,COUNTA of order_id
2026-09,98300,19
2026-10,93100,20
2026-11,154800,24
Grand Total,346200,63

 Pivot Table 2 — Monthly Performance
 order_month,SUM of amount,COUNTA of order_id	
 2026-09,98300,19	
 2026-10,93100,20	
 2026-11,154800,24	
 Grand Total,346200,63	



Reconciliation

| Metric  | Spreadsheet          | Part A Q05           | Result                    |
| ------- | -------------------- | -------------------- | ------------------------- |
| COUNT   | 63                   | 63                   |  63                       |
| SUM     | 346200               | 346200               |  346200                   |
| AVERAGE | 5495.238095          | 5495.238095          | 5495.238095               |

 Data Validation

- Missing amounts: Orders 1001, 1010 and 1064 have blank amounts. These were kept blank rather than replaced with zero because the source amounts are unknown.
- Data types: Record how numeric columns were checked to ensure values are stored as numbers rather than text.
- Duplicate order IDs: Record the result of checking for duplicate `order_id` values.
- Outliers: Record the largest completed-order amount and every `order_id` that has that amount. Explain whether it appears unusual.
- Handover decision: Document one decision that would help a colleague maintain the sheet consistently.

