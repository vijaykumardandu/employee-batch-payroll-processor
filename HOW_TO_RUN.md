## How to Compile and Run

### Prerequisites
- Java JDK 11 or above
- MySQL 8.0+
- mysql-connector-java-8.x.x.jar (download from https://dev.mysql.com/downloads/connector/j/)

### Step 1 — Set up the database
Open MySQL Workbench or terminal and run:
```
mysql -u root -p < schema.sql
```

### Step 2 — Add MySQL JDBC driver
Download mysql-connector-java.jar and place it in the lib/ folder.

### Step 3 — Update DB credentials
Open src/db/DBConnection.java and update:
```java
private static final String DB_URL  = "jdbc:mysql://localhost:3306/payroll_db";
private static final String DB_USER = "root";
private static final String DB_PASS = "your_actual_password";
```

### Step 4 — Compile
```bash
# Windows
javac -cp "lib/mysql-connector-java-8.x.x.jar" -d out src/model/*.java src/util/*.java src/service/*.java src/db/*.java src/Main.java

# Mac/Linux
javac -cp "lib/mysql-connector-java-8.x.x.jar" -d out src/model/*.java src/util/*.java src/service/*.java src/db/*.java src/Main.java
```

### Step 5 — Run
```bash
# Windows
java -cp "out;lib/mysql-connector-java-8.x.x.jar" Main

# Mac/Linux
java -cp "out:lib/mysql-connector-java-8.x.x.jar" Main
```

### Output
- Console: formatted payroll summary with department breakdown
- data/payroll_output.csv: full per-employee results
- logs/payroll.log: full execution log with timestamps
