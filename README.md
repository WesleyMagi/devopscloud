# **Spring Boot & React Deployment on AWS with GitLab CI/CD**

## **1. Overview**

This project consists of a **React frontend** and a **Spring Boot backend**, deployed on **AWS** using **Kubernetes (EKS), RDS, and Terraform** for infrastructure provisioning. The deployment process is automated using **GitLab CI/CD**.

---

## **2. Architecture**

### **2.1. Component Breakdown**

| Component            | Technology        | Description |
|----------------------|------------------|-------------|
| **Frontend**        | React, Node.js    | Provides a web interface for users. |
| **Backend**         | Spring Boot, Java | REST API that handles business logic and communicates with the database. |
| **Database**        | AWS RDS (PostgreSQL) | Stores persistent application data. |
| **Containerization** | Docker           | Backend and frontend are packaged into separate containers. |
| **Orchestration**   | Kubernetes (EKS) | Manages deployments, scaling, and networking. |
| **CI/CD**          | GitLab CI/CD      | Automates build, test, containerization, and deployment. |
| **Infrastructure as Code** | Terraform  | Defines and provisions AWS resources. |
| **Monitoring**      | AWS CloudWatch    | Captures logs and application performance metrics. |

---

### **2.2. Infrastructure Diagram**

```plaintext
                +---------------------+
                |      GitLab CI/CD   |
                +---------------------+
                          |
                          v
     +-----------------------------------------+
     |          AWS Cloud Infrastructure      |
     +-----------------------------------------+
                          |
       -----------------------------------
       |                                |
+----------------+                +----------------+
|  Kubernetes    |                |   AWS RDS (DB) |
|  (EKS Cluster) |                |   PostgreSQL   |
+----------------+                +----------------+
       |                                |
       |                                |
+----------------+            +----------------+
|  Backend Pods  |<---------->|  Database      |
|  (Spring Boot) |            |  (AWS RDS)     |
+----------------+            +----------------+
       |
+----------------+
|  Frontend Pods |
|  (React App)   |
+----------------+
```
