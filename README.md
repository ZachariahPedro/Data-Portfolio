# Zachariah Pedro Data Analysis Portfolio
This portfolio contains projects demonstatrating data analysis profeciency with a number of tools. Each project has a README which explains the project, these are included below as well. 


## Contents
- [Python & Tableau Project](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/Pandas_Tableau_Project)
  - [Screenshots](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/Pandas_Tableau_Project/Dashboard%20Screenshots)
  - Tableau Dashboard
  - Python/Pandas EDA
- [SQL & Excel Project](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/SQL_Project)
  - [Screenshots](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/SQL_Project/Screenshots)
  - SQL Queries
  - Excel Sheets


	  
---
# Online Retail II — Python + Tableau
[Screenshots](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/Pandas_Tableau_Project/Dashboard%20Screenshots)

This project cleans and analyzes the Online Retail II dataset in Python and presents insights in 
a Tableau dashboard. It’s designed to show practical data-wrangling, exploratory analysis, and 
stakeholder-ready visual storytelling.



### What this demonstrates:

- Data cleaning & feature engineering (pandas, numpy)

- Exploratory analysis & visuals (matplotlib)

- Business metrics: revenue trends, product performance, cohort & RFM-style customer views

- Dashboarding: interactive KPIs and drill-downs in Tableau



### Includes:
- `Online_Retail_Analysis.ipynb`
- `Online_Retail_Dashboard.twbx`
- `requirements.txt`
- Screenshots
	- `Revenue Mode.png`
	- `Units Sold Mode.png`
	- `Sep Oct Nov Select.png`

## Required 
#### - Tableau
#### - VSCode (Recommended)
#### - [Online Retail II from Kaggle](https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset)

## How To Run


  [Download Online Retail II from Kaggle](https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset)

  Place the file in folder: Pandas_Tableau_Project



### Set-Up the notebook (VS Code)


#### Windows

    python -m venv .venv

    .\.venv\Scripts\Activate.ps1

    pip install -r requirements.txt

    python -m ipykernel install --user --name online-retail

 

#### macOS/Linux

    python -m venv .venv

    source .venv/bin/activate

    pip install -r requirements.txt

    python -m ipykernel install --user --name online-retail



### Open the Tableau dashboard

   Open with Tableau `Online_Retail_Dashboard.twbx` 

---


# Northwind Database — SQL
[Screenshots](https://github.com/ZachariahPedro/Data-Portfolio/tree/main/SQL_Project/Screenshots)

This project investigates late shipment complaints using the Northwind sample database. The analysis focuses on identifying shipment delays, quantifying their impact on revenue and freight costs, and uncovering patterns related to customers, shippers, and seasonality.



### What this demonstrates:

- Data preparation & cleaning in SQL – combining multiple tables, handling missing dates, and creating calculated fields.

- Analytical SQL queries – grouping, filtering, and using CASE statements for business logic.

- Business impact awareness – translating delays into metrics like revenue at risk and freight costs.

- Reproducibility & documentation – use of views and clear query structure so other analysts can reuse and extend the work.

- Communication skills – ability to turn SQL outputs into insights that matter to operations and sales stakeholders.



### Includes:
- `Northwind_Shipments.sql`
- Screenshots Folder
	- `customer_shipper_late_summary.png`
	- `shipper_late_bytime.png`
- Excel Folder
	- `customer_shipper_late_summary.xlsx`	
	- `shipper_late_bytime.xlsx`

## Required 
#### - SQLite3
#### - VSCode (Recommended)
#### - [Northwind Database](https://github.com/jpwhite3/northwind-SQLite3)

## How To Run

  See previews and screenshots on Github

  or

  Download the folder SQL_Project


  Run `Northwind_Shipments.sql` with SQLite3 in your preferred medium



