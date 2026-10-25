# Part D — AI-Assisted Analysis with Human-in-the-Loop Verification

## 1. Five-Part Prompt for Part A, q13

**Role**

Act as a senior SQL analyst experienced in business reporting and sales performance analysis.

**Task**

Write the SQL query for Part A, q13. Calculate each sales representative's performance against their monthly target for each order month. Return `rep_name`, `order_month`, `monthly_target`, `revenue`, and `performance_tier`. Include completed orders only, group by representative, month, and target, and order by representative name followed by order month.

**Context**

The SQL dialect is MySQL. The database contains these tables and columns:

- `reps`: `rep_id`, `rep_name`, `region`, `monthly_target`
- `customers`: `customer_id`, `first_name`, `last_name`, `city`, `region`, `age`, `rep_id`
- `orders`: `order_id`, `customer_id`, `item`, `quantity`, `amount`, `status`, `order_month`

Join `orders` to `customers` using `customer_id`, then join `customers` to `reps` using `rep_id`. Revenue is the sum of `orders.amount` for completed orders only.

**Constraints**

- Include only rows where `orders.status = 'completed'`.
- Classify performance as **Below Target** when revenue is less than `monthly_target`.
- Classify performance as **On Target** when revenue is greater than or equal to `monthly_target` and less than `1.1 * monthly_target`.
- Classify performance as **Above Target** otherwise.
- Do not use `WITH` clauses or common table expressions.
- Do not use stored procedures.
- Calculate the performance tier directly from the aggregate revenue expression.
- Do not use an aggregate alias in `WHERE` or `GROUP BY`.
- Use the actual table and column names provided above.

**Format**

Return raw SQL only, with brief inline comments. Do not include Markdown fences or explanatory prose.

## 2. Scenario D1 — Defect Inspection

| Defect | Classification | Correct fix |
|---|---|---|
| The table `sales` does not exist. | schema error | Use the actual `orders`, `customers`, and `reps` tables. |
| The columns region_name and total_sales do not exist in the supplied schema. | schema error | Use `reps.region` and `orders.amount`. |
| `SUM(total_sales) > 80000` is placed in `WHERE`. | Logic error | Filter completed rows in `WHERE`, then apply the aggregate threshold in `HAVING`. |
| The assistant claims North's revenue grew by 38% month over month without evidence. | Phantom statistic | Calculate the change from the actual q11 results and compare it with the claim. |

## 3. Scenario D1 — Corrected Query and Results

The corrected query is saved as `sql/d1_corrected.sql` and was run against the project seed data.

The query joins `orders` to `customers` and then to `reps`, filters for completed orders, groups by region, and keeps regions whose completed-order revenue is greater than 80000.

**Actual compiler output:**

| region | revenue |
|---|---:|
| North | 119300 |
| South | 82500 |

The query returned exactly two rows, matching the expected result.

**North's month-over-month revenue change**

Using the q11 results, North's revenue change from `2026-09` to `2026-10` is **-22.8%**.

**Percentage change formula:**

$$
\frac{\text{October revenue}-\text{September revenue}}{\text{September revenue}}\times100
$$

**Calculation:**

$$
\frac{41{,}300-53{,}500}{53{,}500}\times100\approx -22.8\%
$$

A negative percentage means revenue decreased. Therefore, the assistant's claim that North's revenue grew by 38% is contradicted by the data.

## 4. Human-in-the-Loop Protocol — Scenario D1

**Specification:** The requirement is to calculate revenue by region using completed orders only, retain regions with revenue greater than 80000, and use the actual database schema.

**Execution:** I corrected the SQL by joining `orders`, `customers`, and `reps` through their actual keys. I filtered completed orders, grouped the results by region, and applied the threshold with `HAVING`.

**Inspection:** The original answer used a nonexistent table and incorrect column names. It also placed an aggregate condition in `WHERE`, and its 38% growth claim was unsupported.

**Verification:** I ran the corrected query in the SQL compiler. It returned exactly North with revenue 119300 and South with revenue 82500. The q11 results show that North's September-to-October revenue change was -22.8%.

**Decision:** Reject the original answer because its schema references and aggregate filtering are incorrect, and its 38% growth claim contradicts the data. Accept the corrected query because its executed output matches the two expected rows and the q11 calculation confirms a 22.8% decrease.

## 5. Scenario D2 — Five-Part Prompt and Formula Repair

**Role**

Act as a spreadsheet troubleshooting expert familiar with Google Sheets and Excel lookup functions.

**Task**

Find why a VLOOKUP formula returns a not-found error even though the lookup item exists in the products table. Explain the root cause and provide a repaired formula.

**Context**

The original formula is:

=VLOOKUP(G2, products!$A$2:$C$10, 3, FALSE)

Cell `G2` on the `orders` tab contains ` Smart Watch`, with a leading space before the first letter. The `products` tab occupies `A1:C10`. Row 1 contains headers, item names are in column A, and unit prices are in column C. The product `Smart Watch` exists in the table.

**Constraints**

- Keep exact-match lookup using `FALSE`.
- Do not change the product name or invent another item.
- Account for the leading space in the lookup value.
- Return the matching unit price from column C.

**Format**

State the root cause in plain language, provide the repaired formula, and briefly explain why it works.

**Root cause**

The lookup value in `orders!G2` has a leading space. It does not exactly match `Smart Watch` in the products table, so the exact-match lookup fails.

**Repaired formula**

`=VLOOKUP(TRIM(G2), products!$A$2:$C$10, 3, FALSE)`

`TRIM(G2)` removes the extra space from the lookup value. VLOOKUP can then match the product name in column A of the `products` tab and return its unit price from column C.

## 6. Skeptical-Analyst Check on Part C

**Prompt**

Act as a skeptical business analyst. Challenge my first recommendation from Part C to investigate North's strong revenue and consider a targeted promotion. Identify unstated assumptions and distinguish correlation from causation. For each assumption, give a figure or a specific data check that would confirm or weaken it. Explain what additional evidence is needed before concluding that a promotion would cause revenue to increase. Do not invent evidence.

**Unstated assumptions and evidence checks**

1. **Assumption: North's high revenue means it has the greatest opportunity for further growth.** North's total revenue is 119300, the highest among the regions. Check North's monthly revenue and order counts in q11 to determine whether performance is consistent or concentrated in one month.

2. **Assumption: A promotion will increase North's revenue.** The dataset records sales but does not prove that promotions cause higher sales. Test a future promotion against a suitable baseline or control group, tracking revenue, units sold, and profit margin.

3. **Assumption: North can fulfil additional demand.** North's category revenue is 19400 for Apparel, 73400 for Electronics, and 26500 for Home. These figures show its sales mix, but they do not confirm stock availability. Check inventory and fulfilment data before recommending a promotion.

4. **Assumption: Highest revenue means North is the strongest region on every business measure.** Revenue alone does not establish profitability or customer retention. Check order counts and, if available, costs, profit margins, and repeat-customer measures.

**Conclusion**

North leads the regions in revenue, but this alone does not explain why it leads or prove that a promotion will cause further growth. A targeted promotion should be treated as a hypothesis to test, not a guaranteed result.
