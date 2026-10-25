# Spreadsheet Analysis Notes

## 1. Setup

- Spreadsheet application: Google Sheets
- Original data source: `data/orders_enriched.csv`
- Original dataset: 90 order rows and 10 columns
- Tabs: `orders`, `products`, `completed_orders`
- Products lookup range: `products!A2:C10`
- Completed-order filter: `status = completed`

The original CSV contains `order_id`, `order_month`, `first_name`, `last_name`, `region`, `rep_name`, `item`, `quantity`, `amount`, and `status`.

The `orders` sheet adds three calculated columns: `category`, `unit_price`, and `revenue_calc`. The first and last name fields are cleaned using formulas. After these changes, the working dataset has 13 columns.

## 2. Formulas

Enter these formulas in row 2 of the `orders` sheet and fill them down through row 91.

| Column | Formula | Purpose |
|---|---|---|
| `clean_first_name` | `=PROPER(TRIM(C2))` | Removes extra spaces and standardizes name capitalization |
| `clean_last_name` | `=PROPER(TRIM(D2))` | Removes extra spaces and standardizes name capitalization |
| `category` | `=IFERROR(VLOOKUP(G2,products!$A$2:$C$10,2,FALSE),"UNKNOWN_ITEM")` | Looks up the product category |
| `unit_price` | `=IFERROR(XLOOKUP(G2,products!$A$2:$A$10,products!$C$2:$C$10),"UNKNOWN_ITEM")` | Looks up the product's unit price |
| `revenue_calc` | `=H2*L2` | Calculates quantity multiplied by unit price |

**Column mapping:** The formulas assume the original columns remain in A:J, with `clean_first_name` and `clean_last_name` replacing the original name columns, and the new calculated columns placed in K:M: `category` in K, `unit_price` in L, and `revenue_calc` in M.

The `products` sheet uses column A for `item`, column B for `category`, and column C for `unit_price`.

The `revenue_calc` formula calculates order value. For reporting revenue, include only rows with `status = completed`.

## 3. Aggregate Results

The following results are based on completed orders only.

| Metric | Spreadsheet result |
|---|---:|
| `total_count` — COUNT of amount | 63 |
| `total_revenue` — SUM of amount | 346200 |
| `average_order_value` — AVERAGE of amount | 5495.24 |
| `max_order_value` — MAX of amount | 15600 |
| `min_order_value` — MIN of amount | 1100 |

These results match Part A Q05.

## 4. Pivot Table 1 — Category by Region

Source: completed-order data.

| Category | East | North | South | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Grand Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

## 5. Pivot Table 2 — Monthly Performance

Source: completed-order data.

| Order Month | SUM of amount | COUNTA of order_id |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| **Grand Total** | **346200** | **63** |

November generated the highest monthly revenue, at 154800.

## 6. Reconciliation with SQL

| Metric | Spreadsheet | Part A Q05 | Result |
|---|---:|---:|---|
| Completed-order count | 63 | 63 | Match |
| Total revenue | 346200 | 346200 | Match |
| Average order value | 5495.238095 | 5495.238095 | Match |

All three metrics reconcile with Part A Q05.

## 7. Data Validation

### Missing amounts

Orders 1001, 1010, and 1064 have blank amounts. These are pending orders in the source data. The missing values were kept blank rather than replaced with zero because the actual amounts are unknown.

### Data types

Check that `quantity`, `amount`, `unit_price`, and `revenue_calc` contain numeric values where appropriate. The `unit_price` lookup should return a number for valid products.

### Duplicate order IDs

Check that each `order_id` appears only once. Investigate any duplicates before exporting the final dataset.

### Outliers

The maximum completed-order amount is 15600. Verify that each completed order with this value is consistent with the product price and quantity.

### Unknown product lookup

The test item `Mystery Item` returned `UNKNOWN_ITEM`. This confirms that the lookup formula handles a missing product key rather than silently assigning an incorrect category.

## 8. Handover Decision

- Keep unknown amounts blank until the correct source values are available.
- Use completed orders only for revenue KPIs and completed-order pivot tables.
- Retain the original `amount` field for reconciliation against SQL.
- Use `revenue_calc` to validate the relationship between quantity and unit price.
- Export the enriched dataset only after confirming the column names, formulas, and row counts.




