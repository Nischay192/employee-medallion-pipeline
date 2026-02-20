# Employee Medallion Architecture Pipeline

## Overview
Production-style Databricks data pipeline implementing Bronze, Silver, and Gold layers
using Delta Lake, CDC ingestion, and SCD Type 2 modeling.

## Architecture
Bronze → Silver → Gold

## Bronze Layer
- Raw CDC ingestion
- Insert, update, and delete tracking

## Silver Layer
- Clean employee snapshot
- SCD Type 2 history tracking
- Soft delete handling

## Gold Layer
- Active employee metrics by department
- Average salary analytics
- Deleted employee insights

## Technologies
- Databricks
- Delta Lake
- Spark SQL
