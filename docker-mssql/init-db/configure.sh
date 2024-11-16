#!/bin/bash

# Wait for SQL Server to start up by ensuring that calling SQLCMD does not return an error code.
# This will ensure that sqlcmd is accessible and can successfully connect to the SQL Server instance.

ERRCODE=1  # Initialize ERRCODE to a non-zero value to ensure the loop runs initially
i=0

# Retry logic with a maximum of 60 attempts to check if SQL Server is up and reachable
while [[ $i -lt 60 ]] && [[ $ERRCODE -ne 0 ]]; do
    i=$((i + 1))
    
    # Attempt to check if SQL Server is running by querying a simple value (SELECT 1)
    echo "Attempt $i: Checking if SQL Server is running..."
    DBSTATUS=$(/opt/mssql-tools18/bin/sqlcmd -h -1 -t 1 -U sa -P "$SA_PASSWORD" -No -Q "SELECT 1" 2>&1)
    ERRCODE=$?

    # Output the results for debugging
    echo "Attempt $i: ERRCODE=$ERRCODE, DBSTATUS='$DBSTATUS'"

    # If there is no error (ERRCODE == 0), then SQL Server is up
    if [[ $ERRCODE -eq 0 ]]; then
        echo "SQL Server is up and reachable."
        break
    fi

    # Sleep to give SQL Server more time to start up
    sleep 1
done

# After 60 attempts, check if the server is still not reachable
if [[ $ERRCODE -ne 0 ]]; then 
    echo "SQL Server took more than 60 seconds to start up and is still not reachable"
    exit 1
fi

# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -No -d master -i init.sql
