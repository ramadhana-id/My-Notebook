-- ============================================================
-- SALES ANALYSIS WITH SQL
-- Ramadhana | Data Analytics Portfolio
-- ============================================================

-- T1 — Monthly Sales Performance
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue,
    AVG(od.unit_price * od.quantity * (1 - od.discount)) AS avg_order_value
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2025
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


-- T2 — Shipment SLA Performance
SELECT
    s.company_name AS shipper_name,
    COUNT(o.order_id) AS shipped_orders,
    SUM(
        CASE
            WHEN o.shipped_date > o.required_date THEN 1
            ELSE 0
        END
    ) AS late_orders,
    ROUND(
        SUM(
            CASE
                WHEN o.shipped_date > o.required_date THEN 1
                ELSE 0
            END
        )::numeric
        / COUNT(o.order_id) * 100,
        2
    ) AS late_rate_percent
FROM orders o
JOIN shippers s
    ON o.ship_via = s.shipper_id
WHERE o.shipped_date IS NOT NULL
  AND EXTRACT(YEAR FROM o.shipped_date) = 2025
GROUP BY s.company_name
ORDER BY late_rate_percent DESC;


-- T3 — Top Products by Revenue
SELECT
    products.product_name,
    categories.category_name,
    products.unit_price,
    CASE
        WHEN products.unit_price < 10 THEN '<10'
        WHEN products.unit_price BETWEEN 10 AND 20 THEN '10-20'
        WHEN products.unit_price BETWEEN 20 AND 50 THEN '20-50'
        ELSE '>50'
    END AS price_range,
    ROUND(
        SUM(
            order_details.unit_price
            * order_details.quantity
            * (1 - order_details.discount)
        )::numeric,
        2
    ) AS total_revenue
FROM order_details
JOIN orders
    ON order_details.order_id = orders.order_id
JOIN products
    ON order_details.product_id = products.product_id
JOIN categories
    ON products.category_id = categories.category_id
WHERE EXTRACT(YEAR FROM orders.order_date) = 2025
GROUP BY
    products.product_name,
    categories.category_name,
    products.unit_price
ORDER BY total_revenue DESC
LIMIT 10;


-- T4 — Sales Representative Performance
SELECT
    employees.first_name || ' ' || employees.last_name AS employee_name,
    COUNT(order_summary.order_id) AS total_orders,
    ROUND(AVG(order_summary.order_total)::numeric, 2) AS avg_order_value,
    ROUND(
        (
            SUM(
                CASE
                    WHEN order_summary.order_total > 1000 THEN 1
                    ELSE 0
                END
            )::numeric
            / COUNT(order_summary.order_id)
        ) * 100,
        2
    ) AS pct_large_orders
FROM (
    SELECT
        orders.order_id,
        orders.employee_id,
        SUM(
            order_details.unit_price
            * order_details.quantity
            * (1 - order_details.discount)
        ) AS order_total
    FROM orders
    JOIN order_details
        ON orders.order_id = order_details.order_id
    WHERE EXTRACT(YEAR FROM orders.order_date) = 2025
    GROUP BY orders.order_id, orders.employee_id
) AS order_summary
JOIN employees
    ON order_summary.employee_id = employees.employee_id
GROUP BY employees.first_name, employees.last_name
ORDER BY avg_order_value DESC;


-- T5 — Customer Segmentation
SELECT
    CASE
        WHEN EXTRACT(
            YEAR FROM (
                SELECT MIN(order_date)
                FROM orders AS o2
                WHERE o2.customer_id = o1.customer_id
            )
        ) = 2025 THEN 'NEW'
        ELSE 'LOYAL'
    END AS segment,
    COUNT(o1.order_id) AS orders,
    ROUND(
        SUM(
            od.unit_price
            * od.quantity
            * (1 - od.discount)
        )::numeric,
        2
    ) AS revenue
FROM orders AS o1
JOIN order_details AS od
    ON o1.order_id = od.order_id
WHERE EXTRACT(YEAR FROM o1.order_date) = 2025
GROUP BY segment;
