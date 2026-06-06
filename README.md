<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=1F4E79&height=200&section=header&text=BookStore%20Analytics&fontSize=52&fontColor=ffffff&fontAlignY=38&desc=End-to-End%20Retail%20Data%20Analysis%20%7C%20Python%20%7C%20Pandas%20%7C%20Jupyter&descAlignY=58&descSize=16" width="100%" alt="BookStore Analytics Banner"/>

</div>

<div align="center">

[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![Pandas](https://img.shields.io/badge/Pandas-2.0+-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org)
[![NumPy](https://img.shields.io/badge/NumPy-1.24+-013243?style=for-the-badge&logo=numpy&logoColor=white)](https://numpy.org)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?style=for-the-badge&logo=jupyter&logoColor=white)](https://jupyter.org)
[![Matplotlib](https://img.shields.io/badge/Matplotlib-3.7+-11557c?style=for-the-badge&logo=python&logoColor=white)](https://matplotlib.org)
[![License](https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](./LICENSE)
[![Status](https://img.shields.io/badge/Status-Complete-1F4E79?style=for-the-badge&logo=checkmarx&logoColor=white)](#)

<br/>

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/YOUR_USERNAME/bookstore-analytics/blob/main/notebooks/01_books_analysis.ipynb)
&nbsp;
[![View Notebooks](https://img.shields.io/badge/View-Notebooks-orange?logo=jupyter)](https://github.com/YOUR_USERNAME/bookstore-analytics/tree/main/notebooks)
&nbsp;
[![Download Docs](https://img.shields.io/badge/Download-Documentation-blue?logo=microsoftword)](./docs/BookStore_Project_Documentation.docx)

<br/>

<p align="center">
  <b>A production-grade data analytics pipeline for an Indian online bookstore</b><br/>
  Covering inventory · customers · sales · returns · reviews — all in one place.
</p>

> 💡 **Key Result:** Revenue grew **+29.7%** from Jan → Apr 2025, peaking at ₹34,624.
> Education & Biography are the **#1 preferred customer categories** yet have only 3 catalog titles — a clear restocking opportunity.

<br/>

[📊 Key Findings](#-key-findings) &nbsp;·&nbsp; [🚀 Get Started](#-getting-started) &nbsp;·&nbsp; [📦 Datasets](#-dataset-overview) &nbsp;·&nbsp; [💡 Insights](#-business-insights) &nbsp;·&nbsp; [📄 Docs](#-documentation)

</div>

---

## 📌 Table of Contents

1. [About the Project](#-about-the-project)
2. [Dataset Overview](#-dataset-overview)
3. [Project Structure](#-project-structure)
4. [Entity Relationship](#-entity-relationship)
5. [Key Findings](#-key-findings)
6. [Getting Started](#-getting-started)
7. [Analysis Modules](#-analysis-modules)
8. [Tech Stack](#-tech-stack)
9. [Business Insights](#-business-insights)
10. [Documentation](#-documentation)
11. [Contributing](#-contributing)
12. [License](#-license)

---

## 🧭 About the Project

**BookStore Analytics** is an end-to-end data analysis pipeline built on five interrelated CSV datasets representing a real-world Indian online bookstore. It covers the complete customer lifecycle — from catalog browsing and purchase to review submission and return processing.

| Goal | Description |
|------|-------------|
| 🗂️ **Unify Data** | Consolidates 5 CSV sources into an integrated analytics view |
| 📈 **Revenue Trends** | Tracks monthly sales performance and average order values |
| 👥 **Customer Profiling** | Segments customers by age, city, membership, and preferences |
| 💳 **Payment Analysis** | Evaluates payment methods, coupon usage, and failure rates |
| 🔄 **Returns Tracking** | Identifies return reasons, refund outcomes, and loss patterns |
| ⭐ **Review Intelligence** | Analyses star ratings, verified reviews, and helpful vote trends |

---

## 📦 Dataset Overview

Five CSV files form the core of this project, all linked via shared keys (`Book_Id`, `Customer_Id`, `Order_Id`).

| # | 📄 File | 📊 Records | 🔑 Primary Key | 📋 Description |
|---|---------|-----------|----------------|----------------|
| 1 | `Books.csv` | 25 | `Book_Id` | Titles, categories, pricing, ratings, stock, bestseller flag |
| 2 | `customers.csv` | 60 | `Customer_Id` | Name, age, gender, city, membership tier, preferred genre |
| 3 | `Orders.csv` | 150 | `Order_Id` | Date, quantities, payment method, order & payment status |
| 4 | `Returns.csv` | 9 | `Return_Id` | Return reason, refund amount, method, and status |
| 5 | `Reviews_1.csv` | 200 | `Review_Id` | Rating (1–5), review text, helpful votes, verified flag |

<details>
<summary><b>📘 Books.csv — Full Field Reference</b></summary>
<br/>

| Field | Type | Description |
|-------|------|-------------|
| `Book_Id` | String | Unique book code (B101–B125) |
| `Book_Title` | String | Title of the book |
| `Author` | String | Author name |
| `Category` | String | Fiction / Self-Help / Business / Technology / Education / Biography / History |
| `Publication_Year` | Integer | Year published |
| `Publisher` | String | Publishing house |
| `Language` | String | English / Hindi / Tamil |
| `Pages` | Integer | Total page count |
| `Unit_Price_Inr` | Float | Original MRP (INR) |
| `Discount_Pct` | Float | Discount percentage applied |
| `Sale_Price_Inr` | Float | Final sale price after discount (INR) |
| `Stock_Quantity` | Integer | Units available in inventory |
| `Avg_Rating` | Float | Average star rating out of 5.0 |
| `Num_Reviews` | Integer | Total number of reviews received |
| `Is_Bestseller` | String | Yes / No |

</details>

<details>
<summary><b>👥 customers.csv — Full Field Reference</b></summary>
<br/>

| Field | Type | Description |
|-------|------|-------------|
| `Customer_Id` | String | Unique customer code (C001–C060) |
| `Customer_Name` | String | Full name |
| `Gender` | String | Male / Female |
| `Age` | Integer | Customer age in years |
| `Email` | String | Contact email address |
| `Phone Number` | String | Contact phone number |
| `City` | String | City of residence |
| `State` | String | State of residence |
| `Registration_Date` | Date | Account creation date (YYYY-MM-DD) |
| `Membership` | String | Free / Silver / Gold / Platinum |
| `Preferred_Category` | String | Customer's favourite book genre |

</details>

<details>
<summary><b>🛒 Orders.csv — Full Field Reference</b></summary>
<br/>

| Field | Type | Description |
|-------|------|-------------|
| `Order_Id` | Integer | Unique order number |
| `Order_Date` | Date | Date order was placed |
| `Customer_Id` | String | FK → customers.csv |
| `Book_Id` | String | FK → Books.csv |
| `Quantity_Ordered` | Integer | Number of copies ordered |
| `Total_Amount_Inr` | Float | Total order value (INR) |
| `Payment_Method` | String | UPI / Credit Card / Debit Card / Wallet / Net Banking / COD |
| `Payment_Status` | String | Success / Failed / Pending |
| `Order_Status` | String | Delivered / Shipped / Processing / Cancelled / Returned / Pending |
| `Coupon_Used` | String | Coupon code applied or `No Coupon` |

</details>

<details>
<summary><b>🔄 Returns.csv — Full Field Reference</b></summary>
<br/>

| Field | Type | Description |
|-------|------|-------------|
| `Return_Id` | String | Unique return code (RET0001–) |
| `Order_Id` | Integer | FK → Orders.csv |
| `Customer_Id` | String | FK → customers.csv |
| `Customer_Name` | String | Customer full name |
| `Book_Id` | String | FK → Books.csv |
| `Book_Title` | String | Title of returned book |
| `Category` | String | Book category |
| `Purchase_Date` | Date | Original purchase date |
| `Return_Date` | Date | Date return was initiated |
| `Days_To_Return` | Integer | Days elapsed between purchase and return |
| `Return_Reason` | String | Changed mind / Damaged / Not as described / Accidental / Duplicate |
| `Original_Amount_Inr` | Float | Amount originally paid (INR) |
| `Refund_Amount_Inr` | Float | Refund amount issued (INR) |
| `Refund_Method` | String | Store Credit / Original Payment |
| `Refund_Status` | String | Processed / Rejected / Pending |
| `Return_Condition` | String | Acceptable / Damaged |

</details>

<details>
<summary><b>⭐ Reviews_1.csv — Full Field Reference</b></summary>
<br/>

| Field | Type | Description |
|-------|------|-------------|
| `Review_Id` | String | Unique review code (REV0001–) |
| `Book_Id` | String | FK → Books.csv |
| `Book_Title` | String | Title of reviewed book |
| `Category` | String | Book category |
| `Customer_Id` | String | FK → customers.csv |
| `Customer_Name` | String | Reviewer name |
| `Rating` | Integer | Star rating (1–5) |
| `Review_Text` | String | Free-text review content |
| `Review_Date` | Date | Date review was submitted |
| `Helpful_Votes` | Integer | Number of users who found review helpful |
| `Verified_Purchase` | String | Yes / No — whether reviewer bought the book |

</details>

---

## 📁 Project Structure

```
bookstore-analytics/
│
├── 📂 data/                          # Raw CSV datasets
│   ├── Books.csv                     # 25 books
│   ├── customers.csv                 # 60 customers
│   ├── Orders.csv                    # 150 orders
│   ├── Returns.csv                   # 9 returns
│   └── Reviews_1.csv                 # 200 reviews
│
├── 📂 notebooks/                     # Jupyter analysis notebooks
│   ├── 01_books_analysis.ipynb
│   ├── 02_customer_analysis.ipynb
│   ├── 03_orders_revenue.ipynb
│   ├── 04_returns_analysis.ipynb
│   └── 05_reviews_analysis.ipynb
│
├── 📂 docs/                          # Project documentation
│   └── BookStore_Project_Documentation.docx
│
├── 📂 assets/                        # Images and static files
│   └── banner.png
│
├── 📂 outputs/                       # Generated charts and exports
│   └── charts/
│
├── requirements.txt                  # Python dependencies
├── README.md                         # You are here
└── LICENSE                           # MIT License
```

---

## 🔗 Entity Relationship

```
┌─────────────────────┐        ┌──────────────────────┐        ┌─────────────────────┐
│      CUSTOMERS      │        │        ORDERS         │        │        BOOKS        │
│─────────────────────│        │──────────────────────-│        │─────────────────────│
│ Customer_Id  (PK) ◄─┼────────┤ Customer_Id  (FK)     │        │ Book_Id  (PK)       │
│ Customer_Name       │        │ Order_Id  (PK)         ├───────►│ Book_Title          │
│ Age / Gender        │        │ Book_Id  (FK)          │        │ Author / Category   │
│ City / State        │        │ Total_Amount_Inr       │        │ Sale_Price_Inr      │
│ Membership          │        │ Payment_Method         │        │ Avg_Rating          │
│ Preferred_Category  │        │ Order_Status           │        │ Is_Bestseller       │
└─────────────────────┘        └──────────┬─────────────┘        └──────────┬──────────┘
                                           │                                 │
                               ┌───────────▼─────────────┐    ┌─────────────▼───────────┐
                               │         RETURNS          │    │         REVIEWS         │
                               │─────────────────────────-│    │─────────────────────────│
                               │ Return_Id  (PK)          │    │ Review_Id  (PK)         │
                               │ Order_Id  (FK)           │    │ Book_Id  (FK)           │
                               │ Customer_Id  (FK)        │    │ Customer_Id  (FK)       │
                               │ Return_Reason            │    │ Rating  (1–5 stars)     │
                               │ Refund_Amount_Inr        │    │ Review_Text             │
                               │ Refund_Status            │    │ Verified_Purchase       │
                               └──────────────────────────┘    └─────────────────────────┘
```

---

## 📊 Key Findings

### 💰 Revenue at a Glance

| Metric | Value | Status |
|--------|-------|--------|
| 📦 Total Orders | 150 | — |
| 💵 Total Revenue | ₹ 1,76,689.30 | — |
| 🧾 Avg Order Value | ₹ 1,177.93 | — |
| ✅ Delivered Orders | 93 (62.0%) | 🟢 Good |
| ❌ Cancelled Orders | 13 (8.7%) | 🟡 Monitor |
| 🔄 Return Rate | 6.0% | 🟡 Monitor |
| 💳 Payment Success | 132 / 150 (88%) | 🟢 Good |
| ❌ Payment Failures | 13 (8.7%) | 🔴 Needs fix |

---

### 📅 Monthly Revenue — Jan to Jun 2025

```
  Month       Revenue         Trend
  ─────────────────────────────────────────────────────
  Jan 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░  ₹ 26,692   Baseline
  Feb 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░  ₹ 30,077   +12.7% ↑
  Mar 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░  ₹ 33,131   +10.2% ↑
  Apr 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░  ₹ 34,624   +4.5%  ↑  ← PEAK
  May 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░  ₹ 24,861   -28.2% ↓  ← DIP
  Jun 2025  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░  ₹ 27,301   +9.8%  ↑
```

---

### 📚 Top 5 Best-Selling Books

| Rank | Book Title | Category | Units Sold |
|:----:|-----------|:--------:|:----------:|
| 🥇 | Harry Potter and the Sorcerer's Stone | Fiction | **27** |
| 🥇 | SQL for Beginners | Technology | **27** |
| 🥉 | Think and Grow Rich | Business | **21** |
| 4️⃣ | Data Structures in C++ | Technology | **21** |
| 5️⃣ | Rich Dad Poor Dad | Business | **20** |

---

### ⭐ Top Rated Books

| Book Title | Category | Rating |
|-----------|:--------:|:------:|
| The 5 AM Club | Self-Help | ⭐⭐⭐⭐⭐ **5.0** |
| Think and Grow Rich | Business | ⭐⭐⭐⭐⭐ **4.9** |
| The Subtle Art of Not Giving a F*ck | Self-Help | ⭐⭐⭐⭐⭐ **4.9** |
| Atomic Habits | Self-Help | ⭐⭐⭐⭐⭐ **4.8** |
| God of Small Things | Fiction | ⭐⭐⭐⭐⭐ **4.8** |

---

### 👥 Customer Snapshot

```
  MEMBERSHIP TIERS                    PREFERRED CATEGORIES
  ──────────────────────────────      ──────────────────────────────────
  🆓 Free       ▓▓▓▓▓▓▓▓▓▓▓  33%     📖 Education    ▓▓▓▓▓▓▓▓▓▓▓▓  12
  🥈 Silver     ▓▓▓▓▓▓▓▓     25%     📔 Biography    ▓▓▓▓▓▓▓▓▓▓▓▓  12
  🥇 Gold       ▓▓▓▓▓▓▓      23%     📜 History      ▓▓▓▓▓▓▓▓▓▓    10
  💎 Platinum   ▓▓▓▓▓▓       18%     💭 Self-Help    ▓▓▓▓▓▓▓▓       8
                                      💼 Business     ▓▓▓▓▓▓▓▓       8

  Age Range: 19 – 45 yrs  |  Avg Age: 31.4  |  Gender: 50% ♂ / 50% ♀
  Top Cities: Coimbatore (6) · Vijayawada (5) · Chandigarh (5)
```

---

### 💳 Payment Methods

| Method | Orders | Share | Bar |
|--------|:------:|:-----:|-----|
| 💳 Debit Card | 31 | 20.7% | `████████████` |
| 💳 Credit Card | 28 | 18.7% | `███████████` |
| 📱 UPI | 25 | 16.7% | `██████████` |
| 💵 Cash on Delivery | 25 | 16.7% | `██████████` |
| 🏦 Net Banking | 21 | 14.0% | `████████` |
| 👛 Wallet | 20 | 13.3% | `████████` |

---

### 🔄 Returns Summary

| Return Reason | Count | Share |
|---------------|:-----:|:-----:|
| 🤔 Changed my mind | 3 | 33.3% |
| ❓ Not as described | 2 | 22.2% |
| 🖱️ Accidental purchase | 2 | 22.2% |
| 📦 Damaged on arrival | 1 | 11.1% |
| 🔁 Duplicate order | 1 | 11.1% |

| Refund Status | Count | Rate |
|---------------|:-----:|:----:|
| ✅ Processed | 3 | 33.3% |
| ❌ Rejected | 5 | 55.6% |
| ⏳ Pending | 1 | 11.1% |

> ⚠️ **Note:** The 55.6% refund rejection rate is unusually high and warrants a policy review.

---

### ⭐ Reviews Summary

| Metric | Value |
|--------|-------|
| Total Reviews | 200 |
| Average Rating | ⭐ 3.78 / 5.0 |
| Verified Purchases | 146 (73%) |
| Avg Helpful Votes | 71.8 per review |
| 5-star reviews | 70 (35%) |
| 4-star reviews | 66 (33%) |
| 1–3 star reviews | 64 (32%) |

---

## 🚀 Getting Started

### ✅ Prerequisites

- Python **3.10+**
- `pip` or `conda`

### 📥 Installation

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/bookstore-analytics.git
cd bookstore-analytics

# 2. Create and activate a virtual environment
python -m venv venv
source venv/bin/activate          # macOS / Linux
venv\Scripts\activate             # Windows

# 3. Install all dependencies
pip install -r requirements.txt

# 4. Launch Jupyter
jupyter notebook notebooks/
```

### 📋 requirements.txt

```
pandas>=2.0.0
numpy>=1.24.0
matplotlib>=3.7.0
seaborn>=0.12.0
jupyter>=1.0.0
openpyxl>=3.1.0
```

> 💡 Or run directly in the cloud — no setup needed:
> [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/YOUR_USERNAME/bookstore-analytics/blob/main/notebooks/01_books_analysis.ipynb)

---

## 📈 Analysis Modules

| # | 📓 Notebook | 🔍 Focus Area | 📌 Key Outputs |
|---|------------|--------------|----------------|
| 01 | `01_books_analysis.ipynb` | Catalog, pricing, ratings, categories | Category pie chart, bestseller heatmap |
| 02 | `02_customer_analysis.ipynb` | Demographics, membership, geography | City map, age distribution, tier funnel |
| 03 | `03_orders_revenue.ipynb` | Revenue, payments, coupons, trends | Monthly line chart, payment funnel |
| 04 | `04_returns_analysis.ipynb` | Return reasons, refund status, losses | Pareto chart, refund status breakdown |
| 05 | `05_reviews_analysis.ipynb` | Ratings, verified reviews, helpful votes | Rating histogram, word cloud |

---

## 🛠️ Tech Stack

<div align="center">

| Tool | Version | Purpose |
|------|:-------:|---------|
| ![Python](https://img.shields.io/badge/-Python-3776AB?logo=python&logoColor=white&style=flat-square) | 3.10+ | Core language |
| ![Pandas](https://img.shields.io/badge/-Pandas-150458?logo=pandas&logoColor=white&style=flat-square) | 2.0+ | Data wrangling & aggregation |
| ![NumPy](https://img.shields.io/badge/-NumPy-013243?logo=numpy&logoColor=white&style=flat-square) | 1.24+ | Numerical computation |
| ![Matplotlib](https://img.shields.io/badge/-Matplotlib-11557c?logo=python&logoColor=white&style=flat-square) | 3.7+ | Charts & plots |
| ![Seaborn](https://img.shields.io/badge/-Seaborn-4c72b0?logo=python&logoColor=white&style=flat-square) | 0.12+ | Statistical visualisations |
| ![Jupyter](https://img.shields.io/badge/-Jupyter-F37626?logo=jupyter&logoColor=white&style=flat-square) | 1.0+ | Interactive notebooks |
| ![VS Code](https://img.shields.io/badge/-VS%20Code-007ACC?logo=visualstudiocode&logoColor=white&style=flat-square) | Latest | IDE |

</div>

---

## 💡 Business Insights

### ✅ Strengths
- 📈 Revenue grew **+29.7%** from January → April 2025 — strong sustained momentum
- 📚 **68% of catalog** flagged as bestsellers — well-curated, market-aligned inventory
- 💳 **6 payment methods** available — minimal checkout friction for all user types
- ✔️ **73% of reviews are verified** purchases — high credibility of rating data
- ⚖️ **Perfect 50/50 gender balance** — enables unbiased, dual-segment marketing strategy

### 🚀 Opportunities
- 🎯 **33% of customers on Free tier** — prime targets for Silver/Gold upgrade campaigns
- 🏷️ **WELCOME20 + SUMMER15** coupons drove 37% of all orders — seasonal promotions work, scale them
- 📖 **Education & Biography** are the top 2 preferred categories but represent only **3 catalog titles** — immediate restocking priority
- 🌍 **South Indian cities dominate** (Coimbatore, Vijayawada, Visakhapatnam) — regional language (Telugu/Tamil) catalog expansion can unlock demand

### ⚠️ Areas for Improvement
- 📉 **May 2025 revenue dip of −28.2%** — investigate for marketing gap, stock shortage, or seasonality
- ❌ **8.7% payment failure rate** — requires technical audit of payment gateway integration
- 🔴 **55.6% refund rejection rate** — overly strict policy likely damaging customer trust and increasing churn
- 📝 **Top 3 return reasons are avoidable** (changed mind, accidental purchase) — improved product descriptions and a purchase confirmation step can reduce these

---

## 📄 Documentation

The full project is available as a professionally formatted Word document:

📥 **[Download Project Documentation (.docx)](./docs/BookStore_Project_Documentation.docx)**

The document includes:

| Section | Content |
|---------|---------|
| 📊 Executive Summary | KPI dashboard with 8 key metrics |
| 🗂️ Dataset Schemas | Full field descriptions for all 5 tables |
| 🔗 Entity Relationships | FK mapping across all datasets |
| 📈 Revenue Analysis | Monthly trend + order breakdown |
| 👥 Customer Segments | Demographics, geography, membership |
| 🔄 Returns Log | Complete 9-record returns & refund table |
| ⭐ Review Analysis | Rating distribution & sentiment insights |
| 💡 Recommendations | Prioritised action items for the business |

---

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome!

```bash
# 1. Fork this repository
# 2. Create your feature branch
git checkout -b feature/your-feature-name

# 3. Make your changes and commit
git commit -m "✨ Add: description of your change"

# 4. Push to your branch
git push origin feature/your-feature-name

# 5. Open a Pull Request on GitHub
```

### 📌 Commit Convention

| Prefix | When to Use |
|--------|------------|
| `✨ Add:` | New feature or analysis module |
| `🐛 Fix:` | Bug or data correction |
| `📊 Data:` | Dataset update or new source |
| `📝 Docs:` | README or documentation update |
| `🔧 Config:` | Environment or config change |
| `🎨 Style:` | Formatting or visual improvement |
| `♻️ Refactor:` | Code restructure, no behaviour change |

---

## 📜 License

Distributed under the **MIT License** — see [`LICENSE`](./LICENSE) for full details.

```
MIT License  |  Copyright (c) 2025 BookStore Analytics Team
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software to use, copy, modify, merge, publish, distribute — subject
to the conditions in the LICENSE file.
```

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=1F4E79&height=100&section=footer" width="100%" alt="footer"/>

**Made with ❤️ by the BookStore Analytics Team**

If this project helped you, please consider giving it a ⭐ — it means a lot!

[![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/bookstore-analytics?style=social)](https://github.com/YOUR_USERNAME/bookstore-analytics)
[![GitHub forks](https://img.shields.io/github/forks/YOUR_USERNAME/bookstore-analytics?style=social)](https://github.com/YOUR_USERNAME/bookstore-analytics/fork)

</div>
