# Automotive Inventory and Sales System

A modern JavaFX desktop application for managing car dealership operations, including inventory, employees, customers, sales, and reporting.

---

## About This Project

The **Automotive Inventory System** is designed to streamline and digitize the daily operations of a car dealership. Traditionally, managing car stock, employee records, customer information, and sales data involves a lot of paperwork and manual tracking, which can lead to errors and inefficiencies. This project provides a unified, user-friendly platform to handle all these tasks efficiently.

### Why This Project?

- **Centralized Management:** All dealership data—cars, employees, customers, and sales—are managed in one place.
- **Error Reduction:** Automated record-keeping reduces manual errors and data loss.
- **Productivity:** Employees spend less time on paperwork and more on sales and customer service.
- **Reporting:** Instant access to sales and commission reports helps management make informed decisions.
- **Modernization:** Brings a modern, digital workflow to traditional automotive businesses.

### What Can You Do With It?

- **Manage Car Inventory:** Add new cars, update existing listings, or remove sold/outdated vehicles.
- **Employee Management:** Keep track of employee details, update records, and calculate commissions.
- **Customer Management:** Store and retrieve customer information for better service and follow-up.
- **Sales Tracking:** Record new sales, view sales history, and associate sales with employees and customers.
- **Generate Reports:** Create and export sales and commission reports in TXT or PDF format for analysis or record-keeping.
- **User-Friendly Interface:** Navigate easily with a modern, dark-themed UI designed for efficiency.

---

## Features

- **Car Inventory Management**: Add, update, delete, and view cars in stock.
- **Employee Management**: Manage employee records, salaries, and commissions.
- **Customer Management**: Store and access customer information.
- **Sales Tracking**: Record new sales and view sales history.
- **Reporting**: Generate sales and commission reports, exportable as TXT or PDF.
- **Modern UI**: Dark theme, responsive layout, and intuitive navigation.

---

## Technology Stack

- **Frontend**: JavaFX
- **Backend**: Java
- **Database**: MySQL via MySQL Connector/J JDBC driver
- **Build Tool**: Maven (Maven Wrapper included)

---

## Project Structure

```
├── database/
│   ├── mysql_schema.sql
│   └── mysql_seed.sql
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/projectfxv5/
│   │   │       ├── Projectv5.java
│   │   │       ├── dao/
│   │   │       ├── model/
│   │   │       └── ...
│   │   └── resources/
│   │       ├── com/example/projectfxv5/css/styles.css
│   │       └── com/example/projectfxv5/images/
│   └── test/
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README.md
```

---

## Setup & Installation

### Prerequisites

- Java 11 or higher
- MySQL Server 8.0+ (or compatible)

> **Note:** Maven is **not required** to be installed globally. This project includes the [Maven Wrapper](https://maven.apache.org/wrapper/), so you can use `./mvnw` (Linux/macOS) or `mvnw.cmd` (Windows) to run Maven commands.

### Steps

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/automotive-inventory-system.git
   cd automotive-inventory-system
   ```

2. **Build the project:**
   ```sh
   ./mvnw clean package      # On Linux/macOS
   mvnw.cmd clean package    # On Windows
   ```

3. **Run the application:**
   ```sh
   ./mvnw javafx:run         # On Linux/macOS
   mvnw.cmd javafx:run       # On Windows
   ```

4. **Database:**
   - Create the MySQL schema/tables by running `database/mysql_schema.sql`.
   - Populate initial sample data and login by running `database/mysql_seed.sql`.
   - Configure database connection settings in `src/main/resources/config.properties`:
     - `db.url`
     - `db.username`
     - `db.password`

---

## Dependencies

- [MySQL Connector/J](https://dev.mysql.com/doc/connector-j/en/)
- JavaFX (managed by Maven)
- Apache PDFBox (for PDF export)

All dependencies are managed via Maven.

---

## Usage

- **Login** with your credentials.
- **Navigate** using the dashboard to manage cars, employees, customers, sales, and reports.
- **Export** sales and commission reports as TXT or PDF.

---

## Troubleshooting

- Ensure Java is installed and in your `PATH`.
- Use the Maven Wrapper scripts (`./mvnw` or `mvnw.cmd`) for all Maven commands.
- Confirm your MySQL server is running and reachable from your machine.
- For database errors, verify `db.url`, `db.username`, and `db.password` in `config.properties`.
- Ensure the schema from `database/mysql_schema.sql` has been created.
- If tables are empty, run `database/mysql_seed.sql` to load sample records.

---

## License

This project is for educational and demonstration purposes.

---

## Credits

Developed by Samiullah Qureshi.  
Icons and images © Platinum Auto Japan.

