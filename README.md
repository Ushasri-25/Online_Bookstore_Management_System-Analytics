# 📚 Online_Bookstore_Management_System-Analytics

> **A comprehensive retail intelligence system for a bookstore — analysing inventory, customers, orders, returns, and reviews using Python & Pandas.**
<br/>
[![Dataset](https://img.shields.io/badge/📦%20Datasets-5%20CSV%20Files-blue)](./data/)
[![Records](https://img.shields.io/badge/📊%20Records-444%20Total-blueviolet)](#-dataset-overview)
[![Revenue](https://img.shields.io/badge/💰%20Revenue%20Tracked-INR%201%2C76%2C689-success)](#-key-findings)

</div>

---

## 📑 Table of Contents

- [📖 Project Overview](#-project-overview)
- [📁 Repository Structure](#-repository-structure)
- [📦 Dataset Overview](#-dataset-overview)
- [🔗 Entity Relationship](#-entity-relationship)
- [📊 Key Findings](#-key-findings)
- [🚀 Getting Started](#-getting-started)
- [📈 Analysis Modules](#-analysis-modules)
- [💡 Business Insights](#-business-insights)
- [🛠️ Tech Stack](#️-tech-stack)
- [📄 Documentation](#-documentation)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)

---

## 📖 Project Overview

The **BookStore Analytics** project is an end-to-end data analysis pipeline built on five interrelated datasets representing a real-world Indian online bookstore. It covers the full customer lifecycle — from catalog browsing and purchase to review and return — enabling data-driven decisions on inventory, pricing, customer engagement, and fulfilment.

### 🎯 Objectives

| # | Objective |
|---|-----------|
| 1 | 🗂️ Consolidate multi-source retail data into a unified structure |
| 2 | 📈 Identify top-performing books, categories, and revenue trends |
| 3 | 👤 Profile customer demographics and purchase behaviour |
| 4 | 💳 Analyse order fulfilment, payment methods, and coupon effectiveness |
| 5 | 🔄 Examine return patterns to reduce losses |
| 6 | ⭐ Leverage customer reviews for product quality insights |

---

## 📁 Repository Structure

```
bookstore-analytics/
│
├── 📂 data/
│   ├── Books.csv               # Book catalog (25 titles)
│   ├── customers.csv           # Customer profiles (60 records)
│   ├── Orders.csv              # Sales transactions (150 orders)
│   ├── Returns.csv             # Return & refund records (9 entries)
│   └── Reviews_1.csv          # Customer reviews (200 reviews)
│
├── 📂 notebooks/
│   ├── 01_books_analysis.ipynb
│   ├── 02_customer_analysis.ipynb
│   ├── 03_orders_revenue.ipynb
│   ├── 04_returns_analysis.ipynb
│   └── 05_reviews_sentiment.ipynb
│
├── 📂 docs/
│   └── BookStore_Project_Documentation.docx
│
├── 📂 outputs/
│   └── (generated charts & reports)
│
├── requirements.txt
├── README.md
└── LICENSE
```

---

## 📦 Dataset Overview

| # | 📄 File | 🗃️ Records | 🔑 Primary Key | 📋 Description |
|---|---------|-----------|----------------|----------------|
| 1 | `Books.csv` | 25 | `Book_Id` | Catalog with pricing, ratings & stock info |
| 2 | `customers.csv` | 60 | `Customer_Id` | Demographics, membership & preferences |
| 3 | `Orders.csv` | 150 | `Order_Id` | Transactions, payment & fulfilment status |
| 4 | `Returns.csv` | 9 | `Return_Id` | Return reasons, refund amounts & status |
| 5 | `Reviews_1.csv` | 200 | `Review_Id` | Star ratings, review text & helpful votes |

### 📘 Books Dataset — Key Fields
| Field | Type | Description |
|-------|------|-------------|
| `Book_Id` | String | Unique identifier (B101–B125) |
| `Category` | String | Fiction, Self-Help, Business, Technology, etc. |
| `Sale_Price_Inr` | Float | Discounted price in INR |
| `Avg_Rating` | Float | Average rating out of 5 |
| `Is_Bestseller` | String | Yes / No |

### 👥 Customers Dataset — Key Fields
| Field | Type | Description |
|-------|------|-------------|
| `Customer_Id` | String | Unique identifier (C001–C060) |
| `Membership` | String | Free / Silver / Gold / Platinum |
| `Preferred_Category` | String | Favourite book genre |
| `Registration_Date` | Date | Account creation date |

### 🛒 Orders Dataset — Key Fields
| Field | Type | Description |
|-------|------|-------------|
| `Order_Id` | Integer | Unique order number |
| `Payment_Method` | String | UPI, Credit Card, Debit Card, etc. |
| `Order_Status` | String | Delivered / Shipped / Cancelled / Returned |
| `Coupon_Used` | String | Coupon code or 'No Coupon' |

---

## 🔗 Entity Relationship

```
┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│   CUSTOMERS │       │    ORDERS   │       │    BOOKS    │
│─────────────│       │─────────────│       │─────────────│
│ Customer_Id │◄──────│ Customer_Id │──────►│  Book_Id    │
│ Name        │       │ Order_Id    │       │  Title      │
│ Membership  │       │ Total_Amount│       │  Category   │
│ City/State  │       │ Pay_Method  │       │  Sale_Price │
└─────────────┘       │ Status      │       └──────┬──────┘
                      └──────┬──────┘              │
                             │                     │
               ┌─────────────▼──────┐   ┌──────────▼──────┐
               │      RETURNS       │   │     REVIEWS      │
               │────────────────────│   │─────────────────-│
               │  Return_Id         │   │  Review_Id       │
               │  Order_Id (FK)     │   │  Book_Id (FK)    │
               │  Refund_Amount     │   │  Customer_Id(FK) │
               │  Refund_Status     │   │  Rating (1–5)    │
               └────────────────────┘   └─────────────────-┘
```

---

## 📊 Key Findings

### 💰 Revenue & Orders

| Metric | Value |
|--------|-------|
| 📦 Total Orders | 150 |
| 💵 Total Revenue | INR 1,76,689.30 |
| 🧾 Avg Order Value | INR 1,177.93 |
| ✅ Delivery Success Rate | 62.0% |
| ❌ Cancellation Rate | 8.7% |
| 🔄 Return Rate | 6.0% |

### 📅 Monthly Revenue Trend

```
Jan 2025  ████████████████░░░░  INR 26,692
Feb 2025  ████████████████████  INR 30,077
Mar 2025  ████████████████████████  INR 33,131
Apr 2025  ██████████████████████████  INR 34,624  ← Peak
May 2025  ██████████████░░░░░░  INR 24,861  ← Dip
Jun 2025  █████████████████░░░  INR 27,301
```

### 📚 Top 5 Best-Selling Books

| Rank | 📖 Book | 🏷️ Category | 📦 Units Sold |
|------|---------|-------------|--------------|
| 🥇 | Harry Potter and the Sorcerer's Stone | Fiction | 27 |
| 🥇 | SQL for Beginners | Technology | 27 |
| 🥉 | Think and Grow Rich | Business | 21 |
| 4️⃣ | Data Structures in C++ | Technology | 21 |
| 5️⃣ | Rich Dad Poor Dad | Business | 20 |

### ⭐ Top Rated Books

| Book Title | Rating |
|------------|--------|
| The 5 AM Club | ⭐⭐⭐⭐⭐ 5.0 |
| Think and Grow Rich | ⭐⭐⭐⭐⭐ 4.9 |
| The Subtle Art of Not Giving a F*ck | ⭐⭐⭐⭐⭐ 4.9 |
| Atomic Habits | ⭐⭐⭐⭐⭐ 4.8 |
| God of Small Things | ⭐⭐⭐⭐⭐ 4.8 |

### 👥 Customer Demographics

```
Membership Tiers          Gender Split
─────────────────         ────────────
Free       ▓▓▓▓▓▓▓  33%   Male    50%  👨
Silver     ▓▓▓▓▓    25%   Female  50%  👩
Gold       ▓▓▓▓▓    23%
Platinum   ▓▓▓▓     18%   Age Range: 19–45 yrs (avg 31.4)
```

### 💳 Payment Methods

| Method | Orders | Share |
|--------|--------|-------|
| 💳 Debit Card | 31 | 20.7% |
| 💳 Credit Card | 28 | 18.7% |
| 📱 UPI | 25 | 16.7% |
| 💵 Cash on Delivery | 25 | 16.7% |
| 🏦 Net Banking | 21 | 14.0% |
| 👛 Wallet | 20 | 13.3% |

### 🔄 Returns Analysis

| Return Reason | Count |
|---------------|-------|
| 🤔 Changed my mind | 3 |
| ❓ Not as described | 2 |
| 🖱️ Accidental purchase | 2 |
| 📦 Damaged on arrival | 1 |
| 🔁 Duplicate order | 1 |

---
-----
## 📈 Analysis Modules

| 🔢 Module | 📓 Notebook | 📌 Focus Area |
|-----------|------------|---------------|
| 1 | `01_books_analysis.ipynb` | Catalog overview, pricing, ratings, bestsellers |
| 2 | `02_customer_analysis.ipynb` | Demographics, membership, geography |
| 3 | `03_orders_revenue.ipynb` | Revenue trends, payment methods, coupons |
| 4 | `04_returns_analysis.ipynb` | Return reasons, refund status, loss analysis |
| 5 | `05_reviews_sentiment.ipynb` | Rating distribution, verified reviews, helpful votes |

---

## 💡 Business Insights

### ✅ Strengths
- 📈 Steady revenue growth from January to April 2025 (+29.7%)
- 📚 68% of catalog flagged as bestsellers — well-curated inventory
- 💳 6 payment methods reduce checkout friction significantly
- ✔️ 73% of reviews are verified purchases — high review credibility
- ⚖️ Perfect 50/50 gender balance enables unbiased marketing

### 🚀 Opportunities
- 🎯 33% of customers on Free tier — prime targets for upgrade campaigns
- 🏷️ WELCOME20 & SUMMER15 coupons drove 37% of orders — seasonal promotions are effective
- 📖 Education & Biography are the most-preferred categories but have only 3 catalog titles — **high restocking priority**
- 🌍 South Indian cities dominate — regional language (Telugu/Tamil) cataloging could boost reach

### ⚠️ Areas for Improvement
- 📉 May 2025 dip of -28.2% warrants investigation (marketing gap or seasonal slump)
- ❌ 8.7% payment failure rate needs technical review
- 🔴 55.6% refund rejection rate may be harming customer trust
- 📝 Avoidable returns ("changed my mind", "accidental purchase") — better product descriptions needed

---

## 🛠️ Tech Stack

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c?style=flat-square&logo=python&logoColor=white)
![Seaborn](https://img.shields.io/badge/Seaborn-4c72b0?style=flat-square&logo=python&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white)
![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white)

| Library | Version | Purpose |
|---------|---------|---------|
| `pandas` | 2.0+ | Data manipulation & aggregation |
| `numpy` | 1.24+ | Numerical operations |
| `matplotlib` | 3.7+ | Chart & plot generation |
| `seaborn` | 0.12+ | Statistical visualisations |
| `jupyter` | 1.0+ | Interactive notebooks |

---

## 📄 Documentation

The full project documentation is available as a formatted Word report:

📥 **[Download BookStore_Project_Documentation.docx](./docs/BookStore_Project_Documentation.docx)**

The documentation includes:
- 📊 Executive Summary with KPI cards
- 🗂️ Dataset schema & field descriptions
- 🔗 Entity relationship diagram
- 📈 Monthly revenue trends
- 👥 Customer & demographic analysis
- 🔄 Returns & refund log
- ⭐ Reviews sentiment breakdown
- 💡 Business recommendations

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

```bash
# 1. Fork the repository
# 2. Create a feature branch
git checkout -b feature/your-feature-name

# 3. Commit your changes
git commit -m "✨ Add: your feature description"

# 4. Push and open a Pull Request
git push origin feature/your-feature-name
```

### 📌 Commit Message Convention

| Emoji | Type |
|-------|------|
| ✨ | New feature |
| 🐛 | Bug fix |
| 📊 | Data update |
| 📝 | Documentation |
| 🔧 | Configuration |
| 🎨 | Style/formatting |

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](./LICENSE) file for details.

---

<div align="center">

Made with ❤️ by the **BookStore Analytics Team**

⭐ **Star this repo** if you found it useful!

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=bookstore-analytics)

</div>
