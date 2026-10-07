<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f172a,50:991b1b,100:cc2927&height=200&section=header&text=SQL%20Server%20Query%20Practice&fontSize=46&fontColor=ffffff&fontAlignY=36&animation=fadeIn&desc=Joins%20%E2%80%A2%20CTEs%20%E2%80%A2%20Window%20functions&descSize=18&descAlignY=58" width="100%" alt="SQL Server Query Practice"/>
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=19&duration=2400&pause=700&color=F87171&center=true&vCenter=true&width=640&lines=SELECT+*+FROM+skills+WHERE+level+%3D+'growing'%3B;RANK()+OVER+(PARTITION+BY+department);MySQL+schema+%E2%86%92+T-SQL" alt="typing"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/T--SQL-0078D4?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/SSMS-5C2D91?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Queries-18-2ea44f?style=for-the-badge"/>
</p>

---

## 🧠 What I Did

Week 3 of a Data Science internship: write SQL against a small HR database of **20 employees across 5 departments**. **Individual assignment.**

The assignment shipped a **MySQL** schema, but I worked in **SQL Server (SSMS)** — so the first task was porting it: replacing `DROP TABLE IF EXISTS` with `IF OBJECT_ID(...) IS NOT NULL DROP TABLE`, swapping `LIMIT` for `TOP` / window-function filters, and keeping the foreign key from `employees.dept_id` to `departments.id`.

```mermaid
erDiagram
    departments ||--o{ employees : "dept_id"
    employees ||--o{ employees : "manager_id"
    departments {
        int id PK
        varchar department_name
        varchar location
    }
    employees {
        int id PK
        varchar name
        int dept_id FK
        decimal salary
        decimal bonus
        int manager_id
        date hire_date
    }
```

## 📋 What's Covered

| Section | Queries | Concepts |
|---|:-:|---|
| **1 — Setup** | schema + seed | `CREATE TABLE`, PK/FK, `INSERT`, MySQL → T-SQL conversion |
| **2 — Medium** | 10 | `GROUP BY` / `HAVING`, `INNER` and `LEFT JOIN`, **self-join** (employee ↔ manager), subqueries, `EXISTS`, `COALESCE` for NULL bonuses, date filtering |
| **3 — Hard** | 8 | `RANK()` and `ROW_NUMBER()` with `PARTITION BY`, top-N per group, `LEAD()`, **CTEs**, `UNION`, correlated subqueries, `EXISTS` (managers with direct reports) |

### Example — top 2 earners per department

```sql
WITH RankedEmployees AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS RowNum
    FROM employees
)
SELECT *
FROM RankedEmployees
WHERE RowNum <= 2;
```

## 📂 Files

| File | Contents |
|---|---|
| `section1_queries.sql` | Schema (SQL Server syntax) and seed data |
| `section2_3_queries.sql` | Medium and hard queries, each commented with its question |
| `screenshots/` | Result grids from SSMS |

**Run:** open both files in SSMS, execute `section1_queries.sql` first, then any query from `section2_3_queries.sql`.

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:cc2927,50:991b1b,100:0f172a&height=90&section=footer" width="100%" alt=""/>
</p>
