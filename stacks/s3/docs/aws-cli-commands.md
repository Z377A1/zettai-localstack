### **1. Create (Upload or Create Bucket)**

**Create a bucket:**

```bash
awslocal s3 mb s3://example-bucket
```

**Upload a file to a bucket:**

```bash
awslocal s3 cp stacks/s3/example/localfile.txt s3://example-bucket/
```

**Upload a folder recursively:**

```bash
awslocal s3 cp stacks/s3/example/ s3://example-bucket/example/ --recursive
```

---

### **2. Read (List / Download)**

**List buckets:**

```bash
awslocal s3 ls
```

**List objects in a bucket:**

```bash
awslocal s3 ls s3://example-bucket/
```

**Download a file from S3:**

```bash
awslocal s3 cp s3://example-bucket/localfile.txt ./stacks/s3/example/updatedfile.txt
```

**Download a folder recursively:**

```bash
awslocal s3 cp s3://example-bucket/example/ ./stacks/s3/example/updatedfolder/ --recursive
```

---

### **3. Update (Replace / Modify)**

**Upload again to replace/update a file:**

```bash
awslocal s3 cp stacks/s3/example/updatedfile.txt s3://example-bucket/localfile.txt
```

**Sync a local folder to S3 (updates changed/new files):**

```bash
awslocal s3 sync ./stacks/s3/example s3://example-bucket/
```

**Sync S3 to local (download updates):**

```bash
awslocal s3 sync s3://example-bucket/ ./stacks/s3/example
```

---

### **4. Delete**

**Delete a single object:**

```bash
awslocal s3 rm s3://example-bucket/localfile.txt
```

**Delete all objects in a bucket:**

```bash
awslocal s3 rm s3://example-bucket/ --recursive
```

**Delete the bucket itself (must be empty first):**

```bash
awslocal s3 rb s3://example-bucket
```
