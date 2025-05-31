Absolutely! Here’s the **final clean markdown content** for your GitHub README, plus a `.gitignore` snippet to keep private keys safe. You can just copy-paste both.

---

### README.md

````markdown
# Setting Up a New User with SSH Key Authentication on EC2

This guide covers how to create a user, assign groups, configure SSH key authentication, and enable password login on an Amazon EC2 instance.

---

## Step 1: Create a new user

```bash
sudo useradd kiran
````

---

## Step 2: Create a group

```bash
sudo groupadd Devops
```

---

## Step 3: Add the user to the group

```bash
sudo usermod -g Devops kiran
```

*Sets `Devops` as the primary group for `kiran`.*

---

## Step 4: Set a password for the user

```bash
sudo passwd kiran
```

---

## Step 5: Create `.ssh` directory and set ownership and permissions

```bash
sudo mkdir -p /home/kiran/.ssh
sudo chown -R kiran:Devops /home/kiran/.ssh
sudo chmod 700 /home/kiran/.ssh
```

---

## Step 6: Enable password and public key authentication in SSH config

Edit the SSH config file:

```bash
sudo vi /etc/ssh/sshd_config
```

Ensure the following lines are present and **not commented**:

```
PasswordAuthentication yes
PubkeyAuthentication yes
```

Save and exit.

---

## Step 7: Restart SSH and verify configuration

```bash
sudo systemctl restart sshd
sudo sshd -t
```

Check there are no errors.

---

## Step 8: Login as the new user (using password)

```bash
ssh kiran@<public-ip>
```

---

## Step 9: Generate SSH key pair for the new user (on client or EC2 instance)

```bash
ssh-keygen -f remote
```

This generates two files:

* `remote` (private key)
* `remote.pub` (public key)

---

## Step 10 (Optional): Rename private key for clarity

```bash
mv remote remote.pem
```

---

## Step 11: Add the public key to authorized\_keys

```bash
cat remote.pub >> /home/kiran/.ssh/authorized_keys
```

---

## Step 12: Set ownership and permissions for authorized\_keys

```bash
sudo chown kiran:Devops /home/kiran/.ssh/authorized_keys
chmod 600 /home/kiran/.ssh/authorized_keys
```

---

## Step 13: Login using private key

```bash
ssh -i remote.pem kiran@<public-ip>
```

---

# Notes

* Replace `<public-ip>` with your EC2 instance’s public IP address.
* Ensure your security group allows SSH (port 22) access.
* Keep your private key files (`remote.pem`) secure and **never upload them to public repositories**.

---

````

---

### .gitignore

```gitignore
# Ignore private keys
*.pem
*.key
````

---

Just create two files in your repo root:

* `README.md` (paste the above markdown)
* `.gitignore` (paste the above gitignore content)

This will keep your private keys safe and your instructions public.

If you want, I can help with anything else!
