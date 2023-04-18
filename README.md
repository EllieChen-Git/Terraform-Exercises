
# Terraform Hands-on Exercise

##### 1. Learn basic Terraform commands
 - Run `terraform init`: Initialize the directory.
 - Create main.tf file & run `terraform apply`
 - `terraform fmt`: Formatting .tf files 
 - `terraform validate`: Validating terraform

 - `terraform show`: Inspect the current state
 - `terraform state list`: Get the updated list of resources managed in your workspace.
 - `terraform destroy`: Terminates resources managed by your Terraform project.
 - `terraform destroy -target="azurerm_virtual_network.vnet"`: only delete 1 resource
 - `terraform output resource_group_id`
 - `terraform taint aws_instance.webserver`: taint command is deprecated. Use `terraform apply -replace="aws_instance.webserver"` instead as the change will be reflected in the Terraform Plan.
- [terraform state pull](https://developer.hashicorp.com/terraform/cli/commands/state/pull): downloads the state from its current location, upgrades the local copy to the latest state file version that is compatible with locally-installed Terraform, and outputs the raw format to stdout. For Windows PowerShell: use `terraform state pull | sc terraform.tfstate`

##### 2. Store state in local storage and change to remote state in Azure Storage Account
##### 3. Corrupt the Terraform state and fix it 
##### 4. Re-write NSG rules into Dynamic Blocks
##### 5. Learn Terraform workspace and use workspace variables to create a resource
 - `terraform workspace list` `terraform workspace new dev`

##### 6. Logging
- `$Env:TF_LOG="TRACE"` 

##### 7. Create a resource manually and import it to Terraform state in order to manage it
 - `terraform import azurerm_storage_account.storage_account_imported /subscriptions/xxxx/resourcegroups/rg-terraform/providers/Microsoft.Storage/storageAccounts/xxxx`: Also need to create a dummy resource in main.tf 

##### 8. Store VM secrets in Azure key vault: Move VM secrets from variables to Azure key vault
- Remove vm_username and vm_password in variables.tf & terraform.tfvars
- In main.tf: Create Azure Key Vault & Azure key vault secrets (using Terraform random provider)

##### [To-do]
- deploy resources in 2 accounts in 2 regions to understand how providers work
- create an architecture which you have to cross reference using outputs and variable 

##### [To-Research]

1. How to ensure that remote state file is synced to local state file? (Or is this necessary?)
A: Is `terraform state pull` the only option?
2. How to better managed imported resources?
A: After imported, fill in the required attributes and make sure nothing is modified?


<!-- 
##### Configure Projects

1. [Authenticate Terraform to Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=azure-powershell)

Run PowerShell as admin

az login

az account set --subscription "c152c4da-6794-4c9f-9cde-3e270a2fa962"

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/c152c4da-6794-4c9f-9cde-3e270a2fa962"

$Env:ARM_CLIENT_ID = "856691ff-a49f-430e-8005-352702e9582c"
$Env:ARM_CLIENT_SECRET = "8JK8Q~n_0hT9iOF0ImBxN9XXNKuL3RE7~PvTfaj7"
$Env:ARM_SUBSCRIPTION_ID = "c152c4da-6794-4c9f-9cde-3e270a2fa962"
$Env:ARM_TENANT_ID = "16b3c013-d300-468d-ac64-7eda0820b6d3" -->



