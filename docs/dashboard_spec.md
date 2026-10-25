# Part C — Dashboard Specification and Business Narrative

## 1. Data Source

Connect Tableau Public to `data/orders_clean.csv`.

| Column | Classification |
|---|---|
| order_id | Dimension |
| order_month | Dimension |
| clean_first_name | Dimension |
| clean_last_name | Dimension |
| region | Dimension |
| rep_name | Dimension |
| item | Dimension |
| category | Dimension |
| unit_price | Measure |
| quantity | Measure |
| amount | Measure |
| revenue_calc | Measure |
| status | Dimension |

The dataset contains 13 columns: 9 Dimensions and 4 Measures.

## 2. KPI Cards

### Total Revenue

- Field: `amount`
- Aggregation: SUM
- Display value: ₹346,200

The Total Revenue KPI equals Part A Q05's `total_revenue` of 346200.

### Total Units Sold

- Field: `quantity`
- Aggregation: SUM
- Display value: 106 units

## 3. Chart Sheets

### 3.1 Revenue by Region

- Chart type: Horizontal bar chart
- Rows: `region`
- Columns: SUM(`amount`)
- Colour: `region`

A bar chart makes it easy to compare revenue across regions.

| Region | Revenue (₹) |
|---|---:|
| North | 119300 |
| South | 82500 |
| East | 69500 |
| West | 74900 |
| **Grand Total** | **346200** |

### 3.2 Revenue by Category

- Chart type: Horizontal bar chart
- Rows: `category`
- Columns: SUM(`amount`)
- Colour: `category`

A bar chart clearly compares the revenue contribution of each product category.

| Category | Revenue (₹) |
|---|---:|
| Electronics | 142300 |
| Home | 126400 |
| Apparel | 77500 |
| **Grand Total** | **346200** |

### 3.3 Revenue Trend by Month and Category

- Chart type: Line chart
- Columns: `order_month`
- Rows: SUM(`amount`)
- Colour: `category`
- Detail: `category`

A line chart shows how category revenue changes over time and helps identify monthly trends.

### Monthly Revenue by Category

| Month | Apparel (INR) | Electronics (INR) | Home (INR) | Grand Total (INR) |
|---|---:|---:|---:|---:|
| 2026-09 | 24700 | 43000 | 30600 | 98300 |
| 2026-10 | 30600 | 49900 | 12600 | 93100 |
| 2026-11 | 22200 | 49400 | 83200 | 154800 |
| **Grand Total** | **77500** | **142300** | **126400** | **346200** |


### 3.4 Region x Category Detail

- Chart type: Text table
- Rows: `category`
- Columns: `region`
- Text/colour: SUM(`amount`)

A text table provides precise values for comparing each category across all regions.

| Category | East | North | South | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Grand Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

## 4. Dashboard Layout

Arrange the dashboard from top to bottom:

1. KPI cards: Total Revenue and Total Units Sold.
2. Category filter, directly below the KPI cards in the top band.
3. Revenue Trend by Month and Category.
4. Revenue by Region and Revenue by Category comparison charts.
5. Region x Category Detail text table.

Use a vertical container for the overall dashboard. Use a horizontal container for the two KPI cards and another horizontal container for the two comparison charts.

Add a `category` filter in the top band and apply it to all four worksheets using this data source.

With **Use as Filter** enabled on Revenue by Region, clicking a region's bar filters the other charts and detail table to show the selected region's data.

## 5. Insight and Recommendation Narrative

### Visualization summary

The dashboard summarizes completed-order revenue across regions, categories and months. It provides two headline KPIs, monthly category trends, regional and category comparisons, and a detailed region-by-category table.

### Summary analysis

1. North generated ₹119,300, the highest regional revenue, while East generated ₹69,500. North's revenue was ₹49,800 higher than East's.
2. Electronics generated ₹142,300, exceeding Home at ₹126,400 by ₹15,900. Apparel generated ₹77,500.
3. Revenue rose from ₹93,100 in October to ₹154,800 in November, an increase of ₹61,700. September revenue was ₹98,300.

### Recommendations

1. **North:** Review which products and sales activities contributed to its ₹119,300 revenue, then test a targeted promotional campaign for high-performing products. Track completed-order revenue and order count before and after the campaign.
2. **Electronics:** Review stock availability and test a focused promotion for the Electronics category, which generated ₹142,300. Track category revenue, units sold and stockouts to assess the result.
3. **West:** Investigate the category mix behind West's ₹74,900 revenue, including Apparel's ₹37,500 contribution. Test a targeted campaign for relevant Apparel products and track West's completed-order revenue and units sold.

These recommendations are hypotheses to test; the revenue figures show performance but do not by themselves prove the causes.

## 6. Reconciliation

| Check | Revenue (₹) |
|---|---:|
| Total Revenue KPI | 346200 |
| Sum of Revenue by Region | 346200 |
| Sum of Revenue by Category | 346200 |
| Part B pivot grand total | 346200 |

All four totals reconcile to ₹346,200.
