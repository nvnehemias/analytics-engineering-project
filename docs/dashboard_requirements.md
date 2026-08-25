# Dashboard Requirements

## Purpose

The purpose of this dashboard is to provide a business-facing view of
Brazilian e-commerce performance using the analytics-ready dbt models
created in this project.

The dashboard will focus on three areas:

1. Executive business performance
2. Customer and seller performance
3. Delivery and operational performance

---

# Dashboard 1 — Executive Overview

## Intended Audience

Business leadership and stakeholders who need a high-level view of
sales, customers, sellers, and operational performance.

## Business Questions

- How much revenue is the business generating?
- How many orders are being placed?
- What is the average order value?
- How is sales performance changing over time?
- How many customers and sellers are represented in the business?
- How well are orders being delivered?

## KPIs

| KPI | Definition | Source Model |
|---|---|---|
| Total Orders | Total number of orders | `monthly_sales` |
| Total Revenue | Total product revenue | `monthly_sales` |
| Average Order Value | Average payment value per order | `monthly_sales` |
| Total Customers | Number of customers with orders | `customer_order_summary` |
| Total Sellers | Number of sellers with order activity | `seller_performance` |
| On-Time Delivery % | Percentage of delivered orders delivered on or before the estimated date | `delivery_performance` |

## Visualizations

### 1. Monthly Revenue Trend

**Chart:** Line chart

**X-axis:** Month

**Y-axis:** Product revenue

**Purpose:** Identify revenue trends and changes over time.

**Source:** `monthly_sales`

---

### 2. Monthly Order Volume

**Chart:** Line chart

**X-axis:** Month

**Y-axis:** Order count

**Purpose:** Understand changes in order volume over time.

**Source:** `monthly_sales`

---

### 3. Delivery Performance

**Chart:** Bar chart

**Categories:**

- Early
- On Time
- Late
- Unknown

**Purpose:** Understand overall delivery performance.

**Source:** `delivery_performance`

---

### 4. Top Sellers

**Chart:** Horizontal bar chart

**Dimension:** Seller

**Metric:** Product revenue

**Display:** Top 10 sellers

**Purpose:** Identify sellers generating the most revenue.

**Source:** `seller_performance`

---

### 5. Top Customers

**Chart:** Horizontal bar chart

**Dimension:** Customer

**Metric:** Total spend

**Display:** Top 10 customers

**Purpose:** Identify customers with the highest recorded spend.

**Source:** `customer_order_summary`

---

# Dashboard 2 — Customer & Seller Analysis

## Business Questions

- Which customers generate the most revenue?
- How frequently do customers place orders?
- What is the average customer spend?
- Which sellers generate the most revenue?
- Which sellers process the most orders?
- How does seller performance vary?

## Customer Visualizations

### Customer Revenue Distribution

**Chart:** Bar chart

**Metric:** Total customer spend

**Purpose:** Understand customer revenue concentration.

**Source:** `customer_order_summary`

### Orders per Customer

**Chart:** Distribution or bar chart

**Metric:** Order count

**Purpose:** Understand customer purchasing frequency.

**Source:** `customer_order_summary`

## Seller Visualizations

### Seller Revenue

**Chart:** Horizontal bar chart

**Metric:** Total product revenue

**Purpose:** Compare seller revenue performance.

**Source:** `seller_performance`

### Seller Order Volume

**Chart:** Horizontal bar chart

**Metric:** Order count

**Purpose:** Compare seller order activity.

**Source:** `seller_performance`

---

# Dashboard 3 — Delivery & Operations

## Business Questions

- How long does delivery typically take?
- Are orders arriving earlier or later than expected?
- What percentage of orders arrive on time?
- Which periods experience the most delivery delays?

## KPIs

| KPI | Definition | Source Model |
|---|---|---|
| Average Delivery Days | Average calendar days from purchase to delivery | `delivery_performance` |
| Average Estimated Delivery Days | Average expected delivery duration | `delivery_performance` |
| On-Time Delivery % | Percentage delivered on or before estimate | `delivery_performance` |
| Late Orders | Number of orders delivered after estimate | `delivery_performance` |

## Visualizations

### 1. Delivery Category

**Chart:** Bar chart

**Categories:**

- Early
- On Time
- Late
- Unknown

**Purpose:** Show overall delivery performance.

---

### 2. Delivery Time Distribution

**Chart:** Histogram

**Metric:** Delivery days

**Purpose:** Understand the distribution of actual delivery times.

---

### 3. Delivery Performance Over Time

**Chart:** Line chart

**X-axis:** Month

**Metric:** On-time delivery percentage

**Purpose:** Identify changes in delivery performance over time.

---

# Dashboard Filters

Potential dashboard-level filters:

- Order date
- Order status
- Customer state
- Seller state
- Delivery category

Filters should only be added where they provide meaningful analytical value.

---

# Data Sources

The dashboard should use the following dbt analytics models:

- `monthly_sales`
- `customer_order_summary`
- `seller_performance`
- `delivery_performance`

The dashboard should not directly query the raw source tables.

---

# Metric Definitions

## Total Revenue

Total product revenue generated from order items.

Source:

`monthly_sales`

---

## Average Order Value

Average recorded payment value per order.

Source:

`monthly_sales`

---

## Total Spend

Total recorded payment value associated with a customer.

Source:

`customer_order_summary`

---

## On-Time Delivery

An order is considered on time when the actual delivery date is on or before the estimated delivery date.

Source:

`delivery_performance`

---

## Days Late

Actual delivery date minus estimated delivery date.

- Negative = delivered early
- Zero = delivered on time
- Positive = delivered late

Source:

`delivery_performance`

---

# Dashboard Design Principles

The dashboard should:

- Prioritize business questions over decorative visuals.
- Use consistent metric definitions.
- Use the dbt analytics layer as the primary data source.
- Avoid unnecessary charts.
- Clearly distinguish revenue, orders, customers, sellers, and operational metrics.
- Make important KPIs visible without requiring excessive interaction.
- Maintain a clean and professional visual design.