# NYC Motor Vehicle Collisions Analysis (2020-2024)

## Project Overview
This project analyzes over **1 million motor vehicle collisions** in New York City. The goal was to move beyond simple crash counting and measure actual **"Safety Risk"** by distinguishing between high-frequency fender benders and high-severity casualty events.

**Methodology:**
This project utilizes a **"SQL-First" approach**. The entire analytical logic (including risk calculations, aggregation trends, and data normalization) was first established and verified using **SQL**. Power BI was then used to visualize these pre-validated insights.

**Key Questions Answered:**
* Which vehicle types pose the highest risk of injury (Frequency vs. Severity)?
* What are the primary contributing factors for accidents across different boroughs?
* How do seasonal trends impact collision rates?

## Data Source
The dataset used in this analysis was sourced from the **[Analyst Builder - Motor Vehicle Collisions Project](https://www.analystbuilder.com/projects/motor-vehicle-collisions-analysis-nyc-oeMWy)**.
*(Original data provided by NYC Open Data)*.

## File Structure
**`NYC_Collisions_Analysis.pbix`**  The interactive Power BI Dashboard for visual storytelling. 

**`SQL_Analysis_and_Prep.sql`** **The Core Logic.** Contains the full ETL pipeline, normalization, and the analytical queries used to derive insights (Severity Scores, Risk %). 

**`Project_Report.pdf`** A formal executive summary of findings and recommendations. 


## Tools & Technologies
* **SQL Server (SSMS):** **Primary Analytical Tool.**
    * *ETL & Normalization:* Transformed flat files into a Star Schema using `UNION ALL` and `CASE` statements.
    * *Exploratory Data Analysis (EDA):* Performed deep-dive analysis directly in SQL to calculate injury rates, fatality percentages, and borough-level trends before visualization.
* **Power BI:** **Visualization & Reporting.**
    * Connected to the SQL-prepared tables (`Fact_Collisions`, `Dim_Vehicles`) to build dynamic dashboards with interactive filtering.
* **DAX:** Used for dynamic aggregation (e.g., re-calculating risk scores based on user selection).

## Key Findings (Derived from SQL Analysis)
1.  **The "Safety Paradox":**
    * **Passenger Cars** account for the highest volume (~696k crashes) but have a low injury risk (~26%).
    * **Micromobility (E-bikes/Scooters)** accounts for low volume but has a staggering **77% injury risk** per crash.
2.  **Top Causes:** **Driver Distraction** is the #1 cause of accidents across all boroughs (~35%).
3.  **Seasonality:** SQL aggregations revealed a consistent accident peak in **Summer (June/July)** and a sharp drop in Winter.

## How to Run
1.  **View the Logic:** Open `SQL_Analysis_and_Prep.sql` to see the data transformation and analytical queries.
2.  **View the Visuals:** Open `NYC_Collisions_Analysis.pbix` in Power BI Desktop.
3.  **Read the Story:** Check `Project_Report.pdf` for the business recommendations.

---
**Author:** Saket Shah  
