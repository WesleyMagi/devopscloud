# **Spring Boot & React Deployment on AWS with GitLab CI/CD**

## 📌 Overview  
This project demonstrates a **CI/CD pipeline** and **infrastructure automation** for deploying a **Java Spring Boot backend** and a **React frontend** to AWS using **GitLab CI/CD, Terraform, Docker, and Kubernetes**.  

The solution includes:  
- **CI/CD Pipeline**: Automates build, test, Dockerization, and deployment.  
- **Infrastructure as Code (IaC)**: Uses **Terraform** to provision AWS infrastructure.  
- **AWS Services Used**: EKS (Kubernetes), RDS (PostgreSQL), VPC, Subnets, IAM, and CloudWatch.  
- **Automated Scaling**: Kubernetes auto-scaling for high availability.  
- **Security & Best Practices**: Isolated VPC, managed access, and Terraform state management.  

This project consists of a **React frontend** and a **Spring Boot backend**, deployed on **AWS** using **Kubernetes (EKS), RDS, and Terraform** for infrastructure provisioning. The deployment process is automated using **GitLab CI/CD**.

---

## 🎯 **Architecture**  
The system is **containerized** and deployed on **AWS EKS**, with an RDS database and managed networking.  

### **1️⃣ Infrastructure Components**  
| **Component**  | **Description**  |
|--------------|----------------|
| **VPC & Subnets**  | Isolated AWS VPC with **public and private subnets** for security. |
| **EKS Cluster**  | Manages Kubernetes workloads for **backend & frontend containers**. |
| **RDS PostgreSQL**  | Persistent database replacing the in-memory DB. |
| **IAM Roles & Policies**  | Secure access for EKS nodes, Terraform, and CI/CD. |
| **CloudWatch Logs**  | Centralized logging for debugging and monitoring. |
| **Frontend**        | React, Node.js    |
| **Backend**         | Spring Boot, Java |

```plaintext
                 +---------------------------+
                 |        AWS Cloud          |
                 +---------------------------+
                            │
       +--------------------------------------+
       |          Amazon VPC (10.0.0.0/16)    |
       +--------------------------------------+
         │                         │
         │                         │
 +----------------+       +----------------+
 |  Public Subnet |       |  Public Subnet |
 |  (10.0.1.0/24) |       |  (10.0.2.0/24) |
 +----------------+       +----------------+
         │                         │
         │                         │
         │                         │
 +----------------+       +----------------+
 |   EKS Worker 1 |       |   EKS Worker 2 |
 +----------------+       +----------------+
         │                         │
         ├────── Load Balancer ─────┤
         │                         │
 +--------------------+    +---------------------+
 |   Spring Boot API  |    |      React UI       |
 +--------------------+    +---------------------+
            │
  +----------------------+
  |  Amazon RDS (PostgreSQL) |
  +----------------------+

```

### **2️⃣ CI/CD Pipeline Stages**  
| **Stage** | **Tasks Performed** |
|-----------|---------------------|
| **Build** | Compiles backend (Maven) & frontend (React). |
| **Test** | Runs unit tests for both components. |
| **Dockerize** | Builds & pushes Docker images to GitLab registry. |
| **Deploy** | Deploys to Kubernetes (EKS) using `kubectl`. |
| **Destroy** | Optionally destroys the infrastructure. |

---

## 🚀 **Deployment Guide**  

### **1️⃣ Prerequisites**  
Ensure the following tools are installed:  
- **Git**  
- **Docker**  
- **Terraform**  
- **AWS CLI**  
- **kubectl**  
- **Maven & Node.js**  

### **2️⃣ Fork & Clone the Repository**  
```bash
git clone https://gitlab.com/YOUR_GITLAB_REPO.git
cd spring-boot-react-example
```

### **3️⃣ Set Up AWS Credentials**  
Before deploying infrastructure, configure your AWS credentials.  

#### **For Linux/macOS**  
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

#### **For Windows**
```bash
$env:AWS_ACCESS_KEY_ID="your-access-key"
$env:AWS_SECRET_ACCESS_KEY="your-secret-key"
```

Verify credentials by running:
```bash
aws sts get-caller-identity\
```

### **4️⃣ Configure Terraform & Deploy Infrastructure**  

#### **Initialize Terraform**  
Navigate to the Terraform directory and initialize the Terraform backend:  

```bash
terraform init  
```

#### **Create or Select a Terraform Workspace**  
Workspaces allow separate infrastructure environments (e.g., `dev`, `staging`, `prod`):  

```bash
terraform workspace new dev || terraform workspace select dev  
```

#### **Apply Terraform Configuration**  
Run the following command to provision AWS resources:  

```bash
terraform apply -auto-approve  
```

This will provision:  
- A **VPC with public & private subnets**  
- An **EKS cluster** for Kubernetes  
- An **RDS PostgreSQL database**  
- IAM roles, networking, and security groups  

---

### **5️⃣ Verify Terraform Deployment**  

After Terraform completes, retrieve the **RDS endpoint**:  

```bash
terraform output rds_endpoint  
```

#### **Test Terraform Locally**  
To ensure Terraform works correctly on your local machine, execute:  

```bash
terraform validate  
terraform plan  
terraform apply -auto-approve  
```

To destroy the infrastructure locally:  

```bash
terraform destroy -auto-approve  
```

---

### **6️⃣ Deploy the Application Using GitLab CI/CD**  

#### **Set Up GitLab CI/CD Variables**  
Navigate to **GitLab → Settings → CI/CD → Variables**, and add:  

| Variable Name         | Value / Description                     |
|----------------------|----------------------------------------|
| `AWS_ACCESS_KEY_ID`  | Your AWS Access Key ID               |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key |
| `KUBE_CONFIG_PATH` | Path to your Kubernetes config file |
| `ENVIRONMENT` | Deployment environment (e.g., `dev`, `staging`, `prod`) |

#### **Trigger the GitLab CI/CD Pipeline**  
Push your changes to GitLab:  

```bash
git add .  
git commit -m "Deploying application"  
git push origin main  
```

Monitor the pipeline under **GitLab → CI/CD → Pipelines**.  

---

### **7️⃣ Verify Deployment**  

Once the pipeline completes:  
- Run `kubectl get pods -n default` to confirm the application is running.  
- Check logs using `kubectl logs <pod-name> -n default`.  
- Access the application via the **Load Balancer URL**.  

---

## 🛑 **Destroy Infrastructure (Cleanup)**  

If you want to remove all AWS resources:  

cd terraform  
terraform workspace select dev || terraform workspace new dev  
terraform destroy -auto-approve  

This will delete the **EKS cluster, RDS database, and VPC**.

Alternatively use the destroy functionality in the pipeline.

---

## 📌 **Conclusion**  
This setup provides a **fully automated deployment** of a Spring Boot & React application to AWS using **GitLab CI/CD and Terraform**.  

If you run into issues, check:  
- **GitLab CI/CD logs**  
- **AWS Console (EKS, RDS, VPC)**  
- **Terraform state**  
