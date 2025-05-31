Here's the finalized `ec2_user_group_guide.md` file with every command block properly wrapped using \`\`\`\`bash\` code fences. It's clean, GitHub-friendly, and will automatically show **copy buttons** on GitHub.

---

### ✅ Final Copy of `ec2_user_group_guide.md`

````markdown
# 🚀 EC2 Instance Setup & User Management on Amazon Linux

---

## 🔐 Login to AWS Console

- **Username**: `your-username`  
- **Password**: `your-password`  
- **MFA Code**: `your-mfa-code`  

---

## 🖥️ Creating an EC2 Instance

1. **Name your instance**
2. **Choose Amazon Linux AMI**
3. **Select instance type**: `t3.micro`
4. **Create a key pair (.pem)**  
   - Example: `aws-keypair.pem`
5. **Network Settings → Edit**
   - **Security Group**: Allow **All traffic** (for learning/demo only)
6. **Click on "Create"**

---

## 💻 Connect to EC2 via SSH

```bash
ssh -i <your-keypair.pem> ec2-user@<public-ip>
````

---

## 👥 User & Group Management on Amazon Linux

---

### 👤 Create a New User

```bash
useradd vijaykumar
```

> Creates user and default group with the same name.

---

### 👤 Create User Without Default Group

```bash
useradd -N vijaykumar
```

> `-N` skips creating a default group named `vijaykumar`.

---

### 👥 Create a New Group

```bash
groupadd DevOps
```

---

### 🔍 Check User and Group Info

```bash
id vijaykumar
```

> Shows UID, GID, and group memberships.

---

### 📂 View All Users

```bash
cat /etc/passwd
```

---

### 📂 View All Groups

```bash
cat /etc/group
```

---

### 🔐 Set Password for User

```bash
passwd vijaykumar
```

---

### ➕ Add User to a Primary Group

```bash
usermod -g DevOps vijaykumar
```

> Changes the **primary** group of the user.

---

### ➕ Add User to a Secondary Group

```bash
usermod -aG DevOps2 vijaykumar
```

> Appends user to **another group** without removing from existing ones.

---

### 📋 List All Groups

```bash
getent group
```

---

### 📋 View Specific Group

```bash
getent group DevOps2
```

---

### ❌ Delete a User

```bash
userdel vijaykumar
```

---

### ❌ Delete a Group

```bash
groupdel DevOps
```