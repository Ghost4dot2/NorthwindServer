# Wait for the SQL Server to come up
sleep 15s

# Run the setup script to creat the DB and the schema in the DB
# Note: make sure that your password matches what is in your dockerfile
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P AStupidPassword1@ -i instnwnd.sql