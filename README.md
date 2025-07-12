# 🚀 Medusa Backend Deployment on AWS ECS (Fargate)

This project demonstrates deploying the Medusa.js backend to AWS ECS (Fargate) using Terraform, with automated CI/CD via GitHub Actions.

## 📦 Tech Stack

🐳 Docker – Containerize the Medusa backend

☁️ AWS ECS (Fargate) – Serverless container hosting

📦 Amazon ECR – Stores Docker image

⚙️ Terraform – Infrastructure as Code

🔁 GitHub Actions – CI/CD pipeline

🛍️ Medusa.js – Headless e-commerce backend

## 📁 Project Structure

medusa-ecs-deployment/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ecs.tf
│   ├── iam.tf
│   ├── ecr.tf
├── .github/
│   └── workflows/
│       └── deploy.yml
├── Dockerfile
└── README.md

## 🧱 Infrastructure Overview

Resource	Description

VPC	Custom VPC with subnet and internet gateway
ECS Cluster	AWS ECS Fargate Cluster
Task Def	Medusa container definition with environment
ECR Repo	Stores Docker image (medusa:latest)
IAM Roles	Required permissions for ECS + ECR
GitHub Actions	Auto builds image and deploys to ECS

## ⚙️ GitHub Actions Workflow

-Builds Docker image from Dockerfile

-Pushes image to ECR

-Deploys using Terraform to ECS Fargate


## 🔐 GitHub Secrets Required

Secret Name	Description

AWS_ACCESS_KEY_ID	IAM user access key
AWS_SECRET_ACCESS_KEY	IAM user secret key

## 🐳 Dockerfile Overview

FROM node:18
WORKDIR /app
RUN npm install -g @medusajs/medusa-cli
RUN medusa new medusa-store --template medusa-starter-default
WORKDIR /app/medusa-store
RUN npm install
EXPOSE 9000
CMD ["npm", "start"]

> Starts a fresh Medusa backend server on port 9000.


## 🚀 How to Deploy

1. Clone this repo


2. Run terraform init and terraform apply inside terraform/


3. Push code to GitHub (triggers Actions pipeline)


4. ECS service pulls latest Docker image from ECR


5. Medusa backend is up and running on ECS

### 📹 Video Explanation

🎥 Click to watch explanation
Explains architecture, Terraform setup, ECS deployment, and CI/CD flow. Face visible in video.

## 🙋‍♀️ Author
👩‍💻 Nikki Goyal
