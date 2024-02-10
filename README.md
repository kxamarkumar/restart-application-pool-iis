# restart-application-pool-iis
PowerShell script to allow users to restart application pool for Web applications in IIS

## Description ## 
The PowerShell script is designed to restart an IIS application pool selected by the user. It checks if the necessary PowerShell modules are installed and imports them if not already available. It then lists all available application pools from the server the script is executed on, prompts the user to choose one, and restarts the selected application pool.

## Prerequisites ## 
Ensure the script is executed with administrative privileges. 

## Usage ##
Access a Windows Server with IIS Role installed and Web Applications deployed
Open PowerShell with administrative privileges
Navigate to the directory containing the script.
Execute the script by running .\restart-app-pool.ps1

## Script Behavior ## 
- Checks for the presence of required PowerShell modules.
- If modules are not installed, attempts to import them.
- Lists available application pools.
- Prompts the user to select an application pool by entering the corresponding number.
- Validates user input to ensure it falls within the acceptable range.
- Restarts the selected application pool.
- Displays success or error messages accordingly.

## Limitations ## 
-	It maybe necessary to restart more than one application pool at the same time – in this case the script will need to be run multiple times 

## Note ## 
Ensure that the user executing this script has appropriate permissions to restart IIS application pools.
Review and error handling and logging as needed for your environment. 



