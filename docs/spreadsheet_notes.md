

 ## Setup

- Spreadsheet application: Google Sheets
- Tabs created: `orders`, `products`, `completed_orders`
- Rows imported into `orders`: 90 data rows
- Products tab range: `A1:C10`
- Filter applied: `status = completed`
- Sort applied before creating `completed_orders`: `amount` descending
- Missing-key XLOOKUP test: `Mystery Item` returned `UNKNOWN_ITEM`

## Formulas

Formulas entered in the first data row of `orders`:

- `clean_first_name`: `=PROPER(TRIM(C2))`
- `clean_last_name`: `=PROPER(TRIM(D2))`
- `category`: Record the exact VLOOKUP formula used.
- `unit_price`: Record the exact XLOOKUP formula used.
- `revenue_calc`: Record the exact cell-reference multiplication formula used.

## Aggregate Results

Record the actual spreadsheet results for COUNT, SUM, AVERAGE, MIN and MAX of `amount`.
 

| Metric | Spreadsheet result |
|---|---:|
| `total_count` | 63 |
| `total_revenue` | 346200 |
| `average_order_value` | 5495.24 |
| `max_order_value` | 15600 |
| `min_order_value` | 1100 |


## Pivot Table 1 — Category by Region

Source: `category_by_region.csv`

| Category | East | North | South | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Grand Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

## Pivot Table 2 — Monthly Performance

Source: `monthly_performance.csv`

| Order Month | SUM of amount | COUNTA of order_id |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| **Grand Total** | **346200** | **63** |




 	



## Reconciliation

| Metric  | Spreadsheet          | Part A Q05           | Result                    |
| ------- | -------------------- | -------------------- | ------------------------- |
| COUNT   | 63                   | 63                   |  63                       |
| SUM     | 346200               | 346200               |  346200                   |
| AVERAGE | 5495.238095          | 5495.238095          | 5495.238095               |

 ## Data Validation

Missing Amounts

Orders 1001, 1010 and 1064 have missing amounts. These values were kept blank rather than replaced with zero because the actual amounts are unknown. These orders are excluded from completed-order revenue calculations if their status is not completed.

Data Types

Numeric columns such as quantity, amount, unit_price and revenue_calc were checked to ensure their values are numeric and can be used in calculations.

Duplicate Order IDs

The order_id column should contain one unique ID per order. Duplicate IDs were checked before final export.

Outliers

The maximum completed-order amount is 15600. Check the spreadsheet for every completed order with this amount. Confirm that the values are consistent with the product price and quantity before treating them as valid.

Handover Decision

Keep missing amounts blank until the correct source values are available. Do not replace unknown amounts with zero. Maintain the completed-order filter and verify that the exported data contains only completed orders.

