 # 📚 Online Bookstore Management System & Analytics
 ----
 
A relational dataset simulating the operations of an Indian online bookstore, covering inventory, customers, transactions, returns, and reviews. Designed for analysis of sales trends, customer behaviour, inventory management, and review sentiment.

-----

## 📌 Table of Contents

1. [About the Project](#-about-the-project)
2. [Dataset Overview](#-dataset-overview)
3. [Project Structure](#-project-structure)
4. [Entity Relationship](#-entity-relationship)
5. [Key Findings](#-key-findings)
6. [Business Insights](#-business-insights)
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
## 2. File Summaries

### Books.csv
25 books spanning 7 genres and 3 languages. Prices range from ₹299 to ₹999. Discounts range from 0% to 20%. 17 of 25 books are flagged as bestsellers. Published by 6 Indian publishers.

### customers.csv
60 customers spread across 20 cities and 14 states. Perfectly balanced gender split (30M / 30F). Ages 19–45 with a mean of 31.4. Four membership tiers: Free, Silver, Gold, Platinum. Registered between January 2023 and June 2024.

### Orders.csv
150 orders placed between January and June 2025, generating ₹1,76,689 in total revenue. Average order value ₹1,178. Six payment methods, three coupon codes in circulation. 62% of orders were successfully delivered.

### Returns.csv
9 return records covering 6% of all orders. Average days-to-return: 7.9 days. Total refund requested: ₹13,114. Total actually processed: ₹4,164. Five of nine refunds were rejected.

### Reviews.csv
200 reviews across all 25 books. Average rating 3.78 / 5. 73% of reviews are from verified purchasers. Helpful votes range from 0 to 150.

-----

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

│__ 📂 Dataset overview
|__ 📂 File summaries 
├── 📂 outputs/                       # Generated charts and exports
│   └── charts/

│__ Entity Relationships
|__ Key findings
|_ Business Insights 
├── requirements.txt                  # 
├── README.md                         # You are here

```

---

## 🔗 Entity Relationship

```
┌─────────────────────┐        ┌──────────────────────┐        ┌─────────────────────┐
│      CUSTOMERS      │        │        ORDERS         │        │        BOOKS       │
│─────────────────────│        │──────────────────────-│        │────────────────────│
│ Customer_Id  (PK) ◄─┼────────┤ Customer_Id  (FK)     │        │ Book_Id  (PK)      │
│ Customer_Name       │        │ Order_Id  (PK)        ├───────►│ Book_Title         │
│ Age / Gender        │        │ Book_Id  (FK)         │        │ Author / Category  │
│ City / State        │        │ Total_Amount_Inr      │        │ Sale_Price_Inr     │
│ Membership          │        │ Payment_Method        │        │ Avg_Rating         │
│ Preferred_Category  │        │ Order_Status          │        │ Is_Bestseller      │
└─────────────────────┘        └──────────┬────────────┘        └──────────┬──────── ┘
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
If this project helped you, please consider giving it a ⭐ 


