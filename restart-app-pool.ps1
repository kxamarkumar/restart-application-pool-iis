#Requires -RunAsAdministrator

if ((Get-Module -ListAvailable -Name WebAdministration) -And (Get-Module -ListAvailable -Name IISAdministration)) {
        Write-Host -ForegroundColor Green "`nRequired Modules Installed"
} 
else {
    try {
        Import-Module WebAdministration
        Import-Module IISAdministration

        # Display a success message
        Write-Host -ForegroundColor Green "`nRequired Modules Installed Successfully"
    } 
    catch {
        # Display an error message if any issues occur
        Write-Host -ForegroundColor Red "`nError installing required modules: $_ `n" 
        throw
    }

}

[array]$appPoolList = @(Get-IISAppPool | Select-Object -Property Name)

# Show app pools to user
for ([int]$i = 0; $i -lt $appPoolList.Length; $i++) {
    Write-Host "`n" $i : $appPoolList[$i].Name
}
[int]$userInput = Read-Host "`nEnter the number of the web application pool you would like to restart"

$listLen = ($appPoolList.Length) - 1

# Validate user input
while ($userInput -gt $listLen){
    Write-Output "`nInput must be between 0 - $listLen"
    [int]$userInput = Read-Host "`nEnter the number of the web application pool you would like to restart"
}

# Write-Host "Restarting ..."  $appPoolList[$UserInput].Name

try {
    # Restart the application pool
    Restart-WebAppPool -Name $appPoolList[$userInput].Name -ErrorAction Stop

    # Display a success message
    Write-Host -ForegroundColor Green "`nRefresh Status:" $appPoolList[$userInput].Name "restarted successfully."
} 
catch {
    # Display an error message if any issues occur
    Write-Host -ForegroundColor Red "`nError refreshing applications: $_ `n" 
    Get-IISAppPool -Name $appPoolList[$UserInput].Name | Select-Object -Property Name,State
    throw
}