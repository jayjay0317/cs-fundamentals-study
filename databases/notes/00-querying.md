# Lecture 0: Querying

## Databases

- Databases offer advantages over spreadsheets in terms of scale, frequency of data access and updates, and speed.
- **Database:** An organized collection of data that supports creating, reading, updating, and deleting data (CRUD).
- **Database Management System (DBMS):** Software used to manage and interact with databases.
  - Examples: MySQL, Oracle Database, PostgreSQL, and SQLite.
- **SQL (Structured Query Language):** A language used to query, manipulate, and manage data in relational databases.

## SQLite CLI

SQLite is a database engine that stores data in a file and does not require a separate database server.

To open an existing database from the terminal:

```bash
sqlite3 longlist.db
```

SQLite provides dot commands for interacting with the database through its command-line interface (CLI).

| Command | Description |
|---|---|
| `.tables` | Lists the tables and views in the database. |
| `.schema` | Displays the SQL definitions of database objects, including table structures and column types. |
| `.schema longlist` | Displays the schema of the specified table. |
| `.headers on` | Displays column names in query results. |
| `.mode column` | Displays query results in aligned columns. |
| `.quit` | Exits the SQLite CLI and returns to the terminal. |

Dot commands are specific to the SQLite CLI and are not standard SQL statements. Unlike SQL statements, they do not require a semicolon.

## Basic Queries

- `SELECT`: Specifies the columns to retrieve.
- `FROM`: Specifies the table to query.
- `LIMIT`: Restricts the number of rows returned.
- `WHERE`: Filters rows based on specified conditions.

## Filtering

### Comparison Operators

- `=`: Equal to.
- `!=`, `<>`: Not equal to.
- `>`, `<`, `>=`, `<=`: Numerical or other ordered comparisons.
- `BETWEEN ... AND ...`: Checks whether a value falls within an inclusive range.

### Logical Operators

- `AND`: Both conditions must be true.
- `OR`: At least one condition must be true.
- `NOT`: Negates a condition.
- Parentheses control the order of evaluation.

### NULL Values

- `NULL` represents a missing or unknown value.
- `IS NULL`: Checks whether a value is NULL.
- `IS NOT NULL`: Checks whether a value is not NULL.
- Standard equality operators should not be used to check for NULL values.

## Pattern Matching

`LIKE` matches strings against a specified pattern.

- `%`: Matches zero or more characters.
- `_`: Matches exactly one character.

Examples:

| Pattern | Description |
|---|---|
| `'%love%'` | Contains "love". |
| `'The %'` | Starts with "The " (including the space). |
| `'P_re'` | Matches four-character strings such as "Pure". |
| `'T___'` | Matches four-character strings starting with "T". |

By default, `LIKE` is case-insensitive for ASCII characters in SQLite and generally case-sensitive in PostgreSQL. PostgreSQL provides `ILIKE` for case-insensitive pattern matching.

## Sorting

- `ORDER BY ... ASC`: Sorts results in ascending order (default).
- `ORDER BY ... DESC`: Sorts results in descending order.
- Multiple columns can be specified to break ties.
- Strings can also be sorted lexicographically according to the applicable collation.

## Aggregate Functions

- `COUNT`: Counts rows or non-NULL values.
- `AVG`: Calculates the arithmetic mean.
- `MIN`: Returns the minimum value.
- `MAX`: Returns the maximum value.
- `SUM`: Calculates the sum.

`MIN` and `MAX` can also be applied to strings, using their collation order.

`COUNT(*)` counts all rows, whereas `COUNT(column)` counts only non-NULL values in the specified column.

## Additional SQL Features

- `ROUND`: Rounds a numerical value to a specified number of decimal places.
- `AS`: Assigns an alias to a column or table.
- `DISTINCT`: Removes duplicate values or combinations of values from query results.
- `COUNT(DISTINCT column)`: Counts unique non-NULL values in a column.