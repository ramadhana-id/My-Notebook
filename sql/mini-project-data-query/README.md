# 🗄️ Sales Analysis with SQL

## Project Overview

Project ini merupakan portfolio **SQL Business Analysis** yang
menggunakan query SQL untuk menganalisis data penjualan, pengiriman,
produk, sales representative, dan segmentasi pelanggan.

Project terdiri dari 5 analisis utama:

1.  Monthly Sales Performance
2.  Shipment SLA Performance
3.  Top Product Revenue
4.  Sales Representative Performance
5.  Customer Segmentation

Query menggunakan sintaks SQL yang sesuai dengan lingkungan PostgreSQL,
termasuk `DATE_TRUNC`, `EXTRACT`, `::numeric`, `CASE`, aggregation,
JOIN, dan subquery.

## Business Questions

### 1. Monthly Sales Performance

-   Bagaimana jumlah order dan revenue setiap bulan pada tahun 2025?
-   Berapa average order value setiap bulan?

### 2. Shipment SLA Performance

-   Berapa jumlah pengiriman setiap shipper?
-   Berapa jumlah dan persentase order yang terlambat?

### 3. Top Products

-   Produk apa yang menghasilkan revenue terbesar?
-   Bagaimana produk dikelompokkan berdasarkan price range?

### 4. Sales Representative Performance

-   Berapa jumlah order masing-masing sales representative?
-   Berapa average order value?
-   Berapa persentase order dengan nilai di atas 1000?

### 5. Customer Segmentation

-   Bagaimana distribusi customer NEW dan LOYAL?
-   Berapa jumlah order dan revenue dari masing-masing segment?

## SQL Techniques

-   `SELECT`
-   `JOIN`
-   `GROUP BY`
-   `ORDER BY`
-   `CASE WHEN`
-   `COUNT`
-   `SUM`
-   `AVG`
-   `ROUND`
-   `DATE_TRUNC`
-   `EXTRACT`
-   Subquery
-   Conditional aggregation
-   Revenue calculation
-   Business segmentation

## Files

  File                    Keterangan
  ----------------------- ------------------------------------
  `queries.sql`           Kumpulan 5 query SQL utama
  `T1_monthly.csv`        Output analisis monthly sales
  `T2_sla.csv`            Output analisis shipment SLA
  `T3_top_products.csv`   Output top products
  `T4_sales_rep.csv`      Output sales representative
  `T5_segments.csv`       Output customer segmentation
  `Presentation1.pdf`     Dokumentasi/presentasi project SQL

## Tools

-   SQL
-   PostgreSQL
-   Data Analysis
-   Business Intelligence

## Project Focus

Project ini menunjukkan kemampuan menerjemahkan kebutuhan bisnis menjadi
query SQL dan menghasilkan output analitis yang dapat digunakan sebagai
dasar reporting dan dashboard.
