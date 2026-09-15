-- =============================================
-- Author:      <Your Name>
-- Procedure:   GetCustomerSummary
-- Description: Summarizes customer and order data
-- =============================================

-- Create Stored Procedure
CREATE PROCEDURE GetCustomerSummary
AS
BEGIN
    SELECT
        COUNT(*) AS TotalCustomer,
        AVG(Score) AS AverageScore
    FROM SalesDB.Sales.Customers
    WHERE Country = 'USA';
END
GO

-- Execute Stored Procedure
EXEC GetCustomerSummary;
GO

-- Alter Stored Procedure with Parameter
ALTER PROCEDURE GetCustomerSummary 
    @Country NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DECLARE @TotalCustomers INT,
                @TotalScore FLOAT;

        -- Prepare and Clean up Data
        IF EXISTS (
            SELECT 1 
            FROM SalesDB.Sales.Customers 
            WHERE Score IS NULL AND Country = @Country
        )
        BEGIN
            PRINT 'Nulls Update to 0.';
            UPDATE SalesDB.Sales.Customers
            SET Score = 0
            WHERE Score IS NULL AND Country = @Country;
        END
        ELSE
        BEGIN
            PRINT 'No Null Score found.';
        END

        -- Generating Reports
        SELECT
            @TotalCustomers = COUNT(*),
            @TotalScore = AVG(Score)
        FROM SalesDB.Sales.Customers
        WHERE Country = @Country;

        -- Print Results
        PRINT 'Total Customers (' + CAST(@Country AS NVARCHAR) + '): ' 
              + CAST(@TotalCustomers AS NVARCHAR);
        PRINT 'Average Score (' + CAST(@Country AS NVARCHAR) + '): ' 
              + CAST(@TotalScore AS NVARCHAR);

        -- Orders and Sales Summary
        SELECT 
            COUNT(OrderID) AS TotalOrders,
            SUM(Sales) AS TotalSales
            --1/0 AS ForceError   -- Example to trigger error handling
        FROM SalesDB.Sales.Orders o
        INNER JOIN SalesDB.Sales.Customers c
            ON o.CustomerID = c.CustomerID;
    END TRY

    BEGIN CATCH
        PRINT 'Error Occurred.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT 'Error Procedure: ' + CAST(ERROR_PROCEDURE() AS NVARCHAR);
    END CATCH
END
GO

-- Execute Parameterized Stored Procedure
EXEC GetCustomerSummary @Country = 'Germany';
GO

-- Drop Stored Procedure
DROP PROCEDURE GetCustomerSummary;
GO
