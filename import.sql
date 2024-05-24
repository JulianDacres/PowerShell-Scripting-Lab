-- import.sql
print 'starting import.sql'
USE ClientDB; -- Specifies the database to use

-- Import the data from the CSV file using the path from our powershell script
print 'importing data from ' + $(mypath)
BULK INSERT Client_A_Contacts
FROM $(mypath)
WITH (
FIRSTROW = 2, -- Skips the first row (header row)
FIELDTERMINATOR = ',', -- Specifies that the field delimiter is a comma
ROWTERMINATOR = '\n' -- Specifies that the row delimiter is a newline character
);