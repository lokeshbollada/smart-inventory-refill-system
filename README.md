# 🛒 Smart Inventory Refill & Profit Protection System  
*A SQL + Python based real-time inventory intelligence engine*

![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
![Tech](https://img.shields.io/badge/Tech-SQL%20Server%20%7C%20Python-blue)
![Type](https://img.shields.io/badge/Application-Inventory%20Optimization-orange)

---

## 📌 Project Overview  
This project solves real retail challenges such as **stockouts**, **dead stock**, and **delayed procurement** for supermarkets like **D-Mart**, **Reliance Smart**, and **Spencer’s**.

It uses SQL Server to track inventory movement and Python for basic dashboard visualization.  
The core intelligence is built inside SQL using **Views**, **Stored Procedures**, and **Forecasting Logic**.

---

## 🚀 Features Implemented

### ✅ **1. Real-Time Stock Tracking**
- Tracks all **IN / OUT / ADJUSTMENT** movements  
- Computes real-time `current_stock` using movement history

### ✅ **2. Consumption Forecasting**
- Calculates **Average Daily Usage (ADU)** using last 30 days of sales

### ✅ **3. Dynamic Reorder Point**
Formula used:  
Reorder Point = (ADU × Lead Time Days) + Safety Stock

markdown
Copy code

### ✅ **4. Reorder Recommendation Engine**
The system computes:
- `need_reorder (YES/NO)`
- `recommended_order_qty`
- `reorder_point`

### ✅ **5. Dead Stock Detection**
Flags products with **no sales in the last 60 days**.

### ✅ **6. Automated Low-Stock Alerts**
Stored procedure:
GenerateLowStockAlerts

markdown
Copy code
Creates low-stock alerts with **priority based on ABC class**.

### ✅ **7. Python + Jupyter Dashboard**
- Connects to SQL Server using `pyodbc`
- Loads the `Inventory_Refill_Recommendations` VIEW
- Visualizes:
  - Current stock
  - Reorder quantities
  - Dead stock products

---

## 🗂 Project Folder Structure

smart-inventory-refill-system/
│
├── sql/
│ ├── create_tables.sql
│ ├── insert_sample_data.sql
│ ├── create_view.sql
│ ├── stored_procedure_generate_alerts.sql
│ └── demo_queries.sql
│
├── python/
│ └── inventory_dashboard.ipynb
│
├── docs/
│ ├── Short_Project_Documentation.docx
│ ├── Project_Summary.docx
│ ├── Workflow_Diagram.docx
│ ├── Elevator_Pitch.docx
│ ├── Interview_QA.docx
│ └── Inventory_Refill_Project_Presentation.pptx
│
├── images/
│ ├── Workflow_Diagram.png
│ ├── products_table.png
│ ├── vendors_table.png
│ ├── recommendation_view.png
│ ├── alerts_table.png
│ ├── jupyter_dataframe.png
│ └── stock_chart.png
│
└── README.md

markdown
Copy code

---

## 🖼 Screenshot Gallery (Upload these in `/images` folder)

### 📌 **1. Products Table**
`/images/products_table.png`

### 📌 **2. Vendors Table**
`/images/vendors_table.png`

### 📌 **3. Inventory Recommendation Engine View**
`/images/recommendation_view.png`

### 📌 **4. Alerts Table Screenshot**
`/images/alerts_table.png`

### 📌 **5. Jupyter DataFrame Output**
`/images/jupyter_dataframe.png`

### 📌 **6. Stock Level Chart**
`/images/stock_chart.png`

### 📌 **7. Workflow Diagram**
`/images/Workflow_Diagram.png`

Add them using:


yaml
Copy code

---

## 🛠 Tech Stack

| Component | Technology |
|----------|------------|
| Database | SQL Server |
| Backend | Python (pyodbc, pandas) |
| Views & Logic | SQL Views, CTE, Aggregates |
| Automation | Stored Procedure (GenerateLowStockAlerts) |
| Dashboard | Jupyter Notebook + Matplotlib |
| Scheduling (Optional) | SQL Agent |

---