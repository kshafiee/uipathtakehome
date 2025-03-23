**Take-Home Assignment: Infrastructure Management**

**Objective**

Q. Develop a solution to manage a cloud infrastructure operation for a company, such as _provisioning, updating, inventory management and de-provisioning resources_, in AWS with best practices in coding, testing, and scalability. Include EC2 instances and EKS cluster resources in your solution.

A. I used Terraform (Infra-as-Code) for Infrastructure resource provisioning and management across different environments. For the intention of a modular design I used a stand-alone Terraform Module to create every type of resource.  
    <br/>The structure of the project looks like this:  
    <br/>├── modules/  
    │ ├── ec2/  
    │ ├── eks/  
    │ ├── vpc/  
    │ └── iam/  
    ├── environments/  
    │ ├── production/  
    │ └── staging/  
    ├── main.tf  
    ├── variables.tf  
    ├── outputs.tf

The above creates EC2 instances and EKS clusters in the environment of choice.

I used GitHub Actions as the CI/CD Pipeline to automate the Terraform workflows in file .github/workflows/terraform.yml  
With this setup, Terraform commands are triggered automatically upon a code push to the main branch.

Q. How to upgrade the Kubernetes cluster version from one version to another?

A. My preference is to upgrade the EKS cluster using AWS CLI and NOT Terraform:  
    aws eks update-cluster-version --name &lt;cluster-name&gt; --kubernetes-version 1.24 --region &lt;region&gt;

In addition to the control plan upgrade, the EKS worker nodes and core components (add-ons) also need to be upgraded. As the last step the tooling, i.e., kubectl version, also need to be updated.

**Bonus Objective**

Include infrastructure migration as an option.

Examples:

Q. Migrating a VM from one region to another

A. 1\. Create an Amazon Machine Image (AMI) of the VM. 2. Share the AMI Across Regions. 3. Launch the VM in the Target Region. 4. Configure security groups (if needed) to make sure similar ACLs for the new instance  

Q. Migrating a SQL server from region A to region B

A. 1\. Create a SQL Server Instance in the Target Region. 2. Backup the Database. 3. Transfer the Backup to Region B by uploading the backup file to an S3 bucket in Region A and then aws s3 sync or aws s3 cp to transfer the backup to an S3 bucket in Region B. 4. Download the backup file from S3 to the SQL Server instance in Region B. 5. Update applications to point to the new DB
