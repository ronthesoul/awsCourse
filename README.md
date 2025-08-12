
# AWS Basics for SOC Team

## 1. What is Cloud Computing?
Cloud computing is the delivery of computing services (servers, storage, databases, networking, software, analytics, intelligence) over the internet (“the cloud”).  
Instead of owning physical servers or data centers, companies rent computing resources from providers like AWS.

### Why use Cloud instead of Local Infrastructure?
- **Scalability** – Easily scale up or down as needed.
- **Cost efficiency** – Pay only for what you use (no large upfront hardware costs).
- **Accessibility** – Access from anywhere with internet.
- **Reliability** – Built-in redundancy and failover.
- **Security** – Enterprise-level security measures.
- **Faster deployment** – Launch resources in minutes.

### AWS responsibilty model
<img src="src/aws_resp.png" alt="AWS Responsibility Model" width="800">


### Key AWS structures

## Key AWS Structures (with ARN examples)

### Regions & Availability Zones (AZs)
- **Region** = a geographic cluster of AWS data centers (e.g., `us-east-1`, `eu-central-1`).
- **Physically**: each Region contains **multiple AZs**; each AZ is an isolated data center or campus with separate power, cooling, and networking.
- **Why it matters**: place workloads near users (low latency) and keep data in-country (compliance). Design for HA by spreading across **≥2 AZs**.

### Accounts, “Projects”, and Subscriptions
- **AWS Account** = isolation + billing boundary + IAM scope. Use multiple accounts for envs (prod/stage/dev), teams, or tenants.
- **“Project”** (not an AWS primitive): organize via **tags**, **OUs** (AWS Organizations), and sometimes **separate accounts** per project.
- **“Subscription”** is an **Azure** term. In AWS the closest equivalent is an **Account**.
- **Organizations**: link accounts, apply guardrails (SCPs), and use **Consolidated Billing**.

### Billing (how you pay)
- **Pay-as-you-go** for usage (compute hours, GB-months, requests, egress).
- **Discounts**: **Savings Plans/Reserved Instances** for steady workloads.
- **Free Tier** for testing; **Budgets** and **Cost Explorer** to track/alert.
- **Consolidated Billing** rolls up costs across linked accounts.

---

## ARN (Amazon Resource Name)

**What it is**  
A **globally unique identifier** for any AWS resource.

**Generic format**  
arn:partition:service:region:account-id:resource


**Field breakdown:**
- **`arn`** – indicates that this is an Amazon Resource Name.
- **`service`** – AWS service namespace (e.g., `ec2`, `s3`, `lambda`, `dynamodb`); in the example, `ec2` is for an EC2 server.
- **`region`** – the geographic location where the resource resides (e.g., `us-west-2`); AWS divides its infrastructure into regions for accessibility and faster performance.
- **`account-id`** – the 12-digit AWS account ID that owns the resource.
- **`resource`** – a service-specific path or unique ID; could represent an EC2 instance, an object in S3, a Lambda function, or a database record.

**Examples:**
arn:aws:ec2:us-west-2:123456789012:instance/i-1234567890abcdef0
arn:aws:s3:::my-bucket/my-object
arn:aws:lambda:us-east-1:123456789012:function:MyFunction
arn:aws:dynamodb:us-east-1:123456789012:table/MyTable

---


## 2. Cloud Service Models

### **IaaS** – Infrastructure as a Service
- Provides virtualized computing resources over the internet.
- Examples: AWS EC2, Amazon VPC.
- You manage: OS, applications, runtime.
- AWS manages: hardware, networking.

<img src="src/aws_iaas.png" alt="AWS Responsibility Model" width="800">

AWS provides raw infrastructure resources, and you manage the operating systems, networking, and software:
- **Amazon EC2** – Virtual servers you manage.
- **Amazon EBS** – Block storage volumes for EC2 instances.
- **Amazon VPC** – Isolated virtual network environment in AWS.

### **PaaS** – Platform as a Service
- Provides platform and environment to build apps without managing infrastructure.
- Examples: AWS Elastic Beanstalk, AWS Lambda.
- You focus on code, AWS handles infrastructure.

<img src="src/aws_paas.png" alt="AWS Responsibility Model" width="800">

Services where AWS manages the underlying infrastructure, and you focus on code or application logic:
- **AWS Lambda** – Run code without managing servers (serverless).
- **Amazon RDS** – Managed relational database service.
- **AWS Elastic Beanstalk** – Deploy and manage applications without handling infrastructure.

### **SaaS** – Software as a Service
- Ready-to-use software hosted in the cloud.
- Examples: Gmail, Salesforce, AWS WorkMail.
- You use the software; AWS/vendor manages everything.

<img src="src/aws_saas.png" alt="AWS Responsibility Model" width="800">

Fully managed applications you can use directly:
- **AWS Trusted Advisor** – Recommendations for cost optimization, performance, and security best practices.
- **AWS Shield** – DDoS protection service.
- **Amazon Chime** – Online meetings, video conferencing, and communications tool.

---

## 3. AWS Identity and Access Management (IAM)

### **Users**
- Individual identities with long-term credentials.

### **Groups**
- Collection of users sharing permissions.

### **Roles**
- Temporary credentials with specific permissions, assumed by users/services.

### **Policies**
- JSON documents defining permissions.

**Best Practices:**
- Assign permissions to groups/roles, not directly to users.
- Use least privilege principle.

---

## 4. AWS Access Methods
- **Console** – Web-based AWS Management Console.
- **CLI** – Command Line Interface (`aws` commands).
- **SDKs** – Programming access for different languages.
- **Terraform** – Infrastructure as code for automation.

---

## 5. Root Account
- Created when AWS account is first set up.
- Has full access to all resources.
- **Best Practices:** Avoid daily use, enable MFA, create IAM admin users.

---

## 6. AWS Core Services

### **EC2 (Elastic Compute Cloud)**
- Virtual servers for running applications.

### **S3 (Simple Storage Service)**
- Object storage for files, backups, and data.

### **VPC (Virtual Private Cloud)**
- Isolated network environment within AWS.

### **Route 53**
- DNS and domain registration service.

### **ACL (Access Control List)**
- Controls inbound/outbound traffic at subnet or resource level.

---

## 7. AWS Structure



---

## Summary
By understanding these concepts, you'll be able to:
- Recognize AWS core services.
- Understand IAM roles, users, and policies.
- Know how to access AWS securely.
- Apply cloud concepts to SOC workflows.

---

*Prepared for SOC Team – AWS Basics*
