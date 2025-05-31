
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

Syntax:  
ssh -i <keypair.pem> ec2-user@<public-ip>


---

## 👥 User & Group Management on Amazon Linux

---

### 👤 Create a New User

Syntax:
useradd (username)

```bash
useradd vijaykumar
```

> Creates user and default group with the same name.

---

### 👤 Create User Without Default Group

Syntax:
useradd -N (username)

```bash
useradd -N vijaykumar
```

> `-N` skips creating a default group named `vijaykumar`.

---

### 👥 Create a New Group

Syntax:
groupadd (groupname)

```bash
groupadd DevOps
```

---

### 🔍 Check User and Group Info

Syntax:
id (username)

```bash
id vijaykumar
```

> Shows UID, GID, and group memberships.

---

### 📂 View All Users

Syntax:
cat /etc/passwd

```bash
cat /etc/passwd
```

---

### 📂 View All Groups

Syntax:
cat /etc/group

```bash
cat /etc/group
```

---

### 🔐 Set Password for User

Syntax:
passwd (username)

```bash
passwd vijaykumar
```

---

### ➕ Add User to a Primary Group

Syntax:
usermod -g (groupname) (username)

```bash
usermod -g DevOps vijaykumar
```

> Changes the **primary** group of the user.

---

### ➕ Add User to a Secondary Group

Syntax:
usermod -aG (groupname) (username)

```bash
usermod -aG DevOps2 vijaykumar
```

> Appends user to **another group** without removing from existing ones.

---

### 📋 List All Groups

Syntax:
getent group

```bash
getent group
```

---

### 📋 View Specific Group

Syntax:
getent group (groupname)

```bash
getent group DevOps2
```

---

### ❌ Delete a User

Syntax:
userdel (username)

```bash
userdel vijaykumar
```

---

### ❌ Delete a Group

Syntax:
groupdel (groupname)

```bash
groupdel DevOps
```