# Lecture 1: Relating

## Relationships

A relational database organizes data into tables that can be related to one another.

- **One-to-One (1:1):** Each record in one table can be associated with at most one record in another table, and vice versa.
- **One-to-Many (1:N):** One record in a table can be associated with multiple records in another table.
- **Many-to-Many (M:N):** Multiple records in one table can be associated with multiple records in another table.

A many-to-many relationship is typically implemented using a junction table containing foreign keys that reference the two related tables.

## Entity Relationship Diagram (ERD)

An Entity Relationship Diagram is a visual representation of entities and the relationships between them in a database.

### Crow's Foot Notation

Crow's Foot Notation represents the minimum and maximum cardinality of relationships between entities.

- **Circle:** Zero (optional).
- **Perpendicular bar:** One.
- **Crow's foot:** Many.

These symbols can be combined to represent different cardinalities:

| Notation | Cardinality |
|---|---|
| Circle + Bar | Zero or one |
| Bar + Bar | Exactly one |
| Circle + Crow's foot | Zero or many |
| Bar + Crow's foot | One or many |

For example, a customer may have zero or many orders, while each order belongs to exactly one customer.

## Keys

Keys help identify records and establish relationships between tables.

- **Primary Key:** A column or combination of columns that uniquely identifies each record in a table.
- **Foreign Key:** A column or combination of columns that references a primary key or another eligible unique key, establishing a relationship between tables.

## Subqueries

- **Subquery:** A SQL query nested within another SQL query.
- `IN`: Checks whether a value belongs to a specified set of values, including values returned by a subquery.

## Joins

Joins combine rows from related tables.

- `INNER JOIN`: Returns matching rows from both tables.
- `LEFT JOIN`: Returns all rows from the left table and matching rows from the right table.
- `RIGHT JOIN`: Returns all rows from the right table and matching rows from the left table.
- `FULL JOIN`: Returns matching and unmatched rows from both tables.

Unmatched columns in outer joins are filled with `NULL`.

### NATURAL JOIN

`NATURAL JOIN` automatically joins tables using all columns that share the same names.

- Does not require an explicit `ON` or `USING` clause.
- Matches rows based on equality across all common columns.
- Returns each common join column only once.

For example:

```sql
SELECT *
FROM sea_lions
NATURAL JOIN migrations;
```

If `id` is the only common column, the join is equivalent to:

```sql
SELECT *
FROM sea_lions
JOIN migrations USING (id);
```

However, `NATURAL JOIN` can produce unintended results when tables share additional column names or when their schemas change.

Explicit join conditions using `ON` or `USING` are generally preferred for clarity and reliability.

## Set Operations

- `UNION`: Combines results and removes duplicate rows.
- `INTERSECT`: Returns rows common to both results.
- `EXCEPT`: Returns rows from the first result that are absent from the second result.

The queries must return the same number of columns with compatible data types.

## Grouping

- `GROUP BY`: Groups rows with common values for aggregate calculations.
- `HAVING`: Filters groups based on specified conditions.

Unlike `WHERE`, which filters individual rows before grouping, `HAVING` filters groups after grouping.