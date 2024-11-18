-- Create the database
CREATE DATABASE my_database;
GO

-- Use the newly created database
USE my_database;
GO

-- Create the Customer table
CREATE TABLE Customer (
    CustomerId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255) UNIQUE
);
GO

-- Create the CustomerAddress table
CREATE TABLE CustomerAddress (
    AddressId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    CustomerId UNIQUEIDENTIFIER,
    Street NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    ZipCode NVARCHAR(20),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);
GO

-- Insert data into Customer table
INSERT INTO Customer (CustomerId, FirstName, LastName, Email) VALUES
(NEWID(), 'John', 'Doe', 'john.doe@example.com'),
(NEWID(), 'Jane', 'Smith', 'jane.smith@example.com'),
(NEWID(), 'Alice', 'Johnson', 'alice.johnson@example.com'),
(NEWID(), 'Robert', 'Brown', 'robert.brown@example.com'),
(NEWID(), 'Michael', 'Williams', 'michael.williams@example.com'),
(NEWID(), 'Mary', 'Jones', 'mary.jones@example.com'),
(NEWID(), 'David', 'Garcia', 'david.garcia@example.com'),
(NEWID(), 'Linda', 'Martinez', 'linda.martinez@example.com'),
(NEWID(), 'James', 'Miller', 'james.miller@example.com'),
(NEWID(), 'Barbara', 'Davis', 'barbara.davis@example.com');

-- Insert data into CustomerAddress table
INSERT INTO CustomerAddress (AddressId, CustomerId, Street, City, State, ZipCode) VALUES
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '123 Elm St', 'Springfield', 'IL', '62701'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '456 Oak St', 'Springfield', 'IL', '62702'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '789 Pine St', 'Greenville', 'SC', '29601'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '101 Maple St', 'Greenville', 'SC', '29602'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '102 Birch St', 'Greenville', 'SC', '29603'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '202 Cedar St', 'Austin', 'TX', '78701'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '303 Palm St', 'Miami', 'FL', '33101'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '404 Fir St', 'Miami', 'FL', '33102'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '505 Spruce St', 'Seattle', 'WA', '98101'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '707 Aspen St', 'Denver', 'CO', '80201'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '808 Willow St', 'Portland', 'OR', '97201'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '909 Poplar St', 'Phoenix', 'AZ', '85001'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '1001 Cypress St', 'Las Vegas', 'NV', '89101'),
(NEWID(), (SELECT TOP 1 CustomerId FROM Customer ORDER BY NEWID()), '1102 Sycamore St', 'Las Vegas', 'NV', '89102');
