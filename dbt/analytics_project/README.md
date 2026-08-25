# Brazilian E-Commerce Analytics Engineering Project

## Overview

This project is an end-to-end analytics engineering pipeline built using the Brazilian E-Commerce Public Dataset by Olist.

The goal of the project is to transform raw e-commerce data into a reliable, analytics-ready data warehouse that can be used to answer business questions related to sales, customers, sellers, and delivery performance.

The project demonstrates a complete analytics engineering workflow, including data ingestion, data modeling, testing, documentation, and analytical marts.

---


## Project Architecture


```text
Olist Open Source Dataset
          |
          v
       Python
          |
          v
      PostgreSQL
          |
          v
         dbt
          |
    +-----+-----+
    |           |
    v           v
 Staging   Intermediate
    |           |
    +-----+-----+
          |
          v
      Core Marts
     /          \
Dimensions      Facts
     \          /
      +--------+
          |
          v
   Analytics Marts
    /     |      \
 Sales Customers Sellers
          |
          v
      Operations
          |
          v
    BI / Dashboard

```

### Architecture Diagram

![E-Commerce Analytics Engineering Architecture](screenshots/architecture_diagram.png)

### dbt Lineage

The dbt project uses model dependencies to create a layered transformation pipeline from source data through staging, intermediate, core, and analytics models.

![dbt Model Lineage](screenshots/dbt_lineage.png)