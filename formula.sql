-- PART 29 — The Most Important JOIN Patterns
-- Pattern 1 — Basic INNER JOIN
SELECT ...
FROM A
JOIN B
ON A.id = B.id;

-- Pattern 2 — LEFT JOIN
SELECT ...
FROM A
LEFT JOIN B
ON A.id = B.id;

-- Pattern 3 — Find unmatched records
SELECT ...
FROM A
LEFT JOIN B
ON A.id = B.id
WHERE B.id IS NULL;

-- Pattern 4 — Multiple JOIN
SELECT ...
FROM A
JOIN B
ON A.id = B.a_id
JOIN C
ON B.id = C.b_id;

-- Pattern 5 — SELF JOIN
SELECT
    e.Name,
    m.Name
FROM Employees e
JOIN Employees m
ON e.Manager_ID = m.Emp_ID;

-- Pattern 6 — JOIN + GROUP BY
SELECT
    B.name,
    COUNT(A.id)
FROM A
JOIN B
ON A.b_id = B.id
GROUP BY B.name;

-- Pattern 7 — JOIN + HAVING
SELECT
    B.name,
    COUNT(A.id)
FROM A
JOIN B
ON A.b_id = B.id
GROUP BY B.name
HAVING COUNT(A.id) > 2;

-- Pattern 8 — JOIN + Aggregate
SELECT
    B.name,
    AVG(A.salary),
    MAX(A.salary),
    MIN(A.salary),
    SUM(A.salary)
FROM A
JOIN B
ON A.b_id = B.id
GROUP BY B.name;