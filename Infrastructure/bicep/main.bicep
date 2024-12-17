@description('Name of the resource group')
param resourceGroupName string = 'TruistGiving-Dev-RG'

@description('Location of the resources')
param location string = 'East US'

@description('App Service Plan Sku')
param appServiceSkuName string = 'P1v2'

@description('SQL Server Admin Username')
param sqlAdminUsername string

@description('SQL Server Admin Password')
@secure()
param sqlAdminPassword string

@description('SQL Database Name')
param sqlDatabaseName string = 'TruistGivingDB-Dev'

@description('Key Vault Name')
param keyVaultName string = 'TruistGivingKeyVault-Dev'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TruistGivingAppServicePlan-Dev'
  location: location
  sku: {
    name: appServiceSkuName
    tier: 'Premium'
    size: 'P1v2'
  }
  kind: 'linux'
}

resource frontendApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'TruistGivingFrontend-Dev'
  location: location
  serverFarmId: appServicePlan.id
  httpsOnly: true
}

resource backendApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'TruistGivingBackend-Dev'
  location: location
  serverFarmId: appServicePlan.id
  httpsOnly: true
}

resource sqlServer 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: 'TruistGivingSqlServer-Dev'
  location: location
  properties: {
    administratorLogin: sqlAdminUsername
    administratorLoginPassword: sqlAdminPassword
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  parent: sqlServer
  name: sqlDatabaseName
  location: location
  properties: {
    sku: {
      name: 'S1'
      tier: 'Standard'
    }
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: []
  }
}

output appServicePlanId string = appServicePlan.id
output frontendAppUrl string = 'https://${frontendApp.name}.azurewebsites.net'
output backendAppUrl string = 'https://${backendApp.name}.azurewebsites.net'
output sqlServerName string = sqlServer.name
output keyVaultName string = keyVault.name
