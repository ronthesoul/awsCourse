# AWS Hands-On Tasks

These exercises are for SOC team members to practice exploring AWS in **read-only mode**.  
Do not create, modify, or delete resources.

---

## Task 1: IAM & S3 Visibility
**Goal:** Understand user identities, groups, and storage permissions.

### Steps
1. **IAM**
   - Log into the AWS Console → **IAM → Users**.
   - Find your own user.
   - Check which **groups** and **policies** you are attached to.
   - Navigate to **Roles** and identify one role with permissions that stand out (e.g., `EC2FullAccess`).

2. **S3**
   - Open **S3 → Buckets**.
   - List all buckets in the account.
   - Pick one bucket and:
     - Look at the **Permissions** tab.
     - Check if **public access** is blocked or allowed.
     - Review the **Bucket policy** (if any).

### Questions to Answer
- Which groups/policies is your IAM user in?
- Which role looked interesting and why?
- How many S3 buckets are visible?
- Did you see any bucket policy statements? If yes, what did it allow or deny?
- Was public access enabled anywhere?

---

## Task 2: CloudTrail & CloudWatch Monitoring
**Goal:** Explore logging and monitoring to spot activity.

### Steps
1. **CloudTrail**
   - Navigate to **CloudTrail → Event history**.
   - Filter for the last 24 hours.
   - Identify:
     - One **IAM** event (user creation, login, or access denied).
     - One **S3** event (list bucket, get object, etc.).
     - One **EC2** event (start/stop/describe instance).

2. **CloudWatch Logs**
   - Go to **CloudWatch → Logs Insights**.
   - Pick a log group (for example: `VPCFlowLogs`, `CloudTrail/DefaultLogGroup`, or `GuardDuty`).
   - Run this query:
     ```sql
     fields @timestamp, @message
     | sort @timestamp desc
     | limit 20
     ```
   - Review the last few log lines.

### Questions to Answer
- Which IAM event did you find (user login, role assumption, policy action)?
- Which S3 event did you find (read, list, etc.)?
- Which EC2 event did you see?
- Which log group did you query in CloudWatch?
- Share one example of a log message you saw.

---

## Deliverable
Write down your findings for both tasks and share them with the instructor.  
Keep it short but concrete: list **what you observed** and any **potential security concerns**.

---
