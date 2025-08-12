
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
![AWS Logo](src/aws_resp.png)
---

## 2. Cloud Service Models

### **IaaS** – Infrastructure as a Service
- Provides virtualized computing resources over the internet.
- Examples: AWS EC2, Amazon VPC.
- You manage: OS, applications, runtime.
- AWS manages: hardware, networking.

### **PaaS** – Platform as a Service
- Provides platform and environment to build apps without managing infrastructure.
- Examples: AWS Elastic Beanstalk, AWS Lambda.
- You focus on code, AWS handles infrastructure.

### **SaaS** – Software as a Service
- Ready-to-use software hosted in the cloud.
- Examples: Gmail, Salesforce, AWS WorkMail.
- You use the software; AWS/vendor manages everything.

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

### **Regions**
- Physical locations worldwide where AWS hosts data centers.
- Example: `us-east-1`, `eu-central-1`.

### **Availability Zones (AZs)**
- Isolated data centers within a region.

### **ARN (Amazon Resource Name)**
- Unique identifier for AWS resources.
- Format: `arn:aws:service:region:account-id:resource`.

### **AWS Accounts**
- Each account is a container for AWS resources, billing, and IAM.

---

## Summary
By understanding these concepts, you'll be able to:
- Recognize AWS core services.
- Understand IAM roles, users, and policies.
- Know how to access AWS securely.
- Apply cloud concepts to SOC workflows.

---

*Prepared for SOC Team – AWS Basics*
