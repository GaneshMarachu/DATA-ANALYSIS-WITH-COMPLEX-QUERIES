-- Drop existing tables if they exist
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Staff;

-- Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample Staff data
INSERT INTO Staff (StaffID, FullName, Department) VALUES
(1, 'Aakash', 'Sales'),
(2, 'Bhavna', 'Sales'),
(3, 'Chirag', 'HR'),
(4, 'Deepa', 'HR'),
(5, 'Eshan', 'IT');
SELECT * FROM staff;

-- Create Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    StaffID INT,
    Amount DECIMAL(10,2),
    TransDate DATE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Insert sample Transactions
INSERT INTO Transactions (TransactionID, StaffID, Amount, TransDate) VALUES
(201, 1, 4200.00, '2024-11-01'),
(202, 1, 5100.00, '2024-11-08'),
(203, 2, 6300.00, '2024-11-04'),
(204, 2, 4700.00, '2024-11-22'),
(205, 5, 7900.00, '2024-11-18');
SELECT * FROM transactions;

-- 1. CTE + Window Function: Rank Transactions per Staff
WITH RankedTransactions AS (
    SELECT 
        s.FullName,
        t.Amount,
        t.TransDate,
        RANK() OVER (PARTITION BY t.StaffID ORDER BY t.Amount DESC) AS TransactionRank
    FROM Transactions t
    JOIN Staff s ON s.StaffID = t.StaffID
)
-- 2. Window Function: Average Transaction per Staff
SELECT 
    s.FullName,
    t.Amount,
    AVG(t.Amount) OVER (PARTITION BY t.StaffID) AS AvgTransactionPerStaff
FROM Transactions t
JOIN Staff s ON t.StaffID = s.StaffID;
-- 3. Subquery: Transactions greater than overall average
SELECT FullName, Amount
FROM (
    SELECT 
        s.FullName,
        t.Amount,
        AVG(t.Amount) OVER () AS OverallAvg
    FROM Transactions t
    JOIN Staff s ON s.StaffID = t.StaffID
) AS Temp
WHERE Amount > OverallAvg;

-- 4. Row Number for each Staff's transaction
SELECT 
    s.FullName,
    t.Amount,
    ROW_NUMBER() OVER (PARTITION BY s.StaffID ORDER BY t.TransDate) AS TransRow
FROM Transactions t
JOIN Staff s ON s.StaffID = t.StaffID;
