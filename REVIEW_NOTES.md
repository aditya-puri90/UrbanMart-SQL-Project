# Review of submitted UrbanMart SQL file

## Corrections made in the organized version

1. Customer spending rank now sorts `SUM(total_amount) DESC`; the submitted query ranked low spenders first.
2. Running revenue now uses `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`; the submitted `UNBOUNDED FOLLOWING` frame returned the full-window total instead of a running total.
3. Product ranking output is ordered by category and rank.
4. LAG calculations use `ORDER BY order_date, order_id` for deterministic chronological sequencing.
5. Revenue/spending examples exclude cancelled and returned orders as a documented business rule.
6. Product-category revenue and top-product calculations join through orders so cancelled/returned orders can be excluded.
7. The customers-without-reviews query uses `NOT EXISTS`, avoiding common `NOT IN`/NULL pitfalls.
8. The "most purchased product" query returns all tied top-ranked products.
9. Added Q47–Q52 data-quality queries because those checks were not present in the submitted file.

## Review notes

- The core schema, foreign keys, sample inserts, and most basic SQL, joins, subqueries, CTEs, and window-function queries are on the right track.
- The original uploaded file ended after Q46 (the latest-order comparison). Q47–Q51 were not included in that file; they are now in `queries/06_data_quality.sql`.
- `customers.email` is declared `UNIQUE`, so exact duplicate non-NULL emails cannot normally be inserted into this database. The query checks normalized emails (trimmed and lowercased) for duplicate-like values.
- The sample data is clean for several checks: missing-payment, payment-mismatch, invalid-delivery-date, and invalid-stock checks are expected to return zero rows on the unchanged sample data.
- These queries have been reviewed logically, but they were not executed against a live MySQL server in this environment. Please run them in MySQL Workbench to confirm execution in your specific server version/settings.
