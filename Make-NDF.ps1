# Specify the SQL instance
$sqlins = "localhost"
# Specify how many NDFs should be created per mountpoint
$ndfs = 5
# Getting local mountpoints
$mountpoints = Get-WmiObject -Class Win32_Volume | Where-Object{$_.Label -like "D*"} | Select -ExpandProperty Name

# For each mountpoint create n amount of NDF files
Foreach ($mount in $mountpoints) {
    # Put mount name in the file name
    $mpname = $mount.Substring(11,2)
    # Loop through creating NDFs until the specified number is reached
    For ($i = 1; $i -lt $ndfs; $i++) {
        #This needs a bit of more work to make the DB name into a variable, for now, DB 7 is selected
        $database = Invoke-Sqlcmd -ServerInstance $sqlins 'select name from master.sys.databases where database_id = 7' | select name
        # Using T-SQL to alter the database by creating and adding the desired number of NDF files
        $query = "ALTER DATABASE $($database.Name) ADD FILE ( NAME = $($database.Name)_$($mpname)_$($i), FILENAME = '$($mount)DATA\$($database.Name)_$($i).ndf' )"
        # Executing the previous T-SQL query
        Invoke-Sqlcmd -ServerInstance $sqlins -Database $($database.name) -Query $query
    }
}