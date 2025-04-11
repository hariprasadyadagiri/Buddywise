## Todo App 📔

- React JS
- FastAPI
- Sqlalchemy
- Tailwind CSS

![Todo gif](https://user-images.githubusercontent.com/64283478/204075904-bfb3d555-b736-4501-b30b-70c256d5c75a.gif)

Buddy Wise Application Deployment
This project automates the build, deployment, and infrastructure provisioning of a cloud-native application using:
•	GitHub Actions for CI/CD
•	Docker for containerization
•	Kubernetes (AKS) for orchestration
•	Azure for cloud infrastructure
•	Terraform for Infrastructure-as-Code (IaC)
Project Structure
 







Docker Setup
Frontend Dockerfile
 












Backend Dockerfile
 
 Kubernetes Setup
Frontend
•	k8s/frontend-deployment.yml
•	k8s/frontend-service.yml
Backend
•	k8s/backend-deployment.yml
•	k8s/backend-service.yml
 

If you want to apply directly from the CLI: 
kubectl apply -f k8s/
After deployment Completion, need to run the following commands to know the Pods' Status
$> buddywise-infra> kubectl get deployments -n prod  
 
$> buddywise-infra> kubectl describe pod myapp-frontend -n prod 

 
 
 
 

GitHub Actions Workflow
.github/workflows/deployment.yml
This workflow automates:
•	Docker image build
o	Tiger 
o	 
•	Azure login using OIDC & Client Secret & Job
o	 

•	Pushing to ACR
o	 
•	Deployment to AKS
 
 
GitHub Secrets Configuration: 
Add the following in GitHub → Settings → Secrets and Variables:
Secret Name	Purpose
AZURE_CLIENT_ID	App Registration Client ID
AZURE_CLIENT_SECRET	App Registration Secret
AZURE_TENANT_ID	Azure Tenant ID
AZURE_SUBSCRIPTION_ID	Subscription ID
AZURE_RESOURCE_GROUP	Resource Group Name
AZURE_ACR_NAME	ACR Name

Azure Infrastructure Provisioning (UI-Based):
 Create Resource Group
Azure Portal → "Resource groups" → Create
•	Resource group: buddywise-rg
•	Region: East US
 

Create Azure Container Registry (ACR)
Azure Portal → "Container registries" → Create
•	Name: buddywiseacr (must be unique)
•	SKU: Standard
•	Enable Admin User: yes

 

Create Azure Kubernetes Cluster (AKS):
Azure Portal → "Kubernetes services" → Create
•	Name: buddywiseaks
•	Node Pool: 2 nodes, Standard_DS2_v2
•	Auth: System-assigned managed identity
•	Integrate with ACR: buddywiseacr
 

Create App Registration:
Azure Portal → "Microsoft Entra ID" → "App registrations" → New registration
•	Name: buddywise-gh-actions
•	Save Application (client) ID
 



Create Client Secret:
App → "Certificates & secrets" → New client secret
Save the value (used in GitHub Secrets)
And save value, it appears only once
 

Assign IAM Roles: 
🔸 AKS Access
AKS → Access control (IAM) → Add role:
•	Role: Contributor
•	Assign to: Service Principal
🔸 ACR Access
ACR → Access control (IAM):
•	Role: AcrPush or AcrPull
Configure OIDC Federated Identity (Optional, Preferred):
az ad app federated-credential create --id "825b698e-807f-491b-91fe-1cddc869cef1" --parameters "{`"name`": `"github-actions`", `"issuer`": `"https://token.actions.githubusercontent.com`", `"subject`": `"repo:hariprasadyadagiri/Buddywise:ref:refs/heads/main`", `"description`": `"OIDC for GitHub Actions`", `"audiences`": [`"api://AzureADTokenExchange`"]}"

All files and access have been completed. Let's deploy the application from Git.
Use the commands below from the CLI to deploy from git
:>  git add.
:>  git commit -m "Deployment Application" (you use your own massage while committing)
:>  git push origin main

 


 








 








