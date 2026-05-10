# MySQL Database Connection and Workflow

This document explains how this project is connected to a MySQL database (having migrated from Access DB) and how the database functions within the application.

## 1. Database Connection Logic

The connection to the MySQL database is managed centrally by the `DatabaseConfig.java` class located at `src/main/java/com/example/projectfxv5/DatabaseConfig.java`. 

### How it Works:
- **Centralized Management**: Whenever any part of the application needs to interact with the database (e.g., adding a car, fetching sales), it calls `DatabaseConfig.getConnection()`.
- **Dynamic Configuration**: The class uses a static block to initialize the connection parameters. It checks for configuration in the following order of precedence:
  1. **Environment Variables** (`DB_URL`, `DB_USERNAME`, `DB_PASSWORD`): This allows the application to easily connect to a Docker container or different environments without changing the code.
  2. **Properties File**: If environment variables aren't set, it reads `src/main/resources/config.properties`.
  3. **Hardcoded Defaults**: If the properties file is missing, it falls back to hardcoded default values.

### Connection String:
The connection string used is typically:
```properties
jdbc:mysql://localhost:3306/automotive_inventory?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
```
- `localhost:3306`: The default host and port for MySQL.
- `automotive_inventory`: The name of the database.
- `useSSL=false` & `allowPublicKeyRetrieval=true`: Common settings for local development to avoid SSL/TLS handshake issues.
- `serverTimezone=UTC`: Ensures correct date/time parsing.

## 2. Maven Dependency

To communicate with MySQL, the project uses the official MySQL JDBC driver. This is defined in the `pom.xml` file:

```xml
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.4.0</version>
</dependency>
```
When `DatabaseConfig.java` calls `Class.forName("com.mysql.cj.jdbc.Driver");`, it loads this specific driver provided by Maven.

## 3. How the Database Works (Schema)

The database is named `automotive_inventory` and consists of five core tables created using the `InnoDB` engine (which supports foreign key constraints and transactions). You can find the schema in `database/mysql_schema.sql`.

### Tables and Relationships:
1. **`Cars`**: Stores vehicle inventory details.
   - Primary Key: `id`
   - Enforces unique constraints on `numberPlate` and `chassisNumber`.
2. **`Customers`**: Stores customer contact information.
   - Primary Key: `id`
   - Enforces unique constraint on `email`.
3. **`Employees`**: Stores staff details, including their `salary` and `commissionRate`.
   - Primary Key: `id`
4. **`Sales`**: The core transactional table linking the entities together.
   - Primary Key: `id`
   - **Foreign Keys**: Links `carId` to `Cars(id)`, `customerId` to `Customers(id)`, and `employeeId` to `Employees(id)`.
   - Ensures data integrity (e.g., you cannot create a sale for a car or employee that does not exist).
5. **`users`**: Stores authentication credentials (`username` and `password`) for logging into the application.

## 4. Docker Integration

The project has been configured to support Docker (`docker-compose.yml` and `Dockerfile`). Because `DatabaseConfig.java` prioritizes Environment Variables, when you run the application via Docker Compose, the Java application container passes the MySQL container's network details (like `jdbc:mysql://db:3306/...`) directly into the app, bypassing the `localhost` properties file seamlessly.
