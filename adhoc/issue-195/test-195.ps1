#Import-Module ".\azure.datafactory.tools.psd1" -Force
#Get-Module 
$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'

. .\adhoc\~~Load-all-cmdlets-locally.ps1   # Load to this session

$path = (.\adhoc\Get-RootPath.ps1)
#$path
$RootFolder = Join-Path (Split-Path (Split-Path $path)) "test" "BigFactorySample2"
$opt = New-AdfPublishOption
Publish-AdfV2FromJson -DataFactoryName 'BigFactorySample2' -ResourceGroupName 'rg-devops-factory' -Location 'NorthEurope' `
    -Option $opt -RootFolder $RootFolder



$DebugPreference = 'Continue'
Update-PropertiesFromFile -adf $adf -stage "$path\config.csv"


$DebugPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'
