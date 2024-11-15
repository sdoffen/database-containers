-- Enable UUID generation
SET @uuid := UUID();
SET @customerCount = 10;

DROP TABLE IF EXISTS CustomerAddress;
DROP TABLE IF EXISTS Customer;

-- Create Customer table
CREATE TABLE Customer (
    CustomerID CHAR(36) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create CustomerAddress table
CREATE TABLE CustomerAddress (
    AddressID CHAR(36) NOT NULL PRIMARY KEY,
    CustomerID CHAR(36) NOT NULL,
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into Customer table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email) VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com'),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com'),
(UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com'),
(UUID(), 'Robert', 'Brown', 'robert.brown@example.com'),
(UUID(), 'Michael', 'Williams', 'michael.williams@example.com'),
(UUID(), 'Mary', 'Jones', 'mary.jones@example.com'),
(UUID(), 'David', 'Garcia', 'david.garcia@example.com'),
(UUID(), 'Linda', 'Martinez', 'linda.martinez@example.com'),
(UUID(), 'James', 'Miller', 'james.miller@example.com'),
(UUID(), 'Barbara', 'Davis', 'barbara.davis@example.com');

-- Insert data into CustomerAddress table
INSERT INTO CustomerAddress (AddressID, CustomerID, Street, City, State, ZipCode) VALUES
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 0), '123 Elm St', 'Springfield', 'IL', '62701'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 0), '456 Oak St', 'Springfield', 'IL', '62702'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 1), '789 Pine St', 'Greenville', 'SC', '29601'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 1), '101 Maple St', 'Greenville', 'SC', '29602'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 1), '102 Birch St', 'Greenville', 'SC', '29603'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 2), '202 Cedar St', 'Austin', 'TX', '78701'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 3), '303 Palm St', 'Miami', 'FL', '33101'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 3), '404 Fir St', 'Miami', 'FL', '33102'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 4), '505 Spruce St', 'Seattle', 'WA', '98101'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 6), '707 Aspen St', 'Denver', 'CO', '80201'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 7), '808 Willow St', 'Portland', 'OR', '97201'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 8), '909 Poplar St', 'Phoenix', 'AZ', '85001'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 9), '1001 Cypress St', 'Las Vegas', 'NV', '89101'),
(UUID(), (SELECT CustomerID FROM Customer LIMIT 1 OFFSET 9), '1102 Sycamore St', 'Las Vegas', 'NV', '89102');
