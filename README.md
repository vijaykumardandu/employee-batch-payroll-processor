# Employee Batch Payroll Processor

A Java-based batch payroll processing system that reads employee data from CSV, calculates salaries with slab-based tax deductions, persists results to MySQL via JDBC, and generates department-wise summary reports.

Built to learn and demonstrate: **Java OOP, batch processing, JDBC data access, error handling, and file I/O.**

---

## Screenshots

### Console output — batch processing + summary report
![Uploading Screenshot 2026-05-01 101354.png…]()


### CSV output — payroll_output.csv
<img width="2797" height="743" alt="Screenshot 2026-05-01 101407" src="https://github.com/user-attachments/assets/496d173a-36a2-4212-987b-851da75f34ff" />


### MySQL Workbench — payroll_results table
<img width="2753" height="992" alt="Screenshot 2026-05-01 101420" src="https://github.com/user-attachments/assets/3a19ced9-2a33-48b9-9dd2-c06f0bc932ae" />


---

## What it does

- Reads employee records from a CSV file (id, name, department, hours worked, hourly rate)
- Validates and skips malformed records with detailed error logging
- Processes payroll in configurable batches (default: 50 records per batch)
- Calculates gross salary, tax deduction (slab-based), and net payout per employee
- Persists all results to MySQL using JDBC batch inserts with transaction control
- Prints a formatted summary report to the console with department-wise breakdown
- Exports the full payroll output to a CSV file
- Logs every step to `logs/payroll.log` with timestamps

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 11 |
| Database | MySQL 8.0 |
| Data Access | JDBC (PreparedStatement + batch insert) |
| Build | Manual javac |
| Version Control | Git + GitHub |

---

## Project Structure

```
PayrollProcessorFull/
├── src/
│   ├── Main.java
│   ├── model/
│   │   ├── Employee.java
│   │   └── Payroll.java
│   ├── service/
│   │   ├── PayrollService.java
│   │   └── TaxCalculator.java
│   ├── db/
│   │   ├── DBConnection.java
│   │   └── PayrollDAO.java
│   └── util/
│       ├── AppLogger.java
│       ├── CSVReader.java
│       └── ReportGenerator.java
├── data/
│   ├── employees.csv
│   └── payroll_output.csv
├── logs/
│   └── payroll.log
├── screenshots/
├── schema.sql
├── HOW_TO_RUN.md
└── README.md
```

---

## Tax Slab Logic

| Monthly Gross | Tax Rate |
|---|---|
| Up to $10,000 | 10% |
| $10,001 – $25,000 | 20% |
| Above $25,000 | 30% |

---

## How to Run

See [HOW_TO_RUN.md](HOW_TO_RUN.md) for full setup steps.

```bash
javac -cp "lib/mysql-connector-java-8.x.x.jar" -d out src/model/*.java src/util/*.java src/service/*.java src/db/*.java src/Main.java
java -cp "out:lib/mysql-connector-java-8.x.x.jar" Main
```

---

## Key Concepts Demonstrated

- **OOP** — Employee and Payroll as separate model classes with encapsulation
- **Batch Processing** — records split into configurable batch sizes with per-batch logging
- **JDBC Data Access** — PreparedStatement with batch inserts and manual transaction control
- **Error Handling** — malformed CSV lines logged and skipped without crashing
- **Separation of Concerns** — model / service / db / util layers clearly separated
- **File I/O** — CSV reading with BufferedReader, export with PrintWriter

---

## What I'd add next

- Hibernate ORM layer to replace raw JDBC
- Spring Batch for enterprise-grade processing
- REST API to trigger payroll run on demand
- Unit tests with JUnit 5
