#!/bin/bash
# Start SQL Server in the background
/opt/mssql/bin/sqlservr &

# Wait until SQL Server is ready
echo "Waiting for SQL Server to start..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'pa_Fancy_password1' -Q "SELECT 1" > /dev/null 2>&1; do
  sleep 1
done

echo "Restoring AdventureWorksDW2022..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'pa_Fancy_password1' -i /var/opt/mssql/scripts/restore.sql

wait
