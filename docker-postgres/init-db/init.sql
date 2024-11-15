-- Enable UUID generation (no need for setting variables directly)
DO $$ BEGIN
    IF EXISTS (SELECT FROM pg_catalog.pg_tables WHERE tablename = 'customeraddress') THEN
        DROP TABLE CustomerAddress;
    END IF;
    IF EXISTS (SELECT FROM pg_catalog.pg_tables WHERE tablename = 'customer') THEN
        DROP TABLE Customer;
    END IF;
END $$;

-- Create Customer table
CREATE TABLE Customer (
    CustomerID UUID PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create CustomerAddress table
CREATE TABLE CustomerAddress (
    AddressID UUID PRIMARY KEY,
    CustomerID UUID NOT NULL,
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into Customer table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email) VALUES
(gen_random_uuid(), 'John', 'Doe', 'john.doe@example.com'),
(gen_random_uuid(), 'Jane', 'Smith', 'jane.smith@example.com'),
(gen_random_uuid(), 'Alice', 'Johnson', 'alice.johnson@example.com'),
(gen_random_uuid(), 'Robert', 'Brown', 'robert.brown@example.com'),
(gen_random_uuid(), 'Michael', 'Williams', 'michael.williams@example.com'),
(gen_random_uuid(), 'Mary', 'Jones', 'mary.jones@example.com'),
(gen_random_uuid(), 'David', 'Garcia', 'david.garcia@example.com'),
(gen_random_uuid(), 'Linda', 'Martinez', 'linda.martinez@example.com'),
(gen_random_uuid(), 'James', 'Miller', 'james.miller@example.com'),
(gen_random_uuid(), 'Barbara', 'Davis', 'barbara.davis@example.com');

-- Insert data into CustomerAddress table using subqueries to get specific customer UUIDs
INSERT INTO CustomerAddress (AddressID, CustomerID, Street, City, State, ZipCode) VALUES
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 0), '123 Elm St', 'Springfield', 'IL', '62701'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 0), '456 Oak St', 'Springfield', 'IL', '62702'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 1), '789 Pine St', 'Greenville', 'SC', '29601'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 1), '101 Maple St', 'Greenville', 'SC', '29602'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 1), '102 Birch St', 'Greenville', 'SC', '29603'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 2), '202 Cedar St', 'Austin', 'TX', '78701'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 3), '303 Palm St', 'Miami', 'FL', '33101'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 3), '404 Fir St', 'Miami', 'FL', '33102'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 4), '505 Spruce St', 'Seattle', 'WA', '98101'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 6), '707 Aspen St', 'Denver', 'CO', '80201'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 7), '808 Willow St', 'Portland', 'OR', '97201'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 8), '909 Poplar St', 'Phoenix', 'AZ', '85001'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 9), '1001 Cypress St', 'Las Vegas', 'NV', '89101'),
(gen_random_uuid(), (SELECT CustomerID FROM Customer ORDER BY CustomerID LIMIT 1 OFFSET 9), '1102 Sycamore St', 'Las Vegas', 'NV', '89102');
