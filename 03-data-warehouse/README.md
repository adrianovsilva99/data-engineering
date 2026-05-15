# 03 - Data Warehouse and BigQuery

This module focuses on Data Warehouse concepts and Google BigQuery as a cloud-based analytical data platform.
The goal is to understand how analytical databases differ from transactional systems, how BigQuery works, and how to optimize data storage and queries using external tables, partitioning and clustering.

## Topics covered

- Data Warehouse concepts
- OLTP vs OLAP
- Google BigQuery
- Google Cloud Storage
- External tables
- Native BigQuery tables
- Partitioned tables
- Clustered tables
- Query cost optimization
- BigQuery SQL
- ELT workflows

## Main concepts

### Data Warehouse

A Data Warehouse is designed for analytical workloads, reporting and decision-making.
Unlike transactional databases, which are optimized for inserts, updates and operational systems, a Data Warehouse is optimized for reading, aggregating and analyzing large volumes of data.

### OLTP vs OLAP

| Type | Purpose | Example |
|---|---|---|
| OLTP | Operational and transactional systems | ERP, CRM, banking systems |
| OLAP | Analytical and reporting systems | Dashboards, BI, historical analysis |

### Google BigQuery

BigQuery is a serverless data warehouse from Google Cloud.
It allows running SQL queries over large datasets without managing servers, storage engines or infrastructure manually.

### Google Cloud Storage

Google Cloud Storage is used to store raw files such as CSV, JSON or Parquet.
In a data pipeline, GCS can work as a data lake or staging area before loading the data into BigQuery.

Example:

```text
CSV / Parquet files
↓
Google Cloud Storage
↓
External Table or Native Table
↓
BigQuery SQL
↓
Analytics / BI
```

## External tables

External tables allow BigQuery to query data directly from files stored in Google Cloud Storage.
In this case, the data is not physically loaded into BigQuery storage. BigQuery reads the external files during query execution.

Use cases:

- Querying raw files from a data lake
- Exploring data before loading it
- Avoiding duplicated storage during initial analysis

## Native tables

Native tables store data directly inside BigQuery.
They usually provide better performance and more optimization options compared to external tables.

Use cases:

- Production analytical tables
- Frequently queried datasets
- Optimized reporting layers

## Partitioning

Partitioning divides a table into smaller segments based on a specific column, usually a date or timestamp column.
This helps reduce the amount of data scanned by queries.

Example:

```sql
WHERE pickup_date = '2021-01-01'
```

If the table is partitioned by pickup_date, BigQuery can scan only the relevant partition instead of the entire table.

## Clustering

Clustering organizes data based on one or more columns, it helps improve query performance when filtering or aggregating by clustered columns.

Example clustered columns:

```text
VendorID
PULocationID
DOLocationID
```

## Partitioning vs Clustering
| Concept | Best used for |
|---|---|
| Partitioning | Filtering by date, timestamp or range |
| Clustering | Filtering, grouping or joining by specific columns |

Both can be used together.

Example:

```text
Partition by date
Cluster by location_id or vendor_id
```

## Query cost optimization

BigQuery query cost is strongly related to the amount of data scanned.

Good practices:

- Avoid `SELECT *`
- Select only the required columns
- Use partition filters
- Use clustering when appropriate
- Check query size before running
- Prefer native tables for frequent analytical queries

Example:

```sql
SELECT
  VendorID,
  COUNT(*) AS total_trips
FROM `project.dataset.table`
WHERE pickup_date BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY VendorID;
```

## Useful commands and practices

### Check estimated query size

Before running a query in BigQuery, check how much data will be processed.

### Use partition filters

```sql
WHERE DATE(tpep_pickup_datetime) = '2021-01-01'
```

### Avoid unnecessary columns

Prefer:

```sql
SELECT VendorID, passenger_count, trip_distance
```

Instead of:

```sql
SELECT *
```

## Module goal

By the end of this module, the goal is to understand:

- What a Data Warehouse is
- How BigQuery differs from traditional databases
- How to query data stored in GCS
- When to use external tables
- When to use native tables
- How partitioning improves query efficiency
- How clustering improves query performance
- How to reduce query costs in BigQuery