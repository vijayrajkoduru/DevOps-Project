

## 🛠 Step 1: Update the System

Make sure your package list and system packages are up-to-date.

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 🐳 Step 2: Install Docker

Install Docker using the APT package manager.

```bash
sudo apt install docker.io -y
```

---

## ▶️ Step 3: Start and Enable Docker

Start the Docker service and enable it to launch on boot.

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

---

## 🔍 Step 4: Verify Docker Installation

Check if Docker is installed correctly by verifying its version.

```bash
docker --version
```

---

## 👤 Step 5: Run Docker Without Sudo (Optional)

Add your user to the `docker` group to avoid typing `sudo` each time.

```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

## ✅ Done!

Docker should now be installed and running on your Ubuntu system. You can test it by running:

```bash
docker run hello-world
```

installing the nginx
```bash
sudo apt-get install nginx
```

