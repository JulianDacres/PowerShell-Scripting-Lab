# Julian Dacres
# StudentID: 011681893
# creates database and imports the records
$servername = ".\SQLEXPRESS"
$databasename = "ClientDB"
$table = 'dbo.client_a_contacts'
Invoke-Sqlcmd -ServerInstance $servername -InputFile $PSScriptRoot\dbcreate.sql -Verbose
Invoke-Sqlcmd -ServerInstance $servername -Database $databasename -InputFile $PSScriptRoot\client_A_contacts.sql -Verbose
Invoke-Sqlcmd -ServerInstance $servername -Database $databasename -InputFile $PSScriptRoot\import.sql -Variable mypath="'$PSScriptroot\NewClientData.csv'" -Verbose
Invoke-Sqlcmd -Database ClientDB -ServerInstance .\SQLEXPRESS -Query 'SELECT * FROM dbo.Client_A_Contacts' > $PSScriptRoot\SqlResults.txt
