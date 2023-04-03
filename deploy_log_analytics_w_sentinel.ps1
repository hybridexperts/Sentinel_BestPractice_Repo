$env = "QAS"
$location = "West Europe"
$location_abb = "AZEUW"

New-AzResourceGroup -Name "RG-$location_abb-MONITOR-1000-$env" -Location $location

New-AzOperationalInsightsWorkspace `
    -ResourceGroupName "RG-$location_abb-MONITOR-1000-$env" `
    -Name "LAW-$location_abb-1000-$env" `
    -Location $location `
    -Sku "PerGB2018"

$resourceGroupName = "RG-$location_abb-MONITOR-1000-$env"
$workspaceName =  "LAW-$location_abb-1000-$env"  

Set-AzOperationalInsightsIntelligencepack -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -IntelligencePackName SecurityInsights -Enabled $true
Set-AzOperationalInsightsIntelligencepack -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -IntelligencePackName AzureResources -Enabled $true

New-AzSentinelOnboardingState -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -Name "default"

