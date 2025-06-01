

# Expense Backend Service Setup

This guide provides steps to set up the **Expense Backend Service** written in **Node.js**, configure it as a systemd service, and connect it to a MySQL database.

---

## 🔧 Prerequisites

- RHEL/CentOS/Fedora-based system with `dnf`
- MySQL Server (Remote or Local)
- Superuser or sudo access

---

## 🚀 Backend Service Installation Steps

### 1. Install Node.js

> By default, Node.js 16 is available. However, this application requires **Node.js version 20 or higher**.

```bash
# Disable default Node.js module
dnf module disable nodejs -y
```
```bash
# Enable Node.js 20 module
dnf module enable nodejs:20 -y
```
```bash
# Install Node.js
dnf install nodejs -y
````

---

### 2. Create Application User

Create a system user to run the backend application.

```bash
useradd expense
```

> 🔒 Note: The `expense` user is a non-login user used to run the backend service.

---

### 3. Setup Application Directory

```bash
mkdir /app
cd /app
```

---

### 4. Download and Extract Backend Code

```bash
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
unzip /tmp/backend.zip -d /app
```

---

### 5. Install Node.js Dependencies

```bash
cd /app
npm install
```

---

## ⚙️ Configure systemd Service

Create a systemd service file for the backend application.

```bash
vim /etc/systemd/system/backend.service
```

Paste the following content:

```ini
[Unit]
Description = Backend Service

[Service]
User=expense
Environment=DB_HOST="<MYSQL-SERVER-IPADDRESS>"
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target
```

> ⚠️ Replace `<MYSQL-SERVER-IPADDRESS>` with the actual IP address of your MySQL server.

---

### 6. Start and Enable the Service

```bash
systemctl daemon-reload
systemctl start backend
systemctl enable backend
```

---

## 🗄️ Load MySQL Schema

### 1. Install MySQL Client

```bash
dnf install mysql -y
```

### 2. Load Schema into Database

```bash
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql
```

> 📝 Replace `<MYSQL-SERVER-IPADDRESS>` with your actual database IP address.

---

### 3. Restart Backend Service

```bash
systemctl restart backend
```

---

## ✅ Verification

Check the status of the service:

```bash
systemctl status backend
```

Logs (if any errors):

```bash
journalctl -u backend -f
```

---

